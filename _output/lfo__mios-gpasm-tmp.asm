;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:03 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"lfo.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _save3
	global _LFO_Init
	global _LFO_Tick
	global _LFO_bpm
	global _lfo0_value
	global _lfo1_value
	global _lfo2_value
	global _LFO_bpm_tmp2
	global _save0
	global _save1
	global _save2
	global _lfox_bpm
	global _lfo_add_table
	global _lfo_add_table_bpm

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
	extern _bank
	extern _preset
	extern _looper
	extern _app_flags
	extern _load_last
	extern _update_led
	extern _update_preset_led
	extern _midi_note
	extern _midi_cc_chn0
	extern _midi_pitch_bender
	extern _eg0
	extern _eg1
	extern _eg2
	extern _eg3
	extern _eg0_value
	extern _eg1_value
	extern _eg2_value
	extern _eg3_value
	extern _all_param
	extern _new_note
	extern _bpm
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
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR1L equ 0xfe9 ;; normaly 0xfe1, changed by mios-gpasm
FSR2L	equ	0xfd9
POSTDEC1 equ 0xfed ;; normaly 0xfe5, changed by mios-gpasm
PREINC1 equ 0xfec ;; normaly 0xfe4, changed by mios-gpasm
PLUSW2	equ	0xfdb


; Internal registers
.registers udata_ovr 0x0010 ;; normaly 0x0000, changed by mios-gpasm
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1


gpr14	udata

udata_lfo_0	udata
_save3	res	1

udata_lfo_1	udata
_lfo0_value	res	2

udata_lfo_2	udata
_lfo1_value	res	2

udata_lfo_3	udata
_lfo2_value	res	2

udata_lfo_4	udata
_lfox_bpm	res	1

udata_lfo_5	udata
_save0	res	1

udata_lfo_6	udata
_save1	res	1

udata_lfo_7	udata
_save2	res	1

udata_lfo_8	udata
_LFO_bpm_tmp2	res	2

udata_lfo_9	udata
_LFO_bpm_LFO_bpm_tmp_1_1	res	2

udata_lfo_10	udata
_LFO_bpm_lfox_bpm_1_1	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_lfo__LFO_bpm	code
_LFO_bpm:
	.line	348; lfo.c	void LFO_bpm(volatile unsigned char lfox_bpm)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, _LFO_bpm_lfox_bpm_1_1
; ;multiply lit val:0x02 by variable (_all_param + 39) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	354; lfo.c	LFO_bpm_tmp = lfo_add_table_bpm[all_param.bpm];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 39)
	RLCF	(_all_param + 39), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table_bpm)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table_bpm)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table_bpm)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, _LFO_bpm_LFO_bpm_tmp_1_1
	TBLRD*+	
	MOVFF	TABLAT, (_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	.line	356; lfo.c	switch( lfox_bpm ) {
	MOVFF	_LFO_bpm_lfox_bpm_1_1, r0x00
	MOVLW	0x0b
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00391_DS_
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	CLRF	r0x04
	RLCF	r0x00, W
	RLCF	r0x04, F
	RLCF	WREG, W
	RLCF	r0x04, F
	ANDLW	0xfc
	MOVWF	r0x03
	MOVLW	UPPER(_00395_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00395_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00395_DS_)
	ADDWF	r0x03, F
	MOVF	r0x04, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x03, W
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVWF	PCL
_00395_DS_:
	GOTO	_00379_DS_
	GOTO	_00380_DS_
	GOTO	_00381_DS_
	GOTO	_00382_DS_
	GOTO	_00383_DS_
	GOTO	_00384_DS_
	GOTO	_00385_DS_
	GOTO	_00386_DS_
	GOTO	_00387_DS_
	GOTO	_00388_DS_
	GOTO	_00389_DS_
_00379_DS_:
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	.line	359; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 6;
	RRCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
; removed redundant BANKSEL
	RRCF	_LFO_bpm_tmp2, W, B
	MOVWF	_LFO_bpm_tmp2, B
; removed redundant BANKSEL
	RRCF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	RRCF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	RRCF	(_LFO_bpm_tmp2 + 1), W, B
	ANDLW	0xc0
; removed redundant BANKSEL
	XORWF	_LFO_bpm_tmp2, W, B
	XORWF	_LFO_bpm_tmp2, F, B
	XORWF	_LFO_bpm_tmp2, W, B
; removed redundant BANKSEL
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	.line	360; lfo.c	break;
	BRA	_00391_DS_
_00380_DS_:
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	.line	362; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 5;
	SWAPF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	ANDLW	0xf0
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	SWAPF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	ANDLW	0x0f
; removed redundant BANKSEL
	XORWF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	ADDWF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	RLCF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	RLCF	(_LFO_bpm_tmp2 + 1), F, B
	.line	363; lfo.c	break;
	BRA	_00391_DS_
_00381_DS_:
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	.line	365; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 4;
	SWAPF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	ANDLW	0xf0
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	SWAPF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	ANDLW	0x0f
; removed redundant BANKSEL
	XORWF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	ADDWF	(_LFO_bpm_tmp2 + 1), F, B
	.line	366; lfo.c	break;
	BRA	_00391_DS_
_00382_DS_:
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	.line	368; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 3;
	MOVF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	ADDWF	_LFO_bpm_tmp2, F, B
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RLCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RLCF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	RLCF	(_LFO_bpm_tmp2 + 1), F, B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RLCF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	RLCF	(_LFO_bpm_tmp2 + 1), F, B
	.line	369; lfo.c	break;
	BRA	_00391_DS_
_00383_DS_:
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	.line	371; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 2;
	MOVF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	ADDWF	_LFO_bpm_tmp2, F, B
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RLCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RLCF	_LFO_bpm_tmp2, F, B
; removed redundant BANKSEL
	RLCF	(_LFO_bpm_tmp2 + 1), F, B
	.line	372; lfo.c	break;
	BRA	_00391_DS_
_00384_DS_:
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	.line	374; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 1;
	MOVF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	ADDWF	_LFO_bpm_tmp2, F, B
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RLCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	.line	375; lfo.c	break;
	BRA	_00391_DS_
_00385_DS_:
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	.line	377; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp << 0;
	MOVF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	MOVF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	.line	378; lfo.c	break;
	BRA	_00391_DS_
_00386_DS_:
	.line	380; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp >> 1;
	BCF	STATUS, 0
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RRCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	RRCF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	.line	381; lfo.c	break;
	BRA	_00391_DS_
_00387_DS_:
	.line	383; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp >> 2;
	BCF	STATUS, 0
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RRCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	RRCF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RRCF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	RRCF	_LFO_bpm_tmp2, F, B
	.line	384; lfo.c	break;
	BRA	_00391_DS_
_00388_DS_:
	.line	386; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp >> 3;
	BCF	STATUS, 0
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	RRCF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	RRCF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RRCF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	RRCF	_LFO_bpm_tmp2, F, B
	BCF	STATUS, 0
; removed redundant BANKSEL
	RRCF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	RRCF	_LFO_bpm_tmp2, F, B
	.line	387; lfo.c	break;
	BRA	_00391_DS_
_00389_DS_:
	BANKSEL	_LFO_bpm_LFO_bpm_tmp_1_1
	.line	389; lfo.c	LFO_bpm_tmp2 = LFO_bpm_tmp >> 4;
	SWAPF	_LFO_bpm_LFO_bpm_tmp_1_1, W, B
	ANDLW	0x0f
	BANKSEL	_LFO_bpm_tmp2
	MOVWF	_LFO_bpm_tmp2, B
	BANKSEL	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1)
	SWAPF	(_LFO_bpm_LFO_bpm_tmp_1_1 + 1), W, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVWF	(_LFO_bpm_tmp2 + 1), B
	ANDLW	0xf0
; removed redundant BANKSEL
	XORWF	(_LFO_bpm_tmp2 + 1), F, B
; removed redundant BANKSEL
	ADDWF	_LFO_bpm_tmp2, F, B
_00391_DS_:
	.line	391; lfo.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_lfo__LFO_Tick	code
_LFO_Tick:
	.line	84; lfo.c	void LFO_Tick(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_all_param
	.line	93; lfo.c	if( all_param.router_flags_lfo1.lfo1_note_start ) {
	BTFSS	_all_param, 5, B
	BRA	_00112_DS_
	BANKSEL	_new_note
	.line	94; lfo.c	if( new_note ) {
	MOVF	_new_note, W, B
	BZ	_00112_DS_
	BANKSEL	_lfo0_value
	.line	95; lfo.c	lfo0_value = 0;
	CLRF	_lfo0_value, B
; removed redundant BANKSEL
	CLRF	(_lfo0_value + 1), B
	.line	96; lfo.c	new_note ^= 1; } }
	MOVLW	0x01
	BANKSEL	_new_note
	XORWF	_new_note, F, B
_00112_DS_:
	BANKSEL	(_all_param + 32)
	.line	99; lfo.c	if( all_param.lfo0_rate > 0 ) {
	MOVF	(_all_param + 32), W, B
	BTFSC	STATUS, 2
	GOTO	_00145_DS_
; removed redundant BANKSEL
	.line	101; lfo.c	if( all_param.router_flags_lfo1.lfo1_sync_bpm ) {
	BTFSS	_all_param, 6, B
	BRA	_00142_DS_
	.line	103; lfo.c	lfox_bpm = all_param.lfo0_bpm;
	MOVFF	(_all_param + 35), _lfox_bpm
	BANKSEL	_lfox_bpm
	.line	104; lfo.c	LFO_bpm(lfox_bpm);
	MOVF	_lfox_bpm, W, B
	MOVWF	POSTDEC1
	CALL	_LFO_bpm
	INCF	FSR1L, F
	BANKSEL	(_all_param + 8)
	.line	106; lfo.c	switch( all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ) {
	MOVF	(_all_param + 8), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00113_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00114_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00294_DS_
	BRA	_00117_DS_
_00294_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00296_DS_
	BRA	_00120_DS_
_00296_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00298_DS_
	BRA	_00123_DS_
_00298_DS_:
	BRA	_00145_DS_
_00113_DS_:
	BANKSEL	_LFO_bpm_tmp2
	.line	108; lfo.c	lfo0_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	ADDWFC	(_lfo0_value + 1), F, B
	.line	109; lfo.c	break;
	BRA	_00145_DS_
_00114_DS_:
	.line	111; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	112; lfo.c	lfo0_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	113; lfo.c	if( lfo0_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00299_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00299_DS_:
	BNC	_00117_DS_
	BANKSEL	_lfo0_value
	.line	114; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	115; lfo.c	lfo0_value = eg0_value;
	MOVFF	_eg0_value, _lfo0_value
	MOVFF	(_eg0_value + 1), (_lfo0_value + 1)
	.line	116; lfo.c	break;}
	BRA	_00145_DS_
_00117_DS_:
	.line	118; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	119; lfo.c	lfo0_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	120; lfo.c	if( lfo0_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00300_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00300_DS_:
	BNC	_00120_DS_
	BANKSEL	_lfo0_value
	.line	121; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	122; lfo.c	lfo0_value = eg1_value;
	MOVFF	_eg1_value, _lfo0_value
	MOVFF	(_eg1_value + 1), (_lfo0_value + 1)
	.line	123; lfo.c	break; }
	BRA	_00145_DS_
_00120_DS_:
	.line	125; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	126; lfo.c	lfo0_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	127; lfo.c	if( lfo0_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00301_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00301_DS_:
	BTFSS	STATUS, 0
	BRA	_00145_DS_
	BANKSEL	_lfo0_value
	.line	128; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	129; lfo.c	lfo0_value = eg2_value; }
	MOVFF	_eg2_value, _lfo0_value
	MOVFF	(_eg2_value + 1), (_lfo0_value + 1)
	.line	130; lfo.c	break;
	BRA	_00145_DS_
_00123_DS_:
	.line	132; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	133; lfo.c	lfo0_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	134; lfo.c	if( lfo0_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00302_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00302_DS_:
	BTFSS	STATUS, 0
	BRA	_00145_DS_
	BANKSEL	_lfo0_value
	.line	135; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	136; lfo.c	lfo0_value = eg3_value; }
	MOVFF	_eg3_value, _lfo0_value
	MOVFF	(_eg3_value + 1), (_lfo0_value + 1)
	.line	138; lfo.c	}
	BRA	_00145_DS_
_00142_DS_:
	BANKSEL	(_all_param + 8)
	.line	141; lfo.c	switch( all_param.router_flags_Eg_to_lfo1.Eg_to_lfo1 ) {
	MOVF	(_all_param + 8), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00127_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00128_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00308_DS_
	BRA	_00131_DS_
_00308_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00310_DS_
	BRA	_00134_DS_
_00310_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00312_DS_
	BRA	_00137_DS_
_00312_DS_:
	BRA	_00145_DS_
; ;multiply lit val:0x02 by variable (_all_param + 32) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00127_DS_:
	.line	143; lfo.c	lfo0_value += lfo_add_table[all_param.lfo0_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 32)
	RLCF	(_all_param + 32), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo0_value + 1), F, B
	.line	144; lfo.c	break;
	BRA	_00145_DS_
_00128_DS_:
	.line	146; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 32) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	147; lfo.c	lfo0_value += lfo_add_table[all_param.lfo0_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 32)
	RLCF	(_all_param + 32), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	148; lfo.c	if( lfo0_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00313_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00313_DS_:
	BNC	_00131_DS_
	BANKSEL	_lfo0_value
	.line	149; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	150; lfo.c	lfo0_value = eg0_value;
	MOVFF	_eg0_value, _lfo0_value
	MOVFF	(_eg0_value + 1), (_lfo0_value + 1)
	.line	151; lfo.c	break;}
	BRA	_00145_DS_
_00131_DS_:
	.line	153; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 32) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	154; lfo.c	lfo0_value += lfo_add_table[all_param.lfo0_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 32)
	RLCF	(_all_param + 32), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	155; lfo.c	if( lfo0_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00314_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00314_DS_:
	BNC	_00134_DS_
	BANKSEL	_lfo0_value
	.line	156; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	157; lfo.c	lfo0_value = eg1_value;
	MOVFF	_eg1_value, _lfo0_value
	MOVFF	(_eg1_value + 1), (_lfo0_value + 1)
	.line	158; lfo.c	break; }
	BRA	_00145_DS_
_00134_DS_:
	.line	160; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 32) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	161; lfo.c	lfo0_value += lfo_add_table[all_param.lfo0_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 32)
	RLCF	(_all_param + 32), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	162; lfo.c	if( lfo0_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00315_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00315_DS_:
	BTFSS	STATUS, 0
	BRA	_00145_DS_
	BANKSEL	_lfo0_value
	.line	163; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	164; lfo.c	lfo0_value = eg2_value; }
	MOVFF	_eg2_value, _lfo0_value
	MOVFF	(_eg2_value + 1), (_lfo0_value + 1)
	.line	165; lfo.c	break;
	BRA	_00145_DS_
_00137_DS_:
	.line	167; lfo.c	lfo0_value = save0;
	MOVFF	_save0, _lfo0_value
	BANKSEL	(_lfo0_value + 1)
	CLRF	(_lfo0_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 32) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	168; lfo.c	lfo0_value += lfo_add_table[all_param.lfo0_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 32)
	RLCF	(_all_param + 32), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo0_value
	ADDWF	_lfo0_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo0_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	169; lfo.c	if( lfo0_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00316_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00316_DS_:
	BNC	_00145_DS_
	BANKSEL	_lfo0_value
	.line	170; lfo.c	save0 = lfo0_value;
	MOVF	_lfo0_value, W, B
	BANKSEL	_save0
	MOVWF	_save0, B
	.line	171; lfo.c	lfo0_value = eg3_value; }
	MOVFF	_eg3_value, _lfo0_value
	MOVFF	(_eg3_value + 1), (_lfo0_value + 1)
_00145_DS_:
	BANKSEL	(_all_param + 1)
	.line	176; lfo.c	if( all_param.router_flags_lfo2.lfo2_note_start ) {
	BTFSS	(_all_param + 1), 5, B
	BRA	_00149_DS_
	BANKSEL	_new_note
	.line	177; lfo.c	if( new_note ) {
	MOVF	_new_note, W, B
	BZ	_00149_DS_
	BANKSEL	_lfo1_value
	.line	178; lfo.c	lfo1_value = 0;
	CLRF	_lfo1_value, B
; removed redundant BANKSEL
	CLRF	(_lfo1_value + 1), B
	.line	179; lfo.c	new_note ^= 2; } }
	MOVLW	0x02
	BANKSEL	_new_note
	XORWF	_new_note, F, B
_00149_DS_:
	BANKSEL	(_all_param + 33)
	.line	181; lfo.c	if( all_param.lfo1_rate > 0 ) {
	MOVF	(_all_param + 33), W, B
	BTFSC	STATUS, 2
	GOTO	_00182_DS_
; removed redundant BANKSEL
	.line	183; lfo.c	if( all_param.router_flags_lfo2.lfo2_sync_bpm ) {
	BTFSS	(_all_param + 1), 6, B
	BRA	_00179_DS_
	.line	185; lfo.c	lfox_bpm = all_param.lfo1_bpm;
	MOVFF	(_all_param + 36), _lfox_bpm
	BANKSEL	_lfox_bpm
	.line	186; lfo.c	LFO_bpm(lfox_bpm);
	MOVF	_lfox_bpm, W, B
	MOVWF	POSTDEC1
	CALL	_LFO_bpm
	INCF	FSR1L, F
	BANKSEL	(_all_param + 9)
	.line	188; lfo.c	switch( all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ) {
	MOVF	(_all_param + 9), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00150_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00151_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00323_DS_
	BRA	_00154_DS_
_00323_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00325_DS_
	BRA	_00157_DS_
_00325_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00327_DS_
	BRA	_00160_DS_
_00327_DS_:
	BRA	_00182_DS_
_00150_DS_:
	BANKSEL	_LFO_bpm_tmp2
	.line	190; lfo.c	lfo1_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	ADDWFC	(_lfo1_value + 1), F, B
	.line	191; lfo.c	break;
	BRA	_00182_DS_
_00151_DS_:
	.line	193; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	194; lfo.c	lfo1_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	195; lfo.c	if( lfo1_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00328_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00328_DS_:
	BNC	_00154_DS_
	BANKSEL	_lfo1_value
	.line	196; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	197; lfo.c	lfo1_value = eg0_value;
	MOVFF	_eg0_value, _lfo1_value
	MOVFF	(_eg0_value + 1), (_lfo1_value + 1)
	.line	198; lfo.c	break; }
	BRA	_00182_DS_
_00154_DS_:
	.line	200; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	201; lfo.c	lfo1_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	202; lfo.c	if( lfo1_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00329_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00329_DS_:
	BNC	_00157_DS_
	BANKSEL	_lfo1_value
	.line	203; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	204; lfo.c	lfo1_value = eg1_value;
	MOVFF	_eg1_value, _lfo1_value
	MOVFF	(_eg1_value + 1), (_lfo1_value + 1)
	.line	205; lfo.c	break; }
	BRA	_00182_DS_
_00157_DS_:
	.line	207; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	208; lfo.c	lfo1_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	209; lfo.c	if( lfo1_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00330_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00330_DS_:
	BNC	_00160_DS_
	BANKSEL	_lfo1_value
	.line	210; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	211; lfo.c	lfo1_value = eg2_value;
	MOVFF	_eg2_value, _lfo1_value
	MOVFF	(_eg2_value + 1), (_lfo1_value + 1)
	.line	212; lfo.c	break; }
	BRA	_00182_DS_
_00160_DS_:
	.line	214; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	215; lfo.c	lfo1_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	216; lfo.c	if( lfo0_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00331_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00331_DS_:
	BTFSS	STATUS, 0
	BRA	_00182_DS_
	BANKSEL	_lfo1_value
	.line	217; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	218; lfo.c	lfo1_value = eg3_value;
	MOVFF	_eg3_value, _lfo1_value
	MOVFF	(_eg3_value + 1), (_lfo1_value + 1)
	.line	219; lfo.c	break; }
	BRA	_00182_DS_
_00179_DS_:
	BANKSEL	(_all_param + 9)
	.line	223; lfo.c	switch( all_param.router_flags_Eg_to_lfo2.Eg_to_lfo2 ) {
	MOVF	(_all_param + 9), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00164_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00165_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00337_DS_
	BRA	_00168_DS_
_00337_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00339_DS_
	BRA	_00171_DS_
_00339_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00341_DS_
	BRA	_00174_DS_
_00341_DS_:
	BRA	_00182_DS_
; ;multiply lit val:0x02 by variable (_all_param + 33) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00164_DS_:
	.line	225; lfo.c	lfo1_value += lfo_add_table[all_param.lfo1_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 33)
	RLCF	(_all_param + 33), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo1_value + 1), F, B
	.line	226; lfo.c	break;
	BRA	_00182_DS_
_00165_DS_:
	.line	228; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 33) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	229; lfo.c	lfo1_value += lfo_add_table[all_param.lfo1_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 33)
	RLCF	(_all_param + 33), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	230; lfo.c	if( lfo1_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00342_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00342_DS_:
	BNC	_00168_DS_
	BANKSEL	_lfo1_value
	.line	231; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	232; lfo.c	lfo1_value = eg0_value;
	MOVFF	_eg0_value, _lfo1_value
	MOVFF	(_eg0_value + 1), (_lfo1_value + 1)
	.line	233; lfo.c	break; }
	BRA	_00182_DS_
_00168_DS_:
	.line	235; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 33) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	236; lfo.c	lfo1_value += lfo_add_table[all_param.lfo1_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 33)
	RLCF	(_all_param + 33), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	237; lfo.c	if( lfo1_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00343_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00343_DS_:
	BNC	_00171_DS_
	BANKSEL	_lfo1_value
	.line	238; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	239; lfo.c	lfo1_value = eg1_value;
	MOVFF	_eg1_value, _lfo1_value
	MOVFF	(_eg1_value + 1), (_lfo1_value + 1)
	.line	240; lfo.c	break; }
	BRA	_00182_DS_
_00171_DS_:
	.line	242; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 33) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	243; lfo.c	lfo1_value += lfo_add_table[all_param.lfo1_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 33)
	RLCF	(_all_param + 33), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	244; lfo.c	if( lfo1_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo1_value + 1)
	SUBWF	(_lfo1_value + 1), W, B
	BNZ	_00344_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo1_value
	SUBWF	_lfo1_value, W, B
_00344_DS_:
	BNC	_00174_DS_
	BANKSEL	_lfo1_value
	.line	245; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	246; lfo.c	lfo1_value = eg2_value;
	MOVFF	_eg2_value, _lfo1_value
	MOVFF	(_eg2_value + 1), (_lfo1_value + 1)
	.line	247; lfo.c	break; }
	BRA	_00182_DS_
_00174_DS_:
	.line	249; lfo.c	lfo1_value = save1;
	MOVFF	_save1, _lfo1_value
	BANKSEL	(_lfo1_value + 1)
	CLRF	(_lfo1_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 33) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	250; lfo.c	lfo1_value += lfo_add_table[all_param.lfo1_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 33)
	RLCF	(_all_param + 33), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo1_value
	ADDWF	_lfo1_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo1_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	251; lfo.c	if( lfo0_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo0_value + 1)
	SUBWF	(_lfo0_value + 1), W, B
	BNZ	_00345_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo0_value
	SUBWF	_lfo0_value, W, B
_00345_DS_:
	BNC	_00182_DS_
	BANKSEL	_lfo1_value
	.line	252; lfo.c	save1 = lfo1_value;
	MOVF	_lfo1_value, W, B
	BANKSEL	_save1
	MOVWF	_save1, B
	.line	253; lfo.c	lfo1_value = eg3_value;
	MOVFF	_eg3_value, _lfo1_value
	MOVFF	(_eg3_value + 1), (_lfo1_value + 1)
_00182_DS_:
	BANKSEL	(_all_param + 2)
	.line	258; lfo.c	if( all_param.router_flags_lfo3.lfo3_note_start ) {
	BTFSS	(_all_param + 2), 5, B
	BRA	_00186_DS_
	BANKSEL	_new_note
	.line	259; lfo.c	if( new_note ) {
	MOVF	_new_note, W, B
	BZ	_00186_DS_
	BANKSEL	_lfo1_value
	.line	260; lfo.c	lfo1_value = 0;
	CLRF	_lfo1_value, B
; removed redundant BANKSEL
	CLRF	(_lfo1_value + 1), B
	.line	261; lfo.c	new_note ^= 4; } }
	MOVLW	0x04
	BANKSEL	_new_note
	XORWF	_new_note, F, B
_00186_DS_:
	BANKSEL	(_all_param + 34)
	.line	263; lfo.c	if( all_param.lfo2_rate > 0 ) {
	MOVF	(_all_param + 34), W, B
	BTFSC	STATUS, 2
	GOTO	_00220_DS_
; removed redundant BANKSEL
	.line	265; lfo.c	if(all_param.router_flags_lfo2.lfo2_sync_bpm ) {
	BTFSS	(_all_param + 1), 6, B
	BRA	_00216_DS_
	.line	267; lfo.c	lfox_bpm = all_param.lfo2_bpm;
	MOVFF	(_all_param + 37), _lfox_bpm
	BANKSEL	_lfox_bpm
	.line	268; lfo.c	LFO_bpm(lfox_bpm);
	MOVF	_lfox_bpm, W, B
	MOVWF	POSTDEC1
	CALL	_LFO_bpm
	INCF	FSR1L, F
	BANKSEL	(_all_param + 10)
	.line	270; lfo.c	switch( all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ) {
	MOVF	(_all_param + 10), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00187_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00188_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00352_DS_
	BRA	_00191_DS_
_00352_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00354_DS_
	BRA	_00194_DS_
_00354_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00356_DS_
	BRA	_00197_DS_
_00356_DS_:
	BRA	_00220_DS_
_00187_DS_:
	BANKSEL	_LFO_bpm_tmp2
	.line	272; lfo.c	lfo2_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	ADDWFC	(_lfo2_value + 1), F, B
	.line	273; lfo.c	break;
	BRA	_00220_DS_
_00188_DS_:
	.line	275; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	276; lfo.c	lfo2_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	277; lfo.c	if( lfo2_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00357_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00357_DS_:
	BNC	_00191_DS_
	BANKSEL	_lfo2_value
	.line	278; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	279; lfo.c	lfo2_value = eg0_value;
	MOVFF	_eg0_value, _lfo2_value
	MOVFF	(_eg0_value + 1), (_lfo2_value + 1)
	.line	280; lfo.c	break;  }
	BRA	_00220_DS_
_00191_DS_:
	.line	282; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	283; lfo.c	lfo2_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	284; lfo.c	if( lfo2_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00358_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00358_DS_:
	BNC	_00194_DS_
	BANKSEL	_lfo2_value
	.line	285; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	286; lfo.c	lfo2_value = eg1_value;
	MOVFF	_eg1_value, _lfo2_value
	MOVFF	(_eg1_value + 1), (_lfo2_value + 1)
	.line	287; lfo.c	break;  }
	BRA	_00220_DS_
_00194_DS_:
	.line	289; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	290; lfo.c	lfo2_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	291; lfo.c	if( lfo2_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00359_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00359_DS_:
	BNC	_00197_DS_
	BANKSEL	_lfo2_value
	.line	292; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	293; lfo.c	lfo2_value = eg2_value;
	MOVFF	_eg2_value, _lfo2_value
	MOVFF	(_eg2_value + 1), (_lfo2_value + 1)
	.line	294; lfo.c	break; }
	BRA	_00220_DS_
_00197_DS_:
	.line	296; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
	BANKSEL	_LFO_bpm_tmp2
	.line	297; lfo.c	lfo2_value += LFO_bpm_tmp2;
	MOVF	_LFO_bpm_tmp2, W, B
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	BANKSEL	(_LFO_bpm_tmp2 + 1)
	MOVF	(_LFO_bpm_tmp2 + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	298; lfo.c	if( lfo2_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00360_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00360_DS_:
	BTFSS	STATUS, 0
	BRA	_00220_DS_
	BANKSEL	_lfo2_value
	.line	299; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	300; lfo.c	lfo2_value = eg3_value;
	MOVFF	_eg3_value, _lfo2_value
	MOVFF	(_eg3_value + 1), (_lfo2_value + 1)
	.line	301; lfo.c	break;}
	BRA	_00220_DS_
_00216_DS_:
	BANKSEL	(_all_param + 10)
	.line	306; lfo.c	switch( all_param.router_flags_Eg_to_lfo3.Eg_to_lfo3 ) {
	MOVF	(_all_param + 10), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	BZ	_00201_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00202_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BNZ	_00366_DS_
	BRA	_00205_DS_
_00366_DS_:
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x04
	BNZ	_00368_DS_
	BRA	_00208_DS_
_00368_DS_:
	MOVF	r0x00, W
	XORLW	0x08
	BNZ	_00370_DS_
	BRA	_00211_DS_
_00370_DS_:
	BRA	_00220_DS_
; ;multiply lit val:0x02 by variable (_all_param + 34) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00201_DS_:
	.line	309; lfo.c	lfo2_value += lfo_add_table[all_param.lfo2_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 34)
	RLCF	(_all_param + 34), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo2_value + 1), F, B
	.line	310; lfo.c	break;
	BRA	_00220_DS_
_00202_DS_:
	.line	312; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 34) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	313; lfo.c	lfo2_value += lfo_add_table[all_param.lfo2_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 34)
	RLCF	(_all_param + 34), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg0_value + 1)
	.line	314; lfo.c	if( lfo2_value >= eg0_value ) {
	MOVF	(_eg0_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00371_DS_
	BANKSEL	_eg0_value
	MOVF	_eg0_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00371_DS_:
	BNC	_00205_DS_
	BANKSEL	_lfo2_value
	.line	315; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	316; lfo.c	lfo2_value = eg0_value;
	MOVFF	_eg0_value, _lfo2_value
	MOVFF	(_eg0_value + 1), (_lfo2_value + 1)
	.line	317; lfo.c	break;  }
	BRA	_00220_DS_
_00205_DS_:
	.line	319; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 34) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	320; lfo.c	lfo2_value += lfo_add_table[all_param.lfo2_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 34)
	RLCF	(_all_param + 34), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg1_value + 1)
	.line	321; lfo.c	if( lfo2_value >= eg1_value ) {
	MOVF	(_eg1_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00372_DS_
	BANKSEL	_eg1_value
	MOVF	_eg1_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00372_DS_:
	BNC	_00208_DS_
	BANKSEL	_lfo2_value
	.line	322; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	323; lfo.c	lfo2_value = eg1_value;
	MOVFF	_eg1_value, _lfo2_value
	MOVFF	(_eg1_value + 1), (_lfo2_value + 1)
	.line	324; lfo.c	break;  }
	BRA	_00220_DS_
_00208_DS_:
	.line	326; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 34) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	327; lfo.c	lfo2_value += lfo_add_table[all_param.lfo2_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 34)
	RLCF	(_all_param + 34), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg2_value + 1)
	.line	328; lfo.c	if( lfo2_value >= eg2_value ) {
	MOVF	(_eg2_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00373_DS_
	BANKSEL	_eg2_value
	MOVF	_eg2_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00373_DS_:
	BNC	_00211_DS_
	BANKSEL	_lfo2_value
	.line	329; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	330; lfo.c	lfo2_value = eg2_value;
	MOVFF	_eg2_value, _lfo2_value
	MOVFF	(_eg2_value + 1), (_lfo2_value + 1)
	.line	331; lfo.c	break; }
	BRA	_00220_DS_
_00211_DS_:
	.line	333; lfo.c	lfo2_value = save2;
	MOVFF	_save2, _lfo2_value
	BANKSEL	(_lfo2_value + 1)
	CLRF	(_lfo2_value + 1), B
; ;multiply lit val:0x02 by variable (_all_param + 34) and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	334; lfo.c	lfo2_value += lfo_add_table[all_param.lfo2_rate];
	CLRF	r0x01
	BCF	STATUS, 0
	BANKSEL	(_all_param + 34)
	RLCF	(_all_param + 34), W, B
	MOVWF	r0x00
	RLCF	r0x01, F
	CLRF	r0x02
	MOVLW	LOW(_lfo_add_table)
	ADDWF	r0x00, F
	MOVLW	HIGH(_lfo_add_table)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_lfo_add_table)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	TBLRD*+	
	MOVFF	TABLAT, r0x01
	MOVF	r0x00, W
	BANKSEL	_lfo2_value
	ADDWF	_lfo2_value, F, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	ADDWFC	(_lfo2_value + 1), F, B
	BANKSEL	(_eg3_value + 1)
	.line	335; lfo.c	if( lfo2_value >= eg3_value ) {
	MOVF	(_eg3_value + 1), W, B
	BANKSEL	(_lfo2_value + 1)
	SUBWF	(_lfo2_value + 1), W, B
	BNZ	_00374_DS_
	BANKSEL	_eg3_value
	MOVF	_eg3_value, W, B
	BANKSEL	_lfo2_value
	SUBWF	_lfo2_value, W, B
_00374_DS_:
	BNC	_00220_DS_
	BANKSEL	_lfo2_value
	.line	336; lfo.c	save2 = lfo2_value;
	MOVF	_lfo2_value, W, B
	BANKSEL	_save2
	MOVWF	_save2, B
	.line	337; lfo.c	lfo2_value = eg3_value;
	MOVFF	_eg3_value, _lfo2_value
	MOVFF	(_eg3_value + 1), (_lfo2_value + 1)
_00220_DS_:
	.line	339; lfo.c	}
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_lfo__LFO_Init	code
_LFO_Init:
	.line	74; lfo.c	lfo0_value = 0x7fff;
	MOVLW	0xff
	BANKSEL	_lfo0_value
	MOVWF	_lfo0_value, B
	MOVLW	0x7f
; removed redundant BANKSEL
	MOVWF	(_lfo0_value + 1), B
	.line	75; lfo.c	lfo1_value = 0x7fff;
	MOVLW	0xff
	BANKSEL	_lfo1_value
	MOVWF	_lfo1_value, B
	MOVLW	0x7f
; removed redundant BANKSEL
	MOVWF	(_lfo1_value + 1), B
	.line	76; lfo.c	lfo2_value = 0x7fff;
	MOVLW	0xff
	BANKSEL	_lfo2_value
	MOVWF	_lfo2_value, B
	MOVLW	0x7f
; removed redundant BANKSEL
	MOVWF	(_lfo2_value + 1), B
	RETURN	

; ; Starting pCode block for Ival
	code
_lfo_add_table:
	DB	0x00, 0x00, 0x01, 0x00, 0x02, 0x00, 0x03, 0x00, 0x04, 0x00, 0x06, 0x00
	DB	0x07, 0x00, 0x08, 0x00, 0x0a, 0x00, 0x0b, 0x00, 0x0c, 0x00, 0x0e, 0x00
	DB	0x0f, 0x00, 0x11, 0x00, 0x12, 0x00, 0x14, 0x00, 0x15, 0x00, 0x17, 0x00
	DB	0x19, 0x00, 0x1a, 0x00, 0x1c, 0x00, 0x1e, 0x00, 0x1f, 0x00, 0x21, 0x00
	DB	0x23, 0x00, 0x25, 0x00, 0x27, 0x00, 0x29, 0x00, 0x2a, 0x00, 0x2c, 0x00
	DB	0x2e, 0x00, 0x30, 0x00, 0x33, 0x00, 0x35, 0x00, 0x37, 0x00, 0x39, 0x00
	DB	0x3b, 0x00, 0x3e, 0x00, 0x40, 0x00, 0x42, 0x00, 0x45, 0x00, 0x47, 0x00
	DB	0x4a, 0x00, 0x4c, 0x00, 0x4f, 0x00, 0x51, 0x00, 0x54, 0x00, 0x57, 0x00
	DB	0x59, 0x00, 0x5c, 0x00, 0x5f, 0x00, 0x62, 0x00, 0x65, 0x00, 0x68, 0x00
	DB	0x6b, 0x00, 0x6e, 0x00, 0x72, 0x00, 0x75, 0x00, 0x78, 0x00, 0x7c, 0x00
	DB	0x7f, 0x00, 0x82, 0x00, 0x86, 0x00, 0x8a, 0x00, 0x8d, 0x00, 0x91, 0x00
	DB	0x95, 0x00, 0x99, 0x00, 0x9d, 0x00, 0xa1, 0x00, 0xa5, 0x00, 0xa9, 0x00
	DB	0xad, 0x00, 0xb2, 0x00, 0xb6, 0x00, 0xbb, 0x00, 0xbf, 0x00, 0xc4, 0x00
	DB	0xc9, 0x00, 0xce, 0x00, 0xd3, 0x00, 0xd8, 0x00, 0xdd, 0x00, 0xe2, 0x00
	DB	0xe7, 0x00, 0xed, 0x00, 0xf2, 0x00, 0xf8, 0x00, 0xfd, 0x00, 0x03, 0x01
	DB	0x09, 0x01, 0x0f, 0x01, 0x15, 0x01, 0x1b, 0x01, 0x22, 0x01, 0x28, 0x01
	DB	0x2f, 0x01, 0x36, 0x01, 0x3c, 0x01, 0x43, 0x01, 0x4a, 0x01, 0x52, 0x01
	DB	0x59, 0x01, 0x60, 0x01, 0x68, 0x01, 0x70, 0x01, 0x78, 0x01, 0x80, 0x01
	DB	0x88, 0x01, 0x90, 0x01, 0x99, 0x01, 0xa1, 0x01, 0xaa, 0x01, 0xb3, 0x01
	DB	0xbc, 0x01, 0xc5, 0x01, 0xcf, 0x01, 0xd8, 0x01, 0xe2, 0x01, 0xec, 0x01
	DB	0xf6, 0x01, 0x01, 0x02, 0x0b, 0x02, 0x16, 0x02, 0x21, 0x02, 0x2c, 0x02
	DB	0x37, 0x02, 0x43, 0x02, 0x4e, 0x02, 0x5a, 0x02, 0x66, 0x02, 0x73, 0x02
	DB	0x7f, 0x02, 0x8c, 0x02, 0x99, 0x02, 0xa6, 0x02, 0xb4, 0x02, 0xc2, 0x02
	DB	0xd0, 0x02, 0xde, 0x02, 0xec, 0x02, 0xfb, 0x02, 0x0a, 0x03, 0x1a, 0x03
	DB	0x29, 0x03, 0x39, 0x03, 0x49, 0x03, 0x5a, 0x03, 0x6b, 0x03, 0x7c, 0x03
	DB	0x8d, 0x03, 0x9f, 0x03, 0xb1, 0x03, 0xc3, 0x03, 0xd6, 0x03, 0xe9, 0x03
	DB	0xfc, 0x03, 0x10, 0x04, 0x24, 0x04, 0x39, 0x04, 0x4d, 0x04, 0x63, 0x04
	DB	0x78, 0x04, 0x8e, 0x04, 0xa5, 0x04, 0xbb, 0x04, 0xd3, 0x04, 0xea, 0x04
	DB	0x02, 0x05, 0x1b, 0x05, 0x34, 0x05, 0x4d, 0x05, 0x67, 0x05, 0x81, 0x05
	DB	0x9c, 0x05, 0xb7, 0x05, 0xd3, 0x05, 0xef, 0x05, 0x0c, 0x06, 0x29, 0x06
	DB	0x47, 0x06, 0x66, 0x06, 0x85, 0x06, 0xa4, 0x06, 0xc4, 0x06, 0xe5, 0x06
	DB	0x06, 0x07, 0x28, 0x07, 0x4b, 0x07, 0x6e, 0x07, 0x91, 0x07, 0xb6, 0x07
	DB	0xdb, 0x07, 0x01, 0x08, 0x27, 0x08, 0x4e, 0x08, 0x76, 0x08, 0x9e, 0x08
	DB	0xc8, 0x08, 0xf2, 0x08, 0x1c, 0x09, 0x48, 0x09, 0x74, 0x09, 0xa2, 0x09
	DB	0xd0, 0x09, 0xfe, 0x09, 0x2e, 0x0a, 0x5f, 0x0a, 0x90, 0x0a, 0xc2, 0x0a
	DB	0xf5, 0x0a, 0x2a, 0x0b, 0x5f, 0x0b, 0x95, 0x0b, 0xcc, 0x0b, 0x04, 0x0c
	DB	0x3d, 0x0c, 0x77, 0x0c, 0xb2, 0x0c, 0xee, 0x0c, 0x2c, 0x0d, 0x6a, 0x0d
	DB	0xaa, 0x0d, 0xeb, 0x0d, 0x2c, 0x0e, 0x70, 0x0e, 0xb4, 0x0e, 0xf9, 0x0e
	DB	0x40, 0x0f, 0x88, 0x0f, 0xd2, 0x0f, 0x1d, 0x10, 0x69, 0x10, 0xb6, 0x10
	DB	0x05, 0x11, 0x55, 0x11, 0xa7, 0x11, 0xfa, 0x11, 0x4f, 0x12, 0xa6, 0x12
	DB	0xfe, 0x12, 0x57, 0x13, 0xb2, 0x13, 0x0f, 0x14, 0x6d, 0x14, 0xce, 0x14
	DB	0x30, 0x15, 0x93, 0x15, 0xf9, 0x15, 0x60, 0x16, 0xc9, 0x16, 0x34, 0x17
	DB	0xa2, 0x17, 0x11, 0x18, 0x82, 0x18, 0xf5, 0x18
; ; Starting pCode block for Ival
_lfo_add_table_bpm:
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
	DB	0x34, 0x00, 0x35, 0x00, 0x36, 0x00, 0x37, 0x00, 0x38, 0x00, 0x39, 0x00
	DB	0x3a, 0x00, 0x3c, 0x00, 0x3d, 0x00, 0x3e, 0x00, 0x3f, 0x00, 0x40, 0x00
	DB	0x41, 0x00, 0x42, 0x00, 0x43, 0x00, 0x44, 0x00, 0x45, 0x00, 0x46, 0x00
	DB	0x48, 0x00, 0x49, 0x00, 0x4a, 0x00, 0x4b, 0x00, 0x4c, 0x00, 0x4d, 0x00
	DB	0x4e, 0x00, 0x4f, 0x00, 0x50, 0x00, 0x51, 0x00, 0x53, 0x00, 0x54, 0x00
	DB	0x55, 0x00, 0x56, 0x00, 0x57, 0x00, 0x58, 0x00, 0x59, 0x00, 0x5a, 0x00
	DB	0x5b, 0x00, 0x5c, 0x00, 0x5d, 0x00, 0x5f, 0x00, 0x60, 0x00, 0x61, 0x00
	DB	0x62, 0x00, 0x63, 0x00, 0x64, 0x00, 0x65, 0x00, 0x66, 0x00, 0x67, 0x00
	DB	0x68, 0x00, 0x69, 0x00, 0x6b, 0x00, 0x6c, 0x00, 0x6d, 0x00, 0x6e, 0x00
	DB	0x6f, 0x00, 0x70, 0x00, 0x71, 0x00, 0x72, 0x00, 0x73, 0x00, 0x74, 0x00
	DB	0x75, 0x00, 0x77, 0x00, 0x78, 0x00, 0x79, 0x00, 0x7a, 0x00, 0x7b, 0x00
	DB	0x7c, 0x00, 0x7d, 0x00, 0x7e, 0x00, 0x7f, 0x00, 0x80, 0x00, 0x81, 0x00
	DB	0x83, 0x00, 0x84, 0x00, 0x85, 0x00, 0x86, 0x00, 0x87, 0x00, 0x88, 0x00
	DB	0x89, 0x00, 0x8a, 0x00, 0x8b, 0x00, 0x8c, 0x00, 0x8d, 0x00, 0x8f, 0x00
	DB	0x90, 0x00, 0x91, 0x00, 0x92, 0x00, 0x93, 0x00, 0x94, 0x00, 0x95, 0x00
	DB	0x96, 0x00, 0x97, 0x00, 0x98, 0x00, 0x9a, 0x00, 0x9b, 0x00, 0x9c, 0x00
	DB	0x9d, 0x00, 0x9e, 0x00, 0x9f, 0x00, 0xa0, 0x00, 0xa1, 0x00, 0xa2, 0x00
	DB	0xa3, 0x00, 0xa4, 0x00, 0xa6, 0x00, 0xa7, 0x00, 0xa8, 0x00, 0xa9, 0x00
	DB	0xaa, 0x00, 0xab, 0x00, 0xac, 0x00, 0xad, 0x00, 0xae, 0x00, 0xaf, 0x00
	DB	0xb0, 0x00, 0xb2, 0x00, 0xb3, 0x00, 0xb4, 0x00, 0xb5, 0x00, 0xb6, 0x00
	DB	0xb7, 0x00, 0xb8, 0x00, 0xb9, 0x00, 0xba, 0x00, 0xbb, 0x00, 0xbc, 0x00
	DB	0xbe, 0x00, 0xbf, 0x00, 0xc0, 0x00, 0xc1, 0x00, 0xc2, 0x00, 0xc3, 0x00
	DB	0xc4, 0x00, 0xc5, 0x00, 0xc6, 0x00, 0xc7, 0x00, 0xc8, 0x00, 0xca, 0x00
	DB	0xcb, 0x00, 0xcc, 0x00, 0xcd, 0x00, 0xce, 0x00, 0xcf, 0x00, 0xd0, 0x00
	DB	0xd1, 0x00, 0xd2, 0x00, 0xd3, 0x00, 0xd4, 0x00, 0xd6, 0x00, 0xd7, 0x00
	DB	0xd8, 0x00, 0xd9, 0x00, 0xda, 0x00, 0xdb, 0x00, 0xdc, 0x00, 0xdd, 0x00
	DB	0xde, 0x00, 0xdf, 0x00, 0xe1, 0x00, 0xe2, 0x00, 0xe3, 0x00, 0xe4, 0x00
	DB	0xe5, 0x00, 0xe6, 0x00, 0xe7, 0x00, 0xe8, 0x00, 0xe9, 0x00, 0xea, 0x00
	DB	0xeb, 0x00, 0xed, 0x00, 0xee, 0x00, 0xef, 0x00, 0xf0, 0x00, 0xf1, 0x00
	DB	0xf2, 0x00, 0xf3, 0x00, 0xf4, 0x00, 0xf5, 0x00, 0xf6, 0x00, 0xf7, 0x00
	DB	0xf9, 0x00, 0xfa, 0x00, 0xfb, 0x00, 0xfc, 0x00, 0xfd, 0x00, 0xfe, 0x00
	DB	0xff, 0x00, 0x00, 0x01, 0x01, 0x01, 0x02, 0x01, 0x03, 0x01, 0x05, 0x01
	DB	0x06, 0x01, 0x07, 0x01, 0x08, 0x01, 0x09, 0x01, 0x0a, 0x01, 0x0b, 0x01
	DB	0x0c, 0x01, 0x0d, 0x01, 0x0e, 0x01, 0x0f, 0x01, 0x11, 0x01, 0x12, 0x01
	DB	0x13, 0x01, 0x14, 0x01, 0x15, 0x01, 0x16, 0x01


; Statistics:
; code size:	 3502 (0x0dae) bytes ( 2.67%)
;           	 1751 (0x06d7) words
; udata size:	   16 (0x0010) bytes ( 0.42%)
; access size:	    5 (0x0005) bytes


	end
