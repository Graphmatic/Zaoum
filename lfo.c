/*
 * LFO program module
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
/////////////////////////////////////////////////////////////////////////////
// Global variables
/////////////////////////////////////////////////////////////////////////////

// in order to achive best performance, we are NOT using arrays here!

// in order to achive best performance, we are NOT using arrays here!

// external accessible variables
volatile unsigned int  lfo0_value, lfo1_value, lfo2_value;

volatile unsigned int LFO_bpm_tmp2;
// external accessible variables
volatile unsigned char save0;
volatile unsigned char save1;
volatile unsigned char save2;
volatile unsigned char save3;
extern volatile  unsigned  char new_note;
extern volatile  unsigned char bpm;
volatile unsigned char lfox_bpm;
// this includes the lfo_add_table
// it was generated with: perl utils\lfo_table.pl > lfo_table.inc
#include "lfo_table.inc"


/////////////////////////////////////////////////////////////////////////////
// This function initializes the LFO module
// it should be called from USER_Init() in main.c
/////////////////////////////////////////////////////////////////////////////
void LFO_Init(void)
{
  lfo0_value = 0x7fff;
  lfo1_value = 0x7fff;
  lfo2_value = 0x7fff;

}


/////////////////////////////////////////////////////////////////////////////
// This function is periodically invoked from USER_Timer()
/////////////////////////////////////////////////////////////////////////////
void LFO_Tick(void)
{



  // this generates a saw waveform with the given frequency rate
  // it can be easily converted to other waveforms by using transforming tables
  // (-> see example in map.c, the sinwave[] array)

if( all_param.router_flags_lfo1.lfo1_note_start ) {
    if( new_note ) {
      lfo0_value = 0;
      new_note ^= 1; } }


if( all_param.lfo0_rate > 0 ) {

if( all_param.router_flags_lfo1.lfo1_sync_bpm ) {

    lfox_bpm = all_param.lfo0_bpm;
    LFO_bpm(lfox_bpm);

switch( all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ) {
    case 0:
    lfo0_value += LFO_bpm_tmp2;
    break;
    case 1:
    lfo0_value = save0;
    lfo0_value += LFO_bpm_tmp2;
    if( lfo0_value >= eg0_value ) {
    save0 = lfo0_value;
    lfo0_value = eg0_value;
    break;}
    case 2:
    lfo0_value = save0;
    lfo0_value += LFO_bpm_tmp2;
    if( lfo0_value >= eg1_value ) {
    save0 = lfo0_value;
    lfo0_value = eg1_value;
    break; }
    case 4:
    lfo0_value = save0;
    lfo0_value += LFO_bpm_tmp2;
    if( lfo0_value >= eg2_value ) {
    save0 = lfo0_value;
    lfo0_value = eg2_value; }
    break;
    case 8:
    lfo0_value = save0;
    lfo0_value += LFO_bpm_tmp2;
    if( lfo0_value >= eg3_value ) {
    save0 = lfo0_value;
    lfo0_value = eg3_value; }
    break;
}
}
else {
switch( all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ) {
    case 0:
    lfo0_value += lfo_add_table[all_param.lfo0_rate];
    break;
    case 1:
    lfo0_value = save0;
    lfo0_value += lfo_add_table[all_param.lfo0_rate];
    if( lfo0_value >= eg0_value ) {
    save0 = lfo0_value;
    lfo0_value = eg0_value;
    break;}
    case 2:
    lfo0_value = save0;
    lfo0_value += lfo_add_table[all_param.lfo0_rate];
    if( lfo0_value >= eg1_value ) {
    save0 = lfo0_value;
    lfo0_value = eg1_value;
    break; }
    case 4:
    lfo0_value = save0;
    lfo0_value += lfo_add_table[all_param.lfo0_rate];
    if( lfo0_value >= eg2_value ) {
    save0 = lfo0_value;
    lfo0_value = eg2_value; }
    break;
    case 8:
    lfo0_value = save0;
    lfo0_value += lfo_add_table[all_param.lfo0_rate];
    if( lfo0_value >= eg3_value ) {
    save0 = lfo0_value;
    lfo0_value = eg3_value; }
    break;
}
}
}
if( all_param.router_flags_lfo2.lfo2_note_start ) {
    if( new_note ) {
      lfo1_value = 0;
      new_note ^= 2; } }

if( all_param.lfo1_rate > 0 ) {

if( all_param.router_flags_lfo2.lfo2_sync_bpm ) {

    lfox_bpm = all_param.lfo1_bpm;
    LFO_bpm(lfox_bpm);

switch( all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ) {
    case 0:
    lfo1_value += LFO_bpm_tmp2;
    break;
    case 1:
    lfo1_value = save1;
    lfo1_value += LFO_bpm_tmp2;
    if( lfo1_value >= eg0_value ) {
    save1 = lfo1_value;
    lfo1_value = eg0_value;
    break; }
    case 2:
    lfo1_value = save1;
    lfo1_value += LFO_bpm_tmp2;
    if( lfo1_value >= eg1_value ) {
    save1 = lfo1_value;
    lfo1_value = eg1_value;
    break; }
    case 4:
    lfo1_value = save1;
    lfo1_value += LFO_bpm_tmp2;
    if( lfo1_value >= eg2_value ) {
    save1 = lfo1_value;
    lfo1_value = eg2_value;
    break; }
    case 8:
    lfo1_value = save1;
    lfo1_value += LFO_bpm_tmp2;
    if( lfo0_value >= eg3_value ) {
    save1 = lfo1_value;
    lfo1_value = eg3_value;
    break; }
}
}
else {
switch( all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ) {
    case 0:
    lfo1_value += lfo_add_table[all_param.lfo1_rate];
    break;
    case 1:
    lfo1_value = save1;
    lfo1_value += lfo_add_table[all_param.lfo1_rate];
    if( lfo1_value >= eg0_value ) {
    save1 = lfo1_value;
    lfo1_value = eg0_value;
    break; }
    case 2:
    lfo1_value = save1;
    lfo1_value += lfo_add_table[all_param.lfo1_rate];
    if( lfo1_value >= eg1_value ) {
    save1 = lfo1_value;
    lfo1_value = eg1_value;
    break; }
    case 4:
    lfo1_value = save1;
    lfo1_value += lfo_add_table[all_param.lfo1_rate];
    if( lfo1_value >= eg2_value ) {
    save1 = lfo1_value;
    lfo1_value = eg2_value;
    break; }
    case 8:
    lfo1_value = save1;
    lfo1_value += lfo_add_table[all_param.lfo1_rate];
    if( lfo0_value >= eg3_value ) {
    save1 = lfo1_value;
    lfo1_value = eg3_value;
    break; }
}
}
}
if( all_param.router_flags_lfo3.lfo3_note_start ) {
    if( new_note ) {
      lfo1_value = 0;
      new_note ^= 4; } }

if( all_param.lfo2_rate > 0 ) {

if(all_param.router_flags_lfo2.lfo2_sync_bpm ) {

    lfox_bpm = all_param.lfo2_bpm;
    LFO_bpm(lfox_bpm);

switch( all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ) {
    case 0:
    lfo2_value += LFO_bpm_tmp2;
    break;
    case 1:
    lfo2_value = save2;
    lfo2_value += LFO_bpm_tmp2;
    if( lfo2_value >= eg0_value ) {
    save2 = lfo2_value;
    lfo2_value = eg0_value;
    break;  }
    case 2:
    lfo2_value = save2;
    lfo2_value += LFO_bpm_tmp2;
    if( lfo2_value >= eg1_value ) {
    save2 = lfo2_value;
    lfo2_value = eg1_value;
    break;  }
    case 4:
    lfo2_value = save2;
    lfo2_value += LFO_bpm_tmp2;
    if( lfo2_value >= eg2_value ) {
    save2 = lfo2_value;
    lfo2_value = eg2_value;
    break; }
    case 8:
    lfo2_value = save2;
    lfo2_value += LFO_bpm_tmp2;
    if( lfo2_value >= eg3_value ) {
    save2 = lfo2_value;
    lfo2_value = eg3_value;
    break;}
}
}
else {

switch( all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ) {

    case 0:
    lfo2_value += lfo_add_table[all_param.lfo2_rate];
    break;
    case 1:
    lfo2_value = save2;
    lfo2_value += lfo_add_table[all_param.lfo2_rate];
    if( lfo2_value >= eg0_value ) {
    save2 = lfo2_value;
    lfo2_value = eg0_value;
    break;  }
    case 2:
    lfo2_value = save2;
    lfo2_value += lfo_add_table[all_param.lfo2_rate];
    if( lfo2_value >= eg1_value ) {
    save2 = lfo2_value;
    lfo2_value = eg1_value;
    break;  }
    case 4:
    lfo2_value = save2;
    lfo2_value += lfo_add_table[all_param.lfo2_rate];
    if( lfo2_value >= eg2_value ) {
    save2 = lfo2_value;
    lfo2_value = eg2_value;
    break; }
    case 8:
    lfo2_value = save2;
    lfo2_value += lfo_add_table[all_param.lfo2_rate];
    if( lfo2_value >= eg3_value ) {
    save2 = lfo2_value;
    lfo2_value = eg3_value;
    break;}
   }
  }
}
}

///


///////help bpm div/mult
void LFO_bpm(volatile unsigned char lfox_bpm)
{

volatile unsigned int LFO_bpm_tmp;


  LFO_bpm_tmp = lfo_add_table_bpm[all_param.bpm];

switch( lfox_bpm ) {

  case 0:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 6;
  break;
  case 1:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 5;
  break;
  case 2:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 4;
  break;
  case 3:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 3;
  break;
  case 4:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 2;
  break;
  case 5:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 1;
  break;
  case 6:
  LFO_bpm_tmp2 = LFO_bpm_tmp << 0;
  break;
  case 7:
  LFO_bpm_tmp2 = LFO_bpm_tmp >> 1;
  break;
  case 8:
  LFO_bpm_tmp2 = LFO_bpm_tmp >> 2;
  break;
  case 9:
  LFO_bpm_tmp2 = LFO_bpm_tmp >> 3;
  break;
  case 10:
  LFO_bpm_tmp2 = LFO_bpm_tmp >> 4;
  break;
}


}





