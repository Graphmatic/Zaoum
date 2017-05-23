;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:05 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"eg.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _EG_Init
	global _EG_Tick
	global _eg0
	global _eg1
	global _eg2
	global _eg3
	global _eg0_value
	global _eg1_value
	global _eg2_value
	global _eg3_value
	global _eg0_int
	global _eg1_int
	global _eg2_int
	global _eg3_int
	global _eg_add_table

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
	extern _new_note
	extern _lfo1_value
	extern _lfo2_value
	extern _all_param
	extern _lfo0_value
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
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1


gpr14	udata

udata_eg_0	udata
_eg0_value	res	2

udata_eg_1	udata
_eg1_value	res	2

udata_eg_2	udata
_eg2_value	res	2

udata_eg_3	udata
_eg3_value	res	2

udata_eg_4	udata
_eg0	res	1

udata_eg_5	udata
_eg0_int	res	1

udata_eg_6	udata
_eg1	res	1

udata_eg_7	udata
_eg1_int	res	1

udata_eg_8	udata
_eg2	res	1

udata_eg_9	udata
_eg2_int	res	1

udata_eg_10	udata
_eg3	res	1

udata_eg_11	udata
_eg3_int	res	1

udata_eg_12	udata
iTemp154	res	1

udata_eg_13	udata
iTemp174	res	1

udata_eg_14	udata
iTemp182	res	1

udata_eg_15	udata
iTemp200	res	1

udata_eg_16	udata
iTemp258	res	1

udata_eg_17	udata
iTemp278	res	1

udata_eg_18	udata
iTemp286	res	1

udata_eg_19	udata
iTemp304	res	1

udata_eg_20	udata
iTemp366	res	1

udata_eg_21	udata
iTemp386	res	1

udata_eg_22	udata
iTemp394	res	1

udata_eg_23	udata
iTemp412	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_eg__EG_Tick	code
_EG_Tick:
	.line	81; eg.c	{
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	.line	98; eg.c	eg0_int.LAST_GATE = 1;
	CLRF	r0x00
	BANKSEL	_eg0
	BTFSC	_eg0, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00113_DS_
_00254_DS_:
	BANKSEL	_eg0_int
	BTFSC	_eg0_int, 4, B
	BRA	_00113_DS_
; removed redundant BANKSEL
	.line	99; eg.c	eg0_int.STATE = ATTACK;
	BSF	_eg0_int, 4, B
	.line	100; eg.c	} else if( (eg0.GATE == 0) && (eg0_int.LAST_GATE == 1) ) { // falling edge
	MOVF	_eg0_int, W, B
	ANDLW	0xf0
	IORLW	0x01
; removed redundant BANKSEL
	MOVWF	_eg0_int, B
	BRA	_00114_DS_
_00113_DS_:
	BANKSEL	_eg0
	.line	101; eg.c	eg0_int.LAST_GATE = 0;
	BTFSC	_eg0, 0, B
	BRA	_00114_DS_
	CLRF	r0x00
	BANKSEL	_eg0_int
	BTFSC	_eg0_int, 4, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00114_DS_
_00256_DS_:
	BANKSEL	_eg0_int
	.line	102; eg.c	eg0_int.STATE = RELEASE;
	BCF	_eg0_int, 4, B
	.line	103; eg.c	}
	MOVF	_eg0_int, W, B
	ANDLW	0xf0
	IORLW	0x04
; removed redundant BANKSEL
	MOVWF	_eg0_int, B
_00114_DS_:
	.line	105; eg.c	
	CLRF	r0x00
	BANKSEL	_eg0
	BTFSC	_eg0, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	BANKSEL	_eg0_int
	MOVF	_eg0_int, W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg0_int, B
	.line	107; eg.c	
	BCF	STATUS, 0
	BANKSEL	(_eg0_value + 1)
	RRCF	(_eg0_value + 1), W, B
	MOVWF	r0x01
; removed redundant BANKSEL
	RRCF	_eg0_value, W, B
	MOVWF	r0x00
	BANKSEL	_eg0_int
	.line	109; eg.c	case IDLE:
	MOVF	_eg0_int, W, B
	ANDLW	0x0f
	MOVWF	r0x02
	MOVFF	r0x02, r0x03
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x7b
	BTFSC	STATUS, 0
	BRA	_00132_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x02, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00258_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00258_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00258_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00258_DS_:
	GOTO	_00116_DS_
	GOTO	_00117_DS_
	GOTO	_00122_DS_
	GOTO	_00128_DS_
	GOTO	_00129_DS_
_00116_DS_:
	.line	111; eg.c	break;
	CLRF	r0x00
	CLRF	r0x01
	.line	112; eg.c	
	BRA	_00132_DS_
_00117_DS_:
	BANKSEL	(_all_param + 3)
	.line	115; eg.c	all_param.attack[0] = lfo0_value ;}
	BTFSS	(_all_param + 3), 0, B
	BRA	_00119_DS_
	BANKSEL	_lfo0_value
	.line	116; eg.c	if( (eg_value += eg_add_table[all_param.attack[0]]) & 0x8000 ) {
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 16)
	MOVWF	(_all_param + 16), B
; ;multiply lit val:0x02 by variable (_all_param + 16) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00119_DS_:
	.line	117; eg.c	eg_value = 0x7fff;
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(_all_param + 16)
	RLCF	(_all_param + 16), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	BTFSS	r0x03, 7
	BRA	_00132_DS_
	.line	118; eg.c	eg0_int.STATE = DECAY; }
	MOVLW	0xff
	MOVWF	r0x00
	MOVLW	0x7f
	MOVWF	r0x01
	BANKSEL	_eg0_int
	.line	119; eg.c	
	MOVF	_eg0_int, W, B
	ANDLW	0xf0
	IORLW	0x02
; removed redundant BANKSEL
	MOVWF	_eg0_int, B
	.line	121; eg.c	
	BRA	_00132_DS_
_00122_DS_:
	BANKSEL	(_all_param + 4)
	.line	124; eg.c	all_param.decay[0] = lfo0_value;}
	BTFSS	(_all_param + 4), 0, B
	BRA	_00124_DS_
	BANKSEL	_lfo0_value
	.line	125; eg.c	lvl = (all_param.sustain[0] << 7);
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 20)
	MOVWF	(_all_param + 20), B
_00124_DS_:
	.line	126; eg.c	
	MOVFF	(_all_param + 24), r0x02
	CLRF	r0x03
	RRCF	r0x03, W
	RRCF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	RRCF	r0x04, F
; ;multiply lit val:0x02 by variable (_all_param + 20) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	.line	128; eg.c	eg_value = lvl;
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(_all_param + 20)
	RLCF	(_all_param + 20), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x06
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x06, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x03, W
	SUBWFB	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BNZ	_00260_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00260_DS_:
	BC	_00125_DS_
	BTFSS	r0x01, 7
	BRA	_00132_DS_
_00125_DS_:
	.line	129; eg.c	//        eg0_int.STATE = SUSTAIN;
	MOVFF	r0x04, r0x00
	MOVFF	r0x05, r0x01
	.line	132; eg.c	
	BRA	_00132_DS_
_00128_DS_:
	.line	135; eg.c	break;
	MOVFF	(_all_param + 28), r0x02
	CLRF	r0x03
	RRCF	r0x03, W
	RRCF	r0x02, W
	MOVWF	r0x01
	CLRF	r0x00
	RRCF	r0x00, F
	.line	136; eg.c	
	BRA	_00132_DS_
; ;multiply lit val:0x02 by variable (_all_param + 28) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00129_DS_:
	.line	139; eg.c	eg_value = 0;
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(_all_param + 28)
	RLCF	(_all_param + 28), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x03, W
	SUBWFB	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	BTFSS	r0x03, 7
	BRA	_00132_DS_
	.line	140; eg.c	eg0_int.STATE = IDLE;
	CLRF	r0x00
	CLRF	r0x01
	BANKSEL	_eg0_int
	.line	141; eg.c	}
	MOVF	_eg0_int, W, B
	ANDLW	0xf0
; removed redundant BANKSEL
	MOVWF	_eg0_int, B
_00132_DS_:
	.line	146; eg.c	
	MOVF	r0x00, W
	BANKSEL	_eg0_value
	MOVWF	_eg0_value, B
	ADDWF	_eg0_value, F, B
	RLCF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_eg0_value + 1), B
	BANKSEL	(_all_param + 5)
	.line	150; eg.c	
	BTFSC	(_all_param + 5), 0, B
	BRA	_00158_DS_
	.line	152; eg.c	eg1_int.LAST_GATE = 1;
	CLRF	r0x00
	BANKSEL	_eg1
	BTFSC	_eg1, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00137_DS_
_00264_DS_:
	BANKSEL	_eg1_int
	BTFSC	_eg1_int, 4, B
	BRA	_00137_DS_
; removed redundant BANKSEL
	.line	153; eg.c	eg1_int.STATE = ATTACK1;
	BSF	_eg1_int, 4, B
	.line	154; eg.c	} else if( (eg1.GATE == 0) && (eg1_int.LAST_GATE == 1) ) { // falling edge
	MOVF	_eg1_int, W, B
	ANDLW	0xf0
	IORLW	0x01
; removed redundant BANKSEL
	MOVWF	_eg1_int, B
	BRA	_00138_DS_
_00137_DS_:
	BANKSEL	_eg1
	.line	155; eg.c	eg1_int.LAST_GATE = 0;
	BTFSC	_eg1, 0, B
	BRA	_00138_DS_
	CLRF	r0x00
	BANKSEL	_eg1_int
	BTFSC	_eg1_int, 4, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00138_DS_
_00266_DS_:
	BANKSEL	_eg1_int
	.line	156; eg.c	eg1_int.STATE = RELEASE1;
	BCF	_eg1_int, 4, B
	.line	157; eg.c	}
	MOVF	_eg1_int, W, B
	ANDLW	0xf0
	IORLW	0x04
; removed redundant BANKSEL
	MOVWF	_eg1_int, B
_00138_DS_:
	.line	159; eg.c	
	CLRF	r0x00
	BANKSEL	_eg1
	BTFSC	_eg1, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	BANKSEL	_eg1_int
	MOVF	_eg1_int, W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg1_int, B
	.line	161; eg.c	
	BCF	STATUS, 0
	BANKSEL	(_eg1_value + 1)
	RRCF	(_eg1_value + 1), W, B
	MOVWF	r0x01
; removed redundant BANKSEL
	RRCF	_eg1_value, W, B
	MOVWF	r0x00
	BANKSEL	_eg1_int
	.line	163; eg.c	case IDLE1:
	MOVF	_eg1_int, W, B
	ANDLW	0x0f
	MOVWF	r0x02
	MOVFF	r0x02, r0x03
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x7b
	BTFSC	STATUS, 0
	BRA	_00158_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x02, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00268_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00268_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00268_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00268_DS_:
	GOTO	_00140_DS_
	GOTO	_00141_DS_
	GOTO	_00146_DS_
	GOTO	_00152_DS_
	GOTO	_00153_DS_
_00140_DS_:
	.line	166; eg.c	
	BRA	_00158_DS_
_00141_DS_:
	BANKSEL	(_all_param + 3)
	.line	169; eg.c	all_param.attack[1] = lfo0_value;}
	BTFSS	(_all_param + 3), 1, B
	BRA	_00143_DS_
	BANKSEL	_lfo0_value
	.line	170; eg.c	if( (eg1_value1 += eg_add_table[all_param.attack[1]]) & 0x8000 ) {
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 17)
	MOVWF	(_all_param + 17), B
_00143_DS_:
	.line	171; eg.c	eg1_value1 = 0x7fff;
	MOVFF	(_all_param + 17), (iTemp154 + 1)
; ;multiply lit val:0x02 by variable (iTemp154 + 1) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp154 + 1)
	RLCF	(iTemp154 + 1), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
	BTFSS	r0x03, 7
	BRA	_00158_DS_
	BANKSEL	_eg1_int
	.line	173; eg.c	}
	MOVF	_eg1_int, W, B
	ANDLW	0xf0
	IORLW	0x02
; removed redundant BANKSEL
	MOVWF	_eg1_int, B
	.line	175; eg.c	
	BRA	_00158_DS_
_00146_DS_:
	BANKSEL	(_all_param + 4)
	.line	178; eg.c	all_param.decay[1] = lfo0_value;}
	BTFSS	(_all_param + 4), 1, B
	BRA	_00148_DS_
	BANKSEL	_lfo0_value
	.line	179; eg.c	lvl1 = (all_param.sustain[1] << 7);
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 21)
	MOVWF	(_all_param + 21), B
_00148_DS_:
	.line	180; eg.c	
	MOVFF	(_all_param + 25), (iTemp174 + 1)
	MOVFF	(iTemp174 + 1), r0x02
	CLRF	r0x03
	RRCF	r0x03, W
	RRCF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	RRCF	r0x04, F
	.line	182; eg.c	eg1_value1 = lvl1;
	MOVFF	(_all_param + 21), (iTemp182 + 1)
; ;multiply lit val:0x02 by variable (iTemp182 + 1) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp182 + 1)
	RLCF	(iTemp182 + 1), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x06
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x06, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x03, W
	SUBWFB	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BNZ	_00270_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00270_DS_:
	BC	_00158_DS_
	BTFSC	r0x01, 7
	.line	186; eg.c	
	BRA	_00158_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00152_DS_:
	.line	189; eg.c	break;
	MOVFF	(_all_param + 25), WREG
	.line	190; eg.c	
	BRA	_00158_DS_
_00153_DS_:
	.line	193; eg.c	eg1_value1 = 0;
	MOVFF	(_all_param + 29), (iTemp200 + 1)
; ;multiply lit val:0x02 by variable (iTemp200 + 1) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp200 + 1)
	RLCF	(iTemp200 + 1), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	BTFSS	r0x01, 7
	BRA	_00158_DS_
	BANKSEL	_eg1_int
	.line	195; eg.c	}
	MOVF	_eg1_int, W, B
	ANDLW	0xf0
; removed redundant BANKSEL
	MOVWF	_eg1_int, B
_00158_DS_:
	.line	206; eg.c	eg2_int.LAST_GATE = 1;
	CLRF	r0x00
	BANKSEL	_eg2
	BTFSC	_eg2, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00163_DS_
_00275_DS_:
	BANKSEL	_eg2_int
	BTFSC	_eg2_int, 4, B
	BRA	_00163_DS_
; removed redundant BANKSEL
	.line	207; eg.c	eg2_int.STATE = ATTACK2;
	BSF	_eg2_int, 4, B
	.line	208; eg.c	} else if( (eg2.GATE == 0) && (eg2_int.LAST_GATE == 1) ) { // falling edge
	MOVF	_eg2_int, W, B
	ANDLW	0xf0
	IORLW	0x01
; removed redundant BANKSEL
	MOVWF	_eg2_int, B
	BRA	_00164_DS_
_00163_DS_:
	BANKSEL	_eg2
	.line	209; eg.c	eg2_int.LAST_GATE = 0;
	BTFSC	_eg2, 0, B
	BRA	_00164_DS_
	CLRF	r0x00
	BANKSEL	_eg2_int
	BTFSC	_eg2_int, 4, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00164_DS_
_00277_DS_:
	BANKSEL	_eg2_int
	.line	210; eg.c	eg2_int.STATE = RELEASE2;
	BCF	_eg2_int, 4, B
	.line	211; eg.c	}
	MOVF	_eg2_int, W, B
	ANDLW	0xf0
	IORLW	0x04
; removed redundant BANKSEL
	MOVWF	_eg2_int, B
_00164_DS_:
	.line	213; eg.c	
	CLRF	r0x00
	BANKSEL	_eg2
	BTFSC	_eg2, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	BANKSEL	_eg2_int
	MOVF	_eg2_int, W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg2_int, B
	.line	215; eg.c	
	BCF	STATUS, 0
	BANKSEL	(_eg2_value + 1)
	RRCF	(_eg2_value + 1), W, B
	MOVWF	r0x01
; removed redundant BANKSEL
	RRCF	_eg2_value, W, B
	MOVWF	r0x00
	BANKSEL	_eg2_int
	.line	217; eg.c	case IDLE2:
	MOVF	_eg2_int, W, B
	ANDLW	0x0f
	MOVWF	r0x02
	MOVFF	r0x02, r0x03
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x7b
	BTFSC	STATUS, 0
	BRA	_00182_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x02, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00279_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00279_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00279_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00279_DS_:
	GOTO	_00166_DS_
	GOTO	_00167_DS_
	GOTO	_00172_DS_
	GOTO	_00178_DS_
	GOTO	_00179_DS_
_00166_DS_:
	.line	220; eg.c	
	BRA	_00182_DS_
_00167_DS_:
	BANKSEL	(_all_param + 3)
	.line	223; eg.c	all_param.attack[2] = lfo0_value;}
	BTFSS	(_all_param + 3), 2, B
	BRA	_00169_DS_
	BANKSEL	_lfo0_value
	.line	224; eg.c	if( (eg2_value2 += eg_add_table[all_param.attack[2]]) & 0x8000 ) {
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 18)
	MOVWF	(_all_param + 18), B
_00169_DS_:
	.line	225; eg.c	eg2_value2 = 0x7fff;
	MOVFF	(_all_param + 18), (iTemp258 + 2)
; ;multiply lit val:0x02 by variable (iTemp258 + 2) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp258 + 2)
	RLCF	(iTemp258 + 2), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
	BTFSS	r0x03, 7
	BRA	_00182_DS_
	BANKSEL	_eg2_int
	.line	227; eg.c	}
	MOVF	_eg2_int, W, B
	ANDLW	0xf0
	IORLW	0x02
; removed redundant BANKSEL
	MOVWF	_eg2_int, B
	.line	229; eg.c	
	BRA	_00182_DS_
_00172_DS_:
	BANKSEL	(_all_param + 4)
	.line	232; eg.c	all_param.decay[2] = lfo0_value;}
	BTFSS	(_all_param + 4), 2, B
	BRA	_00174_DS_
	BANKSEL	_lfo0_value
	.line	233; eg.c	lvl2 = (all_param.sustain[2] << 7);
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 22)
	MOVWF	(_all_param + 22), B
_00174_DS_:
	.line	234; eg.c	
	MOVFF	(_all_param + 26), (iTemp278 + 2)
	MOVFF	(iTemp278 + 2), r0x02
	CLRF	r0x03
	RRCF	r0x03, W
	RRCF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	RRCF	r0x04, F
	.line	236; eg.c	eg2_value2 = lvl2;
	MOVFF	(_all_param + 22), (iTemp286 + 2)
; ;multiply lit val:0x02 by variable (iTemp286 + 2) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp286 + 2)
	RLCF	(iTemp286 + 2), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x06
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x06, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x03, W
	SUBWFB	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BNZ	_00281_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00281_DS_:
	BC	_00182_DS_
	BTFSC	r0x01, 7
	.line	240; eg.c	
	BRA	_00182_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00178_DS_:
	.line	243; eg.c	break;
	MOVFF	(_all_param + 26), WREG
	.line	244; eg.c	
	BRA	_00182_DS_
_00179_DS_:
	.line	247; eg.c	eg2_value2 = 0;
	MOVFF	(_all_param + 30), (iTemp304 + 2)
; ;multiply lit val:0x02 by variable (iTemp304 + 2) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp304 + 2)
	RLCF	(iTemp304 + 2), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	BTFSS	r0x01, 7
	BRA	_00182_DS_
	BANKSEL	_eg2_int
	.line	249; eg.c	}
	MOVF	_eg2_int, W, B
	ANDLW	0xf0
; removed redundant BANKSEL
	MOVWF	_eg2_int, B
_00182_DS_:
	BANKSEL	(_all_param + 5)
	.line	259; eg.c	
	BTFSC	(_all_param + 5), 1, B
	BRA	_00209_DS_
	.line	261; eg.c	eg3_int.LAST_GATE = 1;
	CLRF	r0x00
	BANKSEL	_eg3
	BTFSC	_eg3, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00187_DS_
_00286_DS_:
	BANKSEL	_eg3_int
	BTFSC	_eg3_int, 4, B
	BRA	_00187_DS_
; removed redundant BANKSEL
	.line	262; eg.c	eg3_int.STATE = ATTACK3;
	BSF	_eg3_int, 4, B
	.line	263; eg.c	} else if( (eg3.GATE == 0) && (eg3_int.LAST_GATE == 1) ) { // falling edge
	MOVF	_eg3_int, W, B
	ANDLW	0xf0
	IORLW	0x01
; removed redundant BANKSEL
	MOVWF	_eg3_int, B
	BRA	_00188_DS_
_00187_DS_:
	BANKSEL	_eg3
	.line	264; eg.c	eg3_int.LAST_GATE = 0;
	BTFSC	_eg3, 0, B
	BRA	_00188_DS_
	CLRF	r0x00
	BANKSEL	_eg3_int
	BTFSC	_eg3_int, 4, B
	INCF	r0x00, F
	MOVF	r0x00, W
	XORLW	0x01
	BNZ	_00188_DS_
_00288_DS_:
	BANKSEL	_eg3_int
	.line	265; eg.c	eg3_int.STATE = RELEASE3;
	BCF	_eg3_int, 4, B
	.line	266; eg.c	}
	MOVF	_eg3_int, W, B
	ANDLW	0xf0
	IORLW	0x04
; removed redundant BANKSEL
	MOVWF	_eg3_int, B
_00188_DS_:
	.line	268; eg.c	
	CLRF	r0x00
	BANKSEL	_eg3
	BTFSC	_eg3, 0, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	SWAPF	WREG, W
	MOVWF	PRODH
	BANKSEL	_eg3_int
	MOVF	_eg3_int, W, B
	ANDLW	0xef
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg3_int, B
	.line	270; eg.c	
	BCF	STATUS, 0
	BANKSEL	(_eg3_value + 1)
	RRCF	(_eg3_value + 1), W, B
	MOVWF	r0x01
; removed redundant BANKSEL
	RRCF	_eg3_value, W, B
	MOVWF	r0x00
	BANKSEL	_eg3_int
	.line	272; eg.c	case IDLE3:
	MOVF	_eg3_int, W, B
	ANDLW	0x0f
	MOVWF	r0x02
	MOVFF	r0x02, r0x03
	MOVF	r0x03, W
	ADDLW	0x80
	ADDLW	0x7b
	BTFSC	STATUS, 0
	BRA	_00209_DS_
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	CLRF	r0x08
	RLCF	r0x02, W
	RLCF	r0x08, F
	RLCF	WREG, W
	RLCF	r0x08, F
	ANDLW	0xfc
	MOVWF	r0x07
	MOVLW	UPPER(_00290_DS_)
	MOVWF	PCLATU
	MOVLW	HIGH(_00290_DS_)
	MOVWF	PCLATH
	MOVLW	LOW(_00290_DS_)
	ADDWF	r0x07, F
	MOVF	r0x08, W
	ADDWFC	PCLATH, F
	BTFSC	STATUS, 0
	INCF	PCLATU, F
	MOVF	r0x07, W
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVWF	PCL
_00290_DS_:
	GOTO	_00190_DS_
	GOTO	_00191_DS_
	GOTO	_00196_DS_
	GOTO	_00202_DS_
	GOTO	_00203_DS_
_00190_DS_:
	.line	275; eg.c	
	BRA	_00209_DS_
_00191_DS_:
	BANKSEL	(_all_param + 3)
	.line	278; eg.c	all_param.attack[3] = lfo0_value;}
	BTFSS	(_all_param + 3), 3, B
	BRA	_00193_DS_
	BANKSEL	_lfo0_value
	.line	279; eg.c	
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 19)
	MOVWF	(_all_param + 19), B
_00193_DS_:
	.line	281; eg.c	eg3_value3 = 0x7fff;
	MOVFF	(_all_param + 19), (iTemp366 + 3)
; ;multiply lit val:0x02 by variable (iTemp366 + 3) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp366 + 3)
	RLCF	(iTemp366 + 3), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x00, W
	ADDWF	r0x02, F
	MOVF	r0x01, W
	ADDWFC	r0x03, F
	BTFSS	r0x03, 7
	BRA	_00209_DS_
	BANKSEL	_eg3_int
	.line	283; eg.c	}
	MOVF	_eg3_int, W, B
	ANDLW	0xf0
	IORLW	0x02
; removed redundant BANKSEL
	MOVWF	_eg3_int, B
	.line	285; eg.c	
	BRA	_00209_DS_
_00196_DS_:
	BANKSEL	(_all_param + 4)
	.line	288; eg.c	all_param.decay[3] = lfo0_value;}
	BTFSS	(_all_param + 4), 3, B
	BRA	_00198_DS_
	BANKSEL	_lfo0_value
	.line	289; eg.c	lvl3 = (all_param.sustain[3] << 7);
	MOVF	_lfo0_value, W, B
	MOVWF	r0x02
	MOVF	r0x02, W
	BANKSEL	(_all_param + 23)
	MOVWF	(_all_param + 23), B
_00198_DS_:
	.line	290; eg.c	
	MOVFF	(_all_param + 27), (iTemp386 + 3)
	MOVFF	(iTemp386 + 3), r0x02
	CLRF	r0x03
	RRCF	r0x03, W
	RRCF	r0x02, W
	MOVWF	r0x05
	CLRF	r0x04
	RRCF	r0x04, F
	.line	292; eg.c	eg3_value3 = lvl3;
	MOVFF	(_all_param + 23), (iTemp394 + 3)
; ;multiply lit val:0x02 by variable (iTemp394 + 3) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp394 + 3)
	RLCF	(iTemp394 + 3), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x06
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x06, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x06, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, W
	MOVWF	r0x02
	MOVF	r0x03, W
	SUBWFB	r0x01, W
	MOVWF	r0x03
	MOVFF	r0x02, r0x00
	MOVFF	r0x03, r0x01
	MOVF	r0x03, W
	SUBWF	r0x05, W
	BNZ	_00292_DS_
	MOVF	r0x02, W
	SUBWF	r0x04, W
_00292_DS_:
	BC	_00209_DS_
	BTFSC	r0x01, 7
	.line	296; eg.c	
	BRA	_00209_DS_
; ;;!!! pic16_aopOp:1070 called for a spillLocation -- assigning WREG instead --- CHECK
_00202_DS_:
	.line	299; eg.c	break;
	MOVFF	(_all_param + 27), WREG
	.line	300; eg.c	
	BRA	_00209_DS_
_00203_DS_:
	.line	303; eg.c	eg3_value3 = 0;
	MOVFF	(_all_param + 31), (iTemp412 + 3)
; ;multiply lit val:0x02 by variable (iTemp412 + 3) and store in r0x02
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
	CLRF	r0x03
	BCF	STATUS, 0
	BANKSEL	(iTemp412 + 3)
	RLCF	(iTemp412 + 3), W, B
	MOVWF	r0x02
	RLCF	r0x03, F
	CLRF	r0x04
	MOVLW	LOW(_eg_add_table)
	ADDWF	r0x02, F
	MOVLW	HIGH(_eg_add_table)
	ADDWFC	r0x03, F
	MOVLW	UPPER(_eg_add_table)
	ADDWFC	r0x04, F
	MOVFF	r0x02, TBLPTRL
	MOVFF	r0x03, TBLPTRH
	MOVFF	r0x04, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x02
	TBLRD*+	
	MOVFF	TABLAT, r0x03
	MOVF	r0x02, W
	SUBWF	r0x00, F
	MOVF	r0x03, W
	SUBWFB	r0x01, F
	BTFSS	r0x01, 7
	BRA	_00209_DS_
	BANKSEL	_eg3_int
	.line	305; eg.c	}
	MOVF	_eg3_int, W, B
	ANDLW	0xf0
; removed redundant BANKSEL
	MOVWF	_eg3_int, B
_00209_DS_:
	.line	310; eg.c	}
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_eg__EG_Init	code
_EG_Init:
	.line	75; eg.c	
	RETURN	

; ; Starting pCode block for Ival
	code
_eg_add_table:
	DB	0x00, 0x00, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80, 0x00, 0x80
	DB	0x00, 0x80, 0x00, 0x80, 0xef, 0x63, 0xf2, 0x4e, 0xef, 0x3f, 0xd4, 0x34
	DB	0x61, 0x2c, 0xce, 0x25, 0x96, 0x20, 0x61, 0x1c, 0xef, 0x18, 0x14, 0x16
	DB	0xb0, 0x13, 0xaa, 0x11, 0xef, 0x0f, 0x72, 0x0e, 0x28, 0x0d, 0x08, 0x0c
	DB	0x0c, 0x0b, 0x2d, 0x0a, 0x67, 0x09, 0xb7, 0x08, 0x19, 0x08, 0x8b, 0x07
	DB	0x0c, 0x07, 0x98, 0x06, 0x2f, 0x06, 0xd0, 0x05, 0x78, 0x05, 0x29, 0x05
	DB	0xdf, 0x04, 0x9c, 0x04, 0x5e, 0x04, 0x24, 0x04, 0xef, 0x03, 0xbe, 0x03
	DB	0x90, 0x03, 0x65, 0x03, 0x3e, 0x03, 0x18, 0x03, 0xf6, 0x02, 0xd5, 0x02
	DB	0xb6, 0x02, 0x9a, 0x02, 0x7f, 0x02, 0x65, 0x02, 0x4d, 0x02, 0x37, 0x02
	DB	0x21, 0x02, 0x0d, 0x02, 0xfa, 0x01, 0xe8, 0x01, 0xd6, 0x01, 0xc6, 0x01
	DB	0xb6, 0x01, 0xa8, 0x01, 0x9a, 0x01, 0x8c, 0x01, 0x7f, 0x01, 0x73, 0x01
	DB	0x67, 0x01, 0x5c, 0x01, 0x52, 0x01, 0x48, 0x01, 0x3e, 0x01, 0x34, 0x01
	DB	0x2b, 0x01, 0x23, 0x01, 0x1b, 0x01, 0x13, 0x01, 0x0b, 0x01, 0x04, 0x01
	DB	0xfd, 0x00, 0xf6, 0x00, 0xef, 0x00, 0xe9, 0x00, 0xe3, 0x00, 0xdd, 0x00
	DB	0xd8, 0x00, 0xd2, 0x00, 0xcd, 0x00, 0xc8, 0x00, 0xc3, 0x00, 0xbe, 0x00
	DB	0xba, 0x00, 0xb5, 0x00, 0xb1, 0x00, 0xad, 0x00, 0xa9, 0x00, 0xa5, 0x00
	DB	0xa1, 0x00, 0x9e, 0x00, 0x9a, 0x00, 0x97, 0x00, 0x94, 0x00, 0x90, 0x00
	DB	0x8d, 0x00, 0x8a, 0x00, 0x87, 0x00, 0x84, 0x00, 0x82, 0x00, 0x7f, 0x00
	DB	0x7c, 0x00, 0x7a, 0x00, 0x77, 0x00, 0x75, 0x00, 0x72, 0x00, 0x70, 0x00
	DB	0x6e, 0x00, 0x6c, 0x00, 0x6a, 0x00, 0x68, 0x00, 0x66, 0x00, 0x64, 0x00
	DB	0x62, 0x00, 0x60, 0x00, 0x5e, 0x00, 0x5c, 0x00, 0x5b, 0x00, 0x59, 0x00
	DB	0x57, 0x00, 0x56, 0x00, 0x54, 0x00, 0x52, 0x00, 0x51, 0x00, 0x50, 0x00
	DB	0x4e, 0x00, 0x4d, 0x00, 0x4b, 0x00, 0x4a, 0x00, 0x49, 0x00, 0x47, 0x00
	DB	0x46, 0x00, 0x45, 0x00, 0x44, 0x00, 0x43, 0x00, 0x41, 0x00, 0x40, 0x00
	DB	0x3f, 0x00, 0x3e, 0x00, 0x3d, 0x00, 0x3c, 0x00, 0x3b, 0x00, 0x3a, 0x00
	DB	0x39, 0x00, 0x38, 0x00, 0x37, 0x00, 0x36, 0x00, 0x35, 0x00, 0x35, 0x00
	DB	0x34, 0x00, 0x33, 0x00, 0x32, 0x00, 0x31, 0x00, 0x31, 0x00, 0x30, 0x00
	DB	0x2f, 0x00, 0x2e, 0x00, 0x2d, 0x00, 0x2d, 0x00, 0x2c, 0x00, 0x2b, 0x00
	DB	0x2b, 0x00, 0x2a, 0x00, 0x29, 0x00, 0x29, 0x00, 0x28, 0x00, 0x27, 0x00
	DB	0x27, 0x00, 0x26, 0x00, 0x26, 0x00, 0x25, 0x00, 0x25, 0x00, 0x24, 0x00
	DB	0x23, 0x00, 0x23, 0x00, 0x22, 0x00, 0x22, 0x00, 0x21, 0x00, 0x21, 0x00
	DB	0x20, 0x00, 0x20, 0x00, 0x1f, 0x00, 0x1f, 0x00, 0x1e, 0x00, 0x1e, 0x00
	DB	0x1e, 0x00, 0x1d, 0x00, 0x1d, 0x00, 0x1c, 0x00, 0x1c, 0x00, 0x1b, 0x00
	DB	0x1b, 0x00, 0x1b, 0x00, 0x1a, 0x00, 0x1a, 0x00, 0x19, 0x00, 0x19, 0x00
	DB	0x19, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x17, 0x00, 0x17, 0x00
	DB	0x17, 0x00, 0x16, 0x00, 0x16, 0x00, 0x16, 0x00, 0x15, 0x00, 0x15, 0x00
	DB	0x15, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x14, 0x00, 0x13, 0x00
	DB	0x13, 0x00, 0x13, 0x00, 0x12, 0x00, 0x12, 0x00, 0x12, 0x00, 0x12, 0x00
	DB	0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x11, 0x00, 0x10, 0x00, 0x10, 0x00
	DB	0x10, 0x00, 0x10, 0x00, 0x10, 0x00, 0x0f, 0x00, 0x0f, 0x00, 0x0f, 0x00
	DB	0x0f, 0x00, 0x0e, 0x00, 0x0e, 0x00, 0x0e, 0x00, 0x0e, 0x00, 0x0e, 0x00
	DB	0x0d, 0x00, 0x0d, 0x00, 0x0d, 0x00, 0x0d, 0x00, 0x0d, 0x00, 0x0c, 0x00
	DB	0x0c, 0x00, 0x0c, 0x00, 0x0c, 0x00, 0x0c, 0x00


; Statistics:
; code size:	 2230 (0x08b6) bytes ( 1.70%)
;           	 1115 (0x045b) words
; udata size:	   28 (0x001c) bytes ( 0.73%)
; access size:	    9 (0x0009) bytes


	end
