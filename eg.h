/*
 * EG program module definitions
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

#ifndef _EG_H
#define _EG_H

/////////////////////////////////////////////////////////////////////////////
// Global definitions
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Global Types
/////////////////////////////////////////////////////////////////////////////

// EG state definition
typedef enum {
  IDLE, ATTACK, DECAY, SUSTAIN, RELEASE
} eg_state_e;

// EG1 state definition
typedef enum {
  IDLE1, ATTACK1, DECAY1, SUSTAIN1, RELEASE1
} eg1_state_e;

// EG2 state definition
typedef enum {
  IDLE2, ATTACK2, DECAY2, SUSTAIN2, RELEASE2
} eg2_state_e;

// EG3 state definition
typedef enum {
  IDLE3, ATTACK3, DECAY3, SUSTAIN3, RELEASE3
} eg3_state_e;

// EG's internal state type
typedef union {
  struct {
    unsigned ALL:8;
  };
  struct {
    eg_state_e STATE:4;
    unsigned LAST_GATE:1;
  };
} eg_int_state_t, eg1_int_state1_t, eg2_int_state2_t, eg3_int_state3_t;


// EG external state type
typedef union {
  struct {
    unsigned ALL:8;
  };
  struct {
    unsigned GATE:1;
  };
} eg_state_t;


/////////////////////////////////////////////////////////////////////////////
// Prototypes
/////////////////////////////////////////////////////////////////////////////

void EG_Init(void);
void EG_Tick(void);

/////////////////////////////////////////////////////////////////////////////
// Export global variables
/////////////////////////////////////////////////////////////////////////////

// in order to achive best performance, we are NOT using arrays here!
extern eg_state_t    eg0, eg1, eg2, eg3;
extern volatile unsigned int  eg0_value;
extern volatile unsigned int  eg1_value;
extern volatile unsigned int  eg2_value;
extern volatile unsigned int  eg3_value;

#endif /* _EG_H */
