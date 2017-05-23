;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:06 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"map.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _MAP_Init
	global _MAP_Tick
	global _all_param
	global _sinewave
	global _squarewave

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
	extern _AOUT_Pin16bitSet
	extern _AOUT_DigitalPinsSet
	extern _AOUT_Update
	extern _mios_enc_pin_table
	extern _mios_mproc_event_table
	extern _MIOS_MPROC_EVENT_TABLE
	extern _MIOS_ENC_PIN_TABLE
	extern _lfo_add_table
	extern _lfo_add_table_bpm
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
WREG	equ	0xfe8
TBLPTRL	equ	0xff6
TBLPTRH	equ	0xff7
TBLPTRU	equ	0xff8
TABLAT	equ	0xff5
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1


gpr14	udata
_all_param	res	64

udata_map_0	udata
_MAP_Tick_gates_1_1	res	1

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_map__MAP_Tick	code
_MAP_Tick:
	.line	132; map.c	void MAP_Tick(void) __wparam
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	.line	141; map.c	gates.ALL = 0;
	MOVLW	0x00
	BANKSEL	_MAP_Tick_gates_1_1
	MOVWF	_MAP_Tick_gates_1_1, B
	BANKSEL	_all_param
	.line	147; map.c	switch( all_param.router_flags_lfo1.lfo1_waveform )
	MOVF	_all_param, W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00109_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BZ	_00110_DS_
	MOVF	r0x00, W
	XORLW	0x04
	BZ	_00111_DS_
	BRA	_00112_DS_
_00109_DS_:
	BANKSEL	(_lfo0_value + 1)
	.line	151; map.c	AOUT_Pin16bitSet(0, lfo0_value);
	MOVF	(_lfo0_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_lfo0_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	152; map.c	break;
	BRA	_00112_DS_
_00110_DS_:
	BANKSEL	(_lfo0_value + 1)
	.line	155; map.c	AOUT_Pin16bitSet(0, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo0_value)]));
	MOVF	(_lfo0_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_sinewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_sinewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_sinewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	157; map.c	break;
	BRA	_00112_DS_
_00111_DS_:
	BANKSEL	(_lfo0_value + 1)
	.line	160; map.c	AOUT_Pin16bitSet(0, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo0_value)]));
	MOVF	(_lfo0_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_squarewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_squarewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_squarewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
_00112_DS_:
	BANKSEL	_all_param
	.line	165; map.c	if( all_param.router_flags_lfo1.lfo1_from_lfo2 ) {
	BTFSS	_all_param, 4, B
	BRA	_00114_DS_
	BANKSEL	(_lfo1_value + 1)
	.line	166; map.c	all_param.lfo0_rate = CONV_16BIT_TO_8BIT(lfo1_value);}
	MOVF	(_lfo1_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	BANKSEL	(_all_param + 32)
	MOVWF	(_all_param + 32), B
_00114_DS_:
	BANKSEL	(_all_param + 1)
	.line	172; map.c	switch( all_param.router_flags_lfo2.lfo2_waveform )
	MOVF	(_all_param + 1), W, B
	ANDLW	0x0f
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00115_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BZ	_00116_DS_
	MOVF	r0x00, W
	XORLW	0x04
	BZ	_00117_DS_
	BRA	_00118_DS_
_00115_DS_:
	BANKSEL	(_lfo1_value + 1)
	.line	175; map.c	AOUT_Pin16bitSet(1, lfo1_value);
	MOVF	(_lfo1_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_lfo1_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	176; map.c	break;
	BRA	_00118_DS_
_00116_DS_:
	BANKSEL	(_lfo1_value + 1)
	.line	179; map.c	AOUT_Pin16bitSet(1, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo1_value)]));
	MOVF	(_lfo1_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_sinewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_sinewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_sinewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	180; map.c	break;
	BRA	_00118_DS_
_00117_DS_:
	BANKSEL	(_lfo1_value + 1)
	.line	183; map.c	AOUT_Pin16bitSet(1, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo1_value)]));
	MOVF	(_lfo1_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_squarewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_squarewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_squarewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
_00118_DS_:
	BANKSEL	(_all_param + 1)
	.line	188; map.c	if( all_param.router_flags_lfo2.lfo2_from_lfo3 ) {
	BTFSS	(_all_param + 1), 4, B
	BRA	_00120_DS_
	BANKSEL	(_lfo2_value + 1)
	.line	189; map.c	all_param.lfo1_rate = CONV_16BIT_TO_8BIT(lfo2_value);}
	MOVF	(_lfo2_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	BANKSEL	(_all_param + 33)
	MOVWF	(_all_param + 33), B
_00120_DS_:
	BANKSEL	(_all_param + 2)
	.line	195; map.c	switch( all_param.router_flags_lfo3.lfo3_waveform )
	MOVF	(_all_param + 2), W, B
	ANDLW	0x07
	MOVWF	r0x00
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x01
	BZ	_00121_DS_
	MOVFF	r0x00, r0x01
	MOVF	r0x01, W
	XORLW	0x02
	BZ	_00122_DS_
	MOVF	r0x00, W
	XORLW	0x04
	BZ	_00123_DS_
	BRA	_00124_DS_
_00121_DS_:
	BANKSEL	(_lfo2_value + 1)
	.line	198; map.c	AOUT_Pin16bitSet(2, lfo2_value);
	MOVF	(_lfo2_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_lfo2_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	199; map.c	break;
	BRA	_00124_DS_
_00122_DS_:
	BANKSEL	(_lfo2_value + 1)
	.line	202; map.c	AOUT_Pin16bitSet(2, CONV_8BIT_TO_16BIT(sinewave[CONV_16BIT_TO_8BIT(lfo2_value)]));
	MOVF	(_lfo2_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_sinewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_sinewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_sinewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	.line	203; map.c	break;
	BRA	_00124_DS_
_00123_DS_:
	BANKSEL	(_lfo2_value + 1)
	.line	206; map.c	AOUT_Pin16bitSet(2, CONV_8BIT_TO_16BIT(squarewave[CONV_16BIT_TO_8BIT(lfo2_value)]));
	MOVF	(_lfo2_value + 1), W, B
	MOVWF	r0x00
	CLRF	r0x01
	CLRF	r0x02
	MOVLW	LOW(_squarewave)
	ADDWF	r0x00, F
	MOVLW	HIGH(_squarewave)
	ADDWFC	r0x01, F
	MOVLW	UPPER(_squarewave)
	ADDWFC	r0x02, F
	MOVFF	r0x00, TBLPTRL
	MOVFF	r0x01, TBLPTRH
	MOVFF	r0x02, TBLPTRU
	TBLRD*+	
	MOVFF	TABLAT, r0x00
	CLRF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x02
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
_00124_DS_:
	BANKSEL	(_eg0_value + 1)
	.line	213; map.c	AOUT_Pin16bitSet(3, eg0_value);
	MOVF	(_eg0_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg0_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x03
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	214; map.c	if (!all_param.router_flags_eg_audio_trig.eg1_audio_trig) {
	BTFSC	(_all_param + 7), 0, B
	BRA	_00126_DS_
	.line	215; map.c	value_8bit = all_param.eg_channel[0];
	MOVFF	(_all_param + 12), r0x00
	.line	216; map.c	eg0.GATE = midi_note[value_8bit].GATE;  }// EG triggered with MIDI note at Channel #eg_channel[0];
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x02, F
	CLRF	WREG
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x01
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg0
	MOVF	_eg0, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg0, B
	BRA	_00127_DS_
_00126_DS_:
	.line	218; map.c	eg0.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }
	CLRF	r0x01
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 4, B
	INCF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg0
	MOVF	_eg0, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg0, B
_00127_DS_:
	BANKSEL	(_all_param + 5)
	.line	221; map.c	if (all_param.router_flags_eg_link.eg1_link_eg2) {
	BTFSS	(_all_param + 5), 0, B
	BRA	_00136_DS_
	BANKSEL	(_eg0_value + 1)
	.line	222; map.c	AOUT_Pin16bitSet(4, eg0_value);
	MOVF	(_eg0_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg0_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	223; map.c	if (!all_param.router_flags_eg_audio_trig.eg1_audio_trig || !all_param.router_flags_eg_audio_trig.eg2_audio_trig) {
	BTFSS	(_all_param + 7), 0, B
	BRA	_00128_DS_
; removed redundant BANKSEL
	BTFSC	(_all_param + 7), 1, B
	BRA	_00129_DS_
_00128_DS_:
	.line	224; map.c	value_8bit = all_param.eg_channel[0];
	MOVFF	(_all_param + 12), r0x00
	.line	225; map.c	eg1.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[0];
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x02, F
	CLRF	WREG
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x01
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg1
	MOVF	_eg1, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg1, B
	BRA	_00137_DS_
_00129_DS_:
	.line	227; map.c	eg1.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }}
	CLRF	r0x01
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 4, B
	INCF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg1
	MOVF	_eg1, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg1, B
	BRA	_00137_DS_
_00136_DS_:
	BANKSEL	(_eg1_value + 1)
	.line	229; map.c	AOUT_Pin16bitSet(4, eg1_value);
	MOVF	(_eg1_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg1_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	230; map.c	if (!all_param.router_flags_eg_audio_trig.eg2_audio_trig) { 
	BTFSC	(_all_param + 7), 1, B
	BRA	_00133_DS_
	.line	231; map.c	value_8bit = all_param.eg_channel[1];
	MOVFF	(_all_param + 13), r0x00
	.line	232; map.c	eg1.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[1];
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x02, F
	CLRF	WREG
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x01
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg1
	MOVF	_eg1, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg1, B
	BRA	_00137_DS_
_00133_DS_:
	.line	234; map.c	eg1.GATE = all_param.router_flags_eg_audio_trig.eg1_audio_trig_on; }}
	CLRF	r0x01
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 4, B
	INCF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg1
	MOVF	_eg1, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg1, B
_00137_DS_:
	BANKSEL	(_eg2_value + 1)
	.line	237; map.c	AOUT_Pin16bitSet(5, eg2_value);
	MOVF	(_eg2_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg2_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	238; map.c	if (!all_param.router_flags_eg_audio_trig.eg3_audio_trig) {
	BTFSC	(_all_param + 7), 2, B
	BRA	_00139_DS_
	.line	239; map.c	value_8bit = all_param.eg_channel[2];
	MOVFF	(_all_param + 14), r0x00
	.line	240; map.c	eg2.GATE = midi_note[value_8bit].GATE; }// EG triggered with MIDI note at Channel #eg_channel[2];
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x02, F
	CLRF	WREG
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x01
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg2
	MOVF	_eg2, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg2, B
	BRA	_00140_DS_
_00139_DS_:
	.line	242; map.c	eg2.GATE = all_param.router_flags_eg_audio_trig.eg3_audio_trig_on; }
	CLRF	r0x01
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 6, B
	INCF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg2
	MOVF	_eg2, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg2, B
_00140_DS_:
	BANKSEL	(_all_param + 5)
	.line	246; map.c	if (all_param.router_flags_eg_link.eg3_link_eg4) {
	BTFSS	(_all_param + 5), 1, B
	BRA	_00149_DS_
	BANKSEL	(_eg2_value + 1)
	.line	247; map.c	AOUT_Pin16bitSet(6, eg2_value);
	MOVF	(_eg2_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg2_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	248; map.c	if (!all_param.router_flags_eg_audio_trig.eg3_audio_trig || !all_param.router_flags_eg_audio_trig.eg4_audio_trig) {
	BTFSS	(_all_param + 7), 2, B
	BRA	_00141_DS_
; removed redundant BANKSEL
	BTFSC	(_all_param + 7), 3, B
	BRA	_00142_DS_
_00141_DS_:
	.line	249; map.c	value_8bit = all_param.eg_channel[2];
	MOVFF	(_all_param + 14), r0x00
	.line	250; map.c	eg3.GATE = midi_note[value_8bit].GATE; }  // EG triggered with MIDI note at Channel #eg_channel[2];
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x02, F
	CLRF	WREG
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x01
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg3
	MOVF	_eg3, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg3, B
	BRA	_00150_DS_
_00142_DS_:
	.line	252; map.c	eg3.GATE = all_param.router_flags_eg_audio_trig.eg3_audio_trig_on; }}
	CLRF	r0x01
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 6, B
	INCF	r0x01, F
	MOVF	r0x01, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg3
	MOVF	_eg3, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg3, B
	BRA	_00150_DS_
_00149_DS_:
	BANKSEL	(_eg3_value + 1)
	.line	254; map.c	AOUT_Pin16bitSet(6, eg3_value);
	MOVF	(_eg3_value + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_eg3_value, W, B
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_AOUT_Pin16bitSet
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	(_all_param + 7)
	.line	255; map.c	if (!all_param.router_flags_eg_audio_trig.eg4_audio_trig ) {
	BTFSC	(_all_param + 7), 3, B
	BRA	_00146_DS_
	.line	256; map.c	value_8bit = all_param.eg_channel[3];
	MOVFF	(_all_param + 15), r0x00
	.line	257; map.c	eg3.GATE = midi_note[value_8bit].GATE; } // EG triggered with MIDI note at Channel #eg_channel[3];
	CLRF	r0x01
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, F
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x01, F
	CLRF	WREG
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, FSR0H
	BTFSC	INDF0, 7
	INCF	WREG, F
	MOVWF	r0x00
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg3
	MOVF	_eg3, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg3, B
	BRA	_00150_DS_
_00146_DS_:
	.line	259; map.c	eg2.GATE = all_param.router_flags_eg_audio_trig.eg4_audio_trig_on; }  }
	CLRF	r0x00
	BANKSEL	(_all_param + 7)
	BTFSC	(_all_param + 7), 7, B
	INCF	r0x00, F
	MOVF	r0x00, W
	ANDLW	0x01
	MOVWF	PRODH
	BANKSEL	_eg2
	MOVF	_eg2, W, B
	ANDLW	0xfe
	IORWF	PRODH, W
; removed redundant BANKSEL
	MOVWF	_eg2, B
_00150_DS_:
	.line	263; map.c	AOUT_Update();
	CALL	_AOUT_Update
	BANKSEL	_MAP_Tick_gates_1_1
	.line	265; map.c	AOUT_DigitalPinsSet(gates.ALL);
	MOVF	_MAP_Tick_gates_1_1, W, B
	ANDLW	0xff
	MOVWF	r0x00
	MOVF	r0x00, W
	CALL	_AOUT_DigitalPinsSet
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_map__MAP_Init	code
_MAP_Init:
	.line	125; map.c	}
	RETURN	

; ; Starting pCode block for Ival
	code
_sinewave:
	DB	0x80, 0x83, 0x86, 0x89, 0x8c, 0x8f, 0x92, 0x95, 0x98, 0x9c, 0x9f, 0xa2
	DB	0xa5, 0xa8, 0xab, 0xae, 0xb0, 0xb3, 0xb6, 0xb9, 0xbc, 0xbf, 0xc1, 0xc4
	DB	0xc7, 0xc9, 0xcc, 0xce, 0xd1, 0xd3, 0xd5, 0xd8, 0xda, 0xdc, 0xde, 0xe0
	DB	0xe2, 0xe4, 0xe6, 0xe8, 0xea, 0xec, 0xed, 0xef, 0xf0, 0xf2, 0xf3, 0xf5
	DB	0xf6, 0xf7, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfc, 0xfd, 0xfe, 0xfe, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xfe, 0xfe
	DB	0xfd, 0xfc, 0xfc, 0xfb, 0xfa, 0xf9, 0xf8, 0xf7, 0xf6, 0xf5, 0xf3, 0xf2
	DB	0xf0, 0xef, 0xed, 0xec, 0xea, 0xe8, 0xe6, 0xe4, 0xe2, 0xe0, 0xde, 0xdc
	DB	0xda, 0xd8, 0xd5, 0xd3, 0xd1, 0xce, 0xcc, 0xc9, 0xc7, 0xc4, 0xc1, 0xbf
	DB	0xbc, 0xb9, 0xb6, 0xb3, 0xb0, 0xae, 0xab, 0xa8, 0xa5, 0xa2, 0x9f, 0x9c
	DB	0x98, 0x95, 0x92, 0x8f, 0x8c, 0x89, 0x86, 0x83, 0x80, 0x7d, 0x7a, 0x77
	DB	0x74, 0x71, 0x6e, 0x6b, 0x68, 0x64, 0x61, 0x5e, 0x5b, 0x58, 0x55, 0x52
	DB	0x50, 0x4d, 0x4a, 0x47, 0x44, 0x41, 0x3f, 0x3c, 0x39, 0x37, 0x34, 0x32
	DB	0x2f, 0x2d, 0x2b, 0x28, 0x26, 0x24, 0x22, 0x20, 0x1e, 0x1c, 0x1a, 0x18
	DB	0x16, 0x14, 0x13, 0x11, 0x10, 0x0e, 0x0d, 0x0b, 0x0a, 0x09, 0x08, 0x07
	DB	0x06, 0x05, 0x04, 0x04, 0x03, 0x02, 0x02, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02, 0x02, 0x03, 0x04, 0x04, 0x05
	DB	0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x10, 0x11, 0x13, 0x14
	DB	0x16, 0x18, 0x1a, 0x1c, 0x1e, 0x20, 0x22, 0x24, 0x26, 0x28, 0x2b, 0x2d
	DB	0x2f, 0x32, 0x34, 0x37, 0x39, 0x3c, 0x3f, 0x41, 0x44, 0x47, 0x4a, 0x4d
	DB	0x50, 0x52, 0x55, 0x58, 0x5b, 0x5e, 0x61, 0x64, 0x68, 0x6b, 0x6e, 0x71
	DB	0x74, 0x77, 0x7a, 0x7d
; ; Starting pCode block for Ival
_squarewave:
	DB	0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff
	DB	0xff, 0xff, 0xff, 0xfe, 0xfd, 0xfc, 0xfb, 0xfa, 0x06, 0x05, 0x04, 0x03
	DB	0x02, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01
	DB	0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x02
	DB	0x03, 0x04, 0x05, 0x06


; Statistics:
; code size:	 1388 (0x056c) bytes ( 1.06%)
;           	  694 (0x02b6) words
; udata size:	   65 (0x0041) bytes ( 1.69%)
; access size:	    4 (0x0004) bytes


	end
