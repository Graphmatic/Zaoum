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
#include "aout.h"
#include "midi.h"
#include "lfo.h"
#include "eg.h"
#include "map.h"
#include "bankstick.h"

/////////////////////////////////////////////////////////////////////////////
// Global variables
/////////////////////////////////////////////////////////////////////////////

// status of application (see bitfield declaration in main.h)
app_flags_t app_flags;
//all_egs_values_t all_egs_values;

volatile unsigned char eg_select_hlp;
volatile unsigned int  jog_value;
volatile unsigned char lcd_temp;
volatile unsigned char CursorBpm = 1;
volatile unsigned int preset;
volatile unsigned int bank;
extern volatile unsigned char load_last;
extern volatile unsigned char update_led;
extern volatile unsigned char update_preset_led;
volatile unsigned char lfo_bpm_temp;

/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS after startup to initialize the
// application
/////////////////////////////////////////////////////////////////////////////
void Init(void) __wparam
{
  // initialize the AIN driver
  MIOS_AIN_NumberSet(AIN_NUMBER_INPUTS);
#if AIN_MUXED_MODE
  MIOS_AIN_Muxed();
#else
  MIOS_AIN_UnMuxed();
#endif
  MIOS_AIN_DeadbandSet(AIN_DEADBAND);
  // initialize the shift registers
  MIOS_SRIO_NumberSet(7);
  MIOS_SRIO_UpdateFrqSet(2);
  // initialize the timer - it should be invoked each mS
  MIOS_TIMER_Init(0, 10000); // 1 mS / 100 nS = 10000 cycles
  
  // initialize the BankStick/preset values
  BANKSTICK_Init();
  // initialize the AOUT driver (-> aout.c) 
  AOUT_Init();
  // initialize the MIDI module
  MIDI_Init();
  // initialize the LFO module
  LFO_Init();
  // initialize the EG module
  EG_Init();
  // initialize the MAP module
  MAP_Init();
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS in the mainloop when nothing else is to do
/////////////////////////////////////////////////////////////////////////////
void Tick(void) __wparam
{
  if (load_last) {
  BANKSTICK_LOAD_Evnt( bank, preset);}
  if (update_led) {
  // initialize the LEDs
  BANKSTICK_Dout_Update( );}
  if (update_led) {
  // initialize the LEDs
  BANKSTICK_Dout_Update_2( );}
  if (update_led) {
  // initialize the LEDs
  BANKSTICK_Dout_Update_3( );}  
  if (update_preset_led) {
  BANKSTICK_preset_LEDs_Update( bank, preset );}

  // call tick function of MAP module
  MAP_Tick();
  // update the requested pins
  AOUT_Update();
}
/////////////////////////////////////////////////////////////////////////////
// This function is periodically called by MIOS. The frequency has to be
// initialized with MIOS_Timer_Set
/////////////////////////////////////////////////////////////////////////////
void Timer(void) __wparam
{
  // invoke the LFO handler
  LFO_Tick();
  // invoke the EG handler
  EG_Tick();
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when the display content should be
// initialized. Thats the case during startup and after a temporary message
// has been printed on the screen
/////////////////////////////////////////////////////////////////////////////
void DISPLAY_Init(void) __wparam
{
unsigned char i;
  MIOS_LCD_Clear();
  // print default screen
  MIOS_LCD_CursorSet(0x00); // first line
////////////////////////////////" AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA 
  MIOS_LCD_PrintCString("BPM  LFO1 LFO2 LFO3 chn: EG1 EG2 EG3 EG4");

  app_flags.DISPLAY_UPDATE_REQ = 1;
}
/////////////////////////////////////////////////////////////////////////////
//  This function is called in the mainloop when no temporary message is shown
//  on screen. Print the realtime messages here
/////////////////////////////////////////////////////////////////////////////
void DISPLAY_Tick(void) __wparam
{
unsigned char i;
  // do nothing if no update has been requested
  if( !app_flags.DISPLAY_UPDATE_REQ )
    return;
////////////////////////////////////////////////////////----------------
  // clear request
  app_flags.DISPLAY_UPDATE_REQ = 0;
  
   switch( app_flags.save_on ) {
  
  case 0 :  
  MIOS_LCD_CursorSet(0x00); // first line
  MIOS_LCD_PrintCString("BPM  LFO1 LFO2 LFO3 chn: EG1 EG2 EG3 EG4");
  lcd_temp = all_param.bpm;
  MIOS_LCD_CursorSet(0x40);
  MIOS_LCD_PrintBCD3( lcd_temp );
  
  lfo_bpm_temp = all_param.lfo0_bpm;
  MIOS_LCD_CursorSet(0x45); 
  DISPLAY_lfobpm (lfo_bpm_temp);
  
  lfo_bpm_temp = all_param.lfo1_bpm;
  MIOS_LCD_CursorSet(0x4a); 
  DISPLAY_lfobpm (lfo_bpm_temp);
  
  lfo_bpm_temp = all_param.lfo2_bpm;
  MIOS_LCD_CursorSet(0x4f); 
  DISPLAY_lfobpm (lfo_bpm_temp);
   
  lcd_temp = all_param.eg_channel[0];
  MIOS_LCD_CursorSet(0x59);
  MIOS_LCD_PrintBCD3(lcd_temp);
  lcd_temp = all_param.eg_channel[1];
  MIOS_LCD_CursorSet(0x5d);
  MIOS_LCD_PrintBCD3(lcd_temp);
  lcd_temp = all_param.eg_channel[2];
  MIOS_LCD_CursorSet(0x61);
  MIOS_LCD_PrintBCD3(lcd_temp);
  lcd_temp = all_param.eg_channel[3];
  MIOS_LCD_CursorSet(0x65);
  MIOS_LCD_PrintBCD3(lcd_temp);

   case 1 :
   MIOS_LCD_CursorSet(0x00); // first line
   MIOS_LCD_PrintCString("SAVE: choose bank and preset...");
   break;}


}
/////////////////////////////////////////////////////////////////////////////
//  help function for lcd
/////////////////////////////////////////////////////////////////////////////
void DISPLAY_lfobpm(volatile unsigned char lfo_bpm_temp) __wparam
{
  switch (lfo_bpm_temp) {  
  case 0 :
  MIOS_LCD_PrintCString("64/1"); 
  case 1 :
  MIOS_LCD_PrintCString("32/1"); 
  case 2 :
  MIOS_LCD_PrintCString("16/1"); 
  case 3 :
  MIOS_LCD_PrintCString(" 8/1"); 
  case 5 :
  MIOS_LCD_PrintCString(" 4/1");
  case 6 :
  MIOS_LCD_PrintCString(" 2/1"); 
  case 7 :
  MIOS_LCD_PrintCString(" 1/1"); 
  case 8 :
  MIOS_LCD_PrintCString("1/2"); 
  case 9 :
  MIOS_LCD_PrintCString("1/4"); 
  case 10 :
  MIOS_LCD_PrintCString("1/8"); 
  case 11 :
  MIOS_LCD_PrintCString("1/16"); 
  }
  }
/////////////////////////////////////////////////////////////////////////////
//  This function is called by MIOS when a complete MIDI event has been received
/////////////////////////////////////////////////////////////////////////////
void MPROC_NotifyReceivedEvnt(unsigned char evnt0, unsigned char evnt1, unsigned char evnt2) __wparam
{
  // forward event to MIDI module
  MIDI_Evnt(evnt0, evnt1, evnt2);
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when a MIDI event has been received
// which has been specified in the MIOS_MPROC_EVENT_TABLE
/////////////////////////////////////////////////////////////////////////////
void MPROC_NotifyFoundEvent(unsigned entry, unsigned char evnt0, unsigned char evnt1, unsigned char evnt2, unsigned char value) __wparam
{
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when a MIDI event has not been completly
// received within 2 seconds
/////////////////////////////////////////////////////////////////////////////
void MPROC_NotifyTimeout(void) __wparam
{
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when a MIDI byte has been received
/////////////////////////////////////////////////////////////////////////////
void MPROC_NotifyReceivedByte(unsigned char byte) __wparam
{
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS before the shift register are loaded
/////////////////////////////////////////////////////////////////////////////
void SR_Service_Prepare(void) __wparam
{
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS after the shift register have been loaded
/////////////////////////////////////////////////////////////////////////////
void SR_Service_Finish(void) __wparam
{
}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when an button has been toggled
// pin_value is 1 when button released, and 0 when button pressed
/////////////////////////////////////////////////////////////////////////////
void DIN_NotifyToggle(unsigned char pin, unsigned char pin_value) __wparam
{
unsigned char sr_temp;

switch( pin ) {

case 0: // change lfo1 waveform ///////////////////////////////////////////////////////////////////
    if( !pin_value )  {
      if( all_param.router_flags_lfo1.lfo1_waveform == 1 ) {
      all_param.router_flags_lfo1.lfo1_waveform << 1;
      MIOS_DOUT_PinSet(0, 0);
      MIOS_DOUT_PinSet(1, 1);
break; }
      if(all_param.router_flags_lfo1.lfo1_waveform == 2 ) {
      all_param.router_flags_lfo1.lfo1_waveform << 1;
      MIOS_DOUT_PinSet(1, 0);
      MIOS_DOUT_PinSet(2, 1);
break; }
      if(all_param.router_flags_lfo1.lfo1_waveform == 4 ) {
      all_param.router_flags_lfo1.lfo1_waveform << 1;
      MIOS_DOUT_PinSet(2, 0);
      MIOS_DOUT_PinSet(3, 1);
break; }
      if(all_param.router_flags_lfo1.lfo1_waveform == 8 ) {
      all_param.router_flags_lfo1.lfo1_waveform >> 3;
      MIOS_DOUT_PinSet(3, 0);
      MIOS_DOUT_PinSet(1, 1);
break; }
}
    case 1: //toggle lfo1_from_lfo2 state      

    if( !pin_value ) {

    all_param.router_flags_lfo1.lfo1_from_lfo2 ^= 1;
    MIOS_DOUT_PinGet(4) ? MIOS_DOUT_PinSet(4, 0) : MIOS_DOUT_PinSet(4, 1);
    break; }

    case 2: // lfo1-> note start   
    if( !pin_value )  {

    all_param.router_flags_lfo1.lfo1_note_start ^= 1;
    MIOS_DOUT_PinGet(5) ? MIOS_DOUT_PinSet(5, 0) : MIOS_DOUT_PinSet(5, 1);
    break; }

    case 3: // lfo1-> bpm sync       
    if( !pin_value )  {
    all_param.router_flags_lfo1.lfo1_sync_bpm ^= 1;
    MIOS_DOUT_PinGet(6) ? MIOS_DOUT_PinSet(6, 0) : MIOS_DOUT_PinSet(6, 1);
    break; }

    case 4: // change lfo2 waveform        
    if( !pin_value ) {

      if( all_param.router_flags_lfo2.lfo2_waveform == 1 ) {
      all_param.router_flags_lfo2.lfo2_waveform << 1;
      MIOS_DOUT_PinSet(8, 0);
      MIOS_DOUT_PinSet(9, 1);
      break;}

      if(all_param.router_flags_lfo2.lfo2_waveform == 2 ) {
      all_param.router_flags_lfo2.lfo2_waveform << 1;
      MIOS_DOUT_PinSet(9, 0);
      MIOS_DOUT_PinSet(10, 1);
      break;}

      if(all_param.router_flags_lfo2.lfo2_waveform == 4 ) {
      all_param.router_flags_lfo2.lfo2_waveform << 1;
      MIOS_DOUT_PinSet(10, 0);
      MIOS_DOUT_PinSet(11, 1);
      break;}

      if(all_param.router_flags_lfo2.lfo2_waveform == 8 ) {
      all_param.router_flags_lfo2.lfo2_waveform >> 3;
      MIOS_DOUT_PinSet(11, 0);
      MIOS_DOUT_PinSet(8, 1);
      break;} }

    case 5:  //toggle lfo2_from_lfo3     ok!
    if( !pin_value ) {
    all_param.router_flags_lfo2.lfo2_from_lfo3 ^= 1;
    MIOS_DOUT_PinGet(12) ? MIOS_DOUT_PinSet(12, 0) : MIOS_DOUT_PinSet(12, 1); }
    break;

    case 6: // lfo2-> note start  ok!
    if( !pin_value ) {
    all_param.router_flags_lfo2.lfo2_note_start ^= 1;
    MIOS_DOUT_PinGet(13) ? MIOS_DOUT_PinSet(13, 0) : MIOS_DOUT_PinSet(13, 1);	}
    break;

    case 7: // lfo2-> bpm sync        ok!
    if( !pin_value )  {
    all_param.router_flags_lfo2.lfo2_sync_bpm ^= 1;
    MIOS_DOUT_PinGet(14) ? MIOS_DOUT_PinSet(14, 0) : MIOS_DOUT_PinSet(14, 1);}
    break;

    case 8:  // change lfo3 waveform        
    if( !pin_value ) {

      if( all_param.router_flags_lfo3.lfo3_waveform == 1 ) {
      all_param.router_flags_lfo3.lfo3_waveform << 1;
      MIOS_DOUT_PinSet(16, 0);
      MIOS_DOUT_PinSet(17, 1);
      break;}

      if( all_param.router_flags_lfo3.lfo3_waveform == 2 ) {
      all_param.router_flags_lfo3.lfo3_waveform << 1;
      MIOS_DOUT_PinSet(17, 0);
      MIOS_DOUT_PinSet(18, 1);
      break;}

      else {
      all_param.router_flags_lfo3.lfo3_waveform == 4;
      all_param.router_flags_lfo3.lfo3_waveform >> 2;
      MIOS_DOUT_PinSet(18, 0);
      MIOS_DOUT_PinSet(16, 1); }     }
    break;

    case 9: // lfo3-> note start     ok!
    if( !pin_value )
{   all_param.router_flags_lfo3.lfo3_note_start ^= 1;
    MIOS_DOUT_PinGet(21) ? MIOS_DOUT_PinSet(21, 0) : MIOS_DOUT_PinSet(21, 1);	}
    break;

    case 10: // lfo3-> bpm sync     ok!
    if( !pin_value )
{   all_param.router_flags_lfo3.lfo3_sync_bpm ^= 1;
    MIOS_DOUT_PinGet(22) ? MIOS_DOUT_PinSet(22, 0) : MIOS_DOUT_PinSet(22, 1);	}
    break;

    case 11:  // eg Attack from lfo1  ok!
    if( !pin_value ) {
    all_param.router_flags_lfo1_att.ALL_flags_lfo1_att ^= all_param.eg_select;
    MIOS_DOUT_PinGet(24) ? MIOS_DOUT_PinSet(24, 0) : MIOS_DOUT_PinSet(24, 1); }
    break;


    case 12:  // eg Decay from lfo1  ok!
    if( !pin_value ) {
    all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec ^= all_param.eg_select ;
    MIOS_DOUT_PinGet(25) ? MIOS_DOUT_PinSet(25, 0) : MIOS_DOUT_PinSet(25, 1);	}
    break;

    case 13:  // eg link 1-2 or 3-4
    if( !pin_value ) {
        switch( all_param.eg_select ) {
        case 1: case 2:
         all_param.router_flags_eg_link.eg1_link_eg2 ^= 1;
    	 MIOS_DOUT_PinGet(26) ? MIOS_DOUT_PinSet(26, 0) : MIOS_DOUT_PinSet(26, 1);
    	break;
        case 4: case 8:
  	 all_param.router_flags_eg_link.eg3_link_eg4 ^= 1;
 	 MIOS_DOUT_PinGet(26) ? MIOS_DOUT_PinSet(26, 0) : MIOS_DOUT_PinSet(26, 1);
  	 break; }}
    break;
	
    case 14:  // eg vel to all_param.sustain
    if( !pin_value ) {
    all_param.router_flags_eg_v2s.ALL_flags_eg_v2s ^= all_param.eg_select ;
    MIOS_DOUT_PinGet(27) ? MIOS_DOUT_PinSet(27, 0) : MIOS_DOUT_PinSet(27, 1);}
    break;

    case 15:  //Eg_to_lfo1
    if(!pin_value ) {
    all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ^= all_param.eg_select;
    MIOS_DOUT_PinGet(28) ? MIOS_DOUT_PinSet(28, 0) : MIOS_DOUT_PinSet(28, 1); }
    break;

    case 16:  //Eg_to_lfo2
    if(!pin_value ) {
    all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ^= all_param.eg_select;
    MIOS_DOUT_PinGet(29) ? MIOS_DOUT_PinSet(29, 0) : MIOS_DOUT_PinSet(29, 1); }
    break;

    case 17:  //Eg_to_lfo3
    if(!pin_value ) {
    all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ^= all_param.eg_select;
    MIOS_DOUT_PinGet(30) ? MIOS_DOUT_PinSet(30, 0) : MIOS_DOUT_PinSet(30, 1);}
    break;

    case 18:  // eg audio trigg
    if( !pin_value ) {
    all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig ^= all_param.eg_select ;
    MIOS_DOUT_PinGet(31) ? MIOS_DOUT_PinSet(31, 0) : MIOS_DOUT_PinSet(31, 1);}
    break;

    case 19:  //toggle twin_mode
    if( !pin_value ) {
    all_param.router_flags_system.twin_mode ^= 1;
    MIOS_DOUT_PinGet(40) ? MIOS_DOUT_PinSet(40, 0) : MIOS_DOUT_PinSet(40, 1);}
    break;

    case 20: //toggle midi_mode
    if( !pin_value ) {
    all_param.router_flags_system.midi_mode ^= 1;
    MIOS_DOUT_PinGet(41) ? MIOS_DOUT_PinSet(41, 0) : MIOS_DOUT_PinSet(41, 1); }
    break;

    case 21: //ttl switch1
    if(!pin_value ) {
    if( all_param.router_flags_system.ttl_switch1 ) { //0 = eg1 -- 1 = eg3
    MIOS_DOUT_PinSet(35, 0);
    MIOS_DOUT_PinSet(33, 0);
    MIOS_DOUT_PinSet(32, 1);
    MIOS_DOUT_PinSet(34, 1);
    all_param.router_flags_system.ttl_switch1 = 0;
    break; }

    else {
    MIOS_DOUT_PinSet(34, 0);
    MIOS_DOUT_PinSet(32, 0);
    MIOS_DOUT_PinSet(33, 1);
    MIOS_DOUT_PinSet(35, 1);
    all_param.router_flags_system.ttl_switch1 = 1; } }
    break;

    case 22: //ttl switch2 0 = eg2 -- 1 = eg3
    if(!pin_value ) {
    if( all_param.router_flags_system.ttl_switch2 ) {
    MIOS_DOUT_PinSet(39, 0);
    MIOS_DOUT_PinSet(37, 0);
    MIOS_DOUT_PinSet(36, 1);
    MIOS_DOUT_PinSet(38, 1);
    all_param.router_flags_system.ttl_switch2 = 0;
    break; }

    else {
    MIOS_DOUT_PinSet(38, 0);
    MIOS_DOUT_PinSet(36, 0);
    MIOS_DOUT_PinSet(37, 1);
    MIOS_DOUT_PinSet(39, 1);
    all_param.router_flags_system.ttl_switch2 = 1;}}
    break;

    case 23:  //save

    if(!pin_value ) {
    app_flags.save_on ^= 1;
    app_flags.DISPLAY_UPDATE_REQ = 1;}
    break;

    case 24:  //eg1/2/3/4 select
    if(!pin_value ) {
      all_param.eg_select << 1;
      if (all_param.eg_select > 8 ) {
      all_param.eg_select = 1; }
      sr_temp = MIOS_DOUT_SRGet(5);
      sr_temp &= 0xf0;
      sr_temp |= all_param.eg_select;
      MIOS_DOUT_SRSet(5, sr_temp);
	  
      if(all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select){
      MIOS_DOUT_PinSet(24, 1);  }
      else {
      MIOS_DOUT_PinSet(24, 0);  }
      if (all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select)  {
      MIOS_DOUT_PinSet(25, 1); }
      else {
      MIOS_DOUT_PinSet(25, 0);}
      if (all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 & all_param.eg_select)  {
      MIOS_DOUT_PinSet(28, 1); }
      else {
      MIOS_DOUT_PinSet(28, 0);}
      if (all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 & all_param.eg_select)  {
      MIOS_DOUT_PinSet(29, 1); }
      else {
      MIOS_DOUT_PinSet(29, 0);}
      if (all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 & all_param.eg_select)  {
      MIOS_DOUT_PinSet(30, 1); }
      else {
      MIOS_DOUT_PinSet(30, 0);}
      if (all_param.router_flags_eg_v2s.ALL_flags_eg_v2s & all_param.eg_select)  {
      MIOS_DOUT_PinSet(27, 1); }
      else {
      MIOS_DOUT_PinSet(27, 0);}
      if (all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig & all_param.eg_select)  {
      MIOS_DOUT_PinSet(31, 1); }
      else {
      MIOS_DOUT_PinSet(31, 0);}
      if ((all_param.router_flags_eg_link.eg1_link_eg2) && (all_param.eg_select <= 2))  {
      MIOS_DOUT_PinSet(26, 1); }
      else if ((all_param.router_flags_eg_link.eg3_link_eg4) && (all_param.eg_select >= 4))  {
      MIOS_DOUT_PinSet(26, 1);}
      else {
      MIOS_DOUT_PinSet(26, 0);}
	  switch ( all_param.eg_select ) {
	    case 1:
	  eg_select_hlp = 0;
          break;
	  	case 2:
	  eg_select_hlp = 1;

          break;
	  	case 4:
	  eg_select_hlp = 2;
          break;
	  	case 8:
	  eg_select_hlp = 3;

          break;}}
break;

case 25: //preset1
if(!pin_value ){
    preset = 0x0100;
    if( app_flags.save_on ){
    BANKSTICK_SAVE_Evnt(bank, preset);  }
    else {
    BANKSTICK_LOAD_Evnt(bank, preset);  }
	sr_temp = MIOS_DOUT_SRGet(6);
    sr_temp &= 0x0f;
    sr_temp |= 0x10 ;
    MIOS_DOUT_SRSet(6, sr_temp);}
break;

case 26: //preset2
if(!pin_value ){
    preset = 0x0200;
    if( app_flags.save_on ){
    BANKSTICK_SAVE_Evnt(bank, preset);  }
    else {
    BANKSTICK_LOAD_Evnt(bank, preset);  }
    sr_temp = MIOS_DOUT_SRGet(6);
    sr_temp &= 0x0f;
    sr_temp |= 0x20;
    MIOS_DOUT_SRSet(6, sr_temp);}
break;

case 27: //preset3
if(!pin_value ){
    preset = 0x0300;
    if( app_flags.save_on ){
    BANKSTICK_SAVE_Evnt(bank, preset);  }
    else {
    BANKSTICK_LOAD_Evnt(bank, preset);  }
	sr_temp = MIOS_DOUT_SRGet(6);
    sr_temp &= 0x0f;
    sr_temp |= 0x40;
    MIOS_DOUT_SRSet(6, sr_temp);}
break;

case 28: //preset4
if(!pin_value ){
    preset = 0x0400;
    if( app_flags.save_on ){
    BANKSTICK_SAVE_Evnt(bank, preset);  }
    else {
    BANKSTICK_LOAD_Evnt(bank, preset);  }
    sr_temp = MIOS_DOUT_SRGet(6);
    sr_temp &= 0x0f;
    sr_temp |= 0x80;
    MIOS_DOUT_SRSet(6, sr_temp);	}
break;

case 29: //bank1-f1
if(!pin_value )
{  bank = 0x1000;
   sr_temp = MIOS_DOUT_SRGet(7);
   sr_temp &= 0xf0;
   sr_temp |= 0x01;
   MIOS_DOUT_SRSet(7, sr_temp);}
break;

case 30: //bank2-f2
if(!pin_value )
{  bank = 0x2000;
   sr_temp = MIOS_DOUT_SRGet(7);
   sr_temp &= 0xf0;
   sr_temp |= 0x02;
   MIOS_DOUT_SRSet(7, sr_temp);}
break;

case 31: //bank3-f3
if(!pin_value )
{  bank = 0x3000;
   sr_temp = MIOS_DOUT_SRGet(7);
   sr_temp &= 0xf0;
   sr_temp |= 0x04;
   MIOS_DOUT_SRSet(7, sr_temp);}
break;

case 32: //bank4-f4
if(!pin_value )
{  bank = 0x4000;
   sr_temp = MIOS_DOUT_SRGet(4);
   sr_temp &= 0xf0;
   sr_temp |= 0x08;
   MIOS_DOUT_SRSet(4, sr_temp);}
break;

case 33: //edit bpm(move lcd cursor)
if( !pin_value ) {
   CursorBpm ^= 1;
}
break;
}
}


/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when an encoder has been moved
// incrementer is positive when encoder has been turned clockwise, else
// it is negative
/////////////////////////////////////////////////////////////////////////////
void ENC_NotifyChange(unsigned char encoder, char incrementer) __wparam
{
unsigned int new_value;
switch( encoder ) {

case 0:// Attack
    if( all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select )  {
    break; }
    new_value = (unsigned int)all_param.attack[eg_select_hlp];
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.attack[eg_select_hlp] = (unsigned char)new_value;}
    break;
	
case 1:// Decay
    if( all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select ){
    break; }
    new_value = (unsigned int)all_param.decay[eg_select_hlp];
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.decay[eg_select_hlp] = (unsigned char)new_value;}
    break;

case 2:// Sustain
    new_value = (unsigned int)all_param.sustain[eg_select_hlp];
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.sustain[eg_select_hlp] = (unsigned char)new_value;}
break;

case 3:// Release
    new_value = (unsigned int)all_param.release[eg_select_hlp];
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.release[eg_select_hlp] = (unsigned char)new_value;}
break;

case 4://jogwheel :  bpm -  Eg MIDI channel  

   if (CursorBpm) {
      jog_value = all_param.bpm;
      if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 255) ) {
      all_param.bpm = jog_value;
      app_flags.DISPLAY_UPDATE_REQ = 1;	}}
	  
   else {
       
   switch( eg_select_hlp ) {
      case 0:
      jog_value = all_param.eg_channel[0];
      if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
      all_param.eg_channel[0] = jog_value;
      app_flags.DISPLAY_UPDATE_REQ = 1;}
      break;

      case 1:
      jog_value = all_param.eg_channel[1];
      if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
      all_param.eg_channel[1] = jog_value;
      app_flags.DISPLAY_UPDATE_REQ = 1;}
      break;

      case 2:
      jog_value = all_param.eg_channel[2];
      if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
      all_param.eg_channel[2] = jog_value;
      app_flags.DISPLAY_UPDATE_REQ = 1;}
      break;

      case 3:
      jog_value = all_param.eg_channel[3];
      if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
      all_param.eg_channel[3] = jog_value;
      app_flags.DISPLAY_UPDATE_REQ = 1;}
      break;} }
break;


case 5:

     if(all_param.router_flags_lfo1.lfo1_from_lfo2) {
     break;}

     if( all_param.router_flags_lfo1.lfo1_sync_bpm ) {
	 
    new_value = all_param.lfo0_bpm;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
    all_param.lfo0_bpm = new_value;
    app_flags.DISPLAY_UPDATE_REQ = 1;}
    break; }
    else {
    new_value = all_param.lfo0_rate;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.lfo0_rate = new_value;} }
break;

case 6:
     if(all_param.router_flags_lfo2.lfo2_from_lfo3) {
     break;}

     if( all_param.router_flags_lfo2.lfo2_sync_bpm ) {
    new_value = all_param.lfo1_bpm;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
    all_param.lfo1_bpm = new_value;
    app_flags.DISPLAY_UPDATE_REQ = 1;}
break; }
    else {
    new_value = all_param.lfo1_rate;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.lfo1_rate = new_value;} }
break;

case 7:

     if( all_param.router_flags_lfo3.lfo3_sync_bpm ) {
    new_value = all_param.lfo2_bpm;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
    all_param.lfo2_bpm = new_value;
    app_flags.DISPLAY_UPDATE_REQ = 1;}
break; }
    else {
    new_value = all_param.lfo2_rate;
    if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
    all_param.lfo2_rate = new_value;}  }
break;
}

}
/////////////////////////////////////////////////////////////////////////////
// This function is called by MIOS when a pot has been moved
/////////////////////////////////////////////////////////////////////////////
void AIN_NotifyChange(unsigned char pin, unsigned int pin_value) __wparam
{
}


