/*
 * MAP program module definitions
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

#ifndef _MAP_H
#define _MAP_H

/////////////////////////////////////////////////////////////////////////////
// Global definitions
/////////////////////////////////////////////////////////////////////////////

#define CONV_16BIT_TO_12BIT(val) ((val) >> 4)
#define CONV_16BIT_TO_8BIT(val)  ((val) >> 8)

#define CONV_12BIT_TO_16BIT(val) ((val) << 4)
#define CONV_12BIT_TO_8BIT(val)  ((val) >> 4)

#define CONV_10BIT_TO_16BIT(val) ((val) << 6)
#define CONV_10BIT_TO_12BIT(val) ((val) << 2)
#define CONV_10BIT_TO_11BIT(val) ((val) << 1)
#define CONV_10BIT_TO_9BIT(val)  ((val) >> 1)
#define CONV_10BIT_TO_8BIT(val)  ((val) >> 2)
#define CONV_10BIT_TO_7BIT(val)  ((val) >> 3)

#define CONV_9BIT_TO_16BIT(val)  ((val) << 7)
#define CONV_9BIT_TO_12BIT(val)  ((val) << 3)
#define CONV_9BIT_TO_11BIT(val)  ((val) << 2)
#define CONV_9BIT_TO_10BIT(val)  ((val) << 1)
#define CONV_9BIT_TO_8BIT(val)   ((val) >> 1)
#define CONV_9BIT_TO_7BIT(val)   ((val) >> 2)

#define CONV_8BIT_TO_16BIT(val)  ((val) << 8)
#define CONV_8BIT_TO_12BIT(val)  ((val) << 4)
#define CONV_8BIT_TO_11BIT(val)  ((val) << 3)
#define CONV_8BIT_TO_10BIT(val)  ((val) << 2)
#define CONV_8BIT_TO_9BIT(val)   ((val) << 1)
#define CONV_8BIT_TO_7BIT(val)   ((val) >> 1)

#define CONV_7BIT_TO_16BIT(val)  ((val) << 9)
#define CONV_7BIT_TO_12BIT(val)  ((val) << 5)
#define CONV_7BIT_TO_11BIT(val)  ((val) << 4)
#define CONV_7BIT_TO_10BIT(val)  ((val) << 3)
#define CONV_7BIT_TO_9BIT(val)   ((val) << 2)
#define CONV_7BIT_TO_8BIT(val)   ((val) << 1)

/////////////////////////////////////////////////////////////////////////////
// Global Types
/////////////////////////////////////////////////////////////////////////////

#pragma udata gpr14 all_param


typedef volatile struct {
   union    //8
		{	
	struct
			{
		unsigned char ALL_flags_lfo1:8;  //init: 0000 0001 = 0x51  SR0 & 0x1f
			};
	struct
			{
		unsigned lfo1_waveform:4;    //  [free]-[square]-[sine]-[saw]
		unsigned lfo1_from_lfo2:1;
		unsigned lfo1_note_start:1;
		unsigned lfo1_sync_bpm:1;
		unsigned lfo1_nothing0:1;
			};
		} router_flags_lfo1;  //bankstick adress : 0xzz01
     union    //8
		{
			struct
			{
		unsigned char ALL_flags_lfo2:8;   //init: 0000 0001 = 0x51  SR1 & 0x1f
			};
			struct
			{
		unsigned lfo2_waveform:4;    //   [free]-square]-[sine]-[saw]
		unsigned lfo2_from_lfo3:1;
		unsigned lfo2_note_start:1;
		unsigned lfo2_sync_bpm:1;
		unsigned lfo2_nothing0:1;
			};
		} router_flags_lfo2;  //bankstick adress : 0xzz02
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_lfo3:8;   //init: 0000 0001 = 0x51  SR2 & 0x0f
			};
			struct
			{
		unsigned lfo3_waveform:3;    //[square]-[sine]-[saw]
		unsigned lfo3_nothing0:1;
		unsigned lfo3_nothing1:1;
		unsigned lfo3_note_start:1;
		unsigned lfo3_sync_bpm:1;
		unsigned lfo3_nothing2:1;
			};
		} router_flags_lfo3;  //bankstick adress : 0xzz03
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_lfo1_att:8;  //init: 0000 0000
			};
			struct
			{
		unsigned eg1_attack_lfo1:1;
		unsigned eg2_attack_lfo1:1;
		unsigned eg3_attack_lfo1:1;
		unsigned eg4_attack_lfo1:1;
		unsigned eg4_attack_lfo1_nothing:4;

			};
		} router_flags_lfo1_att;  //bankstick adress : 0xzz04
    union    //8	
		{
			struct
			{
		unsigned char ALL_flags_lfo1_dec:8;  //init: 0000 0000
			};
			struct
			{
		unsigned eg1_decay_lfo1:1;    //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned eg2_decay_lfo1:1;    //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned eg3_decay_lfo1:1;    //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned eg4_decay_lfo1:1;    //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned egx_decay_lfo1_nothing:4;
			};
		} router_flags_lfo1_dec;   //bankstick adress : 0xzz05
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_eg_link:8;  //init: 0000 0000
			};
			struct
			{
		unsigned eg1_link_eg2:1;
		unsigned eg3_link_eg4:1;
		unsigned egx_link_egx_nothing:6;
			};
		} router_flags_eg_link;   //bankstick adress : 0xzz06
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_eg_v2s:8;  //init: 0000 0000
			};
			struct
			{
		unsigned eg1_vel_2_sustain:1;
		unsigned eg2_vel_2_sustain:1;
		unsigned eg3_vel_2_sustain:1;
		unsigned eg4_vel_2_sustain:1;
		unsigned egx_vel_2_sustain_nothing:4;
			};
		} router_flags_eg_v2s;   //bankstick adress :  : 0xzz07
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_eg_audio_trig:8;  //init: 0000 0000
			};
			struct
			{
		unsigned eg1_audio_trig:1;
		unsigned eg2_audio_trig:1;
		unsigned eg3_audio_trig:1;
		unsigned eg4_audio_trig:1;
		unsigned eg1_audio_trig_on:1;
		unsigned eg2_audio_trig_on:1;
		unsigned eg3_audio_trig_on:1;
		unsigned eg4_audio_trig_on:1;		};
		} router_flags_eg_audio_trig;   //bankstick adress :  : 0xzz08
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_Eg_to_lfo1:8;   //init: 0000 0000
			};
			struct
			{
		unsigned Eg_to_lfo1:4;       //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned Eg_to_lfo1_nothing:4;
			};
		} router_flags_Eg_to_lfo1;  //bankstick adress : 0xzz09
    union    //8
		{	
			struct
			{
		unsigned char ALL_flags_Eg_to_lfo2:8;   //init: 0000 0000
			};
			struct
			{
		unsigned Eg_to_lfo2:4;       //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned Eg_to_lfo2_nothing:4;

			};
		} router_flags_Eg_to_lfo2;  //bankstick adress : 0xzz0a
    union    //8
		{	
			struct
			{
		unsigned char ALL_flags_Eg_to_lfo3:8;   //init: 0000 0000
			};
			struct
			{
		unsigned Eg_to_lfo3:4;       //[eg3]-[eg2]-[eg1]-[eg0]
		unsigned Eg_to_lfo3_nothing:4;

			};
		} router_flags_Eg_to_lfo3;  //bankstick adress : 0xzz0b
    union    //8
		{
			struct
			{
		unsigned char ALL_flags_system:8;      //init: 0000 0000
			};
			struct
			{
		unsigned twin_mode: 1;
		unsigned midi_mode:1;
		unsigned ttl_switch1:1;
		unsigned ttl_switch2:1;
		unsigned system_nothing:4;
			};
		} router_flags_system;    //bankstick adress : 0xzz00
	unsigned char eg_channel[4];	
    unsigned char attack[4];
    unsigned char decay[4];
    unsigned char sustain[4];
    unsigned char release[4];    
    unsigned char lfo0_rate;
    unsigned char lfo1_rate;
    unsigned char lfo2_rate;
    unsigned char lfo0_bpm;
    unsigned char lfo1_bpm;
    unsigned char lfo2_bpm;
    unsigned char eg_select;
    unsigned char bpm;
	unsigned char fill[24];
}all_param_t;


/////////////////////////////////////////////////////////////////////////////
// Prototypes
/////////////////////////////////////////////////////////////////////////////

void MAP_Init(void);
void MAP_Tick(void)__wparam;

/////////////////////////////////////////////////////////////////////////////
// Export global variables
/////////////////////////////////////////////////////////////////////////////
extern volatile all_param_t all_param;


#endif /* _MAP_H */
