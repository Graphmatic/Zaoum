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

#ifndef _MAIN_H
#define _MAIN_H

/////////////////////////////////////////////////////////////////////////////
// Global definitions
/////////////////////////////////////////////////////////////////////////////

#define AIN_NUMBER_INPUTS      0    // number of used analog inputs (0..64)
#define AIN_MUXED_MODE         0    // set this to 1 if AIN modules are used
#define AIN_DEADBAND           3    // define deadband here (higher values reduce the effective resolution but reduce jitter)

// Note: AOUT specific settings are defined in aout.h


/////////////////////////////////////////////////////////////////////////////
// Global Types
/////////////////////////////////////////////////////////////////////////////

// status of analog toolbox application
typedef volatile union {
  struct {
    unsigned ALL:8;
  };
  struct {
    unsigned MENU_EG:1; //0 = BPM & LFO DIV ---- 1 = BPM & EG CHANNELS
    unsigned MENU_CHANGE:1;
    unsigned DISPLAY_UPDATE_REQ:1;  // requests a display update
    unsigned save_on:1;
  };
} app_flags_t;


void DISPLAY_lfobpm(volatile unsigned char lfo_bpm_temp) __wparam;

/////////////////////////////////////////////////////////////////////////////
// Export global variables
/////////////////////////////////////////////////////////////////////////////
// customized options
extern volatile unsigned int bank;
extern volatile unsigned int preset;
extern volatile unsigned char looper;
extern app_flags_t app_flags;



#endif /* _MAIN_H */
