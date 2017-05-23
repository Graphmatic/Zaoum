;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:08 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"bankstick.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _update_preset_led
	global _update_led
	global _load_last
	global _BANKSTICK_Init
	global _BANKSTICK_LOAD_Evnt
	global _BANKSTICK_SAVE_Evnt
	global _BANKSTICK_Dout_Update
	global _BANKSTICK_Dout_Update_2
	global _BANKSTICK_Dout_Update_3
	global _BANKSTICK_preset_LEDs_Update
	global _buffer_bs
	global _adress

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
	extern _all_param
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
	extern _MIOS_DOUT_PinSet
	extern _MIOS_DOUT_SRGet
	extern _MIOS_DOUT_SRSet
	extern _MIOS_BANKSTICK_Read
	extern _MIOS_BANKSTICK_Write
	extern _MIOS_BANKSTICK_WritePage
	extern _MIOS_BANKSTICK_ReadPage
	extern _mios_enc_pin_table
	extern _mios_mproc_event_table
	extern _MIOS_MPROC_EVENT_TABLE
	extern _MIOS_ENC_PIN_TABLE
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR2L	equ	0xfd9
INDF0	equ	0xfef
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb


	idata
_buffer_bs	db	0x00, 0x0e, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1


gpr14	udata

udata_bankstick_0	udata
_load_last	res	1

udata_bankstick_1	udata
_update_led	res	1

udata_bankstick_2	udata
_update_preset_led	res	1

udata_bankstick_3	udata
_adress	res	2

udata_bankstick_4	udata
_BANKSTICK_LOAD_Evnt_bank_1_1	res	2

udata_bankstick_5	udata
_BANKSTICK_LOAD_Evnt_preset_1_1	res	2

udata_bankstick_6	udata
_BANKSTICK_SAVE_Evnt_bank_1_1	res	2

udata_bankstick_7	udata
_BANKSTICK_SAVE_Evnt_preset_1_1	res	2

udata_bankstick_8	udata
_BANKSTICK_preset_LEDs_Update_bank_1_1	res	2

udata_bankstick_9	udata
_BANKSTICK_preset_LEDs_Update_preset_1_1	res	2

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_bankstick__BANKSTICK_preset_LEDs_Update	code
_BANKSTICK_preset_LEDs_Update:
	.line	311; bankstick.c	void BANKSTICK_preset_LEDs_Update( volatile unsigned int bank, volatile unsigned int preset ) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_BANKSTICK_preset_LEDs_Update_bank_1_1
	MOVWF	_BANKSTICK_preset_LEDs_Update_bank_1_1, B
	MOVLW	0x02
	MOVFF	PLUSW2, (_BANKSTICK_preset_LEDs_Update_bank_1_1 + 1)
	MOVLW	0x03
	MOVFF	PLUSW2, _BANKSTICK_preset_LEDs_Update_preset_1_1
	MOVLW	0x04
	MOVFF	PLUSW2, (_BANKSTICK_preset_LEDs_Update_preset_1_1 + 1)
	.line	315; bankstick.c	switch( bank ) {
	MOVFF	_BANKSTICK_preset_LEDs_Update_bank_1_1, r0x00
	MOVFF	(_BANKSTICK_preset_LEDs_Update_bank_1_1 + 1), r0x01
	MOVF	r0x00, W
	BNZ	_00235_DS_
	MOVF	r0x01, W
	XORLW	0x10
	BZ	_00214_DS_
_00235_DS_:
	MOVF	r0x00, W
	BNZ	_00237_DS_
	MOVF	r0x01, W
	XORLW	0x20
	BZ	_00215_DS_
_00237_DS_:
	MOVF	r0x00, W
	BNZ	_00239_DS_
	MOVF	r0x01, W
	XORLW	0x30
	BZ	_00216_DS_
_00239_DS_:
	MOVF	r0x00, W
	BNZ	_00241_DS_
	MOVF	r0x01, W
	XORLW	0x40
	BZ	_00217_DS_
_00241_DS_:
	BRA	_00218_DS_
_00214_DS_:
	.line	317; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	318; bankstick.c	sr6_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	319; bankstick.c	sr6_temp |= 0x01;
	BSF	r0x00, 0
	.line	320; bankstick.c	MIOS_DOUT_SRSet(6, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	321; bankstick.c	break;
	BRA	_00218_DS_
_00215_DS_:
	.line	323; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	324; bankstick.c	sr6_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	325; bankstick.c	sr6_temp |= 0x02;
	BSF	r0x00, 1
	.line	326; bankstick.c	MIOS_DOUT_SRSet(6, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	327; bankstick.c	break;
	BRA	_00218_DS_
_00216_DS_:
	.line	329; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	330; bankstick.c	sr6_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	331; bankstick.c	sr6_temp |= 0x04;
	BSF	r0x00, 2
	.line	332; bankstick.c	MIOS_DOUT_SRSet(6, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	333; bankstick.c	break;
	BRA	_00218_DS_
_00217_DS_:
	.line	335; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(6);
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	336; bankstick.c	sr6_temp &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	.line	337; bankstick.c	sr6_temp |= 0x08;
	BSF	r0x00, 3
	.line	338; bankstick.c	MIOS_DOUT_SRSet(6, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
_00218_DS_:
	.line	342; bankstick.c	switch( preset ) {
	MOVFF	_BANKSTICK_preset_LEDs_Update_preset_1_1, r0x01
	MOVFF	(_BANKSTICK_preset_LEDs_Update_preset_1_1 + 1), r0x02
	MOVF	r0x01, W
	BNZ	_00251_DS_
	MOVF	r0x02, W
	XORLW	0x01
	BZ	_00219_DS_
_00251_DS_:
	MOVF	r0x01, W
	BNZ	_00253_DS_
	MOVF	r0x02, W
	XORLW	0x02
	BZ	_00220_DS_
_00253_DS_:
	MOVF	r0x01, W
	BNZ	_00255_DS_
	MOVF	r0x02, W
	XORLW	0x03
	BZ	_00221_DS_
_00255_DS_:
	MOVF	r0x01, W
	BNZ	_00257_DS_
	MOVF	r0x02, W
	XORLW	0x04
	BZ	_00222_DS_
_00257_DS_:
	BRA	_00223_DS_
_00219_DS_:
	.line	344; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	345; bankstick.c	sr6_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	346; bankstick.c	sr6_temp |= 0x10;
	BSF	r0x00, 4
	.line	347; bankstick.c	MIOS_DOUT_SRSet(5, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	348; bankstick.c	break;
	BRA	_00223_DS_
_00220_DS_:
	.line	350; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	351; bankstick.c	sr6_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	352; bankstick.c	sr6_temp |= 0x20;
	BSF	r0x00, 5
	.line	353; bankstick.c	MIOS_DOUT_SRSet(5, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	354; bankstick.c	break;
	BRA	_00223_DS_
_00221_DS_:
	.line	356; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	357; bankstick.c	sr6_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	358; bankstick.c	sr6_temp |= 0x40;
	BSF	r0x00, 6
	.line	359; bankstick.c	MIOS_DOUT_SRSet(5, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	360; bankstick.c	break;
	BRA	_00223_DS_
_00222_DS_:
	.line	362; bankstick.c	sr6_temp = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	363; bankstick.c	sr6_temp &= 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	364; bankstick.c	sr6_temp |= 0x80;
	BSF	r0x00, 7
	.line	365; bankstick.c	MIOS_DOUT_SRSet(5, sr6_temp);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
_00223_DS_:
	BANKSEL	_update_preset_led
	.line	367; bankstick.c	update_preset_led = 0x00;
	CLRF	_update_preset_led, B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_Dout_Update_3	code
_BANKSTICK_Dout_Update_3:
	.line	282; bankstick.c	void BANKSTICK_Dout_Update_3(void) __wparam
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_all_param + 9)
	.line	286; bankstick.c	if( all_param.router_flags_Eg_to_lfo2.ALL_flags_Eg_to_lfo2 & all_param.eg_select) {
	MOVF	(_all_param + 9), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00205_DS_
	.line	287; bankstick.c	MIOS_DOUT_PinSet(29, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00206_DS_
_00205_DS_:
	.line	289; bankstick.c	MIOS_DOUT_PinSet(29, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1d
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00206_DS_:
	BANKSEL	(_all_param + 10)
	.line	293; bankstick.c	if( all_param.router_flags_Eg_to_lfo3.ALL_flags_Eg_to_lfo3 & all_param.eg_select) {
	MOVF	(_all_param + 10), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00208_DS_
	.line	294; bankstick.c	MIOS_DOUT_PinSet(30, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00209_DS_
_00208_DS_:
	.line	296; bankstick.c	MIOS_DOUT_PinSet(30, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1e
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00209_DS_:
	.line	300; bankstick.c	value_1 = MIOS_DOUT_SRGet(5);
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRGet
	MOVWF	r0x00
	.line	301; bankstick.c	value_1 &= 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, F
	BANKSEL	(_all_param + 38)
	.line	302; bankstick.c	value_1 |= all_param.eg_select;
	MOVF	(_all_param + 38), W, B
	IORWF	r0x00, F
	.line	303; bankstick.c	MIOS_DOUT_SRSet(5, value_1);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x05
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	BANKSEL	_update_led
	.line	304; bankstick.c	update_led = 0x00;
	CLRF	_update_led, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_Dout_Update_2	code
_BANKSTICK_Dout_Update_2:
	.line	231; bankstick.c	void BANKSTICK_Dout_Update_2(void) __wparam
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_all_param + 3)
	.line	234; bankstick.c	if( all_param.router_flags_lfo1_att.ALL_flags_lfo1_att & all_param.eg_select) {
	MOVF	(_all_param + 3), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00176_DS_
	.line	235; bankstick.c	MIOS_DOUT_PinSet(24, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00177_DS_
_00176_DS_:
	.line	237; bankstick.c	MIOS_DOUT_PinSet(24, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x18
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00177_DS_:
	BANKSEL	(_all_param + 4)
	.line	241; bankstick.c	if( all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec & all_param.eg_select) {
	MOVF	(_all_param + 4), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00179_DS_
	.line	242; bankstick.c	MIOS_DOUT_PinSet(25, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00180_DS_
_00179_DS_:
	.line	244; bankstick.c	MIOS_DOUT_PinSet(25, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x19
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00180_DS_:
	BANKSEL	(_all_param + 5)
	.line	248; bankstick.c	if( all_param.router_flags_eg_link.eg1_link_eg2 ) {
	BTFSS	(_all_param + 5), 0, B
	BRA	_00189_DS_
	.line	249; bankstick.c	if( all_param.eg_select <= 2) {
	MOVLW	0x03
; removed redundant BANKSEL
	SUBWF	(_all_param + 38), W, B
	BC	_00190_DS_
	.line	250; bankstick.c	MIOS_DOUT_PinSet(26, 1); } }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00190_DS_
_00189_DS_:
	BANKSEL	(_all_param + 5)
	.line	251; bankstick.c	else if( all_param.router_flags_eg_link.eg3_link_eg4 ){
	BTFSS	(_all_param + 5), 1, B
	BRA	_00186_DS_
	.line	252; bankstick.c	if (all_param.eg_select >= 4) {
	MOVLW	0x04
; removed redundant BANKSEL
	SUBWF	(_all_param + 38), W, B
	BNC	_00190_DS_
	.line	253; bankstick.c	MIOS_DOUT_PinSet(26, 1); }}
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00190_DS_
_00186_DS_:
	.line	255; bankstick.c	MIOS_DOUT_PinSet(26, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1a
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00190_DS_:
	BANKSEL	(_all_param + 6)
	.line	259; bankstick.c	if( all_param.router_flags_eg_v2s.ALL_flags_eg_v2s & all_param.eg_select) {
	MOVF	(_all_param + 6), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00192_DS_
	.line	260; bankstick.c	MIOS_DOUT_PinSet(27, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00193_DS_
_00192_DS_:
	.line	262; bankstick.c	MIOS_DOUT_PinSet(27, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1b
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00193_DS_:
	BANKSEL	(_all_param + 7)
	.line	266; bankstick.c	if( all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig & all_param.eg_select) {
	MOVF	(_all_param + 7), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00195_DS_
	.line	267; bankstick.c	MIOS_DOUT_PinSet(31, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1f
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00196_DS_
_00195_DS_:
	.line	269; bankstick.c	MIOS_DOUT_PinSet(32, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x20
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00196_DS_:
	BANKSEL	(_all_param + 8)
	.line	272; bankstick.c	if( all_param.router_flags_Eg_to_lfo1.ALL_flags_Eg_to_lfo1 & all_param.eg_select) {
	MOVF	(_all_param + 8), W, B
	ANDLW	0xff
	MOVWF	r0x00
; removed redundant BANKSEL
	MOVF	(_all_param + 38), W, B
	ANDWF	r0x00, F
	MOVF	r0x00, W
	BZ	_00198_DS_
	.line	273; bankstick.c	MIOS_DOUT_PinSet(28, 1); }
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00199_DS_
_00198_DS_:
	.line	275; bankstick.c	MIOS_DOUT_PinSet(28, 0); }
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x1c
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00199_DS_:
	.line	276; bankstick.c	update_led = 0x01;
	MOVLW	0x01
	BANKSEL	_update_led
	MOVWF	_update_led, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_Dout_Update	code
_BANKSTICK_Dout_Update:
	.line	196; bankstick.c	void BANKSTICK_Dout_Update(void) __wparam
	MOVFF	r0x00, POSTDEC1
	BANKSEL	(_all_param + 11)
	.line	201; bankstick.c	if( all_param.router_flags_system.ttl_switch1 ) {    // if set eg2 selected, if clear, eg1 selected
	BTFSS	(_all_param + 11), 2, B
	BRA	_00160_DS_
	.line	202; bankstick.c	value_1 = 0x0a; }
	MOVLW	0x0a
	MOVWF	r0x00
	BRA	_00161_DS_
_00160_DS_:
	.line	204; bankstick.c	value_1 = 0x05; }
	MOVLW	0x05
	MOVWF	r0x00
_00161_DS_:
	BANKSEL	(_all_param + 11)
	.line	205; bankstick.c	if( all_param.router_flags_system.ttl_switch2 ) {    // if set eg3 selected, if clear, eg2 selected
	BTFSS	(_all_param + 11), 3, B
	BRA	_00163_DS_
	.line	206; bankstick.c	value_1 ^= 0xa0;}
	MOVLW	0xa0
	XORWF	r0x00, F
	BRA	_00164_DS_
_00163_DS_:
	.line	208; bankstick.c	value_1 ^= 0x50; }
	MOVLW	0x50
	XORWF	r0x00, F
_00164_DS_:
	.line	209; bankstick.c	MIOS_DOUT_SRSet(4, value_1);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x04
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	211; bankstick.c	value_1 = all_param.eg_select;
	MOVFF	(_all_param + 38), r0x00
	.line	212; bankstick.c	MIOS_DOUT_SRSet(6, value_1);	
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x06
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 11)
	.line	215; bankstick.c	all_param.router_flags_system.midi_mode ? MIOS_DOUT_PinSet(53, 1) : MIOS_DOUT_PinSet(53, 0);
	BTFSS	(_all_param + 11), 1, B
	BRA	_00167_DS_
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x35
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00168_DS_
_00167_DS_:
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x35
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00168_DS_:
	BANKSEL	(_all_param + 11)
	.line	216; bankstick.c	all_param.router_flags_system.twin_mode ? MIOS_DOUT_PinSet(52, 1) : MIOS_DOUT_PinSet(52, 0);
	BTFSS	(_all_param + 11), 0, B
	BRA	_00169_DS_
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0x34
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
	BRA	_00170_DS_
_00169_DS_:
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x34
	CALL	_MIOS_DOUT_PinSet
	INCF	FSR1L, F
_00170_DS_:
	BANKSEL	_all_param
	.line	219; bankstick.c	MIOS_DOUT_SRSet(0, all_param.router_flags_lfo1.ALL_flags_lfo1);
	MOVF	_all_param, W, B
	ANDLW	0xff
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 1)
	.line	222; bankstick.c	MIOS_DOUT_SRSet(1, all_param.router_flags_lfo2.ALL_flags_lfo2);
	MOVF	(_all_param + 1), W, B
	ANDLW	0xff
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	BANKSEL	(_all_param + 2)
	.line	225; bankstick.c	MIOS_DOUT_SRSet(2, all_param.router_flags_lfo3.ALL_flags_lfo3);
	MOVF	(_all_param + 2), W, B
	ANDLW	0xff
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_MIOS_DOUT_SRSet
	INCF	FSR1L, F
	.line	226; bankstick.c	update_led = 0x01;
	MOVLW	0x01
	BANKSEL	_update_led
	MOVWF	_update_led, B
	MOVFF	PREINC1, r0x00
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_SAVE_Evnt	code
_BANKSTICK_SAVE_Evnt:
	.line	179; bankstick.c	void BANKSTICK_SAVE_Evnt(volatile unsigned int bank, volatile unsigned int preset) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_BANKSTICK_SAVE_Evnt_bank_1_1
	MOVWF	_BANKSTICK_SAVE_Evnt_bank_1_1, B
	MOVLW	0x02
	MOVFF	PLUSW2, (_BANKSTICK_SAVE_Evnt_bank_1_1 + 1)
	MOVLW	0x03
	MOVFF	PLUSW2, _BANKSTICK_SAVE_Evnt_preset_1_1
	MOVLW	0x04
	MOVFF	PLUSW2, (_BANKSTICK_SAVE_Evnt_preset_1_1 + 1)
	BANKSEL	_BANKSTICK_SAVE_Evnt_preset_1_1
	.line	182; bankstick.c	adress = ((bank + preset) & 0xff00);
	MOVF	_BANKSTICK_SAVE_Evnt_preset_1_1, W, B
	BANKSEL	_BANKSTICK_SAVE_Evnt_bank_1_1
	ADDWF	_BANKSTICK_SAVE_Evnt_bank_1_1, W, B
	MOVWF	r0x00
	BANKSEL	(_BANKSTICK_SAVE_Evnt_preset_1_1 + 1)
	MOVF	(_BANKSTICK_SAVE_Evnt_preset_1_1 + 1), W, B
	BANKSEL	(_BANKSTICK_SAVE_Evnt_bank_1_1 + 1)
	ADDWFC	(_BANKSTICK_SAVE_Evnt_bank_1_1 + 1), W, B
	MOVWF	r0x01
	BANKSEL	_adress
	CLRF	_adress, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_adress + 1), B
	.line	183; bankstick.c	MIOS_BANKSTICK_WritePage(adress, buffer_bs); //0xzz0d     
	MOVFF	_buffer_bs, r0x00
	MOVFF	(_buffer_bs + 1), r0x01
	MOVFF	(_buffer_bs + 2), r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_adress + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_adress, W, B
	CALL	_MIOS_BANKSTICK_WritePage
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_BANKSTICK_SAVE_Evnt_bank_1_1
	.line	185; bankstick.c	MIOS_BANKSTICK_Write(0x0001, bank); //save last bank number
	MOVF	_BANKSTICK_SAVE_Evnt_bank_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_BANKSTICK_Write
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_BANKSTICK_SAVE_Evnt_preset_1_1
	.line	187; bankstick.c	MIOS_BANKSTICK_Write(0x0002, preset); //save last preset number
	MOVF	_BANKSTICK_SAVE_Evnt_preset_1_1, W, B
	MOVWF	r0x00
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_MIOS_BANKSTICK_Write
	MOVLW	0x02
	ADDWF	FSR1L, F
	BANKSEL	_app_flags
	.line	188; bankstick.c	app_flags.save_on = 0;
	BCF	_app_flags, 3, B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_LOAD_Evnt	code
_BANKSTICK_LOAD_Evnt:
	.line	167; bankstick.c	void BANKSTICK_LOAD_Evnt( volatile unsigned int bank, volatile unsigned int preset) __wparam
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	_BANKSTICK_LOAD_Evnt_bank_1_1
	MOVWF	_BANKSTICK_LOAD_Evnt_bank_1_1, B
	MOVLW	0x02
	MOVFF	PLUSW2, (_BANKSTICK_LOAD_Evnt_bank_1_1 + 1)
	MOVLW	0x03
	MOVFF	PLUSW2, _BANKSTICK_LOAD_Evnt_preset_1_1
	MOVLW	0x04
	MOVFF	PLUSW2, (_BANKSTICK_LOAD_Evnt_preset_1_1 + 1)
	BANKSEL	_BANKSTICK_LOAD_Evnt_preset_1_1
	.line	169; bankstick.c	adress = ((bank + preset) & 0xff00);
	MOVF	_BANKSTICK_LOAD_Evnt_preset_1_1, W, B
	BANKSEL	_BANKSTICK_LOAD_Evnt_bank_1_1
	ADDWF	_BANKSTICK_LOAD_Evnt_bank_1_1, W, B
	MOVWF	r0x00
	BANKSEL	(_BANKSTICK_LOAD_Evnt_preset_1_1 + 1)
	MOVF	(_BANKSTICK_LOAD_Evnt_preset_1_1 + 1), W, B
	BANKSEL	(_BANKSTICK_LOAD_Evnt_bank_1_1 + 1)
	ADDWFC	(_BANKSTICK_LOAD_Evnt_bank_1_1 + 1), W, B
	MOVWF	r0x01
	BANKSEL	_adress
	CLRF	_adress, B
	MOVF	r0x01, W
; removed redundant BANKSEL
	MOVWF	(_adress + 1), B
	.line	170; bankstick.c	MIOS_BANKSTICK_ReadPage(adress, buffer_bs);
	MOVFF	_buffer_bs, r0x00
	MOVFF	(_buffer_bs + 1), r0x01
	MOVFF	(_buffer_bs + 2), r0x02
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	(_adress + 1), W, B
	MOVWF	POSTDEC1
; removed redundant BANKSEL
	MOVF	_adress, W, B
	CALL	_MIOS_BANKSTICK_ReadPage
	MOVLW	0x04
	ADDWF	FSR1L, F
	BANKSEL	_load_last
	.line	171; bankstick.c	load_last = 0x00;
	CLRF	_load_last, B
	.line	172; bankstick.c	update_led = 0x01;
	MOVLW	0x01
	BANKSEL	_update_led
	MOVWF	_update_led, B
	.line	173; bankstick.c	update_preset_led = 0x01;
	MOVLW	0x01
	BANKSEL	_update_preset_led
	MOVWF	_update_preset_led, B
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_bankstick__BANKSTICK_Init	code
_BANKSTICK_Init:
	.line	111; bankstick.c	void BANKSTICK_Init(void) __wparam
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	.line	115; bankstick.c	temp_value = MIOS_BANKSTICK_Read(0x0000); //check cosmologik number
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	CALL	_MIOS_BANKSTICK_Read
	MOVWF	r0x00
	INCF	FSR1L, F
	.line	117; bankstick.c	if( temp_value != 0x33 ) {	
	MOVF	r0x00, W
	XORLW	0x33
	BNZ	_00147_DS_
	BRA	_00106_DS_
_00147_DS_:
	.line	118; bankstick.c	all_param.router_flags_system.ALL_flags_system = 0x00;
	MOVLW	0x00
	BANKSEL	(_all_param + 11)
	MOVWF	(_all_param + 11), B
	.line	119; bankstick.c	all_param.router_flags_lfo1.ALL_flags_lfo1 = 0x01;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	_all_param, B
	.line	120; bankstick.c	all_param.router_flags_lfo2.ALL_flags_lfo2 = 0x01;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_all_param + 1), B
	.line	121; bankstick.c	all_param.router_flags_lfo3.ALL_flags_lfo3 = 0x01;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_all_param + 2), B
	.line	122; bankstick.c	all_param.eg_select = 0x01;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_all_param + 38), B
	.line	123; bankstick.c	all_param.router_flags_lfo1_att.ALL_flags_lfo1_att = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 3), B
	.line	124; bankstick.c	all_param.router_flags_lfo1_dec.ALL_flags_lfo1_dec = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 4), B
	.line	125; bankstick.c	all_param.router_flags_eg_link.ALL_flags_eg_link = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 5), B
	.line	126; bankstick.c	all_param.router_flags_eg_v2s.ALL_flags_eg_v2s = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 6), B
	.line	127; bankstick.c	all_param.router_flags_eg_audio_trig.ALL_flags_eg_audio_trig = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 7), B
	.line	128; bankstick.c	all_param.router_flags_Eg_to_lfo1.ALL_flags_Eg_to_lfo1 = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 8), B
	.line	129; bankstick.c	all_param.router_flags_Eg_to_lfo2.ALL_flags_Eg_to_lfo2 = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 9), B
	.line	130; bankstick.c	all_param.router_flags_Eg_to_lfo3.ALL_flags_Eg_to_lfo3 = 0x00;
	MOVLW	0x00
; removed redundant BANKSEL
	MOVWF	(_all_param + 10), B
	.line	131; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	CLRF	r0x00
_00108_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00111_DS_
	.line	132; bankstick.c	all_param.eg_channel[tempo_value] = 0x01;}
	MOVLW	LOW(_all_param + 12)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_all_param + 12)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x01
	MOVWF	INDF0
	.line	131; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	INCF	r0x00, F
	BRA	_00108_DS_
_00111_DS_:
	.line	133; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	CLRF	r0x00
_00112_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00115_DS_
	.line	134; bankstick.c	all_param.attack[tempo_value] = 0x40;}
	MOVLW	LOW(_all_param + 16)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_all_param + 16)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x40
	MOVWF	INDF0
	.line	133; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	INCF	r0x00, F
	BRA	_00112_DS_
_00115_DS_:
	.line	135; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	CLRF	r0x00
_00116_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00119_DS_
	.line	136; bankstick.c	all_param.decay[tempo_value] = 0x40;}
	MOVLW	LOW(_all_param + 20)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_all_param + 20)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x40
	MOVWF	INDF0
	.line	135; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	INCF	r0x00, F
	BRA	_00116_DS_
_00119_DS_:
	.line	137; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	CLRF	r0x00
_00120_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00123_DS_
	.line	138; bankstick.c	all_param.sustain[tempo_value] = 0x80;}
	MOVLW	LOW(_all_param + 24)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_all_param + 24)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x80
	MOVWF	INDF0
	.line	137; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	INCF	r0x00, F
	BRA	_00120_DS_
_00123_DS_:
	.line	139; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	CLRF	r0x00
_00124_DS_:
	MOVLW	0x04
	SUBWF	r0x00, W
	BC	_00127_DS_
	.line	140; bankstick.c	all_param.release[tempo_value] = 0x40;}
	MOVLW	LOW(_all_param + 28)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_all_param + 28)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x40
	MOVWF	INDF0
	.line	139; bankstick.c	for (tempo_value = 0; tempo_value <=3; tempo_value++) {
	INCF	r0x00, F
	BRA	_00124_DS_
_00127_DS_:
	.line	141; bankstick.c	all_param.lfo0_rate  = 0x80;
	MOVLW	0x80
	BANKSEL	(_all_param + 32)
	MOVWF	(_all_param + 32), B
	.line	142; bankstick.c	all_param.lfo1_rate  = 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_all_param + 33), B
	.line	143; bankstick.c	all_param.lfo2_rate  = 0x80;
	MOVLW	0x80
; removed redundant BANKSEL
	MOVWF	(_all_param + 34), B
	.line	144; bankstick.c	all_param.bpm = 0x74;
	MOVLW	0x74
; removed redundant BANKSEL
	MOVWF	(_all_param + 39), B
	.line	145; bankstick.c	all_param.lfo0_bpm   = 0x06;
	MOVLW	0x06
; removed redundant BANKSEL
	MOVWF	(_all_param + 35), B
	.line	146; bankstick.c	all_param.lfo1_bpm   = 0x06;
	MOVLW	0x06
; removed redundant BANKSEL
	MOVWF	(_all_param + 36), B
	.line	147; bankstick.c	all_param.lfo2_bpm   = 0x06;
	MOVLW	0x06
; removed redundant BANKSEL
	MOVWF	(_all_param + 37), B
	.line	148; bankstick.c	all_param.eg_select = 0x01;
	MOVLW	0x01
; removed redundant BANKSEL
	MOVWF	(_all_param + 38), B
	BANKSEL	_load_last
	.line	150; bankstick.c	load_last = 0x00;
	CLRF	_load_last, B
	.line	151; bankstick.c	update_led = 0x01;
	MOVLW	0x01
	BANKSEL	_update_led
	MOVWF	_update_led, B
	BRA	_00128_DS_
_00106_DS_:
	.line	156; bankstick.c	bank = MIOS_BANKSTICK_Read(0x0001);     //read last bank number
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	CALL	_MIOS_BANKSTICK_Read
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVFF	r0x00, _bank
	BANKSEL	(_bank + 1)
	CLRF	(_bank + 1), B
	.line	158; bankstick.c	preset = MIOS_BANKSTICK_Read(0x0002);  //read last preset number
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	CALL	_MIOS_BANKSTICK_Read
	MOVWF	r0x00
	INCF	FSR1L, F
	MOVFF	r0x00, _preset
	BANKSEL	(_preset + 1)
	CLRF	(_preset + 1), B
	.line	160; bankstick.c	load_last = 0x01;
	MOVLW	0x01
	BANKSEL	_load_last
	MOVWF	_load_last, B
_00128_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	



; Statistics:
; code size:	 1700 (0x06a4) bytes ( 1.30%)
;           	  850 (0x0352) words
; udata size:	   17 (0x0011) bytes ( 0.44%)
; access size:	    3 (0x0003) bytes


	end
