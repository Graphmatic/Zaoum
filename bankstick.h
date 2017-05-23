/*
 * BANKSTICK program module definitions
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

#ifndef _BANKSTICK_H
#define _BANKSTICK_H

/////////////////////////////////////////////////////////////////////////////
// Global definitions
/////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////
// Global Types
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// Prototypes
/////////////////////////////////////////////////////////////////////////////

void BANKSTICK_Init(void)__wparam;



void BANKSTICK_LOAD_Evnt( volatile unsigned int bank,  volatile unsigned int preset)__wparam;
void BANKSTICK_SAVE_Evnt( volatile unsigned int bank,  volatile unsigned int preset)__wparam;
void BANKSTICK_Dout_Update(void)__wparam;
void BANKSTICK_Dout_Update_2(void) __wparam;
void BANKSTICK_Dout_Update_3(void) __wparam;
void BANKSTICK_preset_LEDs_Update( volatile unsigned int bank,  volatile unsigned int preset )__wparam;
/////////////////////////////////////////////////////////////////////////////
// Export global variables
/////////////////////////////////////////////////////////////////////////////

extern volatile unsigned char load_last;
extern volatile unsigned char update_led;
extern volatile unsigned char update_preset_led;
// customized options



#endif /* _LFO_H */
