/*
 * MAP program module
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
// Structures
/////////////////////////////////////////////////////////////////////////////
typedef union {
  struct {
    unsigned ALL:8;
  };
  struct {
    unsigned G0:1;  // 1st gate pin
    unsigned G1:1;  // 2nd gate pin
    unsigned G2:1;  // 3rd gate pin
    unsigned G3:1;  // 4th gate pin
    unsigned G4:1;  // 5th gate pin
    unsigned G5:1;  // 6th gate pin
    unsigned G6:1;  // 7th gate pin
    unsigned G7:1;  // 8th gate pin
  };
} gates_t;
/////////////////////////////////////////////////////////////////////////////
// Global variables
/////////////////////////////////////////////////////////////////////////////

// router specific flags (see bitfield declaration in router.h)
all_param_t all_param;
//bankstick_u bankstick_sav;
//all_param_u all_bufferz;
 //  unsigned char ALL_bs;  //init: 0000 0001 = 0x51  SR0 & 0x1f



// generated with "perl utils\sinwave.pl"
const unsigned char sinewave[256] = {
  128,131,134,137,140,143,146,149,152,156,159,162,165,168,171,174,
  176,179,182,185,188,191,193,196,199,201,204,206,209,211,213,216,
  218,220,222,224,226,228,230,232,234,236,237,239,240,242,243,245,
  246,247,248,249,250,251,252,252,253,254,254,255,255,255,255,255,
  255,255,255,255,255,255,254,254,253,252,252,251,250,249,248,247,
  246,245,243,242,240,239,237,236,234,232,230,228,226,224,222,220,
  218,216,213,211,209,206,204,201,199,196,193,191,188,185,182,179,
  176,174,171,168,165,162,159,156,152,149,146,143,140,137,134,131,
  128,125,122,119,116,113,110,107,104,100, 97, 94, 91, 88, 85, 82,
   80, 77, 74, 71, 68, 65, 63, 60, 57, 55, 52, 50, 47, 45, 43, 40,
   38, 36, 34, 32, 30, 28, 26, 24, 22, 20, 19, 17, 16, 14, 13, 11,
   10,  9,  8,  7,  6,  5,  4,  4,  3,  2,  2,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  2,  2,  3,  4,  4,  5,  6,  7,  8,  9,
   10, 11, 13, 14, 16, 17, 19, 20, 22, 24, 26, 28, 30, 32, 34, 36,
   38, 40, 43, 45, 47, 50, 52, 55, 57, 60, 63, 65, 68, 71, 74, 77,
   80, 82, 85, 88, 91, 94, 97,100,104,107,110,113,116,119,122,125,
};

// generated with "perl utils\sinwave.pl"
const unsigned char squarewave[256] = {
  250,251,252,253,254,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,255,
  255,255,255,255,255,255,255,255,255,255,255,254,253,252,251,250,
    6,  5,  4,  3,  2,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,
    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  3,  4,  5,  6,
};

extern const unsigned int lfo_add_table[256];
extern const unsigned int lfo_add_table_bpm[256];


/////////////////////////////////////////////////////////////////////////////
// This function initializes the MAP module
// it should be called from USER_Init() in main.c
/////////////////////////////////////////////////////////////////////////////
void MAP_Init(void)
{

}


/////////////////////////////////////////////////////////////////////////////
// This function is invoked each time nothing else is to do
// it should be called from USER_Tick() in main.c
/////////////////////////////////////////////////////////////////////////////
void MAP_Tick(void) __wparam
{


  unsigned char value_8bit;
  gates_t gates;

///////////////////////////////////////////////////////////////////////////
// clear all gate flags (will be re-assigned on each update cycle)
gates.ALL = 0;

///////////////////////////////////////////////////////////////////////////
// AOUT #1:  LFO0, the rate is modified with encoder 5
///////////////////////////////////////////////////////////////////////////

switch( all_param.router_flags_lfo1.lfo1_waveform )
{

   case 1:
    AOUT_Pin16bitSet(0, lfo0_value);
   break;

   case 2:
    AOUT_Pin16bitSet(0, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo0_value)]));

   break;

   case 4:
    AOUT_Pin16bitSet(0, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo0_value)]));
   break;

};

if( all_param.router_flags_lfo1.lfo1_from_lfo2 ) {
    all_param.lfo0_rate = CONV_16BIT_TO_8BIT(lfo1_value);}


  ///////////////////////////////////////////////////////////////////////////
  // AOUT #2:  LFO1, the rate is modified with encoder 6

switch( all_param.router_flags_lfo2.lfo2_waveform )
{
   case 1:
    AOUT_Pin16bitSet(1, lfo1_value);
   break;

   case 2:
    AOUT_Pin16bitSet(1, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo1_value)]));
   break;

   case 4:
    AOUT_Pin16bitSet(1, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo1_value)]));
   break;
};


if( all_param.router_flags_lfo2.lfo2_from_lfo3 ) {
    all_param.lfo1_rate = CONV_16BIT_TO_8BIT(lfo2_value);}


  ///////////////////////////////////////////////////////////////////////////
  // AOUT #3: lfo2 the rate is modified with encoder 7

switch( all_param.router_flags_lfo3.lfo3_waveform )
{
   case 1:
    AOUT_Pin16bitSet(2, lfo2_value);
   break;

   case 2:
    AOUT_Pin16bitSet(2, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo2_value)]));
   break;

   case 4:
    AOUT_Pin16bitSet(2, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo2_value)]));
   break;
};

  ///////////////////////////////////////////////////////////////////////////
  // AOUT #4: forward EG1 output-

  AOUT_Pin16bitSet(3, eg0_value);
  if (!all_param.router_flags_eg_audio_trig.eg1_audio_trig) {
  value_8bit = all_param.eg_channel[0];
  eg0.GATE = midi_note[value_8bit].GATE;  }// EG triggered with MIDI note at Channel #eg_channel[0];
  else {
  eg0.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }
  ///////////////////////////////////////////////////////////////////////////
  // AOUT #5: forward EG2 output- or EG1 output if eg1-2 link enabled
  if (all_param.router_flags_eg_link.eg1_link_eg2) {
  AOUT_Pin16bitSet(4, eg0_value);
  if (!all_param.router_flags_eg_audio_trig.eg1_audio_trig || !all_param.router_flags_eg_audio_trig.eg2_audio_trig) {
  value_8bit = all_param.eg_channel[0];
  eg1.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[0];
  else {
  eg1.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }}
  else {
  AOUT_Pin16bitSet(4, eg1_value);
  if (!all_param.router_flags_eg_audio_trig.eg2_audio_trig) { 
  value_8bit = all_param.eg_channel[1];
  eg1.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[1];
  else {
  eg1.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }}
  ///////////////////////////////////////////////////////////////////////////
  // AOUT #6: forward EG3 output-
  AOUT_Pin16bitSet(5, eg2_value);
  if (!all_param.router_flags_eg_audio_trig.eg3_audio_trig) {
  value_8bit = all_param.eg_channel[2];
  eg2.GATE = midi_note[value_8bit].GATE; }// EG triggered with MIDI note at Channel #eg_channel[2];
  else {
  eg2.GATE = all_param.router_flags_eg_audio_trig.eg3_audio_trig_on; }

  ///////////////////////////////////////////////////////////////////////////
  // AOUT #7: forward EG4 output- or EG3 output if eg3-4 link enabled
  if (all_param.router_flags_eg_link.eg3_link_eg4) {
  AOUT_Pin16bitSet(6, eg2_value);
  if (!all_param.router_flags_eg_audio_trig.eg3_audio_trig || !all_param.router_flags_eg_audio_trig.eg4_audio_trig) {
  value_8bit = all_param.eg_channel[2];
  eg3.GATE = midi_note[value_8bit].GATE; }  // EG triggered with MIDI note at Channel #eg_channel[2];
  else {
  eg3.GATE = all_param.router_flags_eg_audio_trig.eg3_audio_trig_on; }}
  else {
  AOUT_Pin16bitSet(6, eg3_value);
  if (!all_param.router_flags_eg_audio_trig.eg4_audio_trig ) {
  value_8bit = all_param.eg_channel[3];
  eg3.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[3];
  else {
  eg2.GATE = all_param.router_flags_eg_audio_trig.eg4_audio_trig_on; }  }

  ///////////////////////////////////////////////////////////////////////////
  // AOUT #8: MIDI
  AOUT_Update();
  // update the digital gates
  AOUT_DigitalPinsSet(gates.ALL);
}
