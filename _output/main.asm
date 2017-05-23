;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:00 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"main.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _DISPLAY_lfobpm
	global _app_flags
	global _eg_select_hlp
	global _jog_value
	global _lcd_temp
	global _CursorBpm
	global _preset
	global _bank
	global _lfo_bpm_temp
	global _Init
	global _Tick
	global _Timer
	global _DISPLAY_Init
	global _DISPLAY_Tick
	global _MPROC_NotifyReceivedEvnt
	global _MPROC_NotifyFoundEvent
	global _MPROC_NotifyTimeout
	global _MPROC_NotifyReceivedByte
	global _SR_Service_Prepare
	global _SR_Service_Finish
	global _DIN_NotifyToggle
	global _ENC_NotifyChange
	global _AIN_NotifyChange

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern _MIOS_BOX_CFG0
	extern _MIOS_BOX_CFG1
	extern _MIOS_BOX_STAT
	extern _MIOS_PARAMETER1
	extern _MIOS_PARAMETER2
	extern _MIOS_PARAMETER3
	extern _PORTAbits
	extern _PORTBbits
	extern _PORTCbits
	extern _PORTDbits
	extern _PORTEbits
	extern _LATAbits
	extern _LATBbits
	extern _LATCbits
	extern _LATDbits
	extern _LATEbits
	extern _TRISAbits
	extern _TRISBbits
	extern _TRISCbits
	extern _TRISDbits
	extern _TRISEbits
	extern _OSCTUNEbits
	extern _PIE1bits
	extern _PIR1bits
	extern _IPR1bits
	extern _PIE2bits
	extern _PIR2bits
	extern _IPR2bits
	extern _EECON1bits
	extern _RCSTAbits
	extern _TXSTAbits
	extern _T3CONbits
	extern _CMCONbits
	extern _CVRCONbits
	extern _ECCP1ASbits
	extern _PWM1CONbits
	extern _BAUDCONbits
	extern _CCP2CONbits
	extern _CCP1CONbits
	extern _ADCON2bits
	extern _ADCON1bits
	extern _ADCON0bits
	extern _SSPCON2bits
	extern _SSPCON1bits
	extern _SSPSTATbits
	extern _T2CONbits
	extern _T1CONbits
	extern _RCONbits
	extern _WDTCONbits
	extern _HLVDCONbits
	extern _OSCCONbits
	extern _T0CONbits
	extern _STATUSbits
	extern _FSR2Hbits
	extern _BSRbits
	extern _FSR1Hbits
	extern _FSR0Hbits
	extern _INTCON3bits
	extern _INTCON2bits
	extern _INTCONbits
	extern _TBLPTRUbits
	extern _PCLATHbits
	extern _PCLATUbits
	extern _STKPTRbits
	extern _TOSUbits
	extern _looper
	extern _midi_note
	extern _midi_cc_chn0
	extern _midi_pitch_bender
	extern _new_note
	extern _lfo0_value
	extern _lfo1_value
	extern _lfo2_value
	extern _eg0
	extern _eg1
	extern _eg2
	extern _eg3
	extern _eg0_value
	extern _eg1_value
	extern _eg2_value
	extern _eg3_value
	extern _all_param
	extern _load_last
	extern _update_led
	extern _update_preset_led
	extern _PORTA
	extern _PORTB
	extern _PORTC
	extern _PORTD
	extern _PORTE
	extern _LATA
	extern _LATB
	extern _LATC
	extern _LATD
	extern _LATE
	extern _TRISA
	extern _TRISB
	extern _TRISC
	extern _TRISD
	extern _TRISE
	extern _OSCTUNE
	extern _PIE1
	extern _PIR1
	extern _IPR1
	extern _PIE2
	extern _PIR2
	extern _IPR2
	extern _EECON1
	extern _EECON2
	extern _EEDATA
	extern _EEADR
	extern _RCSTA
	extern _TXSTA
	extern _TXREG
	extern _RCREG
	extern _SPBRG
	extern _SPBRGH
	extern _T3CON
	extern _TMR3L
	extern _TMR3H
	extern _CMCON
	extern _CVRCON
	extern _ECCP1AS
	extern _PWM1CON
	extern _BAUDCON
	extern _CCP2CON
	extern _CCPR2L
	extern _CCPR2H
	extern _CCP1CON
	extern _CCPR1L
	extern _CCPR1H
	extern _ADCON2
	extern _ADCON1
	extern _ADCON0
	extern _ADRESL
	extern _ADRESH
	extern _SSPCON2
	extern _SSPCON1
	extern _SSPSTAT
	extern _SSPADD
	extern _SSPBUF
	extern _T2CON
	extern _PR2
	extern _TMR2
	extern _T1CON
	extern _TMR1L
	extern _TMR1H
	extern _RCON
	extern _WDTCON
	extern _HLVDCON
	extern _OSCCON
	extern _T0CON
	extern _TMR0L
	extern _TMR0H
	extern _STATUS
	extern _FSR2L
	extern _FSR2H
	extern _PLUSW2
	extern _PREINC2
	extern _POSTDEC2
	extern _POSTINC2
	extern _INDF2
	extern _BSR
	extern _FSR1L
	extern _FSR1H
	extern _PLUSW1
	extern _PREINC1
	extern _POSTDEC1
	extern _POSTINC1
	extern _INDF1
	extern _WREG
	extern _FSR0L
	extern _FSR0H
	extern _PLUSW0
	extern _PREINC0
	extern _POSTDEC0
	extern _POSTINC0
	extern _INDF0
	extern _INTCON3
	extern _INTCON2
	extern _INTCON
	extern _PRODL
	extern _PRODH
	extern _TABLAT
	extern _TBLPTRL
	extern _TBLPTRH
	extern _TBLPTRU
	extern _PCL
	extern _PCLATH
	extern _PCLATU
	extern _STKPTR
	extern _TOSL
	extern _TOSH
	extern _TOSU
	extern _MIOS_AIN_DeadbandSet
	extern _MIOS_AIN_NumberSet
	extern _MIOS_AIN_UnMuxed
	extern _MIOS_DOUT_PinGet
	extern _MIOS_DOUT_PinSet
	extern _MIOS_DOUT_SRGet
	extern _MIOS_DOUT_SRSet
	extern _MIOS_SRIO_NumberSet
	extern _MIOS_SRIO_UpdateFrqSet
	extern _MIOS_LCD_Clear
	extern _MIOS_LCD_CursorSet
	extern _MIOS_LCD_PrintBCD3
	extern _MIOS_LCD_PrintCString
	extern _MIOS_TIMER_Init
	extern _MIOS_HLP_16bitAddSaturate
	extern _AOUT_Init
	extern _AOUT_Update
	extern _MIDI_Init
	extern _MIDI_Evnt
	extern _LFO_Init
	extern _LFO_Tick
	extern _EG_Init
	extern _EG_Tick
	extern _MAP_Init
	extern _MAP_Tick
	extern _BANKSTICK_Init
	extern _BANKSTICK_LOAD_Evnt
	extern _BANKSTICK_SAVE_Evnt
	extern _BANKSTICK_Dout_Update
	extern _BANKSTICK_Dout_Update_2
	extern _BANKSTICK_Dout_Update_3
	extern _BANKSTICK_preset_LEDs_Update
	extern _mios_enc_pin_table
	extern _mios_mproc_event_table
	extern _MIOS_MPROC_EVENT_TABLE
	extern _MIOS_ENC_PIN_TABLE
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
PCL	equ	0xff9
PCLATH	equ	0xffa
PCLATU	equ	0xffb
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODH	equ	0xff4


	idata
_CursorBpm	db	0x01


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1


gpr14	udata

udata_main_0	udata
_bank	res	2

udata_main_1	udata
_preset	res	2

udata_main_2	udata
_app_flags	res	1

udata_main_3	udata
_lcd_temp	res	1

udata_main_4	udata
_lfo_bpm_temp	res	1

udata_main_5	udata
_DISPLAY_lfobpm_lfo_bpm_temp_1_1	res	1

udata_main_6	udata
_eg_select_hlp	res	1

udata_main_7	udata
_ENC_NotifyChange_new_value_1_1	res	2

udata_main_8	udata
_jog_value	res	2

udata_main_9	udata
iTemp109	res	1

udata_main_10	udata
iTemp124	res	1

udata_main_11	udata
iTemp139	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_main__AIN_NotifyChange	code
_AIN_NotifyChange:
	.line	807; main.c	void AIN_NotifyChange(unsigned char pin, unsigned int pin_value) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	809; main.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__ENC_NotifyChange	code
_ENC_NotifyChange:
	.line	680; main.c	void ENC_NotifyChange(unsigned char encoder, char incrementer) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVWF	r0x00
	MOVLW	0x02
	MOVFF	PLUSW2, r0x01
	.line	683; main.c	switch( encoder ) {
	MOVLW	0x08
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	GOTO	_00636_DS_
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	CLRF	r0x05
	RLCF	r0x00, W
	RLCF	r0x05, F
	RLCF	WREG, W
	RLCF	r0x05, F
	ANDLW	0xfc
	MOVWF	r0x04
	MOVLW	UPPER(_00664_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00664_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00664_DS_)
	ADDWF	r0x04, F
	MOVF	r0x05, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	PCL
_00664_DS_:
	GOTO	_00572_DS_
	GOTO	_00577_DS_
	GOTO	_00582_DS_
	GOTO	_00585_DS_
	GOTO	_00588_DS_
	GOTO	_00607_DS_
	GOTO	_00617_DS_
	GOTO	_00627_DS_
_00572_DS_:
	BANKSEL	(_all_param + 3)
	.line	686; main.c	if( all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select )  {
	MOVF	(_all_param + 3), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	GOTO	_00636_DS_
	.line	688; main.c	new_value = (unsigned int)all_param.attack[eg_select_hlp];
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 16)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 16)
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVFF	r0x00, _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	689; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	GOTO	_00636_DS_
	.line	690; main.c	all_param.attack[eg_select_hlp] = (unsigned char)new_value;}
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 16)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 16)
	ADDWFC	r0x02, F
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x03
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	.line	691; main.c	break;
	GOTO	_00636_DS_
_00577_DS_:
	BANKSEL	(_all_param + 4)
	.line	694; main.c	if( all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select ){
	MOVF	(_all_param + 4), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BTFSS	STATUS, 2
	GOTO	_00636_DS_
	.line	696; main.c	new_value = (unsigned int)all_param.decay[eg_select_hlp];
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 20)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 20)
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVFF	r0x00, _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	697; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	GOTO	_00636_DS_
	.line	698; main.c	all_param.decay[eg_select_hlp] = (unsigned char)new_value;}
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 20)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 20)
	ADDWFC	r0x02, F
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x03
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	.line	699; main.c	break;
	GOTO	_00636_DS_
_00582_DS_:
	.line	702; main.c	new_value = (unsigned int)all_param.sustain[eg_select_hlp];
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 24)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 24)
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVFF	r0x00, _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	703; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	GOTO	_00636_DS_
	.line	704; main.c	all_param.sustain[eg_select_hlp] = (unsigned char)new_value;}
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 24)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 24)
	ADDWFC	r0x02, F
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x03
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	.line	705; main.c	break;
	GOTO	_00636_DS_
_00585_DS_:
	.line	708; main.c	new_value = (unsigned int)all_param.release[eg_select_hlp];
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 28)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 28)
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	INDF0, r0x00
	MOVFF	r0x00, _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	709; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	GOTO	_00636_DS_
	.line	710; main.c	all_param.release[eg_select_hlp] = (unsigned char)new_value;}
	MOVFF	_eg_select_hlp, r0x00
	CLRF	r0x02
	MOVLW	LOW(_all_param + 28)
	ADDWF	r0x00, F
	MOVLW	HIGH(_all_param + 28)
	ADDWFC	r0x02, F
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x03
	MOVFF	r0x00, FSR0L
	MOVFF	r0x02, FSR0H
	MOVFF	r0x03, INDF0
	.line	711; main.c	break;
	GOTO	_00636_DS_
_00588_DS_:
	BANKSEL	_CursorBpm
	.line	715; main.c	if (CursorBpm) {
	MOVF	_CursorBpm, W, B
	BZ	_00605_DS_
	.line	716; main.c	jog_value = all_param.bpm;
	MOVFF	(_all_param + 39), _jog_value
	BANKSEL	(_jog_value + 1)
	CLRF	(_jog_value + 1), B
	.line	717; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 255) ) {
	MOVLW	HIGH(_jog_value)
	MOVWF	r0x02
	MOVLW	LOW(_jog_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_jog_value
	.line	718; main.c	all_param.bpm = jog_value;
	MOVF	_jog_value, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 39)
	MOVWF	(_all_param + 39), B
	BANKSEL	_app_flags
	.line	719; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;	}}
	BSF	_app_flags, 2, B
	BRA	_00636_DS_
_00605_DS_:
	.line	723; main.c	switch( eg_select_hlp ) {
	MOVFF	_eg_select_hlp, r0x00
	MOVLW	0x04
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00636_DS_
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	CLRF	r0x05
	RLCF	r0x00, W
	RLCF	r0x05, F
	RLCF	WREG, W
	RLCF	r0x05, F
	ANDLW	0xfc
	MOVWF	r0x04
	MOVLW	UPPER(_00666_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00666_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00666_DS_)
	ADDWF	r0x04, F
	MOVF	r0x05, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x04, W
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVWF	PCL
_00666_DS_:
	GOTO	_00591_DS_
	GOTO	_00594_DS_
	GOTO	_00597_DS_
	GOTO	_00600_DS_
_00591_DS_:
	.line	725; main.c	jog_value = all_param.eg_channel[0];
	MOVFF	(_all_param + 12), _jog_value
	BANKSEL	(_jog_value + 1)
	CLRF	(_jog_value + 1), B
	.line	726; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
	MOVLW	HIGH(_jog_value)
	MOVWF	r0x02
	MOVLW	LOW(_jog_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_jog_value
	.line	727; main.c	all_param.eg_channel[0] = jog_value;
	MOVF	_jog_value, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 12)
	MOVWF	(_all_param + 12), B
	BANKSEL	_app_flags
	.line	728; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	729; main.c	break;
	BRA	_00636_DS_
_00594_DS_:
	.line	732; main.c	jog_value = all_param.eg_channel[1];
	MOVFF	(_all_param + 13), (iTemp109 + 1)
	MOVFF	(iTemp109 + 1), _jog_value
	BANKSEL	(_jog_value + 1)
	CLRF	(_jog_value + 1), B
	.line	733; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
	MOVLW	HIGH(_jog_value)
	MOVWF	r0x02
	MOVLW	LOW(_jog_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_jog_value
	.line	734; main.c	all_param.eg_channel[1] = jog_value;
	MOVF	_jog_value, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 13)
	MOVWF	(_all_param + 13), B
	BANKSEL	_app_flags
	.line	735; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	736; main.c	break;
	BRA	_00636_DS_
_00597_DS_:
	.line	739; main.c	jog_value = all_param.eg_channel[2];
	MOVFF	(_all_param + 14), (iTemp124 + 2)
	MOVFF	(iTemp124 + 2), _jog_value
	BANKSEL	(_jog_value + 1)
	CLRF	(_jog_value + 1), B
	.line	740; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
	MOVLW	HIGH(_jog_value)
	MOVWF	r0x02
	MOVLW	LOW(_jog_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_jog_value
	.line	741; main.c	all_param.eg_channel[2] = jog_value;
	MOVF	_jog_value, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 14)
	MOVWF	(_all_param + 14), B
	BANKSEL	_app_flags
	.line	742; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	743; main.c	break;
	BRA	_00636_DS_
_00600_DS_:
	.line	746; main.c	jog_value = all_param.eg_channel[3];
	MOVFF	(_all_param + 15), (iTemp139 + 3)
	MOVFF	(iTemp139 + 3), _jog_value
	BANKSEL	(_jog_value + 1)
	CLRF	(_jog_value + 1), B
	.line	747; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &jog_value, 0x0f) ) {
	MOVLW	HIGH(_jog_value)
	MOVWF	r0x02
	MOVLW	LOW(_jog_value)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0f
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_jog_value
	.line	748; main.c	all_param.eg_channel[3] = jog_value;
	MOVF	_jog_value, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 15)
	MOVWF	(_all_param + 15), B
	BANKSEL	_app_flags
	.line	749; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	751; main.c	break;
	BRA	_00636_DS_
_00607_DS_:
	BANKSEL	_all_param
	.line	756; main.c	if(all_param.router_flags_lfo1.lfo1_from_lfo2) {
	BTFSC	_all_param, 4, B
	BRA	_00636_DS_
; removed redundant BANKSEL
	.line	759; main.c	if( all_param.router_flags_lfo1.lfo1_sync_bpm ) {
	BTFSS	_all_param, 6, B
	BRA	_00615_DS_
	.line	761; main.c	new_value = all_param.lfo0_bpm;
	MOVFF	(_all_param + 35), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	762; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	763; main.c	all_param.lfo0_bpm = new_value;
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 35)
	MOVWF	(_all_param + 35), B
	BANKSEL	_app_flags
	.line	764; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	765; main.c	break; }
	BRA	_00636_DS_
_00615_DS_:
	.line	767; main.c	new_value = all_param.lfo0_rate;
	MOVFF	(_all_param + 32), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	768; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	769; main.c	all_param.lfo0_rate = new_value;} }
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 32)
	MOVWF	(_all_param + 32), B
	.line	770; main.c	break;
	BRA	_00636_DS_
_00617_DS_:
	BANKSEL	(_all_param + 1)
	.line	773; main.c	if(all_param.router_flags_lfo2.lfo2_from_lfo3) {
	BTFSC	(_all_param + 1), 4, B
	BRA	_00636_DS_
; removed redundant BANKSEL
	.line	776; main.c	if( all_param.router_flags_lfo2.lfo2_sync_bpm ) {
	BTFSS	(_all_param + 1), 6, B
	BRA	_00625_DS_
	.line	777; main.c	new_value = all_param.lfo1_bpm;
	MOVFF	(_all_param + 36), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	778; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	779; main.c	all_param.lfo1_bpm = new_value;
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 36)
	MOVWF	(_all_param + 36), B
	BANKSEL	_app_flags
	.line	780; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	781; main.c	break; }
	BRA	_00636_DS_
_00625_DS_:
	.line	783; main.c	new_value = all_param.lfo1_rate;
	MOVFF	(_all_param + 33), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	784; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	785; main.c	all_param.lfo1_rate = new_value;} }
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 33)
	MOVWF	(_all_param + 33), B
	.line	786; main.c	break;
	BRA	_00636_DS_
_00627_DS_:
	BANKSEL	(_all_param + 2)
	.line	790; main.c	if( all_param.router_flags_lfo3.lfo3_sync_bpm ) {
	BTFSS	(_all_param + 2), 6, B
	BRA	_00633_DS_
	.line	791; main.c	new_value = all_param.lfo2_bpm;
	MOVFF	(_all_param + 37), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	792; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0x0a) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	793; main.c	all_param.lfo2_bpm = new_value;
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 37)
	MOVWF	(_all_param + 37), B
	BANKSEL	_app_flags
	.line	794; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	795; main.c	break; }
	BRA	_00636_DS_
_00633_DS_:
	.line	797; main.c	new_value = all_param.lfo2_rate;
	MOVFF	(_all_param + 34), _ENC_NotifyChange_new_value_1_1
	BANKSEL	(_ENC_NotifyChange_new_value_1_1 + 1)
	CLRF	(_ENC_NotifyChange_new_value_1_1 + 1), B
	.line	798; main.c	if( MIOS_HLP_16bitAddSaturate(incrementer, &new_value, 0xff) ) {
	MOVLW	HIGH(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x02
	MOVLW	LOW(_ENC_NotifyChange_new_value_1_1)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	CALL	_MIOS_HLP_16bitAddSaturate
	MOVWF	r0x00
	MOVLW	0x05
	ADDWF	FSR1L, F
	MOVF	r0x00, W
	BZ	_00636_DS_
	BANKSEL	_ENC_NotifyChange_new_value_1_1
	.line	799; main.c	all_param.lfo2_rate = new_value;}  }
	MOVF	_ENC_NotifyChange_new_value_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_all_param + 34)
	MOVWF	(_all_param + 34), B
_00636_DS_:
	.line	801; main.c	}
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DIN_NotifyToggle	code
_DIN_NotifyToggle:
	.line	277; main.c	void DIN_NotifyToggle(unsigned char pin, unsigned char pin_value) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVWF	r0x00
	MOVLW	0x02
	MOVFF	PLUSW2, r0x01
	.line	281; main.c	switch( pin ) {
	MOVLW	0x22
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	GOTO	_00376_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00507_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00507_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00507_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00507_DS_:
	GOTO	_00193_DS_
	GOTO	_00204_DS_
	GOTO	_00207_DS_
	GOTO	_00210_DS_
	GOTO	_00213_DS_
	GOTO	_00224_DS_
	GOTO	_00227_DS_
	GOTO	_00230_DS_
	GOTO	_00233_DS_
	GOTO	_00241_DS_
	GOTO	_00244_DS_
	GOTO	_00247_DS_
	GOTO	_00250_DS_
	GOTO	_00253_DS_
	GOTO	_00261_DS_
	GOTO	_00264_DS_
	GOTO	_00267_DS_
	GOTO	_00270_DS_
	GOTO	_00273_DS_
	GOTO	_00276_DS_
	GOTO	_00279_DS_
	GOTO	_00282_DS_
	GOTO	_00288_DS_
	GOTO	_00294_DS_
	GOTO	_00297_DS_
	GOTO	_00336_DS_
	GOTO	_00342_DS_
	GOTO	_00348_DS_
	GOTO	_00354_DS_
	GOTO	_00360_DS_
	GOTO	_00363_DS_
	GOTO	_00366_DS_
	GOTO	_00369_DS_
	GOTO	_00372_DS_
_00193_DS_:
	.line	284; main.c	if( !pin_value )  {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00204_DS_
	BANKSEL	_all_param
	.line	285; main.c	if( all_param.router_flags_lfo1.lfo1_waveform == 1 ) {
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00195_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00509_DS_:
	BANKSEL	_all_param
	.line	286; main.c	all_param.router_flags_lfo1.lfo1_waveform << 1;
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	287; main.c	MIOS_DOUT_PinSet(0, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	288; main.c	MIOS_DOUT_PinSet(1, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	289; main.c	break; }
	GOTO	_00376_DS_
_00195_DS_:
	BANKSEL	_all_param
	.line	290; main.c	if(all_param.router_flags_lfo1.lfo1_waveform == 2 ) {
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00197_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00511_DS_:
	BANKSEL	_all_param
	.line	291; main.c	all_param.router_flags_lfo1.lfo1_waveform << 1;
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	292; main.c	MIOS_DOUT_PinSet(1, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	293; main.c	MIOS_DOUT_PinSet(2, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	294; main.c	break; }
	GOTO	_00376_DS_
_00197_DS_:
	BANKSEL	_all_param
	.line	295; main.c	if(all_param.router_flags_lfo1.lfo1_waveform == 4 ) {
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x04
	BNZ	_00199_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00513_DS_:
	BANKSEL	_all_param
	.line	296; main.c	all_param.router_flags_lfo1.lfo1_waveform << 1;
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	297; main.c	MIOS_DOUT_PinSet(2, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	298; main.c	MIOS_DOUT_PinSet(3, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x03
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	299; main.c	break; }
	GOTO	_00376_DS_
_00199_DS_:
	BANKSEL	_all_param
	.line	300; main.c	if(all_param.router_flags_lfo1.lfo1_waveform == 8 ) {
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00204_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00515_DS_:
	BANKSEL	_all_param
	.line	301; main.c	all_param.router_flags_lfo1.lfo1_waveform >> 3;
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	302; main.c	MIOS_DOUT_PinSet(3, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	303; main.c	MIOS_DOUT_PinSet(1, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	304; main.c	break; }
	GOTO	_00376_DS_
_00204_DS_:
	.line	308; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BNZ	_00207_DS_
	.line	310; main.c	all_param.router_flags_lfo1.lfo1_from_lfo2 ^= 1;
	CLRF	r0x00
	BANKSEL	_all_param
	BTFSC	_all_param, 4, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_all_param, W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_all_param, B
	.line	311; main.c	MIOS_DOUT_PinGet(4) ? MIOS_DOUT_PinSet(4, 0) : MIOS_DOUT_PinSet(4, 1);
	MOVLW	0x04
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00378_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00378_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	312; main.c	break; }
	GOTO	_00376_DS_
_00207_DS_:
	.line	315; main.c	if( !pin_value )  {
	MOVF	r0x01, W
	BNZ	_00210_DS_
	.line	317; main.c	all_param.router_flags_lfo1.lfo1_note_start ^= 1;
	CLRF	r0x00
	BANKSEL	_all_param
	BTFSC	_all_param, 5, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_all_param, W, B
	ANDLW	0xdf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_all_param, B
	.line	318; main.c	MIOS_DOUT_PinGet(5) ? MIOS_DOUT_PinSet(5, 0) : MIOS_DOUT_PinSet(5, 1);
	MOVLW	0x05
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00380_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00380_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	319; main.c	break; }
	GOTO	_00376_DS_
_00210_DS_:
	.line	322; main.c	if( !pin_value )  {
	MOVF	r0x01, W
	BNZ	_00213_DS_
	.line	323; main.c	all_param.router_flags_lfo1.lfo1_sync_bpm ^= 1;
	CLRF	r0x00
	BANKSEL	_all_param
	BTFSC	_all_param, 6, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_all_param, W, B
	ANDLW	0xbf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_all_param, B
	.line	324; main.c	MIOS_DOUT_PinGet(6) ? MIOS_DOUT_PinSet(6, 0) : MIOS_DOUT_PinSet(6, 1);
	MOVLW	0x06
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00382_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00382_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	325; main.c	break; }
	GOTO	_00376_DS_
_00213_DS_:
	.line	328; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00224_DS_
	BANKSEL	(_all_param + 1)
	.line	330; main.c	if( all_param.router_flags_lfo2.lfo2_waveform == 1 ) {
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00215_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00520_DS_:
	BANKSEL	(_all_param + 1)
	.line	331; main.c	all_param.router_flags_lfo2.lfo2_waveform << 1;
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	332; main.c	MIOS_DOUT_PinSet(8, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	333; main.c	MIOS_DOUT_PinSet(9, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x09
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	334; main.c	break;}
	GOTO	_00376_DS_
_00215_DS_:
	BANKSEL	(_all_param + 1)
	.line	336; main.c	if(all_param.router_flags_lfo2.lfo2_waveform == 2 ) {
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00217_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00522_DS_:
	BANKSEL	(_all_param + 1)
	.line	337; main.c	all_param.router_flags_lfo2.lfo2_waveform << 1;
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	338; main.c	MIOS_DOUT_PinSet(9, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x09
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	339; main.c	MIOS_DOUT_PinSet(10, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	340; main.c	break;}
	GOTO	_00376_DS_
_00217_DS_:
	BANKSEL	(_all_param + 1)
	.line	342; main.c	if(all_param.router_flags_lfo2.lfo2_waveform == 4 ) {
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x04
	BNZ	_00219_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00524_DS_:
	BANKSEL	(_all_param + 1)
	.line	343; main.c	all_param.router_flags_lfo2.lfo2_waveform << 1;
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	344; main.c	MIOS_DOUT_PinSet(10, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	345; main.c	MIOS_DOUT_PinSet(11, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	346; main.c	break;}
	GOTO	_00376_DS_
_00219_DS_:
	BANKSEL	(_all_param + 1)
	.line	348; main.c	if(all_param.router_flags_lfo2.lfo2_waveform == 8 ) {
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00224_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00526_DS_:
	BANKSEL	(_all_param + 1)
	.line	349; main.c	all_param.router_flags_lfo2.lfo2_waveform >> 3;
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	WREG
	.line	350; main.c	MIOS_DOUT_PinSet(11, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	351; main.c	MIOS_DOUT_PinSet(8, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x08
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	352; main.c	break;} }
	GOTO	_00376_DS_
_00224_DS_:
	.line	355; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	356; main.c	all_param.router_flags_lfo2.lfo2_from_lfo3 ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 1)
	BTFSC	(_all_param + 1), 4, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 1), W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 1), B
	.line	357; main.c	MIOS_DOUT_PinGet(12) ? MIOS_DOUT_PinSet(12, 0) : MIOS_DOUT_PinSet(12, 1); }
	MOVLW	0x0c
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00384_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00384_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	358; main.c	break;
	GOTO	_00376_DS_
_00227_DS_:
	.line	361; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	362; main.c	all_param.router_flags_lfo2.lfo2_note_start ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 1)
	BTFSC	(_all_param + 1), 5, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 1), W, B
	ANDLW	0xdf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 1), B
	.line	363; main.c	MIOS_DOUT_PinGet(13) ? MIOS_DOUT_PinSet(13, 0) : MIOS_DOUT_PinSet(13, 1);	}
	MOVLW	0x0d
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00386_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00386_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	364; main.c	break;
	GOTO	_00376_DS_
_00230_DS_:
	.line	367; main.c	if( !pin_value )  {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	368; main.c	all_param.router_flags_lfo2.lfo2_sync_bpm ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 1)
	BTFSC	(_all_param + 1), 6, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 1), W, B
	ANDLW	0xbf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 1), B
	.line	369; main.c	MIOS_DOUT_PinGet(14) ? MIOS_DOUT_PinSet(14, 0) : MIOS_DOUT_PinSet(14, 1);}
	MOVLW	0x0e
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00388_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00388_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x0e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	370; main.c	break;
	GOTO	_00376_DS_
_00233_DS_:
	.line	373; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 2)
	.line	375; main.c	if( all_param.router_flags_lfo3.lfo3_waveform == 1 ) {
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00235_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00531_DS_:
	BANKSEL	(_all_param + 2)
	.line	376; main.c	all_param.router_flags_lfo3.lfo3_waveform << 1;
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	WREG
	.line	377; main.c	MIOS_DOUT_PinSet(16, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x10
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	378; main.c	MIOS_DOUT_PinSet(17, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x11
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	379; main.c	break;}
	GOTO	_00376_DS_
_00235_DS_:
	BANKSEL	(_all_param + 2)
	.line	381; main.c	if( all_param.router_flags_lfo3.lfo3_waveform == 2 ) {
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	r0x00
	MOVF	r0x00, W
	XORLW	0x02
	BNZ	_00237_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00533_DS_:
	BANKSEL	(_all_param + 2)
	.line	382; main.c	all_param.router_flags_lfo3.lfo3_waveform << 1;
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	WREG
	.line	383; main.c	MIOS_DOUT_PinSet(17, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x11
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	384; main.c	MIOS_DOUT_PinSet(18, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x12
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	385; main.c	break;}
	GOTO	_00376_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00237_DS_:
	BANKSEL	(_all_param + 2)
	.line	388; main.c	all_param.router_flags_lfo3.lfo3_waveform == 4;
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	WREG
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
; removed redundant BANKSEL
	.line	389; main.c	all_param.router_flags_lfo3.lfo3_waveform >> 2;
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	WREG
	.line	390; main.c	MIOS_DOUT_PinSet(18, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x12
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	391; main.c	MIOS_DOUT_PinSet(16, 1); }     }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x10
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	392; main.c	break;
	GOTO	_00376_DS_
_00241_DS_:
	.line	395; main.c	if( !pin_value )
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	396; main.c	{   all_param.router_flags_lfo3.lfo3_note_start ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 2)
	BTFSC	(_all_param + 2), 5, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 2), W, B
	ANDLW	0xdf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 2), B
	.line	397; main.c	MIOS_DOUT_PinGet(21) ? MIOS_DOUT_PinSet(21, 0) : MIOS_DOUT_PinSet(21, 1);	}
	MOVLW	0x15
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00390_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x15
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00390_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x15
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	398; main.c	break;
	GOTO	_00376_DS_
_00244_DS_:
	.line	401; main.c	if( !pin_value )
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	402; main.c	{   all_param.router_flags_lfo3.lfo3_sync_bpm ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 2)
	BTFSC	(_all_param + 2), 6, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RRNCF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 2), W, B
	ANDLW	0xbf
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 2), B
	.line	403; main.c	MIOS_DOUT_PinGet(22) ? MIOS_DOUT_PinSet(22, 0) : MIOS_DOUT_PinSet(22, 1);	}
	MOVLW	0x16
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00392_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x16
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00392_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x16
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	404; main.c	break;
	GOTO	_00376_DS_
_00247_DS_:
	.line	407; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 3)
	.line	408; main.c	all_param.router_flags_lfo1_att.ALL_flags_lfo1_att ^= all_param.eg_select;
	MOVF	(_all_param + 3), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 3), B
	.line	409; main.c	MIOS_DOUT_PinGet(24) ? MIOS_DOUT_PinSet(24, 0) : MIOS_DOUT_PinSet(24, 1); }
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00394_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00394_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	410; main.c	break;
	GOTO	_00376_DS_
_00250_DS_:
	.line	414; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 4)
	.line	415; main.c	all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec ^= all_param.eg_select ;
	MOVF	(_all_param + 4), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 4), B
	.line	416; main.c	MIOS_DOUT_PinGet(25) ? MIOS_DOUT_PinSet(25, 0) : MIOS_DOUT_PinSet(25, 1);	}
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00396_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00396_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	417; main.c	break;
	GOTO	_00376_DS_
_00253_DS_:
	.line	420; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	421; main.c	switch( all_param.eg_select ) {
	MOVFF	(_all_param + 38), r0x00
	MOVF	r0x00, W
	XORLW	0x01
	BZ	_00255_DS_
	MOVF	r0x00, W
	XORLW	0x02
	BZ	_00255_DS_
	MOVF	r0x00, W
	XORLW	0x04
	BZ	_00257_DS_
	MOVF	r0x00, W
	XORLW	0x08
	BZ	_00257_DS_
	GOTO	_00376_DS_
_00255_DS_:
	.line	423; main.c	all_param.router_flags_eg_link.eg1_link_eg2 ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 5)
	BTFSC	(_all_param + 5), 0, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 5), W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 5), B
	.line	424; main.c	MIOS_DOUT_PinGet(26) ? MIOS_DOUT_PinSet(26, 0) : MIOS_DOUT_PinSet(26, 1);
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00398_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00398_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	425; main.c	break;
	GOTO	_00376_DS_
_00257_DS_:
	.line	427; main.c	all_param.router_flags_eg_link.eg3_link_eg4 ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 5)
	BTFSC	(_all_param + 5), 1, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 5), W, B
	ANDLW	0xfd
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 5), B
	.line	428; main.c	MIOS_DOUT_PinGet(26) ? MIOS_DOUT_PinSet(26, 0) : MIOS_DOUT_PinSet(26, 1);
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00400_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00400_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	430; main.c	break;
	GOTO	_00376_DS_
_00261_DS_:
	.line	433; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 6)
	.line	434; main.c	all_param.router_flags_eg_v2s.ALL_flags_eg_v2s ^= all_param.eg_select ;
	MOVF	(_all_param + 6), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 6), B
	.line	435; main.c	MIOS_DOUT_PinGet(27) ? MIOS_DOUT_PinSet(27, 0) : MIOS_DOUT_PinSet(27, 1);}
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00402_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00402_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	436; main.c	break;
	GOTO	_00376_DS_
_00264_DS_:
	.line	439; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 8)
	.line	440; main.c	all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ^= all_param.eg_select;
	MOVF	(_all_param + 8), W, B
	ANDLW	0x0f
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x0f
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 8), W, B
	ANDLW	0xf0
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 8), B
	.line	441; main.c	MIOS_DOUT_PinGet(28) ? MIOS_DOUT_PinSet(28, 0) : MIOS_DOUT_PinSet(28, 1); }
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00404_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00404_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	442; main.c	break;
	GOTO	_00376_DS_
_00267_DS_:
	.line	445; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 9)
	.line	446; main.c	all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ^= all_param.eg_select;
	MOVF	(_all_param + 9), W, B
	ANDLW	0x0f
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x0f
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 9), W, B
	ANDLW	0xf0
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 9), B
	.line	447; main.c	MIOS_DOUT_PinGet(29) ? MIOS_DOUT_PinSet(29, 0) : MIOS_DOUT_PinSet(29, 1); }
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00406_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00406_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	448; main.c	break;
	GOTO	_00376_DS_
_00270_DS_:
	.line	451; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 10)
	.line	452; main.c	all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ^= all_param.eg_select;
	MOVF	(_all_param + 10), W, B
	ANDLW	0x0f
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x0f
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 10), W, B
	ANDLW	0xf0
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 10), B
	.line	453; main.c	MIOS_DOUT_PinGet(30) ? MIOS_DOUT_PinSet(30, 0) : MIOS_DOUT_PinSet(30, 1);}
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00408_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00408_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	454; main.c	break;
	GOTO	_00376_DS_
_00273_DS_:
	.line	457; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 7)
	.line	458; main.c	all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig ^= all_param.eg_select ;
	MOVF	(_all_param + 7), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	XORWF	r0x00, F
	MOVF	r0x00, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 7), B
	.line	459; main.c	MIOS_DOUT_PinGet(31) ? MIOS_DOUT_PinSet(31, 0) : MIOS_DOUT_PinSet(31, 1);}
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00410_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00410_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	460; main.c	break;
	GOTO	_00376_DS_
_00276_DS_:
	.line	463; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	464; main.c	all_param.router_flags_system.twin_mode ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 11)
	BTFSC	(_all_param + 11), 0, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 11), W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 11), B
	.line	465; main.c	MIOS_DOUT_PinGet(40) ? MIOS_DOUT_PinSet(40, 0) : MIOS_DOUT_PinSet(40, 1);}
	MOVLW	0x28
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00412_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x28
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00412_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x28
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	466; main.c	break;
	GOTO	_00376_DS_
_00279_DS_:
	.line	469; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	470; main.c	all_param.router_flags_system.midi_mode ^= 1;
	CLRF	r0x00
	BANKSEL	(_all_param + 11)
	BTFSC	(_all_param + 11), 1, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	RLNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	(_all_param + 11), W, B
	ANDLW	0xfd
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	(_all_param + 11), B
	.line	471; main.c	MIOS_DOUT_PinGet(41) ? MIOS_DOUT_PinSet(41, 0) : MIOS_DOUT_PinSet(41, 1); }
	MOVLW	0x29
	CALL	_MIOS_DOUT_PinGet
	MOVWF	r0x00
	MOVF	r0x00, W
	BZ	_00414_DS_
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x29
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	GOTO	_00376_DS_
_00414_DS_:
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x29
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	472; main.c	break;
	GOTO	_00376_DS_
_00282_DS_:
	.line	475; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 11)
	.line	476; main.c	if( all_param.router_flags_system.ttl_switch1 ) { //0 = eg1 -- 1 = eg3
	BTFSS	(_all_param + 11), 2, B
	BRA	_00284_DS_
	.line	477; main.c	MIOS_DOUT_PinSet(35, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x23
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	478; main.c	MIOS_DOUT_PinSet(33, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x21
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	479; main.c	MIOS_DOUT_PinSet(32, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x20
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	480; main.c	MIOS_DOUT_PinSet(34, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x22
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 11)
	.line	481; main.c	all_param.router_flags_system.ttl_switch1 = 0;
	BCF	(_all_param + 11), 2, B
	.line	482; main.c	break; }
	GOTO	_00376_DS_
_00284_DS_:
	.line	485; main.c	MIOS_DOUT_PinSet(34, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x22
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	486; main.c	MIOS_DOUT_PinSet(32, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	487; main.c	MIOS_DOUT_PinSet(33, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x21
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	488; main.c	MIOS_DOUT_PinSet(35, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x23
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 11)
	.line	489; main.c	all_param.router_flags_system.ttl_switch1 = 1; } }
	BSF	(_all_param + 11), 2, B
	.line	490; main.c	break;
	GOTO	_00376_DS_
_00288_DS_:
	.line	493; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	BANKSEL	(_all_param + 11)
	.line	494; main.c	if( all_param.router_flags_system.ttl_switch2 ) {
	BTFSS	(_all_param + 11), 3, B
	BRA	_00290_DS_
	.line	495; main.c	MIOS_DOUT_PinSet(39, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x27
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	496; main.c	MIOS_DOUT_PinSet(37, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x25
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	497; main.c	MIOS_DOUT_PinSet(36, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x24
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	498; main.c	MIOS_DOUT_PinSet(38, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x26
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 11)
	.line	499; main.c	all_param.router_flags_system.ttl_switch2 = 0;
	BCF	(_all_param + 11), 3, B
	.line	500; main.c	break; }
	GOTO	_00376_DS_
_00290_DS_:
	.line	503; main.c	MIOS_DOUT_PinSet(38, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x26
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	504; main.c	MIOS_DOUT_PinSet(36, 0);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x24
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	505; main.c	MIOS_DOUT_PinSet(37, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x25
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	.line	506; main.c	MIOS_DOUT_PinSet(39, 1);
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x27
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 11)
	.line	507; main.c	all_param.router_flags_system.ttl_switch2 = 1;}}
	BSF	(_all_param + 11), 3, B
	.line	508; main.c	break;
	GOTO	_00376_DS_
_00294_DS_:
	.line	512; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
	.line	513; main.c	app_flags.save_on ^= 1;
	CLRF	r0x00
	BANKSEL	_app_flags
	BTFSC	_app_flags, 3, B
	INCF	r0x00, F
	MOVLW	0x01
	XORWF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	RRNCF	WREG, W
	MOVWF	PRODH
; removed redundant BANKSEL
	MOVF	_app_flags, W, B
	ANDLW	0xf7
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_app_flags, B
	.line	514; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;}
	BSF	_app_flags, 2, B
	.line	515; main.c	break;
	GOTO	_00376_DS_
_00297_DS_:
	.line	518; main.c	if(!pin_value ) {
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	GOTO	_00376_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
	.line	519; main.c	all_param.eg_select << 1;
	MOVFF	(_all_param + 38), WREG
	.line	520; main.c	if (all_param.eg_select > 8 ) {
	MOVLW	0x09
	BANKSEL	(_all_param + 38)
	SUBWF	(_all_param + 38), W, B
	BNC	_00299_DS_
	.line	521; main.c	all_param.eg_select = 1; }
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_all_param + 38), B
_00299_DS_:
	.line	522; main.c	sr_temp = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	523; main.c	sr_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	BANKSEL	(_all_param + 38)
	.line	524; main.c	sr_temp |= all_param.eg_select;
	MOVF	(_all_param + 38), W, B
	IORWF	r0x00, F
	.line	525; main.c	MIOS_DOUT_SRSet(5, sr_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 3)
	.line	527; main.c	if(all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select){
	MOVF	(_all_param + 3), W, B
	ANDLW	0xff
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00301_DS_
	.line	528; main.c	MIOS_DOUT_PinSet(24, 1);  }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00302_DS_
_00301_DS_:
	.line	530; main.c	MIOS_DOUT_PinSet(24, 0);  }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00302_DS_:
	BANKSEL	(_all_param + 4)
	.line	531; main.c	if (all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select)  {
	MOVF	(_all_param + 4), W, B
	ANDLW	0xff
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00304_DS_
	.line	532; main.c	MIOS_DOUT_PinSet(25, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00305_DS_
_00304_DS_:
	.line	534; main.c	MIOS_DOUT_PinSet(25, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00305_DS_:
	BANKSEL	(_all_param + 8)
	.line	535; main.c	if (all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 & all_param.eg_select)  {
	MOVF	(_all_param + 8), W, B
	ANDLW	0x0f
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00307_DS_
	.line	536; main.c	MIOS_DOUT_PinSet(28, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00308_DS_
_00307_DS_:
	.line	538; main.c	MIOS_DOUT_PinSet(28, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00308_DS_:
	BANKSEL	(_all_param + 9)
	.line	539; main.c	if (all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 & all_param.eg_select)  {
	MOVF	(_all_param + 9), W, B
	ANDLW	0x0f
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00310_DS_
	.line	540; main.c	MIOS_DOUT_PinSet(29, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00311_DS_
_00310_DS_:
	.line	542; main.c	MIOS_DOUT_PinSet(29, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00311_DS_:
	BANKSEL	(_all_param + 10)
	.line	543; main.c	if (all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 & all_param.eg_select)  {
	MOVF	(_all_param + 10), W, B
	ANDLW	0x0f
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00313_DS_
	.line	544; main.c	MIOS_DOUT_PinSet(30, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00314_DS_
_00313_DS_:
	.line	546; main.c	MIOS_DOUT_PinSet(30, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00314_DS_:
	BANKSEL	(_all_param + 6)
	.line	547; main.c	if (all_param.router_flags_eg_v2s.ALL_flags_eg_v2s & all_param.eg_select)  {
	MOVF	(_all_param + 6), W, B
	ANDLW	0xff
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00316_DS_
	.line	548; main.c	MIOS_DOUT_PinSet(27, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00317_DS_
_00316_DS_:
	.line	550; main.c	MIOS_DOUT_PinSet(27, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00317_DS_:
	BANKSEL	(_all_param + 7)
	.line	551; main.c	if (all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig & all_param.eg_select)  {
	MOVF	(_all_param + 7), W, B
	ANDLW	0xff
	MOVWF	r0x02
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x02, F
	MOVF	r0x02, W
	BZ	_00319_DS_
	.line	552; main.c	MIOS_DOUT_PinSet(31, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00320_DS_
_00319_DS_:
	.line	554; main.c	MIOS_DOUT_PinSet(31, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00320_DS_:
	BANKSEL	(_all_param + 5)
	.line	555; main.c	if ((all_param.router_flags_eg_link.eg1_link_eg2) && (all_param.eg_select <= 2))  {
	BTFSS	(_all_param + 5), 0, B
	BRA	_00326_DS_
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	(_all_param + 38), W, B
	BC	_00326_DS_
	.line	556; main.c	MIOS_DOUT_PinSet(26, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00327_DS_
_00326_DS_:
	BANKSEL	(_all_param + 5)
	.line	557; main.c	else if ((all_param.router_flags_eg_link.eg3_link_eg4) && (all_param.eg_select >= 4))  {
	BTFSS	(_all_param + 5), 1, B
	BRA	_00322_DS_
	MOVLW	0x04
; removed redundant BANKSEL
	SUBWF	(_all_param + 38), W, B
	BNC	_00322_DS_
	.line	558; main.c	MIOS_DOUT_PinSet(26, 1);}
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00327_DS_
_00322_DS_:
	.line	560; main.c	MIOS_DOUT_PinSet(26, 0);}
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00327_DS_:
	.line	561; main.c	switch ( all_param.eg_select ) {
	MOVFF	(_all_param + 38), r0x02
	MOVF	r0x02, W
	XORLW	0x01
	BZ	_00329_DS_
	MOVF	r0x02, W
	XORLW	0x02
	BZ	_00330_DS_
	MOVF	r0x02, W
	XORLW	0x04
	BZ	_00331_DS_
	MOVF	r0x02, W
	XORLW	0x08
	BZ	_00332_DS_
	BRA	_00376_DS_
_00329_DS_:
	BANKSEL	_eg_select_hlp
	.line	563; main.c	eg_select_hlp = 0;
	CLRF	_eg_select_hlp, B
	.line	564; main.c	break;
	BRA	_00376_DS_
_00330_DS_:
	.line	566; main.c	eg_select_hlp = 1;
	MOVLW	0x01
	BANKSEL	_eg_select_hlp
	MOVWF	_eg_select_hlp, B
	.line	568; main.c	break;
	BRA	_00376_DS_
_00331_DS_:
	.line	570; main.c	eg_select_hlp = 2;
	MOVLW	0x02
	BANKSEL	_eg_select_hlp
	MOVWF	_eg_select_hlp, B
	.line	571; main.c	break;
	BRA	_00376_DS_
_00332_DS_:
	.line	573; main.c	eg_select_hlp = 3;
	MOVLW	0x03
	BANKSEL	_eg_select_hlp
	MOVWF	_eg_select_hlp, B
	.line	576; main.c	break;
	BRA	_00376_DS_
_00336_DS_:
	.line	579; main.c	if(!pin_value ){
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_preset
	.line	580; main.c	preset = 0x0100;
	CLRF	_preset, B
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_preset + 1), B
	BANKSEL	_app_flags
	.line	581; main.c	if( app_flags.save_on ){
	BTFSS	_app_flags, 3, B
	BRA	_00338_DS_
	BANKSEL	(_preset + 1)
	.line	582; main.c	BANKSTICK_SAVE_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_SAVE_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00339_DS_
_00338_DS_:
	BANKSEL	(_preset + 1)
	.line	584; main.c	BANKSTICK_LOAD_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_LOAD_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
_00339_DS_:
	.line	585; main.c	sr_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	586; main.c	sr_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	587; main.c	sr_temp |= 0x10 ;
	BSF	r0x00, 4
	.line	588; main.c	MIOS_DOUT_SRSet(6, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	589; main.c	break;
	BRA	_00376_DS_
_00342_DS_:
	.line	592; main.c	if(!pin_value ){
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_preset
	.line	593; main.c	preset = 0x0200;
	CLRF	_preset, B
	MOVLW	0x02
; removed redundant BANKSEL
	MOVWF	(_preset + 1), B
	BANKSEL	_app_flags
	.line	594; main.c	if( app_flags.save_on ){
	BTFSS	_app_flags, 3, B
	BRA	_00344_DS_
	BANKSEL	(_preset + 1)
	.line	595; main.c	BANKSTICK_SAVE_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_SAVE_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00345_DS_
_00344_DS_:
	BANKSEL	(_preset + 1)
	.line	597; main.c	BANKSTICK_LOAD_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_LOAD_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
_00345_DS_:
	.line	598; main.c	sr_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	599; main.c	sr_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	600; main.c	sr_temp |= 0x20;
	BSF	r0x00, 5
	.line	601; main.c	MIOS_DOUT_SRSet(6, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	602; main.c	break;
	BRA	_00376_DS_
_00348_DS_:
	.line	605; main.c	if(!pin_value ){
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_preset
	.line	606; main.c	preset = 0x0300;
	CLRF	_preset, B
	MOVLW	0x03
; removed redundant BANKSEL
	MOVWF	(_preset + 1), B
	BANKSEL	_app_flags
	.line	607; main.c	if( app_flags.save_on ){
	BTFSS	_app_flags, 3, B
	BRA	_00350_DS_
	BANKSEL	(_preset + 1)
	.line	608; main.c	BANKSTICK_SAVE_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_SAVE_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00351_DS_
_00350_DS_:
	BANKSEL	(_preset + 1)
	.line	610; main.c	BANKSTICK_LOAD_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_LOAD_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
_00351_DS_:
	.line	611; main.c	sr_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	612; main.c	sr_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	613; main.c	sr_temp |= 0x40;
	BSF	r0x00, 6
	.line	614; main.c	MIOS_DOUT_SRSet(6, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	615; main.c	break;
	BRA	_00376_DS_
_00354_DS_:
	.line	618; main.c	if(!pin_value ){
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_preset
	.line	619; main.c	preset = 0x0400;
	CLRF	_preset, B
	MOVLW	0x04
; removed redundant BANKSEL
	MOVWF	(_preset + 1), B
	BANKSEL	_app_flags
	.line	620; main.c	if( app_flags.save_on ){
	BTFSS	_app_flags, 3, B
	BRA	_00356_DS_
	BANKSEL	(_preset + 1)
	.line	621; main.c	BANKSTICK_SAVE_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_SAVE_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
	BRA	_00357_DS_
_00356_DS_:
	BANKSEL	(_preset + 1)
	.line	623; main.c	BANKSTICK_LOAD_Evnt(bank, preset);  }
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_LOAD_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
_00357_DS_:
	.line	624; main.c	sr_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	625; main.c	sr_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	626; main.c	sr_temp |= 0x80;
	BSF	r0x00, 7
	.line	627; main.c	MIOS_DOUT_SRSet(6, sr_temp);	}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	628; main.c	break;
	BRA	_00376_DS_
_00360_DS_:
	.line	631; main.c	if(!pin_value )
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_bank
	.line	632; main.c	{  bank = 0x1000;
	CLRF	_bank, B
	MOVLW	0x10
; removed redundant BANKSEL
	MOVWF	(_bank + 1), B
	.line	633; main.c	sr_temp = MIOS_DOUT_SRGet(7);
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	634; main.c	sr_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	635; main.c	sr_temp |= 0x01;
	BSF	r0x00, 0
	.line	636; main.c	MIOS_DOUT_SRSet(7, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	637; main.c	break;
	BRA	_00376_DS_
_00363_DS_:
	.line	640; main.c	if(!pin_value )
	MOVF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00376_DS_
	BANKSEL	_bank
	.line	641; main.c	{  bank = 0x2000;
	CLRF	_bank, B
	MOVLW	0x20
; removed redundant BANKSEL
	MOVWF	(_bank + 1), B
	.line	642; main.c	sr_temp = MIOS_DOUT_SRGet(7);
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	643; main.c	sr_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	644; main.c	sr_temp |= 0x02;
	BSF	r0x00, 1
	.line	645; main.c	MIOS_DOUT_SRSet(7, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	646; main.c	break;
	BRA	_00376_DS_
_00366_DS_:
	.line	649; main.c	if(!pin_value )
	MOVF	r0x01, W
	BNZ	_00376_DS_
	BANKSEL	_bank
	.line	650; main.c	{  bank = 0x3000;
	CLRF	_bank, B
	MOVLW	0x30
; removed redundant BANKSEL
	MOVWF	(_bank + 1), B
	.line	651; main.c	sr_temp = MIOS_DOUT_SRGet(7);
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	652; main.c	sr_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	653; main.c	sr_temp |= 0x04;
	BSF	r0x00, 2
	.line	654; main.c	MIOS_DOUT_SRSet(7, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x07
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	655; main.c	break;
	BRA	_00376_DS_
_00369_DS_:
	.line	658; main.c	if(!pin_value )
	MOVF	r0x01, W
	BNZ	_00376_DS_
	BANKSEL	_bank
	.line	659; main.c	{  bank = 0x4000;
	CLRF	_bank, B
	MOVLW	0x40
; removed redundant BANKSEL
	MOVWF	(_bank + 1), B
	.line	660; main.c	sr_temp = MIOS_DOUT_SRGet(4);
	MOVLW	0x04
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	661; main.c	sr_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	662; main.c	sr_temp |= 0x08;
	BSF	r0x00, 3
	.line	663; main.c	MIOS_DOUT_SRSet(4, sr_temp);}
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	664; main.c	break;
	BRA	_00376_DS_
_00372_DS_:
	.line	667; main.c	if( !pin_value ) {
	MOVF	r0x01, W
	BNZ	_00376_DS_
	.line	668; main.c	CursorBpm ^= 1;
	MOVLW	0x01
	BANKSEL	_CursorBpm
	XORWF	_CursorBpm, F, B
_00376_DS_:
	.line	671; main.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__SR_Service_Finish	code
_SR_Service_Finish:
	.line	272; main.c	}
	RETURN	

; ; Starting pCode block
S_main__SR_Service_Prepare	code
_SR_Service_Prepare:
	.line	266; main.c	}
	RETURN	

; ; Starting pCode block
S_main__MPROC_NotifyReceivedByte	code
_MPROC_NotifyReceivedByte:
	.line	258; main.c	void MPROC_NotifyReceivedByte(unsigned char byte) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	260; main.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__MPROC_NotifyTimeout	code
_MPROC_NotifyTimeout:
	.line	254; main.c	}
	RETURN	

; ; Starting pCode block
S_main__MPROC_NotifyFoundEvent	code
_MPROC_NotifyFoundEvent:
	.line	245; main.c	void MPROC_NotifyFoundEvent(unsigned entry, unsigned char evnt0, unsigned char evnt1, unsigned char evnt2, unsigned char value) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	.line	247; main.c	}
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__MPROC_NotifyReceivedEvnt	code
_MPROC_NotifyReceivedEvnt:
	.line	236; main.c	void MPROC_NotifyReceivedEvnt(unsigned char evnt0, unsigned char evnt1, unsigned char evnt2) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVWF	r0x00
	MOVLW	0x02
	MOVFF	PLUSW2, r0x01
	MOVLW	0x03
	MOVFF	PLUSW2, r0x02
	.line	239; main.c	MIDI_Evnt(evnt0, evnt1, evnt2);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_MIDI_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DISPLAY_lfobpm	code
_DISPLAY_lfobpm:
	.line	206; main.c	void DISPLAY_lfobpm(volatile unsigned char lfo_bpm_temp) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_DISPLAY_lfobpm_lfo_bpm_temp_1_1
	MOVWF	_DISPLAY_lfobpm_lfo_bpm_temp_1_1, B
	.line	208; main.c	switch (lfo_bpm_temp) {  
	MOVFF	_DISPLAY_lfobpm_lfo_bpm_temp_1_1, r0x00
	MOVLW	0x0c
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00160_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00164_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00164_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00164_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00164_DS_:
	GOTO	_00148_DS_
	GOTO	_00149_DS_
	GOTO	_00150_DS_
	GOTO	_00151_DS_
	GOTO	_00160_DS_
	GOTO	_00152_DS_
	GOTO	_00153_DS_
	GOTO	_00154_DS_
	GOTO	_00155_DS_
	GOTO	_00156_DS_
	GOTO	_00157_DS_
	GOTO	_00158_DS_
_00148_DS_:
	.line	210; main.c	MIOS_LCD_PrintCString("64/1"); 
	MOVLW	UPPER(__str_2)
	MOVWF	r0x02
	MOVLW	HIGH(__str_2)
	MOVWF	r0x01
	MOVLW	LOW(__str_2)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00149_DS_:
	.line	212; main.c	MIOS_LCD_PrintCString("32/1"); 
	MOVLW	UPPER(__str_3)
	MOVWF	r0x02
	MOVLW	HIGH(__str_3)
	MOVWF	r0x01
	MOVLW	LOW(__str_3)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00150_DS_:
	.line	214; main.c	MIOS_LCD_PrintCString("16/1"); 
	MOVLW	UPPER(__str_4)
	MOVWF	r0x02
	MOVLW	HIGH(__str_4)
	MOVWF	r0x01
	MOVLW	LOW(__str_4)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00151_DS_:
	.line	216; main.c	MIOS_LCD_PrintCString(" 8/1"); 
	MOVLW	UPPER(__str_5)
	MOVWF	r0x02
	MOVLW	HIGH(__str_5)
	MOVWF	r0x01
	MOVLW	LOW(__str_5)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00152_DS_:
	.line	218; main.c	MIOS_LCD_PrintCString(" 4/1");
	MOVLW	UPPER(__str_6)
	MOVWF	r0x02
	MOVLW	HIGH(__str_6)
	MOVWF	r0x01
	MOVLW	LOW(__str_6)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00153_DS_:
	.line	220; main.c	MIOS_LCD_PrintCString(" 2/1"); 
	MOVLW	UPPER(__str_7)
	MOVWF	r0x02
	MOVLW	HIGH(__str_7)
	MOVWF	r0x01
	MOVLW	LOW(__str_7)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00154_DS_:
	.line	222; main.c	MIOS_LCD_PrintCString(" 1/1"); 
	MOVLW	UPPER(__str_8)
	MOVWF	r0x02
	MOVLW	HIGH(__str_8)
	MOVWF	r0x01
	MOVLW	LOW(__str_8)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00155_DS_:
	.line	224; main.c	MIOS_LCD_PrintCString("1/2"); 
	MOVLW	UPPER(__str_9)
	MOVWF	r0x02
	MOVLW	HIGH(__str_9)
	MOVWF	r0x01
	MOVLW	LOW(__str_9)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00156_DS_:
	.line	226; main.c	MIOS_LCD_PrintCString("1/4"); 
	MOVLW	UPPER(__str_10)
	MOVWF	r0x02
	MOVLW	HIGH(__str_10)
	MOVWF	r0x01
	MOVLW	LOW(__str_10)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00157_DS_:
	.line	228; main.c	MIOS_LCD_PrintCString("1/8"); 
	MOVLW	UPPER(__str_11)
	MOVWF	r0x02
	MOVLW	HIGH(__str_11)
	MOVWF	r0x01
	MOVLW	LOW(__str_11)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00158_DS_:
	.line	230; main.c	MIOS_LCD_PrintCString("1/16"); 
	MOVLW	UPPER(__str_12)
	MOVWF	r0x02
	MOVLW	HIGH(__str_12)
	MOVWF	r0x01
	MOVLW	LOW(__str_12)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00160_DS_:
	.line	231; main.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_main__DISPLAY_Tick	code
_DISPLAY_Tick:
	.line	152; main.c	void DISPLAY_Tick(void) __wparam
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_app_flags
	.line	156; main.c	if( !app_flags.DISPLAY_UPDATE_REQ )
	BTFSC	_app_flags, 2, B
	BRA	_00132_DS_
	.line	157; main.c	return;
	BRA	_00136_DS_
_00132_DS_:
	BANKSEL	_app_flags
	.line	160; main.c	app_flags.DISPLAY_UPDATE_REQ = 0;
	BCF	_app_flags, 2, B
	.line	162; main.c	switch( app_flags.save_on ) {
	CLRF	r0x00
; removed redundant BANKSEL
	BTFSC	_app_flags, 3, B
	INCF	r0x00, F
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00133_DS_
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00144_DS_
	BRA	_00134_DS_
_00144_DS_:
	BRA	_00136_DS_
_00133_DS_:
	.line	165; main.c	MIOS_LCD_CursorSet(0x00); // first line
	MOVLW	0x00
	CALL	_MIOS_LCD_CursorSet
	.line	166; main.c	MIOS_LCD_PrintCString("BPM  LFO1 LFO2 LFO3 chn: EG1 EG2 EG3 EG4");
	MOVLW	UPPER(__str_0)
	MOVWF	r0x02
	MOVLW	HIGH(__str_0)
	MOVWF	r0x01
	MOVLW	LOW(__str_0)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	167; main.c	lcd_temp = all_param.bpm;
	MOVFF	(_all_param + 39), _lcd_temp
	.line	168; main.c	MIOS_LCD_CursorSet(0x40);
	MOVLW	0x40
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lcd_temp
	.line	169; main.c	MIOS_LCD_PrintBCD3( lcd_temp );
	MOVF	_lcd_temp, W, B
	CALL	_MIOS_LCD_PrintBCD3
	.line	171; main.c	lfo_bpm_temp = all_param.lfo0_bpm;
	MOVFF	(_all_param + 35), _lfo_bpm_temp
	.line	172; main.c	MIOS_LCD_CursorSet(0x45); 
	MOVLW	0x45
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lfo_bpm_temp
	.line	173; main.c	DISPLAY_lfobpm (lfo_bpm_temp);
	MOVF	_lfo_bpm_temp, W, B
	CALL	_DISPLAY_lfobpm
	.line	175; main.c	lfo_bpm_temp = all_param.lfo1_bpm;
	MOVFF	(_all_param + 36), _lfo_bpm_temp
	.line	176; main.c	MIOS_LCD_CursorSet(0x4a); 
	MOVLW	0x4a
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lfo_bpm_temp
	.line	177; main.c	DISPLAY_lfobpm (lfo_bpm_temp);
	MOVF	_lfo_bpm_temp, W, B
	CALL	_DISPLAY_lfobpm
	.line	179; main.c	lfo_bpm_temp = all_param.lfo2_bpm;
	MOVFF	(_all_param + 37), _lfo_bpm_temp
	.line	180; main.c	MIOS_LCD_CursorSet(0x4f); 
	MOVLW	0x4f
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lfo_bpm_temp
	.line	181; main.c	DISPLAY_lfobpm (lfo_bpm_temp);
	MOVF	_lfo_bpm_temp, W, B
	CALL	_DISPLAY_lfobpm
	.line	183; main.c	lcd_temp = all_param.eg_channel[0];
	MOVFF	(_all_param + 12), _lcd_temp
	.line	184; main.c	MIOS_LCD_CursorSet(0x59);
	MOVLW	0x59
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lcd_temp
	.line	185; main.c	MIOS_LCD_PrintBCD3(lcd_temp);
	MOVF	_lcd_temp, W, B
	CALL	_MIOS_LCD_PrintBCD3
	.line	186; main.c	lcd_temp = all_param.eg_channel[1];
	MOVFF	(_all_param + 13), _lcd_temp
	.line	187; main.c	MIOS_LCD_CursorSet(0x5d);
	MOVLW	0x5d
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lcd_temp
	.line	188; main.c	MIOS_LCD_PrintBCD3(lcd_temp);
	MOVF	_lcd_temp, W, B
	CALL	_MIOS_LCD_PrintBCD3
	.line	189; main.c	lcd_temp = all_param.eg_channel[2];
	MOVFF	(_all_param + 14), _lcd_temp
	.line	190; main.c	MIOS_LCD_CursorSet(0x61);
	MOVLW	0x61
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lcd_temp
	.line	191; main.c	MIOS_LCD_PrintBCD3(lcd_temp);
	MOVF	_lcd_temp, W, B
	CALL	_MIOS_LCD_PrintBCD3
	.line	192; main.c	lcd_temp = all_param.eg_channel[3];
	MOVFF	(_all_param + 15), _lcd_temp
	.line	193; main.c	MIOS_LCD_CursorSet(0x65);
	MOVLW	0x65
	CALL	_MIOS_LCD_CursorSet
	BANKSEL	_lcd_temp
	.line	194; main.c	MIOS_LCD_PrintBCD3(lcd_temp);
	MOVF	_lcd_temp, W, B
	CALL	_MIOS_LCD_PrintBCD3
_00134_DS_:
	.line	197; main.c	MIOS_LCD_CursorSet(0x00); // first line
	MOVLW	0x00
	CALL	_MIOS_LCD_CursorSet
	.line	198; main.c	MIOS_LCD_PrintCString("SAVE: choose bank and preset...");
	MOVLW	UPPER(__str_1)
	MOVWF	r0x02
	MOVLW	HIGH(__str_1)
	MOVWF	r0x01
	MOVLW	LOW(__str_1)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
_00136_DS_:
	.line	199; main.c	break;}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__DISPLAY_Init	code
_DISPLAY_Init:
	.line	137; main.c	void DISPLAY_Init(void) __wparam
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	140; main.c	MIOS_LCD_Clear();
	CALL	_MIOS_LCD_Clear
	.line	142; main.c	MIOS_LCD_CursorSet(0x00); // first line
	MOVLW	0x00
	CALL	_MIOS_LCD_CursorSet
	.line	144; main.c	MIOS_LCD_PrintCString("BPM  LFO1 LFO2 LFO3 chn: EG1 EG2 EG3 EG4");
	MOVLW	UPPER(__str_0)
	MOVWF	r0x02
	MOVLW	HIGH(__str_0)
	MOVWF	r0x01
	MOVLW	LOW(__str_0)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	CALL	_MIOS_LCD_PrintCString
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_app_flags
	.line	146; main.c	app_flags.DISPLAY_UPDATE_REQ = 1;
	BSF	_app_flags, 2, B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_main__Timer	code
_Timer:
	.line	128; main.c	LFO_Tick();
	CALL	_LFO_Tick
	.line	130; main.c	EG_Tick();
	CALL	_EG_Tick
	RETURN	

; ; Starting pCode block
S_main__Tick	code
_Tick:
	BANKSEL	_load_last
	.line	102; main.c	if (load_last) {
	MOVF	_load_last, W, B
	BZ	_00110_DS_
	BANKSEL	(_preset + 1)
	.line	103; main.c	BANKSTICK_LOAD_Evnt( bank, preset);}
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_LOAD_Evnt
	MOVLW	0x03
	ADDWF	FSR1L, F
_00110_DS_:
	BANKSEL	_update_led
	.line	104; main.c	if (update_led) {
	MOVF	_update_led, W, B
	BZ	_00112_DS_
	.line	106; main.c	BANKSTICK_Dout_Update( );}
	CALL	_BANKSTICK_Dout_Update
_00112_DS_:
	BANKSEL	_update_led
	.line	107; main.c	if (update_led) {
	MOVF	_update_led, W, B
	BZ	_00114_DS_
	.line	109; main.c	BANKSTICK_Dout_Update_2( );}
	CALL	_BANKSTICK_Dout_Update_2
_00114_DS_:
	BANKSEL	_update_led
	.line	110; main.c	if (update_led) {
	MOVF	_update_led, W, B
	BZ	_00116_DS_
	.line	112; main.c	BANKSTICK_Dout_Update_3( );}  
	CALL	_BANKSTICK_Dout_Update_3
_00116_DS_:
	BANKSEL	_update_preset_led
	.line	113; main.c	if (update_preset_led) {
	MOVF	_update_preset_led, W, B
	BZ	_00118_DS_
	BANKSEL	(_preset + 1)
	.line	114; main.c	BANKSTICK_preset_LEDs_Update( bank, preset );}
	MOVF	(_preset + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_preset, W, B
	MOVWF	POSTDEC1
	BANKSEL	(_bank + 1)
	MOVF	(_bank + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_bank, W, B
	CALL	_BANKSTICK_preset_LEDs_Update
	MOVLW	0x03
	ADDWF	FSR1L, F
_00118_DS_:
	.line	117; main.c	MAP_Tick();
	CALL	_MAP_Tick
	.line	119; main.c	AOUT_Update();
	CALL	_AOUT_Update
	RETURN	

; ; Starting pCode block
S_main__Init	code
_Init:
	.line	71; main.c	MIOS_AIN_NumberSet(AIN_NUMBER_INPUTS);
	MOVLW	0x00
	CALL	_MIOS_AIN_NumberSet
	.line	75; main.c	MIOS_AIN_UnMuxed();
	CALL	_MIOS_AIN_UnMuxed
	.line	77; main.c	MIOS_AIN_DeadbandSet(AIN_DEADBAND);
	MOVLW	0x03
	CALL	_MIOS_AIN_DeadbandSet
	.line	79; main.c	MIOS_SRIO_NumberSet(7);
	MOVLW	0x07
	CALL	_MIOS_SRIO_NumberSet
	.line	80; main.c	MIOS_SRIO_UpdateFrqSet(2);
	MOVLW	0x02
	CALL	_MIOS_SRIO_UpdateFrqSet
	.line	82; main.c	MIOS_TIMER_Init(0, 10000); // 1 mS / 100 nS = 10000 cycles
	MOVLW	0x27
	MOVWF	POSTDEC1
	MOVLW	0x10
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_MIOS_TIMER_Init
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	85; main.c	BANKSTICK_Init();
	CALL	_BANKSTICK_Init
	.line	87; main.c	AOUT_Init();
	CALL	_AOUT_Init
	.line	89; main.c	MIDI_Init();
	CALL	_MIDI_Init
	.line	91; main.c	LFO_Init();
	CALL	_LFO_Init
	.line	93; main.c	EG_Init();
	CALL	_EG_Init
	.line	95; main.c	MAP_Init();
	CALL	_MAP_Init
	RETURN	

; ; Starting pCode block
__str_0:
	DB	0x42, 0x50, 0x4d, 0x20, 0x20, 0x4c, 0x46, 0x4f, 0x31, 0x20, 0x4c, 0x46
	DB	0x4f, 0x32, 0x20, 0x4c, 0x46, 0x4f, 0x33, 0x20, 0x63, 0x68, 0x6e, 0x3a
	DB	0x20, 0x45, 0x47, 0x31, 0x20, 0x45, 0x47, 0x32, 0x20, 0x45, 0x47, 0x33
	DB	0x20, 0x45, 0x47, 0x34, 0x00
; ; Starting pCode block
__str_1:
	DB	0x53, 0x41, 0x56, 0x45, 0x3a, 0x20, 0x63, 0x68, 0x6f, 0x6f, 0x73, 0x65
	DB	0x20, 0x62, 0x61, 0x6e, 0x6b, 0x20, 0x61, 0x6e, 0x64, 0x20, 0x70, 0x72
	DB	0x65, 0x73, 0x65, 0x74, 0x2e, 0x2e, 0x2e, 0x00
; ; Starting pCode block
__str_2:
	DB	0x36, 0x34, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_3:
	DB	0x33, 0x32, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_4:
	DB	0x31, 0x36, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_5:
	DB	0x20, 0x38, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_6:
	DB	0x20, 0x34, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_7:
	DB	0x20, 0x32, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_8:
	DB	0x20, 0x31, 0x2f, 0x31, 0x00
; ; Starting pCode block
__str_9:
	DB	0x31, 0x2f, 0x32, 0x00
; ; Starting pCode block
__str_10:
	DB	0x31, 0x2f, 0x34, 0x00
; ; Starting pCode block
__str_11:
	DB	0x31, 0x2f, 0x38, 0x00
; ; Starting pCode block
__str_12:
	DB	0x31, 0x2f, 0x31, 0x36, 0x00


; Statistics:
; code size:	 6442 (0x192a) bytes ( 4.91%)
;           	 3221 (0x0c95) words
; udata size:	   16 (0x0010) bytes ( 0.42%)
; access size:	    6 (0x0006) bytes


	end
