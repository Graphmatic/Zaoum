/*
 * Analog Toolbox
 *
 * ==========================================================================
 *
 * Copyright (C) 2005  Thorsten Klose (tk@midibox.org)
 *
 * ==========================================================================
 *
 * This file is part of a MIOS application
 *
 * This application is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This application is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with This application; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * ==========================================================================
 */

/////////////////////////////////////////////////////////////////////////////
// Include files
/////////////////////////////////////////////////////////////////////////////

#include "cmios.h"
#include <pic18fregs.h>

#include "main.h"
#include "bankstick.h"
#include "aout.h"
#include "midi.h"
#include "lfo.h"
#include "eg.h"
#include "map.h"

//0x0000 = 0x33 --> bankstick formatted
//0x0001 = last saved bank
//0x0002 = last saved preset                     (bank)-(preset)-(param-param)
//
//all_param.router_flags_system    		 = bankstick adress : 0xzz00
//all_param.router_flags_lfo1           		 =  bankstick adress : 0xzz01
//all_param.router_flags_lfo2         		 =  bankstick adress : 0xzz02
//router_flags_lfo3         		 =  bankstick adress : 0xzz03
//
//all_param.eg_select                                     =  bankstick adress : 0xzz04
//
//all_param.router_flags_lfo1_att   		 =  bankstick adress : 0xzz05
//all_param.router_flags_lfo1_dec  		 =  bankstick adress : 0xzz06
//all_param.router_flags_eg_link     		 =  bankstick adress : 0xzz07
//all_param.router_flags_eg_v2s      		 =  bankstick adress : 0xzz08
//all_param.router_flags_eg_audio_trig             = bankstick adress :  : 0xzz09
//all_param.router_flags_Eg_to_lfo1                =  bankstick adress : 0xzz0a
//all_param.router_flags_Eg_to_lfo2                =  bankstick adress : 0xzz0b
//all_param.router_flags_Eg_to_lfo3                =  bankstick adress : 0xzz0c
//
//all_param.attack 1                            	         =  bankstick adress : 0xzz0d
//all_param.attack 2                           	         =  bankstick adress : 0xzz0e
//all_param.attack 3                           	         =  bankstick adress : 0xzz0f
//all_param.attack 4                           	         =  bankstick adress : 0xzz10
//
//all_param.decay  1                           	         =  bankstick adress : 0xzz11
//all_param.decay  2                          	         =  bankstick adress : 0xzz12
//all_param.decay  3                           	         =  bankstick adress : 0xzz13
//all_param.decay  4                           	         =  bankstick adress : 0xzz14
//
//all_param.sustain  1                          	         =  bankstick adress : 0xzz15
//all_param.sustain  2                           	         =  bankstick adress : 0xzz16
//all_param.sustain  3                          	         =  bankstick adress : 0xzz17
//all_param.sustain  4                          	         =  bankstick adress : 0xzz18
//
//all_param.release  1                          	         =  bankstick adress : 0xzz19
//all_param.release  2                          	         =  bankstick adress : 0xzz1a
//all_param.release  3                           	         =  bankstick adress : 0xzz1b
//all_param.release  4                          	         =  bankstick adress : 0xzz1c
//
//all_param.lfo0_rate                                     =  bankstick adress : 0xzz0d + 64 (0x114d)
//all_param.lfo1_rate                                     =  bankstick adress : 0xzz0d + 65 (0x114e)
//all_param.lfo2_rate                                     =  bankstick adress : 0xzz0d + 66 (0x114f)
//
//all_param.lfo0_bpm                                     =  bankstick adress : 0xzz0d + 67 (0x1150)
//all_param.lfo1_bpm                                     =  bankstick adress : 0xzz0d + 68 (0x1151)
//all_param.lfo2_bpm                                     =  bankstick adress : 0xzz0d + 69 (0x1152)
//
//bpm                                          =  bankstick adress : 0xzz0d + 70 (0x1153)


//
//last preset saved bank     : 0x0001    (1000-2000-3000-4000)
//last preset saved          : 0x0002    (0100-0200-0300-0400)
/////////////////////////////////////////////////////////////////////////////
// Global variables
/////////////////////////////////////////////////////////////////////////////

const unsigned char *buffer_bs = 0xE00;
volatile unsigned char load_last;
volatile unsigned int adress;
volatile unsigned char update_led;
volatile unsigned char update_preset_led;
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS after startup to initialize the
// bankstick
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_Init(void) __wparam
{
unsigned char temp_value;
unsigned char tempo_value;
temp_value = MIOS_BANKSTICK_Read(0x0000); //check cosmologik number
//so format if new bankstick
if( temp_value != 0x33 ) {	
all_param.router_flags_system.ALL_flags_system = 0x00;
all_param.router_flags_lfo1.ALL_flags_lfo1 = 0x01;
all_param.router_flags_lfo2.ALL_flags_lfo2 = 0x01;
all_param.router_flags_lfo3.ALL_flags_lfo3 = 0x01;
all_param.eg_select = 0x01;
all_param.router_flags_lfo1_att.ALL_flags_lfo1_att = 0x00;
all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec = 0x00;
all_param.router_flags_eg_link.ALL_flags_eg_link = 0x00;
all_param.router_flags_eg_v2s.ALL_flags_eg_v2s = 0x00;
all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig = 0x00;
all_param.router_flags_Eg_to_lfo1.ALL_flags_Eg_to_lfo1 = 0x00;
all_param.router_flags_Eg_to_lfo2.ALL_flags_Eg_to_lfo2 = 0x00;
all_param.router_flags_Eg_to_lfo3.ALL_flags_Eg_to_lfo3 = 0x00;
for (tempo_value = 0; tempo_value <=3; tempo_value++) {
    all_param.eg_channel[tempo_value] = 0x01;}
for (tempo_value = 0; tempo_value <=3; tempo_value++) {
    all_param.attack[tempo_value] = 0x40;}
for (tempo_value = 0; tempo_value <=3; tempo_value++) {
    all_param.decay[tempo_value] = 0x40;}
for (tempo_value = 0; tempo_value <=3; tempo_value++) {
    all_param.sustain[tempo_value] = 0x80;}
for (tempo_value = 0; tempo_value <=3; tempo_value++) {
    all_param.release[tempo_value] = 0x40;}
all_param.lfo0_rate  = 0x80;
all_param.lfo1_rate  = 0x80;
all_param.lfo2_rate  = 0x80;
all_param.bpm = 0x74;
all_param.lfo0_bpm   = 0x06;
all_param.lfo1_bpm   = 0x06;
all_param.lfo2_bpm   = 0x06;
all_param.eg_select = 0x01;

load_last = 0x00;
update_led = 0x01;
		}
else {
//load last saved preset

        bank = MIOS_BANKSTICK_Read(0x0001);     //read last bank number
		bank << 8;
		preset = MIOS_BANKSTICK_Read(0x0002);  //read last preset number
		preset << 8;
		load_last = 0x01;
        }
}
/////////////////////////////////////////////////////////////////////////////
// This function is called to load a preset
// bankstick
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_LOAD_Evnt( volatile unsigned int bank, volatile unsigned int preset) __wparam
{
        adress = ((bank + preset) & 0xff00);
        MIOS_BANKSTICK_ReadPage(adress, buffer_bs);
		load_last = 0x00;
		update_led = 0x01;
		update_preset_led = 0x01;
}
///////////////////////////////////////////////////////////////////////////////
//// This function is called to save a preset
// bankstick
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_SAVE_Evnt(volatile unsigned int bank, volatile unsigned int preset) __wparam
{

        adress = ((bank + preset) & 0xff00);
		MIOS_BANKSTICK_WritePage(adress, buffer_bs); //0xzz0d     
		bank >> 8;
		MIOS_BANKSTICK_Write(0x0001, bank); //save last bank number
		preset >> 8;
		MIOS_BANKSTICK_Write(0x0002, preset); //save last preset number
		app_flags.save_on = 0;
}



/////////////////////////////////////////////////////////////////////////////
// This function is called to update DOUT pins (LEDs-TTL switchs)
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_Dout_Update(void) __wparam
{
unsigned char value_1;

  //update system flags LEDs ( SR 4 : TTL Switch & resp. Leds)
  if( all_param.router_flags_system.ttl_switch1 ) {    // if set eg2 selected, if clear, eg1 selected
     value_1 = 0x0a; }
  else {
     value_1 = 0x05; }
  if( all_param.router_flags_system.ttl_switch2 ) {    // if set eg3 selected, if clear, eg2 selected
     value_1 ^= 0xa0;}
  else {
     value_1 ^= 0x50; }
  MIOS_DOUT_SRSet(4, value_1);
  
  value_1 = all_param.eg_select;
  MIOS_DOUT_SRSet(6, value_1);	

  //update system flags LEDs ( midi = 53 : twin = 52 =)  (sr shared with bank leds)
  all_param.router_flags_system.midi_mode ? MIOS_DOUT_PinSet(53, 1) : MIOS_DOUT_PinSet(53, 0);
  all_param.router_flags_system.twin_mode ? MIOS_DOUT_PinSet(52, 1) : MIOS_DOUT_PinSet(52, 0);

   //update all_param.router_flags_lfo1 LEDs ( SR 0)/////////////////////////////////////////////////////////ok
  MIOS_DOUT_SRSet(0, all_param.router_flags_lfo1.ALL_flags_lfo1);

   //update router_flags_lfo2 LEDs ( SR 1 )//////////////////////////////////////////////////////////////////ok
  MIOS_DOUT_SRSet(1, all_param.router_flags_lfo2.ALL_flags_lfo2);

 //update router_flags_lfo3 LEDs ( SR 2 )//////////////////////////////////////////////////////////////////////ok
  MIOS_DOUT_SRSet(2, all_param.router_flags_lfo3.ALL_flags_lfo3);
  update_led = 0x01;
}  
/////////////////////////////////////////////////////////////////////////////
// This function is called to go on update DOUT pins (LEDs-TTL switchs)
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_Dout_Update_2(void) __wparam
{
  //update all_param.router_flags_lfo1_att LED( 24 )
  if( all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select) {
  MIOS_DOUT_PinSet(24, 1); }
  else {
  MIOS_DOUT_PinSet(24, 0); }


   //update all_param.router_flags_lfo1_dec LED ( 25 )
  if( all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select) {
  MIOS_DOUT_PinSet(25, 1); }
  else {
  MIOS_DOUT_PinSet(25, 0); }


  //update all_param.router_flags_eg_link LEDs ( 26 )
  if( all_param.router_flags_eg_link.eg1_link_eg2 ) {
  if( all_param.eg_select <= 2) {
  MIOS_DOUT_PinSet(26, 1); } }
  else if( all_param.router_flags_eg_link.eg3_link_eg4 ){
  if (all_param.eg_select >= 4) {
  MIOS_DOUT_PinSet(26, 1); }}
  else {
  MIOS_DOUT_PinSet(26, 0); }


  //update all_param.router_flags_eg_v2s LED ( 27 )
  if( all_param.router_flags_eg_v2s.ALL_flags_eg_v2s & all_param.eg_select) {
  MIOS_DOUT_PinSet(27, 1); }
  else {
  MIOS_DOUT_PinSet(27, 0); }


  //update all_param.router_flags_eg_audio_trig LED ( 31 )
  if( all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig & all_param.eg_select) {
  MIOS_DOUT_PinSet(31, 1); }
  else {
  MIOS_DOUT_PinSet(32, 0); }

   //update all_param.router_flags_Eg_to_lfo1 LED ( 28 )
  if( all_param.router_flags_Eg_to_lfo1.ALL_flags_Eg_to_lfo1 & all_param.eg_select) {
  MIOS_DOUT_PinSet(28, 1); }
  else {
  MIOS_DOUT_PinSet(28, 0); }
  update_led = 0x01;
  
 }
/////////////////////////////////////////////////////////////////////////////
// This function is called to go on update DOUT pins (LEDs-TTL switchs)
/////////////////////////////////////////////////////////////////////////////
void BANKSTICK_Dout_Update_3(void) __wparam
{
unsigned char value_1;
   //update all_param.router_flags_Eg_to_lfo2 LED ( 29 )
  if( all_param.router_flags_Eg_to_lfo2.ALL_flags_Eg_to_lfo2 & all_param.eg_select) {
  MIOS_DOUT_PinSet(29, 1); }
  else {
  MIOS_DOUT_PinSet(29, 0); }


   //update all_param.router_flags_Eg_to_lfo3 LED ( 30 )
  if( all_param.router_flags_Eg_to_lfo3.ALL_flags_Eg_to_lfo3 & all_param.eg_select) {
  MIOS_DOUT_PinSet(30, 1); }
  else {
  MIOS_DOUT_PinSet(30, 0); }


  //update all_param.eg_select led
   value_1 = MIOS_DOUT_SRGet(5);
   value_1 &= 0xf0;
   value_1 |= all_param.eg_select;
   MIOS_DOUT_SRSet(5, value_1);
   update_led = 0x00;
   
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////help for preset/bank leds sr7 (bank-preset)
void BANKSTICK_preset_LEDs_Update( volatile unsigned int bank, volatile unsigned int preset ) __wparam
{
unsigned char sr6_temp;

switch( bank ) {
 case 0x1000:
  sr6_temp = MIOS_DOUT_SRGet(6);
  sr6_temp &= 0xf0;
  sr6_temp |= 0x01;
  MIOS_DOUT_SRSet(6, sr6_temp);
 break;
  case 0x2000:
  sr6_temp = MIOS_DOUT_SRGet(6);
  sr6_temp &= 0xf0;
  sr6_temp |= 0x02;
  MIOS_DOUT_SRSet(6, sr6_temp);
   break;
 case 0x3000:
  sr6_temp = MIOS_DOUT_SRGet(6);
  sr6_temp &= 0xf0;
  sr6_temp |= 0x04;
  MIOS_DOUT_SRSet(6, sr6_temp);
   break;
 case 0x4000:
  sr6_temp = MIOS_DOUT_SRGet(6);
  sr6_temp &= 0xf0;
  sr6_temp |= 0x08;
  MIOS_DOUT_SRSet(6, sr6_temp);
  break; }


switch( preset ) {
 case 0x0100:
   sr6_temp = MIOS_DOUT_SRGet(5);
   sr6_temp &= 0x0f;
   sr6_temp |= 0x10;
   MIOS_DOUT_SRSet(5, sr6_temp);
   break;
  case 0x0200:
   sr6_temp = MIOS_DOUT_SRGet(5);
   sr6_temp &= 0x0f;
   sr6_temp |= 0x20;
   MIOS_DOUT_SRSet(5, sr6_temp);
   break;
 case 0x0300:
   sr6_temp = MIOS_DOUT_SRGet(5);
   sr6_temp &= 0x0f;
   sr6_temp |= 0x40;
   MIOS_DOUT_SRSet(5, sr6_temp);
   break;
 case 0x0400:
   sr6_temp = MIOS_DOUT_SRGet(5);
   sr6_temp &= 0x0f;
   sr6_temp |= 0x80;
   MIOS_DOUT_SRSet(5, sr6_temp);
   break; }
   update_preset_led = 0x00;
}



