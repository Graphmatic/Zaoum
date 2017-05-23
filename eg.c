/*
 * EG program module
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

// external accessible variables
eg_state_t    eg0, eg1, eg2, eg3;
volatile unsigned int  eg0_value;

volatile unsigned int  eg1_value;

volatile unsigned int  eg2_value;

volatile unsigned int  eg3_value;

// internal state (not externally available)
eg_int_state_t eg0_int, eg1_int, eg2_int, eg3_int;

// this includes the eg_add_table
// it was generated with: perl utils\eg_table.pl > eg_table.inc
#include "eg_table.inc"
extern volatile unsigned int lfo0_value;

/////////////////////////////////////////////////////////////////////////////
// This function initializes the EG module
// it should be called from USER_Init() in main.c
/////////////////////////////////////////////////////////////////////////////
void EG_Init(void)
{

}


/////////////////////////////////////////////////////////////////////////////
// This function is periodically invoked from USER_Timer()
/////////////////////////////////////////////////////////////////////////////
void EG_Tick(void)
{
  // in order to simplify the handling, we are working with an unsigned value here
  // (C doesn't natively provide a carry flag :-/ )
  unsigned int eg_value;
  unsigned int lvl;

  unsigned int eg1_value1;
  unsigned int lvl1;

  unsigned int eg2_value2;
  unsigned int lvl2;

  unsigned int eg3_value3;
  unsigned int lvl3;


  if( (eg0.GATE == 1) && (eg0_int.LAST_GATE == 0) ) { // rising edge
    eg0_int.LAST_GATE = 1;
    eg0_int.STATE = ATTACK;
  } else if( (eg0.GATE == 0) && (eg0_int.LAST_GATE == 1) ) { // falling edge
    eg0_int.LAST_GATE = 0;
    eg0_int.STATE = RELEASE;
  }
  eg0_int.LAST_GATE = eg0.GATE; // doesn't work with SDCC v2.5.0

  eg_value = eg0_value >> 1;

  switch( eg0_int.STATE ) {
    case IDLE:
      eg_value = 0x0000;
      break;

    case ATTACK:
      if( all_param.router_flags_lfo1_att.eg1_attack_lfo1 ) {
      all_param.attack[0] = lfo0_value ;}
      if( (eg_value += eg_add_table[all_param.attack[0]]) & 0x8000 ) {
        eg_value = 0x7fff;
	eg0_int.STATE = DECAY; }

      break;

    case DECAY:
      if( all_param.router_flags_lfo1_dec.eg1_decay_lfo1 ) {
      all_param.decay[0] = lfo0_value;}
      lvl = (all_param.sustain[0] << 7);

      if( ((eg_value -= eg_add_table[all_param.decay[0]]) <= lvl) || (eg_value & 0x8000) ) {
        eg_value = lvl;
	//        eg0_int.STATE = SUSTAIN;
      }
      break;

    case SUSTAIN:
      eg_value = (all_param.release[0] << 7);
      break;

    case RELEASE:
      if( (eg_value -= eg_add_table[all_param.release[0]]) & 0x8000 ) {
        eg_value = 0;
	eg0_int.STATE = IDLE;
      }
      break;
  }

  eg0_value = eg_value << 1;

/////////////////////////////////////
/////////////////////////////////////
if( !all_param.router_flags_eg_link.eg1_link_eg2 ) {

  if( (eg1.GATE == 1) && (eg1_int.LAST_GATE == 0) ) { // rising edge
    eg1_int.LAST_GATE = 1;
    eg1_int.STATE = ATTACK1;
  } else if( (eg1.GATE == 0) && (eg1_int.LAST_GATE == 1) ) { // falling edge
    eg1_int.LAST_GATE = 0;
    eg1_int.STATE = RELEASE1;
  }
  eg1_int.LAST_GATE = eg1.GATE; // doesn't work with SDCC v2.5.0

  eg1_value1 = eg1_value >> 1;

  switch( eg1_int.STATE ) {
    case IDLE1:
      eg1_value1 = 0x0000;
      break;

    case ATTACK1:
      if( all_param.router_flags_lfo1_att.eg2_attack_lfo1 ) {
      all_param.attack[1] = lfo0_value;}
      if( (eg1_value1 += eg_add_table[all_param.attack[1]]) & 0x8000 ) {
        eg1_value1 = 0x7fff;
	eg1_int.STATE = DECAY1;
      }
      break;

    case DECAY1:
      if( all_param.router_flags_lfo1_dec.eg2_decay_lfo1 ) {
      all_param.decay[1] = lfo0_value;}
      lvl1 = (all_param.sustain[1] << 7);

      if( ((eg1_value1 -= eg_add_table[all_param.decay[1]]) <= lvl1) || (eg1_value1 & 0x8000) ) {
        eg1_value1 = lvl1;
	//        eg1_int.STATE = SUSTAIN;
      }
      break;

    case SUSTAIN1:
      eg1_value1 = (all_param.sustain[1] << 7);
      break;

    case RELEASE1:
      if( (eg1_value1 -= eg_add_table[all_param.release[1]]) & 0x8000 ) {
        eg1_value1 = 0;
	eg1_int.STATE = IDLE1;
      }
      break;
  }

  eg1_value1 = eg1_value << 1;
}
/////////////////////////////////////
/////////////////////////////////////


  if( (eg2.GATE == 1) && (eg2_int.LAST_GATE == 0) ) { // rising edge
    eg2_int.LAST_GATE = 1;
    eg2_int.STATE = ATTACK2;
  } else if( (eg2.GATE == 0) && (eg2_int.LAST_GATE == 1) ) { // falling edge
    eg2_int.LAST_GATE = 0;
    eg2_int.STATE = RELEASE2;
  }
  eg2_int.LAST_GATE = eg2.GATE; // doesn't work with SDCC v2.5.0

  eg2_value2 = eg2_value >> 1;

  switch( eg2_int.STATE ) {
    case IDLE2:
      eg2_value2 = 0x0000;
      break;

    case ATTACK2:
      if( all_param.router_flags_lfo1_att.eg3_attack_lfo1 ) {
      all_param.attack[2] = lfo0_value;}
      if( (eg2_value2 += eg_add_table[all_param.attack[2]]) & 0x8000 ) {
        eg2_value2 = 0x7fff;
	eg2_int.STATE = DECAY2;
      }
      break;

    case DECAY2:
      if( all_param.router_flags_lfo1_dec.eg3_decay_lfo1 ) {
      all_param.decay[2] = lfo0_value;}
      lvl2 = (all_param.sustain[2] << 7);

      if( ((eg2_value2 -= eg_add_table[all_param.decay[2]]) <= lvl2) || (eg2_value2 & 0x8000) ) {
        eg2_value2 = lvl2;
	//        eg2_int.STATE = SUSTAIN;
      }
      break;

    case SUSTAIN2:
      eg2_value2 = (all_param.sustain[2] << 7);
      break;

    case RELEASE2:
      if( (eg2_value2 -= eg_add_table[all_param.release[2]]) & 0x8000 ) {
        eg2_value2 = 0;
	eg2_int.STATE = IDLE2;
      }
      break;
  }

  eg2_value2 = eg2_value << 1;


/////////////////////////////////////
/////////////////////////////////////
if( !all_param.router_flags_eg_link.eg3_link_eg4 ) {

  if( (eg3.GATE == 1) && (eg3_int.LAST_GATE == 0) ) { // rising edge
    eg3_int.LAST_GATE = 1;
    eg3_int.STATE = ATTACK3;
  } else if( (eg3.GATE == 0) && (eg3_int.LAST_GATE == 1) ) { // falling edge
    eg3_int.LAST_GATE = 0;
    eg3_int.STATE = RELEASE3;
  }
  eg3_int.LAST_GATE = eg3.GATE; // doesn't work with SDCC v2.5.0

  eg3_value3 = eg3_value >> 1;

  switch( eg3_int.STATE ) {
    case IDLE3:
      eg3_value3 = 0x0000;
      break;

    case ATTACK3:
      if( all_param.router_flags_lfo1_att.eg4_attack_lfo1 ) {
      all_param.attack[3] = lfo0_value;}

      if( (eg3_value3 += eg_add_table[all_param.attack[3]]) & 0x8000 ) {
        eg3_value3 = 0x7fff;
	eg3_int.STATE = DECAY3;
      }
      break;

    case DECAY3:
      if( all_param.router_flags_lfo1_dec.eg4_decay_lfo1 ) {
      all_param.decay[3] = lfo0_value;}
      lvl3 = (all_param.sustain[3] << 7);

      if( ((eg3_value3 -= eg_add_table[all_param.decay[3]]) <= lvl3) || (eg3_value3 & 0x8000) ) {
        eg3_value3 = lvl3;
	//        eg3_int.STATE = SUSTAIN;
      }
      break;

    case SUSTAIN3:
      eg3_value3 = (all_param.sustain[3] << 7);
      break;

    case RELEASE3:
      if( (eg3_value3 -= eg_add_table[all_param.release[3]]) & 0x8000 ) {
        eg3_value3 = 0;
	eg3_int.STATE = IDLE3;
      }
      break;
  }

  eg3_value3 = eg3_value << 1;
}
}
