;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.8.0 #5082 (Mar  9 2008) (MINGW32)
; This file was generated Thu Jul 10 15:16:02 2008
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------

	.ident "SDCC version 2.8.0 #5082 [pic16 port]"
	.file	"midi.c"
	list	p=18f4620

	radix dec

;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global _new_note
	global _MIDI_Init
	global _MIDI_Evnt
	global _midi_note
	global _midi_cc_chn0
	global _midi_pitch_bender

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
	extern _mios_enc_pin_table
	extern _mios_mproc_event_table
	extern _MIOS_MPROC_EVENT_TABLE
	extern _MIOS_ENC_PIN_TABLE
;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L equ 0xfe1 ;; normaly 0xfe9, changed by mios-gpasm
FSR0H equ 0xfe2 ;; normaly 0xfea, changed by mios-gpasm
FSR1L equ 0xfe9 ;; normaly 0xfe1, changed by mios-gpasm
FSR2L	equ	0xfd9
INDF0 equ 0xfe7 ;; normaly 0xfef, changed by mios-gpasm
POSTINC0 equ 0xfe6 ;; normaly 0xfee, changed by mios-gpasm
POSTDEC1 equ 0xfed ;; normaly 0xfe5, changed by mios-gpasm
PREINC1 equ 0xfec ;; normaly 0xfe4, changed by mios-gpasm
PLUSW2	equ	0xfdb
PRODH	equ	0xff4


; Internal registers
.registers udata_ovr 0x0010 ;; normaly 0x0000, changed by mios-gpasm
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1


gpr14	udata

udata_midi_0	udata
_new_note	res	1

udata_midi_1	udata
_midi_note	res	16

udata_midi_2	udata
_midi_cc_chn0	res	128

udata_midi_3	udata
_midi_pitch_bender	res	32

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_midi__MIDI_Evnt	code
_MIDI_Evnt:
	.line	81; midi.c	void MIDI_Evnt(unsigned char evnt0, unsigned char evnt1, unsigned char evnt2)
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVLW	0x02
	MOVFF	PLUSW2, r0x00
	MOVLW	0x03
	MOVFF	PLUSW2, r0x01
	MOVLW	0x04
	MOVFF	PLUSW2, r0x02
	.line	83; midi.c	unsigned char midi_cmd = evnt0 & 0xf0;
	MOVLW	0xf0
	ANDWF	r0x00, W
	MOVWF	r0x03
	.line	84; midi.c	unsigned char midi_chn = evnt0 & 0x0f;
	MOVLW	0x0f
	ANDWF	r0x00, F
	.line	86; midi.c	switch( midi_cmd ) {
	MOVF	r0x03, W
	XORLW	0x80
	BZ	_00121_DS_
	MOVF	r0x03, W
	XORLW	0x90
	BZ	_00122_DS_
	MOVF	r0x03, W
	XORLW	0xa0
	BNZ	_00148_DS_
	BRA	_00131_DS_
_00148_DS_:
	MOVF	r0x03, W
	XORLW	0xb0
	BZ	_00124_DS_
	MOVF	r0x03, W
	XORLW	0xc0
	BNZ	_00152_DS_
	BRA	_00131_DS_
_00152_DS_:
	MOVF	r0x03, W
	XORLW	0xd0
	BNZ	_00154_DS_
	BRA	_00131_DS_
_00154_DS_:
	MOVF	r0x03, W
	XORLW	0xe0
	BZ	_00129_DS_
	BRA	_00131_DS_
_00121_DS_:
	.line	89; midi.c	evnt2 = 0x00; // force velocity to zero
	CLRF	r0x02
_00122_DS_:
	.line	91; midi.c	midi_note[midi_chn].NOTE = evnt1;
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x04, F
	MOVF	r0x01, W
	ANDLW	0x7f
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVF	INDF0, W
	ANDLW	0x80
	IORWF	PRODH, W
	MOVWF	INDF0
	.line	92; midi.c	midi_note[midi_chn].GATE = evnt2 > 0 ? 1 : 0;
	MOVLW	LOW(_midi_note)
	ADDWF	r0x00, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x04, F
	MOVF	r0x02, W
	ANDLW	0x01
	RRNCF	WREG, W
	MOVWF	PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVF	INDF0, W
	ANDLW	0x7f
	IORWF	PRODH, W
	MOVWF	INDF0
	.line	93; midi.c	new_note = 0x07;
	MOVLW	0x07
	BANKSEL	_new_note
	MOVWF	_new_note, B
	.line	94; midi.c	break;
	BRA	_00131_DS_
_00124_DS_:
	.line	102; midi.c	if( midi_chn == 0x00 ) {
	MOVF	r0x00, W
	BNZ	_00131_DS_
	.line	103; midi.c	midi_cc_chn0[evnt1] = evnt2;
	MOVLW	LOW(_midi_cc_chn0)
	ADDWF	r0x01, W
	MOVWF	r0x03
	CLRF	r0x04
	MOVLW	HIGH(_midi_cc_chn0)
	ADDWFC	r0x04, F
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, FSR0H
	MOVFF	r0x02, INDF0
	.line	105; midi.c	break;
	BRA	_00131_DS_
; ;multiply lit val:0x02 by variable r0x00 and store in r0x00
; ;Unrolled 8 X 8 multiplication
; ;FIXME: the function does not support result==WREG
_00129_DS_:
	.line	116; midi.c	midi_pitch_bender[midi_chn] = (evnt2 << 7) | evnt1;
	BCF	STATUS, 0
	RLCF	r0x00, F
	CLRF	r0x03
	MOVLW	LOW(_midi_pitch_bender)
	ADDWF	r0x00, F
	MOVLW	HIGH(_midi_pitch_bender)
	ADDWFC	r0x03, F
	CLRF	r0x04
	RRCF	r0x04, W
	RRCF	r0x02, W
	MOVWF	r0x06
	CLRF	r0x05
	RRCF	r0x05, F
	CLRF	r0x07
	MOVF	r0x01, W
	IORWF	r0x05, F
	MOVF	r0x07, W
	IORWF	r0x06, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x03, FSR0H
	MOVFF	r0x05, POSTINC0
	MOVFF	r0x06, INDF0
_00131_DS_:
	.line	119; midi.c	}
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	RETURN	

; ; Starting pCode block
S_midi__MIDI_Init	code
_MIDI_Init:
	.line	59; midi.c	void MIDI_Init(void)
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	.line	63; midi.c	for(i=0; i<sizeof(midi_note); ++i) {
	MOVLW	0x10
	MOVWF	r0x00
_00107_DS_:
	.line	64; midi.c	midi_note[i].ALL = 0;
	DECF	r0x00, W
	MOVWF	r0x01
	MOVLW	LOW(_midi_note)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_midi_note)
	ADDWFC	r0x03, F
	MOVLW	0x00
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVWF	INDF0
	MOVFF	r0x01, r0x00
	.line	63; midi.c	for(i=0; i<sizeof(midi_note); ++i) {
	MOVF	r0x00, W
	BNZ	_00107_DS_
	.line	67; midi.c	for(i=0; i<sizeof(midi_cc_chn0); ++i) {
	CLRF	r0x00
_00108_DS_:
	MOVLW	0x80
	SUBWF	r0x00, W
	BC	_00111_DS_
	.line	68; midi.c	midi_cc_chn0[i] = 0;
	MOVLW	LOW(_midi_cc_chn0)
	ADDWF	r0x00, W
	MOVWF	r0x01
	CLRF	r0x02
	MOVLW	HIGH(_midi_cc_chn0)
	ADDWFC	r0x02, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, FSR0H
	MOVLW	0x00
	MOVWF	INDF0
	.line	67; midi.c	for(i=0; i<sizeof(midi_cc_chn0); ++i) {
	INCF	r0x00, F
	BRA	_00108_DS_
_00111_DS_:
	.line	71; midi.c	for(i=0; i<sizeof(midi_pitch_bender); ++i) {
	CLRF	r0x00
	CLRF	r0x01
_00112_DS_:
	MOVLW	0x20
	SUBWF	r0x00, W
	BC	_00116_DS_
	.line	72; midi.c	midi_pitch_bender[i] = 0;
	MOVLW	LOW(_midi_pitch_bender)
	ADDWF	r0x01, W
	MOVWF	r0x02
	CLRF	r0x03
	MOVLW	HIGH(_midi_pitch_bender)
	ADDWFC	r0x03, F
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, FSR0H
	MOVLW	0x00
	MOVWF	POSTINC0
	MOVLW	0x00
	MOVWF	INDF0
	.line	71; midi.c	for(i=0; i<sizeof(midi_pitch_bender); ++i) {
	INCF	r0x01, F
	INCF	r0x01, F
	INCF	r0x00, F
	BRA	_00112_DS_
_00116_DS_:
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	RETURN	



; Statistics:
; code size:	  474 (0x01da) bytes ( 0.36%)
;           	  237 (0x00ed) words
; udata size:	  177 (0x00b1) bytes ( 4.61%)
; access size:	    8 (0x0008) bytes


	end
