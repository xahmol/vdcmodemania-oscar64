; Compiled with 1.30.248
--------------------------------------------------------------------
startup: ; startup
1c01 : 0b __ __ INV
1c02 : 08 __ __ PHP
1c03 : 0a __ __ ASL
1c04 : 00 __ __ BRK
1c05 : 9e __ __ INV
1c06 : 37 __ __ INV
1c07 : 31 38 __ AND ($38),y 
1c09 : 31 00 __ AND ($00),y 
1c0b : 00 __ __ BRK
1c0c : 00 __ __ BRK
1c0d : a9 0e __ LDA #$0e
1c0f : 8d 00 ff STA $ff00 
1c12 : ba __ __ TSX
1c13 : 8e fe 25 STX $25fe ; (spentry + 0)
1c16 : a9 00 __ LDA #$00
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 54 __ LDA #$54
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 66 __ LDA #$66
1c21 : e9 54 __ SBC #$54
1c23 : f0 0f __ BEQ $1c34 ; (startup + 51)
1c25 : aa __ __ TAX
1c26 : a9 00 __ LDA #$00
1c28 : a0 00 __ LDY #$00
1c2a : 91 19 __ STA (IP + 0),y 
1c2c : c8 __ __ INY
1c2d : d0 fb __ BNE $1c2a ; (startup + 41)
1c2f : e6 1a __ INC IP + 1 
1c31 : ca __ __ DEX
1c32 : d0 f6 __ BNE $1c2a ; (startup + 41)
1c34 : 38 __ __ SEC
1c35 : a9 a0 __ LDA #$a0
1c37 : e9 00 __ SBC #$00
1c39 : f0 08 __ BEQ $1c43 ; (startup + 66)
1c3b : a8 __ __ TAY
1c3c : a9 00 __ LDA #$00
1c3e : 88 __ __ DEY
1c3f : 91 19 __ STA (IP + 0),y 
1c41 : d0 fb __ BNE $1c3e ; (startup + 61)
1c43 : a2 f7 __ LDX #$f7
1c45 : e0 f7 __ CPX #$f7
1c47 : f0 07 __ BEQ $1c50 ; (startup + 79)
1c49 : 95 00 __ STA $00,x 
1c4b : e8 __ __ INX
1c4c : e0 f7 __ CPX #$f7
1c4e : d0 f9 __ BNE $1c49 ; (startup + 72)
1c50 : a9 b6 __ LDA #$b6
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 be __ LDA #$be
1c56 : 85 24 __ STA SP + 1 
1c58 : 20 80 1c JSR $1c80 ; (main.s1000 + 0)
1c5b : a9 4c __ LDA #$4c
1c5d : 85 54 __ STA $54 
1c5f : a9 00 __ LDA #$00
1c61 : 85 13 __ STA P6 
1c63 : 85 1a __ STA IP + 1 
1c65 : a9 1b __ LDA #$1b
1c67 : 85 18 __ STA P11 
1c69 : a9 19 __ LDA #$19
1c6b : 85 16 __ STA P9 
1c6d : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
.s1000:
1c80 : a5 53 __ LDA T2 + 0 
1c82 : 8d b8 be STA $beb8 ; (main@stack + 0)
.s0:
1c85 : 20 dc 1d JSR $1ddc ; (bnk_init.s1000 + 0)
1c88 : a9 00 __ LDA #$00
1c8a : 8d fe bf STA $bffe ; (sstack + 5)
1c8d : a9 01 __ LDA #$01
1c8f : 8d ff bf STA $bfff ; (sstack + 6)
1c92 : 20 21 26 JSR $2621 ; (vdc_init.s1000 + 0)
1c95 : 20 7f 2c JSR $2c7f ; (raster_place_test.s1000 + 0)
1c98 : a9 05 __ LDA #$05
1c9a : 8d b9 be STA $beb9 ; (window + 0)
1c9d : 8d ba be STA $beba ; (window + 1)
1ca0 : a9 00 __ LDA #$00
1ca2 : 8d bd be STA $bebd ; (window + 4)
1ca5 : 8d be be STA $bebe ; (window + 5)
1ca8 : a9 46 __ LDA #$46
1caa : 8d bb be STA $bebb ; (window + 2)
1cad : a9 05 __ LDA #$05
1caf : 85 0d __ STA P0 
1cb1 : 85 0f __ STA P2 
1cb3 : a9 00 __ LDA #$00
1cb5 : 85 0e __ STA P1 
1cb7 : 85 10 __ STA P3 
1cb9 : ad 6e 52 LDA $526e ; (vdc_state + 5)
1cbc : 38 __ __ SEC
1cbd : e9 07 __ SBC #$07
1cbf : 8d bc be STA $bebc ; (window + 3)
1cc2 : 20 54 28 JSR $2854 ; (vdc_coords.s0 + 0)
1cc5 : a9 00 __ LDA #$00
1cc7 : 85 53 __ STA T2 + 0 
1cc9 : 85 0e __ STA P1 
1ccb : ad 75 52 LDA $5275 ; (vdc_state + 12)
1cce : 18 __ __ CLC
1ccf : 65 1b __ ADC ACCU + 0 
1cd1 : 8d bf be STA $bebf ; (window + 6)
1cd4 : ad 76 52 LDA $5276 ; (vdc_state + 13)
1cd7 : 65 1c __ ADC ACCU + 1 
1cd9 : 8d c0 be STA $bec0 ; (window + 7)
1cdc : 20 54 28 JSR $2854 ; (vdc_coords.s0 + 0)
1cdf : ad 77 52 LDA $5277 ; (vdc_state + 14)
1ce2 : 18 __ __ CLC
1ce3 : 65 1b __ ADC ACCU + 0 
1ce5 : 8d c1 be STA $bec1 ; (window + 8)
1ce8 : ad 78 52 LDA $5278 ; (vdc_state + 15)
1ceb : 65 1c __ ADC ACCU + 1 
1ced : 8d c2 be STA $bec2 ; (window + 9)
1cf0 : a9 b9 __ LDA #$b9
1cf2 : 8d f9 bf STA $bff9 ; (sstack + 0)
1cf5 : a9 be __ LDA #$be
1cf7 : 8d fa bf STA $bffa ; (sstack + 1)
1cfa : 20 8f 2f JSR $2f8f ; (vdcwin_border_clear.s0 + 0)
1cfd : 4c 2a 1d JMP $1d2a ; (main.l4 + 0)
.s5:
1d00 : aa __ __ TAX
1d01 : 4a __ __ LSR
1d02 : 4a __ __ LSR
1d03 : 4a __ __ LSR
1d04 : 4a __ __ LSR
1d05 : 4a __ __ LSR
1d06 : a8 __ __ TAY
1d07 : 8a __ __ TXA
1d08 : 59 16 52 EOR $5216,y ; (p2smap + 0)
1d0b : 85 13 __ STA P6 
1d0d : ad b9 be LDA $beb9 ; (window + 0)
1d10 : 18 __ __ CLC
1d11 : 69 05 __ ADC #$05
1d13 : 18 __ __ CLC
1d14 : 65 53 __ ADC T2 + 0 
1d16 : 85 11 __ STA P4 
1d18 : ad ba be LDA $beba ; (window + 1)
1d1b : 18 __ __ CLC
1d1c : 69 05 __ ADC #$05
1d1e : 85 12 __ STA P5 
1d20 : ad 74 52 LDA $5274 ; (vdc_state + 11)
1d23 : 85 14 __ STA P7 
1d25 : 20 06 31 JSR $3106 ; (vdc_printc.s0 + 0)
1d28 : e6 53 __ INC T2 + 0 
.l4:
1d2a : a6 53 __ LDX T2 + 0 
1d2c : bd 82 31 LDA $3182,x 
1d2f : d0 cf __ BNE $1d00 ; (main.s5 + 0)
.s3:
1d31 : 20 96 31 JSR $3196 ; (raster_bar.s0 + 0)
1d34 : 20 f1 31 JSR $31f1 ; (init_plasma.s1000 + 0)
1d37 : a9 14 __ LDA #$14
1d39 : 8d 00 d6 STA $d600 
1d3c : ac 7b 52 LDY $527b ; (vdc_state + 18)
1d3f : ae 7c 52 LDX $527c ; (vdc_state + 19)
.l281:
1d42 : 2c 00 d6 BIT $d600 
1d45 : 10 fb __ BPL $1d42 ; (main.l281 + 0)
.s16:
1d47 : 8e 01 d6 STX $d601 
1d4a : a9 15 __ LDA #$15
1d4c : 8d 00 d6 STA $d600 
.l283:
1d4f : 2c 00 d6 BIT $d600 
1d52 : 10 fb __ BPL $1d4f ; (main.l283 + 0)
.s21:
1d54 : 8c 01 d6 STY $d601 
.l285:
1d57 : 20 e4 ff JSR $ffe4 
1d5a : 09 00 __ ORA #$00
1d5c : d0 f9 __ BNE $1d57 ; (main.l285 + 0)
.l25:
1d5e : 20 14 33 JSR $3314 ; (doplasma0.s1000 + 0)
.l287:
1d61 : ad 00 d6 LDA $d600 
1d64 : 29 20 __ AND #$20
1d66 : f0 f9 __ BEQ $1d61 ; (main.l287 + 0)
.s27:
1d68 : a9 14 __ LDA #$14
1d6a : 8d 00 d6 STA $d600 
1d6d : ac 77 52 LDY $5277 ; (vdc_state + 14)
1d70 : ae 78 52 LDX $5278 ; (vdc_state + 15)
.l288:
1d73 : 2c 00 d6 BIT $d600 
1d76 : 10 fb __ BPL $1d73 ; (main.l288 + 0)
.s35:
1d78 : 8e 01 d6 STX $d601 
1d7b : a9 15 __ LDA #$15
1d7d : 8d 00 d6 STA $d600 
.l290:
1d80 : 2c 00 d6 BIT $d600 
1d83 : 10 fb __ BPL $1d80 ; (main.l290 + 0)
.s40:
1d85 : 8c 01 d6 STY $d601 
1d88 : 20 f3 3c JSR $3cf3 ; (doplasma1.s1000 + 0)
.l292:
1d8b : ad 00 d6 LDA $d600 
1d8e : 29 20 __ AND #$20
1d90 : f0 f9 __ BEQ $1d8b ; (main.l292 + 0)
.s41:
1d92 : a9 14 __ LDA #$14
1d94 : 8d 00 d6 STA $d600 
1d97 : ac 7b 52 LDY $527b ; (vdc_state + 18)
1d9a : ae 7c 52 LDX $527c ; (vdc_state + 19)
.l293:
1d9d : 2c 00 d6 BIT $d600 
1da0 : 10 fb __ BPL $1d9d ; (main.l293 + 0)
.s49:
1da2 : 8e 01 d6 STX $d601 
1da5 : a9 15 __ LDA #$15
1da7 : 8d 00 d6 STA $d600 
.l295:
1daa : 2c 00 d6 BIT $d600 
1dad : 10 fb __ BPL $1daa ; (main.l295 + 0)
.s54:
1daf : 8c 01 d6 STY $d601 
1db2 : 20 e4 ff JSR $ffe4 
1db5 : 09 00 __ ORA #$00
1db7 : f0 a5 __ BEQ $1d5e ; (main.l25 + 0)
.s10:
1db9 : 20 ab 46 JSR $46ab ; (rotate_demo.s1000 + 0)
1dbc : a9 00 __ LDA #$00
1dbe : 20 2f 29 JSR $292f ; (fastmode.s0 + 0)
1dc1 : a9 00 __ LDA #$00
1dc3 : 85 18 __ STA P11 
1dc5 : 20 4e 29 JSR $294e ; (vdc_set_mode.s0 + 0)
1dc8 : 20 68 27 JSR $2768 ; (vdc_cls.s0 + 0)
1dcb : a9 00 __ LDA #$00
1dcd : 85 1b __ STA ACCU + 0 
1dcf : 85 1c __ STA ACCU + 1 
1dd1 : a9 04 __ LDA #$04
1dd3 : 8d 06 d5 STA $d506 
.s1001:
1dd6 : ad b8 be LDA $beb8 ; (main@stack + 0)
1dd9 : 85 53 __ STA T2 + 0 
1ddb : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
1ddc : 38 __ __ SEC
1ddd : a5 23 __ LDA SP + 0 
1ddf : e9 06 __ SBC #$06
1de1 : 85 23 __ STA SP + 0 
1de3 : b0 02 __ BCS $1de7 ; (bnk_init.s0 + 0)
1de5 : c6 24 __ DEC SP + 1 
.s0:
1de7 : a9 6f __ LDA #$6f
1de9 : a0 02 __ LDY #$02
1deb : 91 23 __ STA (SP + 0),y 
1ded : a9 25 __ LDA #$25
1def : c8 __ __ INY
1df0 : 91 23 __ STA (SP + 0),y 
1df2 : a5 ba __ LDA $ba 
1df4 : d0 02 __ BNE $1df8 ; (bnk_init.s4 + 0)
.s2:
1df6 : a9 08 __ LDA #$08
.s4:
1df8 : 85 4e __ STA T1 + 0 
1dfa : a0 04 __ LDY #$04
1dfc : 91 23 __ STA (SP + 0),y 
1dfe : a9 00 __ LDA #$00
1e00 : c8 __ __ INY
1e01 : 91 23 __ STA (SP + 0),y 
1e03 : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
1e06 : a9 06 __ LDA #$06
1e08 : 8d 06 d5 STA $d506 
1e0b : a9 7f __ LDA #$7f
1e0d : a0 02 __ LDY #$02
1e0f : 91 23 __ STA (SP + 0),y 
1e11 : a9 25 __ LDA #$25
1e13 : c8 __ __ INY
1e14 : 91 23 __ STA (SP + 0),y 
1e16 : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
1e19 : a9 00 __ LDA #$00
1e1b : aa __ __ TAX
1e1c : 20 68 ff JSR $ff68 
1e1f : a9 99 __ LDA #$99
1e21 : 85 0d __ STA P0 
1e23 : a9 25 __ LDA #$25
1e25 : 85 0e __ STA P1 
1e27 : 20 a4 25 JSR $25a4 ; (krnio_setnam.s0 + 0)
1e2a : a9 99 __ LDA #$99
1e2c : a0 04 __ LDY #$04
1e2e : 91 23 __ STA (SP + 0),y 
1e30 : a9 25 __ LDA #$25
1e32 : c8 __ __ INY
1e33 : 91 23 __ STA (SP + 0),y 
1e35 : a9 ba __ LDA #$ba
1e37 : a0 02 __ LDY #$02
1e39 : 91 23 __ STA (SP + 0),y 
1e3b : a9 25 __ LDA #$25
1e3d : c8 __ __ INY
1e3e : 91 23 __ STA (SP + 0),y 
1e40 : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
1e43 : a9 01 __ LDA #$01
1e45 : 85 0d __ STA P0 
1e47 : 85 0f __ STA P2 
1e49 : a5 4e __ LDA T1 + 0 
1e4b : 85 0e __ STA P1 
1e4d : 20 c7 25 JSR $25c7 ; (krnio_load.s0 + 0)
1e50 : 09 00 __ ORA #$00
1e52 : d0 32 __ BNE $1e86 ; (bnk_init.s1001 + 0)
.s7:
1e54 : a9 dc __ LDA #$dc
1e56 : a0 02 __ LDY #$02
1e58 : 91 23 __ STA (SP + 0),y 
1e5a : a9 25 __ LDA #$25
1e5c : c8 __ __ INY
1e5d : 91 23 __ STA (SP + 0),y 
1e5f : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
1e62 : a9 00 __ LDA #$00
1e64 : a0 02 __ LDY #$02
1e66 : 91 23 __ STA (SP + 0),y 
1e68 : a9 26 __ LDA #$26
1e6a : c8 __ __ INY
1e6b : 91 23 __ STA (SP + 0),y 
1e6d : ad 5a 52 LDA $525a ; (krnio_pstatus + 1)
1e70 : c8 __ __ INY
1e71 : 91 23 __ STA (SP + 0),y 
1e73 : a9 00 __ LDA #$00
1e75 : c8 __ __ INY
1e76 : 91 23 __ STA (SP + 0),y 
1e78 : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
1e7b : a9 01 __ LDA #$01
1e7d : 85 0d __ STA P0 
1e7f : a9 00 __ LDA #$00
1e81 : 85 0e __ STA P1 
1e83 : 20 0c 26 JSR $260c ; (exit.s0 + 0)
.s1001:
1e86 : 18 __ __ CLC
1e87 : a5 23 __ LDA SP + 0 
1e89 : 69 06 __ ADC #$06
1e8b : 85 23 __ STA SP + 0 
1e8d : 90 02 __ BCC $1e91 ; (bnk_init.s1001 + 11)
1e8f : e6 24 __ INC SP + 1 
1e91 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
1e92 : a9 01 __ LDA #$01
1e94 : 8d fd bf STA $bffd ; (sstack + 4)
1e97 : a9 af __ LDA #$af
1e99 : 85 16 __ STA P9 
1e9b : a9 bf __ LDA #$bf
1e9d : 85 17 __ STA P10 
1e9f : a0 02 __ LDY #$02
1ea1 : b1 23 __ LDA (SP + 0),y 
1ea3 : 8d f9 bf STA $bff9 ; (sstack + 0)
1ea6 : c8 __ __ INY
1ea7 : b1 23 __ LDA (SP + 0),y 
1ea9 : 8d fa bf STA $bffa ; (sstack + 1)
1eac : 18 __ __ CLC
1ead : a5 23 __ LDA SP + 0 
1eaf : 69 04 __ ADC #$04
1eb1 : 8d fb bf STA $bffb ; (sstack + 2)
1eb4 : a5 24 __ LDA SP + 1 
1eb6 : 69 00 __ ADC #$00
1eb8 : 8d fc bf STA $bffc ; (sstack + 3)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
.s0:
1ebb : ad f9 bf LDA $bff9 ; (sstack + 0)
1ebe : 85 49 __ STA T1 + 0 
1ec0 : a9 00 __ LDA #$00
1ec2 : 85 47 __ STA T0 + 0 
1ec4 : ad fa bf LDA $bffa ; (sstack + 1)
1ec7 : 85 4a __ STA T1 + 1 
.l1:
1ec9 : a0 00 __ LDY #$00
1ecb : b1 49 __ LDA (T1 + 0),y 
1ecd : d0 2c __ BNE $1efb ; (sformat.s2 + 0)
.s3:
1ecf : a4 47 __ LDY T0 + 0 
1ed1 : 91 16 __ STA (P9),y ; (buff + 0)
1ed3 : 98 __ __ TYA
1ed4 : f0 1c __ BEQ $1ef2 ; (sformat.s1069 + 0)
.s116:
1ed6 : ad fd bf LDA $bffd ; (sstack + 4)
1ed9 : d0 0c __ BNE $1ee7 ; (sformat.s119 + 0)
.s120:
1edb : 98 __ __ TYA
1edc : 18 __ __ CLC
1edd : 65 16 __ ADC P9 ; (buff + 0)
1edf : aa __ __ TAX
1ee0 : a5 17 __ LDA P10 ; (buff + 1)
1ee2 : 69 00 __ ADC #$00
1ee4 : 4c f6 1e JMP $1ef6 ; (sformat.s1001 + 0)
.s119:
1ee7 : a5 16 __ LDA P9 ; (buff + 0)
1ee9 : 85 0d __ STA P0 
1eeb : a5 17 __ LDA P10 ; (buff + 1)
1eed : 85 0e __ STA P1 
1eef : 20 6c 22 JSR $226c ; (puts.s0 + 0)
.s1069:
1ef2 : a5 17 __ LDA P10 ; (buff + 1)
1ef4 : a6 16 __ LDX P9 ; (buff + 0)
.s1001:
1ef6 : 86 1b __ STX ACCU + 0 ; (fps + 0)
1ef8 : 85 1c __ STA ACCU + 1 ; (fps + 1)
1efa : 60 __ __ RTS
.s2:
1efb : c9 25 __ CMP #$25
1efd : f0 3e __ BEQ $1f3d ; (sformat.s4 + 0)
.s5:
1eff : a4 47 __ LDY T0 + 0 
1f01 : 91 16 __ STA (P9),y ; (buff + 0)
1f03 : e6 49 __ INC T1 + 0 
1f05 : d0 02 __ BNE $1f09 ; (sformat.s1102 + 0)
.s1101:
1f07 : e6 4a __ INC T1 + 1 
.s1102:
1f09 : c8 __ __ INY
1f0a : 84 47 __ STY T0 + 0 
1f0c : 98 __ __ TYA
1f0d : c0 28 __ CPY #$28
1f0f : 90 b8 __ BCC $1ec9 ; (sformat.l1 + 0)
.s110:
1f11 : 85 4c __ STA T5 + 0 
1f13 : a9 00 __ LDA #$00
1f15 : 85 47 __ STA T0 + 0 
1f17 : ad fd bf LDA $bffd ; (sstack + 4)
1f1a : f0 14 __ BEQ $1f30 ; (sformat.s114 + 0)
.s113:
1f1c : a5 16 __ LDA P9 ; (buff + 0)
1f1e : 85 0d __ STA P0 
1f20 : a5 17 __ LDA P10 ; (buff + 1)
1f22 : 85 0e __ STA P1 
1f24 : a9 00 __ LDA #$00
1f26 : a4 4c __ LDY T5 + 0 
1f28 : 91 16 __ STA (P9),y ; (buff + 0)
1f2a : 20 6c 22 JSR $226c ; (puts.s0 + 0)
1f2d : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s114:
1f30 : 18 __ __ CLC
1f31 : a5 16 __ LDA P9 ; (buff + 0)
1f33 : 65 4c __ ADC T5 + 0 
1f35 : 85 16 __ STA P9 ; (buff + 0)
1f37 : 90 90 __ BCC $1ec9 ; (sformat.l1 + 0)
.s1103:
1f39 : e6 17 __ INC P10 ; (buff + 1)
1f3b : b0 8c __ BCS $1ec9 ; (sformat.l1 + 0)
.s4:
1f3d : a5 47 __ LDA T0 + 0 
1f3f : f0 27 __ BEQ $1f68 ; (sformat.s9 + 0)
.s7:
1f41 : 84 47 __ STY T0 + 0 
1f43 : 85 4c __ STA T5 + 0 
1f45 : ad fd bf LDA $bffd ; (sstack + 4)
1f48 : f0 13 __ BEQ $1f5d ; (sformat.s11 + 0)
.s10:
1f4a : a5 16 __ LDA P9 ; (buff + 0)
1f4c : 85 0d __ STA P0 
1f4e : a5 17 __ LDA P10 ; (buff + 1)
1f50 : 85 0e __ STA P1 
1f52 : 98 __ __ TYA
1f53 : a4 4c __ LDY T5 + 0 
1f55 : 91 16 __ STA (P9),y ; (buff + 0)
1f57 : 20 6c 22 JSR $226c ; (puts.s0 + 0)
1f5a : 4c 68 1f JMP $1f68 ; (sformat.s9 + 0)
.s11:
1f5d : 18 __ __ CLC
1f5e : a5 16 __ LDA P9 ; (buff + 0)
1f60 : 65 4c __ ADC T5 + 0 
1f62 : 85 16 __ STA P9 ; (buff + 0)
1f64 : 90 02 __ BCC $1f68 ; (sformat.s9 + 0)
.s1099:
1f66 : e6 17 __ INC P10 ; (buff + 1)
.s9:
1f68 : a9 00 __ LDA #$00
1f6a : 8d e5 bf STA $bfe5 ; (xbuf0 + 60)
1f6d : 8d e6 bf STA $bfe6 ; (xbuf0 + 61)
1f70 : 8d e7 bf STA $bfe7 ; (xbuf0 + 62)
1f73 : 8d e8 bf STA $bfe8 ; (xbuf0 + 63)
1f76 : a9 0a __ LDA #$0a
1f78 : 8d e4 bf STA $bfe4 ; (xbuf0 + 59)
1f7b : a0 01 __ LDY #$01
1f7d : b1 49 __ LDA (T1 + 0),y 
1f7f : a2 20 __ LDX #$20
1f81 : 8e e1 bf STX $bfe1 ; (xbuf0 + 56)
1f84 : a2 00 __ LDX #$00
1f86 : 8e e2 bf STX $bfe2 ; (xbuf0 + 57)
1f89 : ca __ __ DEX
1f8a : 8e e3 bf STX $bfe3 ; (xbuf0 + 58)
1f8d : aa __ __ TAX
1f8e : 18 __ __ CLC
1f8f : a5 49 __ LDA T1 + 0 
1f91 : 69 02 __ ADC #$02
1f93 : 4c a0 1f JMP $1fa0 ; (sformat.l14 + 0)
.s264:
1f96 : a0 00 __ LDY #$00
1f98 : b1 49 __ LDA (T1 + 0),y 
1f9a : aa __ __ TAX
1f9b : 18 __ __ CLC
1f9c : a5 49 __ LDA T1 + 0 
1f9e : 69 01 __ ADC #$01
.l14:
1fa0 : 85 49 __ STA T1 + 0 
1fa2 : 90 02 __ BCC $1fa6 ; (sformat.s1086 + 0)
.s1085:
1fa4 : e6 4a __ INC T1 + 1 
.s1086:
1fa6 : 8a __ __ TXA
1fa7 : e0 2b __ CPX #$2b
1fa9 : d0 07 __ BNE $1fb2 ; (sformat.s17 + 0)
.s16:
1fab : a9 01 __ LDA #$01
1fad : 8d e6 bf STA $bfe6 ; (xbuf0 + 61)
1fb0 : d0 e4 __ BNE $1f96 ; (sformat.s264 + 0)
.s17:
1fb2 : c9 30 __ CMP #$30
1fb4 : d0 06 __ BNE $1fbc ; (sformat.s20 + 0)
.s19:
1fb6 : 8d e1 bf STA $bfe1 ; (xbuf0 + 56)
1fb9 : 4c 96 1f JMP $1f96 ; (sformat.s264 + 0)
.s20:
1fbc : c9 23 __ CMP #$23
1fbe : d0 07 __ BNE $1fc7 ; (sformat.s23 + 0)
.s22:
1fc0 : a9 01 __ LDA #$01
1fc2 : 8d e8 bf STA $bfe8 ; (xbuf0 + 63)
1fc5 : d0 cf __ BNE $1f96 ; (sformat.s264 + 0)
.s23:
1fc7 : c9 2d __ CMP #$2d
1fc9 : d0 07 __ BNE $1fd2 ; (sformat.s15 + 0)
.s25:
1fcb : a9 01 __ LDA #$01
1fcd : 8d e7 bf STA $bfe7 ; (xbuf0 + 62)
1fd0 : d0 c4 __ BNE $1f96 ; (sformat.s264 + 0)
.s15:
1fd2 : c9 30 __ CMP #$30
1fd4 : 90 5b __ BCC $2031 ; (sformat.s31 + 0)
.s32:
1fd6 : c9 3a __ CMP #$3a
1fd8 : b0 57 __ BCS $2031 ; (sformat.s31 + 0)
.s29:
1fda : 85 4c __ STA T5 + 0 
1fdc : a9 00 __ LDA #$00
1fde : 85 44 __ STA T6 + 0 
1fe0 : 85 45 __ STA T6 + 1 
1fe2 : e0 3a __ CPX #$3a
1fe4 : a6 1c __ LDX ACCU + 1 ; (fps + 1)
1fe6 : b0 40 __ BCS $2028 ; (sformat.s35 + 0)
.l34:
1fe8 : a5 44 __ LDA T6 + 0 
1fea : 0a __ __ ASL
1feb : 85 1b __ STA ACCU + 0 ; (fps + 0)
1fed : a5 45 __ LDA T6 + 1 
1fef : 2a __ __ ROL
1ff0 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
1ff2 : 2a __ __ ROL
1ff3 : aa __ __ TAX
1ff4 : 18 __ __ CLC
1ff5 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
1ff7 : 65 44 __ ADC T6 + 0 
1ff9 : 85 44 __ STA T6 + 0 
1ffb : 8a __ __ TXA
1ffc : 65 45 __ ADC T6 + 1 
1ffe : 06 44 __ ASL T6 + 0 
2000 : 2a __ __ ROL
2001 : a8 __ __ TAY
2002 : 18 __ __ CLC
2003 : a5 44 __ LDA T6 + 0 
2005 : 65 4c __ ADC T5 + 0 
2007 : 90 01 __ BCC $200a ; (sformat.s1096 + 0)
.s1095:
2009 : c8 __ __ INY
.s1096:
200a : 38 __ __ SEC
200b : e9 30 __ SBC #$30
200d : 85 44 __ STA T6 + 0 
200f : 98 __ __ TYA
2010 : e9 00 __ SBC #$00
2012 : 85 45 __ STA T6 + 1 
2014 : a0 00 __ LDY #$00
2016 : b1 49 __ LDA (T1 + 0),y 
2018 : 85 4c __ STA T5 + 0 
201a : e6 49 __ INC T1 + 0 
201c : d0 02 __ BNE $2020 ; (sformat.s1098 + 0)
.s1097:
201e : e6 4a __ INC T1 + 1 
.s1098:
2020 : c9 30 __ CMP #$30
2022 : 90 04 __ BCC $2028 ; (sformat.s35 + 0)
.s36:
2024 : c9 3a __ CMP #$3a
2026 : 90 c0 __ BCC $1fe8 ; (sformat.l34 + 0)
.s35:
2028 : 86 1c __ STX ACCU + 1 ; (fps + 1)
202a : a5 44 __ LDA T6 + 0 
202c : 8d e2 bf STA $bfe2 ; (xbuf0 + 57)
202f : a5 4c __ LDA T5 + 0 
.s31:
2031 : c9 2e __ CMP #$2e
2033 : d0 52 __ BNE $2087 ; (sformat.s39 + 0)
.s37:
2035 : a9 00 __ LDA #$00
2037 : 85 44 __ STA T6 + 0 
2039 : a6 1c __ LDX ACCU + 1 ; (fps + 1)
203b : 4c 46 20 JMP $2046 ; (sformat.l243 + 0)
.s1094:
203e : 38 __ __ SEC
203f : e9 30 __ SBC #$30
2041 : 85 44 __ STA T6 + 0 
2043 : 98 __ __ TYA
2044 : e9 00 __ SBC #$00
.l243:
2046 : 85 45 __ STA T6 + 1 
2048 : a0 00 __ LDY #$00
204a : b1 49 __ LDA (T1 + 0),y 
204c : 85 4c __ STA T5 + 0 
204e : e6 49 __ INC T1 + 0 
2050 : d0 02 __ BNE $2054 ; (sformat.s1088 + 0)
.s1087:
2052 : e6 4a __ INC T1 + 1 
.s1088:
2054 : c9 30 __ CMP #$30
2056 : 90 28 __ BCC $2080 ; (sformat.s42 + 0)
.s43:
2058 : c9 3a __ CMP #$3a
205a : b0 24 __ BCS $2080 ; (sformat.s42 + 0)
.s41:
205c : a5 44 __ LDA T6 + 0 
205e : 0a __ __ ASL
205f : 85 1b __ STA ACCU + 0 ; (fps + 0)
2061 : a5 45 __ LDA T6 + 1 
2063 : 2a __ __ ROL
2064 : 06 1b __ ASL ACCU + 0 ; (fps + 0)
2066 : 2a __ __ ROL
2067 : aa __ __ TAX
2068 : 18 __ __ CLC
2069 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
206b : 65 44 __ ADC T6 + 0 
206d : 85 44 __ STA T6 + 0 
206f : 8a __ __ TXA
2070 : 65 45 __ ADC T6 + 1 
2072 : 06 44 __ ASL T6 + 0 
2074 : 2a __ __ ROL
2075 : a8 __ __ TAY
2076 : 18 __ __ CLC
2077 : a5 44 __ LDA T6 + 0 
2079 : 65 4c __ ADC T5 + 0 
207b : 90 c1 __ BCC $203e ; (sformat.s1094 + 0)
.s1093:
207d : c8 __ __ INY
207e : b0 be __ BCS $203e ; (sformat.s1094 + 0)
.s42:
2080 : 86 1c __ STX ACCU + 1 ; (fps + 1)
2082 : a6 44 __ LDX T6 + 0 
2084 : 8e e3 bf STX $bfe3 ; (xbuf0 + 58)
.s39:
2087 : c9 64 __ CMP #$64
2089 : f0 04 __ BEQ $208f ; (sformat.s44 + 0)
.s47:
208b : c9 44 __ CMP #$44
208d : d0 05 __ BNE $2094 ; (sformat.s45 + 0)
.s44:
208f : a9 01 __ LDA #$01
2091 : 4c 30 22 JMP $2230 ; (sformat.s261 + 0)
.s45:
2094 : c9 75 __ CMP #$75
2096 : f0 04 __ BEQ $209c ; (sformat.s1160 + 0)
.s51:
2098 : c9 55 __ CMP #$55
209a : d0 05 __ BNE $20a1 ; (sformat.s49 + 0)
.s1160:
209c : a9 00 __ LDA #$00
209e : 4c 30 22 JMP $2230 ; (sformat.s261 + 0)
.s49:
20a1 : c9 78 __ CMP #$78
20a3 : f0 04 __ BEQ $20a9 ; (sformat.s52 + 0)
.s55:
20a5 : c9 58 __ CMP #$58
20a7 : d0 0d __ BNE $20b6 ; (sformat.s53 + 0)
.s52:
20a9 : a9 10 __ LDA #$10
20ab : 8d e4 bf STA $bfe4 ; (xbuf0 + 59)
20ae : a9 00 __ LDA #$00
20b0 : 8d e5 bf STA $bfe5 ; (xbuf0 + 60)
20b3 : 4c 30 22 JMP $2230 ; (sformat.s261 + 0)
.s53:
20b6 : c9 6c __ CMP #$6c
20b8 : d0 03 __ BNE $20bd ; (sformat.s59 + 0)
20ba : 4c b2 21 JMP $21b2 ; (sformat.s56 + 0)
.s59:
20bd : c9 4c __ CMP #$4c
20bf : d0 03 __ BNE $20c4 ; (sformat.s57 + 0)
20c1 : 4c b2 21 JMP $21b2 ; (sformat.s56 + 0)
.s57:
20c4 : c9 73 __ CMP #$73
20c6 : f0 38 __ BEQ $2100 ; (sformat.s72 + 0)
.s75:
20c8 : c9 53 __ CMP #$53
20ca : f0 34 __ BEQ $2100 ; (sformat.s72 + 0)
.s73:
20cc : c9 63 __ CMP #$63
20ce : f0 14 __ BEQ $20e4 ; (sformat.s103 + 0)
.s106:
20d0 : c9 43 __ CMP #$43
20d2 : f0 10 __ BEQ $20e4 ; (sformat.s103 + 0)
.s104:
20d4 : 09 00 __ ORA #$00
20d6 : d0 03 __ BNE $20db ; (sformat.s263 + 0)
20d8 : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s263:
20db : a4 47 __ LDY T0 + 0 
20dd : 91 16 __ STA (P9),y ; (buff + 0)
20df : e6 47 __ INC T0 + 0 
20e1 : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s103:
20e4 : ad fb bf LDA $bffb ; (sstack + 2)
20e7 : 85 4c __ STA T5 + 0 
20e9 : 18 __ __ CLC
20ea : 69 02 __ ADC #$02
20ec : 8d fb bf STA $bffb ; (sstack + 2)
20ef : ad fc bf LDA $bffc ; (sstack + 3)
20f2 : 85 4d __ STA T5 + 1 
20f4 : 69 00 __ ADC #$00
20f6 : 8d fc bf STA $bffc ; (sstack + 3)
20f9 : a0 00 __ LDY #$00
20fb : b1 4c __ LDA (T5 + 0),y 
20fd : 4c db 20 JMP $20db ; (sformat.s263 + 0)
.s72:
2100 : ad fb bf LDA $bffb ; (sstack + 2)
2103 : 85 4c __ STA T5 + 0 
2105 : 18 __ __ CLC
2106 : 69 02 __ ADC #$02
2108 : 8d fb bf STA $bffb ; (sstack + 2)
210b : ad fc bf LDA $bffc ; (sstack + 3)
210e : 85 4d __ STA T5 + 1 
2110 : 69 00 __ ADC #$00
2112 : 8d fc bf STA $bffc ; (sstack + 3)
2115 : a0 00 __ LDY #$00
2117 : 84 4b __ STY T3 + 0 
2119 : b1 4c __ LDA (T5 + 0),y 
211b : aa __ __ TAX
211c : c8 __ __ INY
211d : b1 4c __ LDA (T5 + 0),y 
211f : 86 4c __ STX T5 + 0 
2121 : 85 4d __ STA T5 + 1 
2123 : ad e2 bf LDA $bfe2 ; (xbuf0 + 57)
2126 : f0 0c __ BEQ $2134 ; (sformat.s78 + 0)
.s1078:
2128 : 88 __ __ DEY
2129 : b1 4c __ LDA (T5 + 0),y 
212b : f0 05 __ BEQ $2132 ; (sformat.s1079 + 0)
.l80:
212d : c8 __ __ INY
212e : b1 4c __ LDA (T5 + 0),y 
2130 : d0 fb __ BNE $212d ; (sformat.l80 + 0)
.s1079:
2132 : 84 4b __ STY T3 + 0 
.s78:
2134 : ad e7 bf LDA $bfe7 ; (xbuf0 + 62)
2137 : d0 19 __ BNE $2152 ; (sformat.s84 + 0)
.s1076:
2139 : a6 4b __ LDX T3 + 0 
213b : ec e2 bf CPX $bfe2 ; (xbuf0 + 57)
213e : a4 47 __ LDY T0 + 0 
2140 : b0 0c __ BCS $214e ; (sformat.s1077 + 0)
.l86:
2142 : ad e1 bf LDA $bfe1 ; (xbuf0 + 56)
2145 : 91 16 __ STA (P9),y ; (buff + 0)
2147 : c8 __ __ INY
2148 : e8 __ __ INX
2149 : ec e2 bf CPX $bfe2 ; (xbuf0 + 57)
214c : 90 f4 __ BCC $2142 ; (sformat.l86 + 0)
.s1077:
214e : 86 4b __ STX T3 + 0 
2150 : 84 47 __ STY T0 + 0 
.s84:
2152 : ad fd bf LDA $bffd ; (sstack + 4)
2155 : d0 37 __ BNE $218e ; (sformat.s88 + 0)
.l94:
2157 : a0 00 __ LDY #$00
2159 : b1 4c __ LDA (T5 + 0),y 
215b : f0 0f __ BEQ $216c ; (sformat.s251 + 0)
.s95:
215d : a4 47 __ LDY T0 + 0 
215f : 91 16 __ STA (P9),y ; (buff + 0)
2161 : e6 47 __ INC T0 + 0 
2163 : e6 4c __ INC T5 + 0 
2165 : d0 f0 __ BNE $2157 ; (sformat.l94 + 0)
.s1091:
2167 : e6 4d __ INC T5 + 1 
2169 : 4c 57 21 JMP $2157 ; (sformat.l94 + 0)
.s251:
216c : ad e7 bf LDA $bfe7 ; (xbuf0 + 62)
216f : d0 03 __ BNE $2174 ; (sformat.s1072 + 0)
2171 : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s1072:
2174 : a6 4b __ LDX T3 + 0 
2176 : ec e2 bf CPX $bfe2 ; (xbuf0 + 57)
2179 : a4 47 __ LDY T0 + 0 
217b : b0 0c __ BCS $2189 ; (sformat.s1080 + 0)
.l101:
217d : ad e1 bf LDA $bfe1 ; (xbuf0 + 56)
2180 : 91 16 __ STA (P9),y ; (buff + 0)
2182 : c8 __ __ INY
2183 : e8 __ __ INX
2184 : ec e2 bf CPX $bfe2 ; (xbuf0 + 57)
2187 : 90 f4 __ BCC $217d ; (sformat.l101 + 0)
.s1080:
2189 : 84 47 __ STY T0 + 0 
218b : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s88:
218e : a5 47 __ LDA T0 + 0 
2190 : f0 12 __ BEQ $21a4 ; (sformat.s93 + 0)
.s91:
2192 : a6 16 __ LDX P9 ; (buff + 0)
2194 : 86 0d __ STX P0 
2196 : a6 17 __ LDX P10 ; (buff + 1)
2198 : 86 0e __ STX P1 
219a : a8 __ __ TAY
219b : a9 00 __ LDA #$00
219d : 85 47 __ STA T0 + 0 
219f : 91 16 __ STA (P9),y ; (buff + 0)
21a1 : 20 6c 22 JSR $226c ; (puts.s0 + 0)
.s93:
21a4 : a5 4c __ LDA T5 + 0 
21a6 : 85 0d __ STA P0 
21a8 : a5 4d __ LDA T5 + 1 
21aa : 85 0e __ STA P1 
21ac : 20 6c 22 JSR $226c ; (puts.s0 + 0)
21af : 4c 6c 21 JMP $216c ; (sformat.s251 + 0)
.s56:
21b2 : ad fb bf LDA $bffb ; (sstack + 2)
21b5 : 85 4c __ STA T5 + 0 
21b7 : 18 __ __ CLC
21b8 : 69 04 __ ADC #$04
21ba : 8d fb bf STA $bffb ; (sstack + 2)
21bd : ad fc bf LDA $bffc ; (sstack + 3)
21c0 : 85 4d __ STA T5 + 1 
21c2 : 69 00 __ ADC #$00
21c4 : 8d fc bf STA $bffc ; (sstack + 3)
21c7 : a0 00 __ LDY #$00
21c9 : b1 49 __ LDA (T1 + 0),y 
21cb : aa __ __ TAX
21cc : e6 49 __ INC T1 + 0 
21ce : d0 02 __ BNE $21d2 ; (sformat.s1090 + 0)
.s1089:
21d0 : e6 4a __ INC T1 + 1 
.s1090:
21d2 : b1 4c __ LDA (T5 + 0),y 
21d4 : 85 11 __ STA P4 
21d6 : a0 01 __ LDY #$01
21d8 : b1 4c __ LDA (T5 + 0),y 
21da : 85 12 __ STA P5 
21dc : c8 __ __ INY
21dd : b1 4c __ LDA (T5 + 0),y 
21df : 85 13 __ STA P6 
21e1 : c8 __ __ INY
21e2 : b1 4c __ LDA (T5 + 0),y 
21e4 : 85 14 __ STA P7 
21e6 : 8a __ __ TXA
21e7 : e0 64 __ CPX #$64
21e9 : f0 04 __ BEQ $21ef ; (sformat.s60 + 0)
.s63:
21eb : c9 44 __ CMP #$44
21ed : d0 04 __ BNE $21f3 ; (sformat.s61 + 0)
.s60:
21ef : a9 01 __ LDA #$01
21f1 : d0 21 __ BNE $2214 ; (sformat.s262 + 0)
.s61:
21f3 : c9 75 __ CMP #$75
21f5 : f0 04 __ BEQ $21fb ; (sformat.s1161 + 0)
.s67:
21f7 : c9 55 __ CMP #$55
21f9 : d0 04 __ BNE $21ff ; (sformat.s65 + 0)
.s1161:
21fb : a9 00 __ LDA #$00
21fd : f0 15 __ BEQ $2214 ; (sformat.s262 + 0)
.s65:
21ff : c9 78 __ CMP #$78
2201 : f0 07 __ BEQ $220a ; (sformat.s68 + 0)
.s71:
2203 : c9 58 __ CMP #$58
2205 : f0 03 __ BEQ $220a ; (sformat.s68 + 0)
2207 : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s68:
220a : a9 10 __ LDA #$10
220c : 8d e4 bf STA $bfe4 ; (xbuf0 + 59)
220f : a9 00 __ LDA #$00
2211 : 8d e5 bf STA $bfe5 ; (xbuf0 + 60)
.s262:
2214 : 85 15 __ STA P8 
2216 : a5 16 __ LDA P9 ; (buff + 0)
2218 : 85 0f __ STA P2 
221a : a5 17 __ LDA P10 ; (buff + 1)
221c : 85 10 __ STA P3 
221e : a9 e1 __ LDA #$e1
2220 : 85 0d __ STA P0 
2222 : a9 bf __ LDA #$bf
2224 : 85 0e __ STA P1 
2226 : 20 fc 23 JSR $23fc ; (nforml.s0 + 0)
.s1068:
2229 : a5 1b __ LDA ACCU + 0 ; (fps + 0)
222b : 85 47 __ STA T0 + 0 
222d : 4c c9 1e JMP $1ec9 ; (sformat.l1 + 0)
.s261:
2230 : 85 13 __ STA P6 
2232 : a5 16 __ LDA P9 ; (buff + 0)
2234 : 85 0f __ STA P2 
2236 : a5 17 __ LDA P10 ; (buff + 1)
2238 : 85 10 __ STA P3 
223a : ad fb bf LDA $bffb ; (sstack + 2)
223d : 85 47 __ STA T0 + 0 
223f : ad fc bf LDA $bffc ; (sstack + 3)
2242 : 85 48 __ STA T0 + 1 
2244 : a0 00 __ LDY #$00
2246 : b1 47 __ LDA (T0 + 0),y 
2248 : 85 11 __ STA P4 
224a : c8 __ __ INY
224b : b1 47 __ LDA (T0 + 0),y 
224d : 85 12 __ STA P5 
224f : 18 __ __ CLC
2250 : a5 47 __ LDA T0 + 0 
2252 : 69 02 __ ADC #$02
2254 : 8d fb bf STA $bffb ; (sstack + 2)
2257 : a5 48 __ LDA T0 + 1 
2259 : 69 00 __ ADC #$00
225b : 8d fc bf STA $bffc ; (sstack + 3)
225e : a9 e1 __ LDA #$e1
2260 : 85 0d __ STA P0 
2262 : a9 bf __ LDA #$bf
2264 : 85 0e __ STA P1 
2266 : 20 c1 22 JSR $22c1 ; (nformi.s0 + 0)
2269 : 4c 29 22 JMP $2229 ; (sformat.s1068 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
226c : a0 00 __ LDY #$00
226e : b1 0d __ LDA (P0),y 
2270 : f0 0b __ BEQ $227d ; (puts.s1001 + 0)
2272 : 20 7e 22 JSR $227e ; (putpch + 0)
2275 : e6 0d __ INC P0 
2277 : d0 f3 __ BNE $226c ; (puts.s0 + 0)
2279 : e6 0e __ INC P1 
227b : d0 ef __ BNE $226c ; (puts.s0 + 0)
.s1001:
227d : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
227e : ae ff 25 LDX $25ff ; (giocharmap + 0)
2281 : e0 01 __ CPX #$01
2283 : 90 26 __ BCC $22ab ; (putpch + 45)
2285 : c9 0a __ CMP #$0a
2287 : d0 02 __ BNE $228b ; (putpch + 13)
2289 : a9 0d __ LDA #$0d
228b : c9 09 __ CMP #$09
228d : f0 1f __ BEQ $22ae ; (putpch + 48)
228f : e0 02 __ CPX #$02
2291 : 90 18 __ BCC $22ab ; (putpch + 45)
2293 : c9 41 __ CMP #$41
2295 : 90 14 __ BCC $22ab ; (putpch + 45)
2297 : c9 7b __ CMP #$7b
2299 : b0 10 __ BCS $22ab ; (putpch + 45)
229b : c9 61 __ CMP #$61
229d : b0 04 __ BCS $22a3 ; (putpch + 37)
229f : c9 5b __ CMP #$5b
22a1 : b0 08 __ BCS $22ab ; (putpch + 45)
22a3 : 49 20 __ EOR #$20
22a5 : e0 03 __ CPX #$03
22a7 : f0 02 __ BEQ $22ab ; (putpch + 45)
22a9 : 29 df __ AND #$df
22ab : 4c d2 ff JMP $ffd2 
22ae : 38 __ __ SEC
22af : 20 f0 ff JSR $fff0 
22b2 : 98 __ __ TYA
22b3 : 29 03 __ AND #$03
22b5 : 49 03 __ EOR #$03
22b7 : aa __ __ TAX
22b8 : a9 20 __ LDA #$20
22ba : 20 d2 ff JSR $ffd2 
22bd : ca __ __ DEX
22be : 10 fa __ BPL $22ba ; (putpch + 60)
22c0 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
22c1 : a9 00 __ LDA #$00
22c3 : 85 43 __ STA T0 + 0 
22c5 : a5 13 __ LDA P6 ; (s + 0)
22c7 : f0 19 __ BEQ $22e2 ; (nformi.s3 + 0)
.s4:
22c9 : 24 12 __ BIT P5 ; (v + 1)
22cb : 10 15 __ BPL $22e2 ; (nformi.s3 + 0)
.s1:
22cd : 38 __ __ SEC
22ce : a9 00 __ LDA #$00
22d0 : e5 11 __ SBC P4 ; (v + 0)
22d2 : 85 11 __ STA P4 ; (v + 0)
22d4 : a9 00 __ LDA #$00
22d6 : e5 12 __ SBC P5 ; (v + 1)
22d8 : 85 12 __ STA P5 ; (v + 1)
22da : e6 43 __ INC T0 + 0 
22dc : a9 10 __ LDA #$10
22de : 85 44 __ STA T2 + 0 
22e0 : d0 0a __ BNE $22ec ; (nformi.s42 + 0)
.s3:
22e2 : a9 10 __ LDA #$10
22e4 : 85 44 __ STA T2 + 0 
22e6 : a5 11 __ LDA P4 ; (v + 0)
22e8 : 05 12 __ ORA P5 ; (v + 1)
22ea : f0 46 __ BEQ $2332 ; (nformi.s7 + 0)
.s42:
22ec : a0 03 __ LDY #$03
22ee : b1 0d __ LDA (P0),y ; (si + 0)
22f0 : 85 45 __ STA T3 + 0 
22f2 : c8 __ __ INY
22f3 : b1 0d __ LDA (P0),y ; (si + 0)
22f5 : 85 46 __ STA T3 + 1 
.l6:
22f7 : a5 11 __ LDA P4 ; (v + 0)
22f9 : 85 1b __ STA ACCU + 0 
22fb : a5 12 __ LDA P5 ; (v + 1)
22fd : 85 1c __ STA ACCU + 1 
22ff : a5 45 __ LDA T3 + 0 
2301 : 85 03 __ STA WORK + 0 
2303 : a5 46 __ LDA T3 + 1 
2305 : 85 04 __ STA WORK + 1 
2307 : 20 52 4f JSR $4f52 ; (divmod + 0)
230a : a5 06 __ LDA WORK + 3 
230c : 30 08 __ BMI $2316 ; (nformi.s78 + 0)
.s1019:
230e : d0 0a __ BNE $231a ; (nformi.s77 + 0)
.s1018:
2310 : a5 05 __ LDA WORK + 2 
2312 : c9 0a __ CMP #$0a
2314 : b0 04 __ BCS $231a ; (nformi.s77 + 0)
.s78:
2316 : a9 30 __ LDA #$30
2318 : d0 02 __ BNE $231c ; (nformi.s79 + 0)
.s77:
231a : a9 37 __ LDA #$37
.s79:
231c : c6 44 __ DEC T2 + 0 
231e : 18 __ __ CLC
231f : 65 05 __ ADC WORK + 2 
2321 : a6 44 __ LDX T2 + 0 
2323 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
2326 : a5 1b __ LDA ACCU + 0 
2328 : 85 11 __ STA P4 ; (v + 0)
232a : a5 1c __ LDA ACCU + 1 
232c : 85 12 __ STA P5 ; (v + 1)
232e : 05 11 __ ORA P4 ; (v + 0)
2330 : d0 c5 __ BNE $22f7 ; (nformi.l6 + 0)
.s7:
2332 : a0 02 __ LDY #$02
2334 : b1 0d __ LDA (P0),y ; (si + 0)
2336 : c9 ff __ CMP #$ff
2338 : d0 04 __ BNE $233e ; (nformi.s80 + 0)
.s81:
233a : a9 0f __ LDA #$0f
233c : d0 05 __ BNE $2343 ; (nformi.s1026 + 0)
.s80:
233e : 38 __ __ SEC
233f : a9 10 __ LDA #$10
2341 : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2343 : a8 __ __ TAY
2344 : c4 44 __ CPY T2 + 0 
2346 : b0 0d __ BCS $2355 ; (nformi.s10 + 0)
.s9:
2348 : a9 30 __ LDA #$30
.l1035:
234a : c6 44 __ DEC T2 + 0 
234c : a6 44 __ LDX T2 + 0 
234e : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
2351 : c4 44 __ CPY T2 + 0 
2353 : 90 f5 __ BCC $234a ; (nformi.l1035 + 0)
.s10:
2355 : a0 07 __ LDY #$07
2357 : b1 0d __ LDA (P0),y ; (si + 0)
2359 : f0 20 __ BEQ $237b ; (nformi.s13 + 0)
.s14:
235b : a0 04 __ LDY #$04
235d : b1 0d __ LDA (P0),y ; (si + 0)
235f : d0 1a __ BNE $237b ; (nformi.s13 + 0)
.s1013:
2361 : 88 __ __ DEY
2362 : b1 0d __ LDA (P0),y ; (si + 0)
2364 : c9 10 __ CMP #$10
2366 : d0 13 __ BNE $237b ; (nformi.s13 + 0)
.s11:
2368 : a9 58 __ LDA #$58
236a : a6 44 __ LDX T2 + 0 
236c : 9d e8 bf STA $bfe8,x ; (xbuf0 + 63)
236f : 8a __ __ TXA
2370 : 18 __ __ CLC
2371 : 69 fe __ ADC #$fe
2373 : 85 44 __ STA T2 + 0 
2375 : aa __ __ TAX
2376 : a9 30 __ LDA #$30
2378 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
.s13:
237b : a9 00 __ LDA #$00
237d : 85 1b __ STA ACCU + 0 
237f : a5 43 __ LDA T0 + 0 
2381 : f0 06 __ BEQ $2389 ; (nformi.s16 + 0)
.s15:
2383 : c6 44 __ DEC T2 + 0 
2385 : a9 2d __ LDA #$2d
2387 : d0 0a __ BNE $2393 ; (nformi.s1025 + 0)
.s16:
2389 : a0 05 __ LDY #$05
238b : b1 0d __ LDA (P0),y ; (si + 0)
238d : f0 09 __ BEQ $2398 ; (nformi.s162 + 0)
.s18:
238f : c6 44 __ DEC T2 + 0 
2391 : a9 2b __ LDA #$2b
.s1025:
2393 : a6 44 __ LDX T2 + 0 
2395 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
.s162:
2398 : a0 06 __ LDY #$06
239a : b1 0d __ LDA (P0),y ; (si + 0)
239c : d0 33 __ BNE $23d1 ; (nformi.s24 + 0)
.l30:
239e : a0 01 __ LDY #$01
23a0 : b1 0d __ LDA (P0),y ; (si + 0)
23a2 : 18 __ __ CLC
23a3 : 65 44 __ ADC T2 + 0 
23a5 : b0 04 __ BCS $23ab ; (nformi.s31 + 0)
.s1006:
23a7 : c9 11 __ CMP #$11
23a9 : 90 0d __ BCC $23b8 ; (nformi.s33 + 0)
.s31:
23ab : c6 44 __ DEC T2 + 0 
23ad : a0 00 __ LDY #$00
23af : b1 0d __ LDA (P0),y ; (si + 0)
23b1 : a6 44 __ LDX T2 + 0 
23b3 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
23b6 : b0 e6 __ BCS $239e ; (nformi.l30 + 0)
.s33:
23b8 : a6 44 __ LDX T2 + 0 
23ba : e0 10 __ CPX #$10
23bc : b0 0e __ BCS $23cc ; (nformi.s23 + 0)
.s34:
23be : 88 __ __ DEY
.l1022:
23bf : bd e9 bf LDA $bfe9,x ; (xbuf0 + 64)
23c2 : 91 0f __ STA (P2),y ; (str + 0)
23c4 : c8 __ __ INY
23c5 : e8 __ __ INX
23c6 : e0 10 __ CPX #$10
23c8 : 90 f5 __ BCC $23bf ; (nformi.l1022 + 0)
.s1023:
23ca : 84 1b __ STY ACCU + 0 
.s23:
23cc : a9 00 __ LDA #$00
23ce : 85 1c __ STA ACCU + 1 
.s1001:
23d0 : 60 __ __ RTS
.s24:
23d1 : a6 44 __ LDX T2 + 0 
23d3 : e0 10 __ CPX #$10
23d5 : b0 1a __ BCS $23f1 ; (nformi.l27 + 0)
.s25:
23d7 : a0 00 __ LDY #$00
.l1020:
23d9 : bd e9 bf LDA $bfe9,x ; (xbuf0 + 64)
23dc : 91 0f __ STA (P2),y ; (str + 0)
23de : c8 __ __ INY
23df : e8 __ __ INX
23e0 : e0 10 __ CPX #$10
23e2 : 90 f5 __ BCC $23d9 ; (nformi.l1020 + 0)
.s1021:
23e4 : 84 1b __ STY ACCU + 0 
23e6 : b0 09 __ BCS $23f1 ; (nformi.l27 + 0)
.s28:
23e8 : 88 __ __ DEY
23e9 : b1 0d __ LDA (P0),y ; (si + 0)
23eb : a4 1b __ LDY ACCU + 0 
23ed : 91 0f __ STA (P2),y ; (str + 0)
23ef : e6 1b __ INC ACCU + 0 
.l27:
23f1 : a5 1b __ LDA ACCU + 0 
23f3 : a0 01 __ LDY #$01
23f5 : d1 0d __ CMP (P0),y ; (si + 0)
23f7 : 90 ef __ BCC $23e8 ; (nformi.s28 + 0)
23f9 : 4c cc 23 JMP $23cc ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
23fc : a9 00 __ LDA #$00
23fe : 85 43 __ STA T0 + 0 
2400 : a5 15 __ LDA P8 ; (s + 0)
2402 : f0 21 __ BEQ $2425 ; (nforml.s182 + 0)
.s4:
2404 : a5 14 __ LDA P7 ; (v + 3)
2406 : f0 1d __ BEQ $2425 ; (nforml.s182 + 0)
.s1032:
2408 : 10 1b __ BPL $2425 ; (nforml.s182 + 0)
.s1:
240a : 38 __ __ SEC
240b : a9 00 __ LDA #$00
240d : e5 11 __ SBC P4 ; (v + 0)
240f : 85 11 __ STA P4 ; (v + 0)
2411 : a9 00 __ LDA #$00
2413 : e5 12 __ SBC P5 ; (v + 1)
2415 : 85 12 __ STA P5 ; (v + 1)
2417 : a9 00 __ LDA #$00
2419 : e5 13 __ SBC P6 ; (v + 2)
241b : 85 13 __ STA P6 ; (v + 2)
241d : a9 00 __ LDA #$00
241f : e5 14 __ SBC P7 ; (v + 3)
2421 : 85 14 __ STA P7 ; (v + 3)
2423 : e6 43 __ INC T0 + 0 
.s182:
2425 : a9 10 __ LDA #$10
2427 : 85 44 __ STA T2 + 0 
2429 : a5 14 __ LDA P7 ; (v + 3)
242b : d0 0c __ BNE $2439 ; (nforml.s42 + 0)
.s1024:
242d : a5 13 __ LDA P6 ; (v + 2)
242f : d0 08 __ BNE $2439 ; (nforml.s42 + 0)
.s1025:
2431 : a5 12 __ LDA P5 ; (v + 1)
2433 : d0 04 __ BNE $2439 ; (nforml.s42 + 0)
.s1026:
2435 : c5 11 __ CMP P4 ; (v + 0)
2437 : b0 0e __ BCS $2447 ; (nforml.s7 + 0)
.s42:
2439 : a0 03 __ LDY #$03
243b : b1 0d __ LDA (P0),y ; (si + 0)
243d : 85 45 __ STA T5 + 0 
243f : c8 __ __ INY
2440 : b1 0d __ LDA (P0),y ; (si + 0)
2442 : 85 46 __ STA T5 + 1 
2444 : 4c 11 25 JMP $2511 ; (nforml.l6 + 0)
.s7:
2447 : a0 02 __ LDY #$02
2449 : b1 0d __ LDA (P0),y ; (si + 0)
244b : c9 ff __ CMP #$ff
244d : d0 04 __ BNE $2453 ; (nforml.s80 + 0)
.s81:
244f : a9 0f __ LDA #$0f
2451 : d0 05 __ BNE $2458 ; (nforml.s1039 + 0)
.s80:
2453 : 38 __ __ SEC
2454 : a9 10 __ LDA #$10
2456 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2458 : a8 __ __ TAY
2459 : c4 44 __ CPY T2 + 0 
245b : b0 0d __ BCS $246a ; (nforml.s10 + 0)
.s9:
245d : a9 30 __ LDA #$30
.l1048:
245f : c6 44 __ DEC T2 + 0 
2461 : a6 44 __ LDX T2 + 0 
2463 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
2466 : c4 44 __ CPY T2 + 0 
2468 : 90 f5 __ BCC $245f ; (nforml.l1048 + 0)
.s10:
246a : a0 07 __ LDY #$07
246c : b1 0d __ LDA (P0),y ; (si + 0)
246e : f0 20 __ BEQ $2490 ; (nforml.s13 + 0)
.s14:
2470 : a0 04 __ LDY #$04
2472 : b1 0d __ LDA (P0),y ; (si + 0)
2474 : d0 1a __ BNE $2490 ; (nforml.s13 + 0)
.s1013:
2476 : 88 __ __ DEY
2477 : b1 0d __ LDA (P0),y ; (si + 0)
2479 : c9 10 __ CMP #$10
247b : d0 13 __ BNE $2490 ; (nforml.s13 + 0)
.s11:
247d : a9 58 __ LDA #$58
247f : a6 44 __ LDX T2 + 0 
2481 : 9d e8 bf STA $bfe8,x ; (xbuf0 + 63)
2484 : 8a __ __ TXA
2485 : 18 __ __ CLC
2486 : 69 fe __ ADC #$fe
2488 : 85 44 __ STA T2 + 0 
248a : aa __ __ TAX
248b : a9 30 __ LDA #$30
248d : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
.s13:
2490 : a9 00 __ LDA #$00
2492 : 85 1b __ STA ACCU + 0 
2494 : a5 43 __ LDA T0 + 0 
2496 : f0 06 __ BEQ $249e ; (nforml.s16 + 0)
.s15:
2498 : c6 44 __ DEC T2 + 0 
249a : a9 2d __ LDA #$2d
249c : d0 0a __ BNE $24a8 ; (nforml.s1038 + 0)
.s16:
249e : a0 05 __ LDY #$05
24a0 : b1 0d __ LDA (P0),y ; (si + 0)
24a2 : f0 09 __ BEQ $24ad ; (nforml.s163 + 0)
.s18:
24a4 : c6 44 __ DEC T2 + 0 
24a6 : a9 2b __ LDA #$2b
.s1038:
24a8 : a6 44 __ LDX T2 + 0 
24aa : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
.s163:
24ad : a0 06 __ LDY #$06
24af : b1 0d __ LDA (P0),y ; (si + 0)
24b1 : d0 33 __ BNE $24e6 ; (nforml.s24 + 0)
.l30:
24b3 : a0 01 __ LDY #$01
24b5 : b1 0d __ LDA (P0),y ; (si + 0)
24b7 : 18 __ __ CLC
24b8 : 65 44 __ ADC T2 + 0 
24ba : b0 04 __ BCS $24c0 ; (nforml.s31 + 0)
.s1006:
24bc : c9 11 __ CMP #$11
24be : 90 0d __ BCC $24cd ; (nforml.s33 + 0)
.s31:
24c0 : c6 44 __ DEC T2 + 0 
24c2 : a0 00 __ LDY #$00
24c4 : b1 0d __ LDA (P0),y ; (si + 0)
24c6 : a6 44 __ LDX T2 + 0 
24c8 : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
24cb : b0 e6 __ BCS $24b3 ; (nforml.l30 + 0)
.s33:
24cd : a6 44 __ LDX T2 + 0 
24cf : e0 10 __ CPX #$10
24d1 : b0 0e __ BCS $24e1 ; (nforml.s23 + 0)
.s34:
24d3 : 88 __ __ DEY
.l1035:
24d4 : bd e9 bf LDA $bfe9,x ; (xbuf0 + 64)
24d7 : 91 0f __ STA (P2),y ; (str + 0)
24d9 : c8 __ __ INY
24da : e8 __ __ INX
24db : e0 10 __ CPX #$10
24dd : 90 f5 __ BCC $24d4 ; (nforml.l1035 + 0)
.s1036:
24df : 84 1b __ STY ACCU + 0 
.s23:
24e1 : a9 00 __ LDA #$00
24e3 : 85 1c __ STA ACCU + 1 
.s1001:
24e5 : 60 __ __ RTS
.s24:
24e6 : a6 44 __ LDX T2 + 0 
24e8 : e0 10 __ CPX #$10
24ea : b0 1a __ BCS $2506 ; (nforml.l27 + 0)
.s25:
24ec : a0 00 __ LDY #$00
.l1033:
24ee : bd e9 bf LDA $bfe9,x ; (xbuf0 + 64)
24f1 : 91 0f __ STA (P2),y ; (str + 0)
24f3 : c8 __ __ INY
24f4 : e8 __ __ INX
24f5 : e0 10 __ CPX #$10
24f7 : 90 f5 __ BCC $24ee ; (nforml.l1033 + 0)
.s1034:
24f9 : 84 1b __ STY ACCU + 0 
24fb : b0 09 __ BCS $2506 ; (nforml.l27 + 0)
.s28:
24fd : 88 __ __ DEY
24fe : b1 0d __ LDA (P0),y ; (si + 0)
2500 : a4 1b __ LDY ACCU + 0 
2502 : 91 0f __ STA (P2),y ; (str + 0)
2504 : e6 1b __ INC ACCU + 0 
.l27:
2506 : a5 1b __ LDA ACCU + 0 
2508 : a0 01 __ LDY #$01
250a : d1 0d __ CMP (P0),y ; (si + 0)
250c : 90 ef __ BCC $24fd ; (nforml.s28 + 0)
250e : 4c e1 24 JMP $24e1 ; (nforml.s23 + 0)
.l6:
2511 : a5 11 __ LDA P4 ; (v + 0)
2513 : 85 1b __ STA ACCU + 0 
2515 : a5 12 __ LDA P5 ; (v + 1)
2517 : 85 1c __ STA ACCU + 1 
2519 : a5 13 __ LDA P6 ; (v + 2)
251b : 85 1d __ STA ACCU + 2 
251d : a5 14 __ LDA P7 ; (v + 3)
251f : 85 1e __ STA ACCU + 3 
2521 : a5 45 __ LDA T5 + 0 
2523 : 85 03 __ STA WORK + 0 
2525 : a5 46 __ LDA T5 + 1 
2527 : 85 04 __ STA WORK + 1 
2529 : a9 00 __ LDA #$00
252b : 85 05 __ STA WORK + 2 
252d : 85 06 __ STA WORK + 3 
252f : 20 d7 4f JSR $4fd7 ; (divmod32 + 0)
2532 : a5 08 __ LDA WORK + 5 
2534 : 30 08 __ BMI $253e ; (nforml.s78 + 0)
.s1023:
2536 : d0 0a __ BNE $2542 ; (nforml.s77 + 0)
.s1022:
2538 : a5 07 __ LDA WORK + 4 
253a : c9 0a __ CMP #$0a
253c : b0 04 __ BCS $2542 ; (nforml.s77 + 0)
.s78:
253e : a9 30 __ LDA #$30
2540 : d0 02 __ BNE $2544 ; (nforml.s79 + 0)
.s77:
2542 : a9 37 __ LDA #$37
.s79:
2544 : c6 44 __ DEC T2 + 0 
2546 : 18 __ __ CLC
2547 : 65 07 __ ADC WORK + 4 
2549 : a6 44 __ LDX T2 + 0 
254b : 9d e9 bf STA $bfe9,x ; (xbuf0 + 64)
254e : a5 1b __ LDA ACCU + 0 
2550 : 85 11 __ STA P4 ; (v + 0)
2552 : a5 1c __ LDA ACCU + 1 
2554 : 85 12 __ STA P5 ; (v + 1)
2556 : a5 1d __ LDA ACCU + 2 
2558 : 85 13 __ STA P6 ; (v + 2)
255a : a5 1e __ LDA ACCU + 3 
255c : 85 14 __ STA P7 ; (v + 3)
255e : d0 b1 __ BNE $2511 ; (nforml.l6 + 0)
.s1018:
2560 : a5 13 __ LDA P6 ; (v + 2)
2562 : d0 ad __ BNE $2511 ; (nforml.l6 + 0)
.s1019:
2564 : a5 12 __ LDA P5 ; (v + 1)
2566 : d0 a9 __ BNE $2511 ; (nforml.l6 + 0)
.s1020:
2568 : c5 11 __ CMP P4 ; (v + 0)
256a : 90 a5 __ BCC $2511 ; (nforml.l6 + 0)
256c : 4c 47 24 JMP $2447 ; (nforml.s7 + 0)
--------------------------------------------------------------------
256f : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
257f : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
258f : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
2599 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
25a4 : a5 0d __ LDA P0 
25a6 : 05 0e __ ORA P1 
25a8 : f0 08 __ BEQ $25b2 ; (krnio_setnam.s0 + 14)
25aa : a0 ff __ LDY #$ff
25ac : c8 __ __ INY
25ad : b1 0d __ LDA (P0),y 
25af : d0 fb __ BNE $25ac ; (krnio_setnam.s0 + 8)
25b1 : 98 __ __ TYA
25b2 : a6 0d __ LDX P0 
25b4 : a4 0e __ LDY P1 
25b6 : 20 bd ff JSR $ffbd 
.s1001:
25b9 : 60 __ __ RTS
--------------------------------------------------------------------
25ba : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
25c7 : a5 0d __ LDA P0 
25c9 : a4 0f __ LDY P2 
25cb : a6 0e __ LDX P1 
25cd : 20 ba ff JSR $ffba 
25d0 : a9 00 __ LDA #$00
25d2 : a8 __ __ TAY
25d3 : 20 d5 ff JSR $ffd5 
25d6 : a9 00 __ LDA #$00
25d8 : 2a __ __ ROL
25d9 : 49 01 __ EOR #$01
.s1001:
25db : 60 __ __ RTS
--------------------------------------------------------------------
25dc : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
25ec : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
25fa : __ __ __ BYT 25 32 55 00                                     : %2U.
--------------------------------------------------------------------
spentry:
25fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
25ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
2600 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
260c : a5 0d __ LDA P0 
260e : 85 1b __ STA ACCU + 0 
2610 : a5 0e __ LDA P1 
2612 : 85 1c __ STA ACCU + 1 
2614 : ae fe 25 LDX $25fe ; (spentry + 0)
2617 : 9a __ __ TXS
2618 : a9 4c __ LDA #$4c
261a : 85 54 __ STA $54 
261c : a9 00 __ LDA #$00
261e : 85 13 __ STA P6 
.s1001:
2620 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
2621 : 38 __ __ SEC
2622 : a5 23 __ LDA SP + 0 
2624 : e9 04 __ SBC #$04
2626 : 85 23 __ STA SP + 0 
2628 : b0 02 __ BCS $262c ; (vdc_init.s0 + 0)
262a : c6 24 __ DEC SP + 1 
.s0:
262c : a9 1a __ LDA #$1a
262e : 8d 00 d6 STA $d600 
.l463:
2631 : 2c 00 d6 BIT $d600 
2634 : 10 fb __ BPL $2631 ; (vdc_init.l463 + 0)
.s7:
2636 : ad 01 d6 LDA $d601 
2639 : 29 f0 __ AND #$f0
263b : aa __ __ TAX
263c : a9 1a __ LDA #$1a
263e : 8d 00 d6 STA $d600 
.l465:
2641 : 2c 00 d6 BIT $d600 
2644 : 10 fb __ BPL $2641 ; (vdc_init.l465 + 0)
.s13:
2646 : 8e 01 d6 STX $d601 
2649 : 8d 00 d6 STA $d600 
.l467:
264c : 2c 00 d6 BIT $d600 
264f : 10 fb __ BPL $264c ; (vdc_init.l467 + 0)
.s20:
2651 : ad 01 d6 LDA $d601 
2654 : 29 0f __ AND #$0f
2656 : 09 d0 __ ORA #$d0
2658 : a2 1a __ LDX #$1a
265a : 8e 00 d6 STX $d600 
.l469:
265d : 2c 00 d6 BIT $d600 
2660 : 10 fb __ BPL $265d ; (vdc_init.l469 + 0)
.s26:
2662 : 8d 01 d6 STA $d601 
2665 : a9 8d __ LDA #$8d
2667 : 8d 74 52 STA $5274 ; (vdc_state + 11)
266a : a9 1c __ LDA #$1c
266c : 8d 00 d6 STA $d600 
.l471:
266f : 2c 00 d6 BIT $d600 
2672 : 10 fb __ BPL $266f ; (vdc_init.l471 + 0)
.s32:
2674 : ad 01 d6 LDA $d601 
2677 : aa __ __ TAX
2678 : 09 10 __ ORA #$10
267a : a0 1c __ LDY #$1c
267c : 8c 00 d6 STY $d600 
.l473:
267f : 2c 00 d6 BIT $d600 
2682 : 10 fb __ BPL $267f ; (vdc_init.l473 + 0)
.s39:
2684 : 8d 01 d6 STA $d601 
2687 : a9 12 __ LDA #$12
2689 : 8d 00 d6 STA $d600 
.l475:
268c : 2c 00 d6 BIT $d600 
268f : 10 fb __ BPL $268c ; (vdc_init.l475 + 0)
.s46:
2691 : a9 1f __ LDA #$1f
2693 : 8d 01 d6 STA $d601 
2696 : a9 13 __ LDA #$13
2698 : 8d 00 d6 STA $d600 
.l477:
269b : 2c 00 d6 BIT $d600 
269e : 10 fb __ BPL $269b ; (vdc_init.l477 + 0)
.s51:
26a0 : a9 ff __ LDA #$ff
26a2 : 8d 01 d6 STA $d601 
26a5 : a9 1f __ LDA #$1f
26a7 : 8d 00 d6 STA $d600 
.l479:
26aa : 2c 00 d6 BIT $d600 
26ad : 10 fb __ BPL $26aa ; (vdc_init.l479 + 0)
.s55:
26af : a9 00 __ LDA #$00
26b1 : 8d 01 d6 STA $d601 
26b4 : a9 12 __ LDA #$12
26b6 : 8d 00 d6 STA $d600 
.l481:
26b9 : 2c 00 d6 BIT $d600 
26bc : 10 fb __ BPL $26b9 ; (vdc_init.l481 + 0)
.s62:
26be : a9 9f __ LDA #$9f
26c0 : 8d 01 d6 STA $d601 
26c3 : a9 13 __ LDA #$13
26c5 : 8d 00 d6 STA $d600 
.l483:
26c8 : 2c 00 d6 BIT $d600 
26cb : 10 fb __ BPL $26c8 ; (vdc_init.l483 + 0)
.s67:
26cd : a9 ff __ LDA #$ff
26cf : 8d 01 d6 STA $d601 
26d2 : a9 1f __ LDA #$1f
26d4 : 8d 00 d6 STA $d600 
.l485:
26d7 : 2c 00 d6 BIT $d600 
26da : 10 fb __ BPL $26d7 ; (vdc_init.l485 + 0)
.s71:
26dc : a9 ff __ LDA #$ff
26de : 8d 01 d6 STA $d601 
26e1 : a9 12 __ LDA #$12
26e3 : 8d 00 d6 STA $d600 
.l487:
26e6 : 2c 00 d6 BIT $d600 
26e9 : 10 fb __ BPL $26e6 ; (vdc_init.l487 + 0)
.s78:
26eb : a9 1f __ LDA #$1f
26ed : 8d 01 d6 STA $d601 
26f0 : a9 13 __ LDA #$13
26f2 : 8d 00 d6 STA $d600 
.l489:
26f5 : 2c 00 d6 BIT $d600 
26f8 : 10 fb __ BPL $26f5 ; (vdc_init.l489 + 0)
.s83:
26fa : a9 ff __ LDA #$ff
26fc : 8d 01 d6 STA $d601 
26ff : a9 1f __ LDA #$1f
2701 : 8d 00 d6 STA $d600 
.l491:
2704 : 2c 00 d6 BIT $d600 
2707 : 10 fb __ BPL $2704 ; (vdc_init.l491 + 0)
.s87:
2709 : ad 01 d6 LDA $d601 
270c : f0 04 __ BEQ $2712 ; (vdc_init.s1038 + 0)
.s1039:
270e : a9 10 __ LDA #$10
2710 : d0 02 __ BNE $2714 ; (vdc_init.s1040 + 0)
.s1038:
2712 : a9 40 __ LDA #$40
.s1040:
2714 : 8d 69 52 STA $5269 ; (vdc_state + 0)
2717 : 8c 00 d6 STY $d600 
.l494:
271a : 2c 00 d6 BIT $d600 
271d : 10 fb __ BPL $271a ; (vdc_init.l494 + 0)
.s94:
271f : 8e 01 d6 STX $d601 
2722 : 20 68 27 JSR $2768 ; (vdc_cls.s0 + 0)
2725 : 24 d7 __ BIT $d7 
2727 : 30 17 __ BMI $2740 ; (vdc_init.s97 + 0)
.s100:
2729 : a9 c1 __ LDA #$c1
272b : a0 02 __ LDY #$02
272d : 91 23 __ STA (SP + 0),y 
272f : a9 28 __ LDA #$28
2731 : c8 __ __ INY
2732 : 91 23 __ STA (SP + 0),y 
2734 : 20 92 1e JSR $1e92 ; (printf.s0 + 0)
2737 : 20 ec 28 JSR $28ec ; (getch.s0 + 0)
273a : 20 81 ff JSR $ff81 
273d : 20 27 29 JSR $2927 ; (screen_setmode.s0 + 0)
.s97:
2740 : a9 01 __ LDA #$01
2742 : 20 2f 29 JSR $292f ; (fastmode.s0 + 0)
2745 : ad fe bf LDA $bffe ; (sstack + 5)
2748 : 85 18 __ STA P11 
274a : 20 4e 29 JSR $294e ; (vdc_set_mode.s0 + 0)
274d : ad 69 52 LDA $5269 ; (vdc_state + 0)
2750 : c9 40 __ CMP #$40
2752 : d0 08 __ BNE $275c ; (vdc_init.s1001 + 0)
.s107:
2754 : ad ff bf LDA $bfff ; (sstack + 6)
2757 : f0 03 __ BEQ $275c ; (vdc_init.s1001 + 0)
.s104:
2759 : 20 ae 2b JSR $2bae ; (vdc_set_extended_memsize.s0 + 0)
.s1001:
275c : 18 __ __ CLC
275d : a5 23 __ LDA SP + 0 
275f : 69 04 __ ADC #$04
2761 : 85 23 __ STA SP + 0 
2763 : 90 02 __ BCC $2767 ; (vdc_init.s1001 + 11)
2765 : e6 24 __ INC SP + 1 
2767 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
2768 : ad 6f 52 LDA $526f ; (vdc_state + 6)
276b : 85 47 __ STA T0 + 1 
276d : ad 6e 52 LDA $526e ; (vdc_state + 5)
2770 : 85 46 __ STA T0 + 0 
2772 : 05 47 __ ORA T0 + 1 
2774 : f0 2d __ BEQ $27a3 ; (vdc_cls.s1001 + 0)
.s6:
2776 : ad 6c 52 LDA $526c ; (vdc_state + 3)
2779 : 85 17 __ STA P10 
277b : a9 00 __ LDA #$00
277d : 85 11 __ STA P4 
277f : 85 12 __ STA P5 
2781 : a8 __ __ TAY
2782 : aa __ __ TAX
2783 : a9 20 __ LDA #$20
2785 : 85 15 __ STA P8 
.l3:
2787 : 86 14 __ STX P7 
2789 : 84 13 __ STY P6 
278b : 20 a4 27 JSR $27a4 ; (vdc_hchar@proxy + 0)
278e : 18 __ __ CLC
278f : a5 13 __ LDA P6 
2791 : 69 01 __ ADC #$01
2793 : a8 __ __ TAY
2794 : a5 14 __ LDA P7 
2796 : 69 00 __ ADC #$00
2798 : aa __ __ TAX
2799 : c5 47 __ CMP T0 + 1 
279b : 90 ea __ BCC $2787 ; (vdc_cls.l3 + 0)
.s1005:
279d : d0 04 __ BNE $27a3 ; (vdc_cls.s1001 + 0)
.s1002:
279f : c4 46 __ CPY T0 + 0 
27a1 : 90 e4 __ BCC $2787 ; (vdc_cls.l3 + 0)
.s1001:
27a3 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
27a4 : ad 74 52 LDA $5274 ; (vdc_state + 11)
27a7 : 85 16 __ STA P9 
--------------------------------------------------------------------
vdc_hchar: ; vdc_hchar(u16,u16,u8,u8,u8)->void
.s0:
27a9 : a5 11 __ LDA P4 ; (x + 0)
27ab : 85 0d __ STA P0 
27ad : a5 12 __ LDA P5 ; (x + 1)
27af : 85 0e __ STA P1 
27b1 : a5 13 __ LDA P6 ; (y + 0)
27b3 : 85 0f __ STA P2 
27b5 : a5 14 __ LDA P7 ; (y + 1)
27b7 : 85 10 __ STA P3 
27b9 : 20 54 28 JSR $2854 ; (vdc_coords.s0 + 0)
27bc : a5 1b __ LDA ACCU + 0 
27be : 85 43 __ STA T0 + 0 
27c0 : a5 1c __ LDA ACCU + 1 
27c2 : 85 44 __ STA T0 + 1 
27c4 : ad 75 52 LDA $5275 ; (vdc_state + 12)
27c7 : 18 __ __ CLC
27c8 : 65 1b __ ADC ACCU + 0 
27ca : 85 0d __ STA P0 
27cc : ad 76 52 LDA $5276 ; (vdc_state + 13)
27cf : 65 1c __ ADC ACCU + 1 
27d1 : 85 0e __ STA P1 
27d3 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
27d6 : a6 17 __ LDX P10 ; (length + 0)
27d8 : ca __ __ DEX
27d9 : 86 45 __ STX T1 + 0 
.l219:
27db : 2c 00 d6 BIT $d600 
27de : 10 fb __ BPL $27db ; (vdc_hchar.l219 + 0)
.s4:
27e0 : a5 15 __ LDA P8 ; (val + 0)
27e2 : 8d 01 d6 STA $d601 
27e5 : a2 18 __ LDX #$18
27e7 : 8e 00 d6 STX $d600 
.l221:
27ea : 2c 00 d6 BIT $d600 
27ed : 10 fb __ BPL $27ea ; (vdc_hchar.l221 + 0)
.s10:
27ef : ad 01 d6 LDA $d601 
27f2 : 29 7f __ AND #$7f
27f4 : 8e 00 d6 STX $d600 
.l223:
27f7 : 2c 00 d6 BIT $d600 
27fa : 10 fb __ BPL $27f7 ; (vdc_hchar.l223 + 0)
.s16:
27fc : 8d 01 d6 STA $d601 
27ff : a9 1e __ LDA #$1e
2801 : 8d 00 d6 STA $d600 
.l225:
2804 : 2c 00 d6 BIT $d600 
2807 : 10 fb __ BPL $2804 ; (vdc_hchar.l225 + 0)
.s21:
2809 : a5 45 __ LDA T1 + 0 
280b : 8d 01 d6 STA $d601 
280e : ad 77 52 LDA $5277 ; (vdc_state + 14)
2811 : 18 __ __ CLC
2812 : 65 43 __ ADC T0 + 0 
2814 : 85 0d __ STA P0 
2816 : ad 78 52 LDA $5278 ; (vdc_state + 15)
2819 : 65 44 __ ADC T0 + 1 
281b : 85 0e __ STA P1 
281d : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
.l227:
2820 : 2c 00 d6 BIT $d600 
2823 : 10 fb __ BPL $2820 ; (vdc_hchar.l227 + 0)
.s25:
2825 : a5 16 __ LDA P9 ; (attr + 0)
2827 : 8d 01 d6 STA $d601 
282a : a2 18 __ LDX #$18
282c : 8e 00 d6 STX $d600 
.l229:
282f : 2c 00 d6 BIT $d600 
2832 : 10 fb __ BPL $282f ; (vdc_hchar.l229 + 0)
.s31:
2834 : ad 01 d6 LDA $d601 
2837 : 29 7f __ AND #$7f
2839 : 8e 00 d6 STX $d600 
.l231:
283c : 2c 00 d6 BIT $d600 
283f : 10 fb __ BPL $283c ; (vdc_hchar.l231 + 0)
.s37:
2841 : 8d 01 d6 STA $d601 
2844 : a9 1e __ LDA #$1e
2846 : 8d 00 d6 STA $d600 
.l233:
2849 : 2c 00 d6 BIT $d600 
284c : 10 fb __ BPL $2849 ; (vdc_hchar.l233 + 0)
.s42:
284e : a5 45 __ LDA T1 + 0 
2850 : 8d 01 d6 STA $d601 
.s1001:
2853 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_coords: ; vdc_coords(u16,u16)->u16
.s0:
2854 : ad 72 52 LDA $5272 ; (vdc_state + 9)
2857 : d0 14 __ BNE $286d ; (vdc_coords.s1 + 0)
.s2:
2859 : a5 0f __ LDA P2 ; (y + 0)
285b : 0a __ __ ASL
285c : aa __ __ TAX
285d : bd 00 54 LDA $5400,x ; (multab + 0)
2860 : 18 __ __ CLC
2861 : 65 0d __ ADC P0 ; (x + 0)
2863 : 85 1b __ STA ACCU + 0 
2865 : bd 01 54 LDA $5401,x ; (multab + 1)
2868 : 65 0e __ ADC P1 ; (x + 1)
286a : 4c 96 28 JMP $2896 ; (vdc_coords.s1001 + 0)
.s1:
286d : ad 6c 52 LDA $526c ; (vdc_state + 3)
2870 : 85 1b __ STA ACCU + 0 
2872 : ad 6d 52 LDA $526d ; (vdc_state + 4)
2875 : 85 1c __ STA ACCU + 1 
2877 : a5 0f __ LDA P2 ; (y + 0)
2879 : 85 03 __ STA WORK + 0 
287b : a5 10 __ LDA P3 ; (y + 1)
287d : 85 04 __ STA WORK + 1 
287f : 20 10 4f JSR $4f10 ; (mul16 + 0)
2882 : a5 0d __ LDA P0 ; (x + 0)
2884 : 46 0e __ LSR P1 ; (x + 1)
2886 : 6a __ __ ROR
2887 : 46 0e __ LSR P1 ; (x + 1)
2889 : 6a __ __ ROR
288a : 46 0e __ LSR P1 ; (x + 1)
288c : 6a __ __ ROR
288d : 18 __ __ CLC
288e : 65 05 __ ADC WORK + 2 
2890 : 85 1b __ STA ACCU + 0 
2892 : a5 0e __ LDA P1 ; (x + 1)
2894 : 65 06 __ ADC WORK + 3 
.s1001:
2896 : 85 1c __ STA ACCU + 1 
2898 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
2899 : a5 4a __ LDA $4a 
289b : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
289d : a9 12 __ LDA #$12
289f : 8d 00 d6 STA $d600 
.l56:
28a2 : 2c 00 d6 BIT $d600 
28a5 : 10 fb __ BPL $28a2 ; (vdc_mem_addr.l56 + 0)
.s5:
28a7 : a5 0e __ LDA P1 ; (addr + 1)
28a9 : 8d 01 d6 STA $d601 
28ac : a9 13 __ LDA #$13
28ae : 8d 00 d6 STA $d600 
.l58:
28b1 : 2c 00 d6 BIT $d600 
28b4 : 10 fb __ BPL $28b1 ; (vdc_mem_addr.l58 + 0)
.s10:
28b6 : a5 0d __ LDA P0 ; (addr + 0)
28b8 : 8d 01 d6 STA $d601 
28bb : a9 1f __ LDA #$1f
28bd : 8d 00 d6 STA $d600 
.s1001:
28c0 : 60 __ __ RTS
--------------------------------------------------------------------
28c1 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
28d1 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
28e1 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
28ec : 20 f6 28 JSR $28f6 ; (getpch + 0)
28ef : c9 00 __ CMP #$00
28f1 : f0 f9 __ BEQ $28ec ; (getch.s0 + 0)
28f3 : 85 1b __ STA ACCU + 0 
.s1001:
28f5 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
28f6 : 20 e4 ff JSR $ffe4 
28f9 : ae ff 25 LDX $25ff ; (giocharmap + 0)
28fc : e0 01 __ CPX #$01
28fe : 90 26 __ BCC $2926 ; (getpch + 48)
2900 : c9 0d __ CMP #$0d
2902 : d0 02 __ BNE $2906 ; (getpch + 16)
2904 : a9 0a __ LDA #$0a
2906 : e0 02 __ CPX #$02
2908 : 90 1c __ BCC $2926 ; (getpch + 48)
290a : c9 db __ CMP #$db
290c : b0 18 __ BCS $2926 ; (getpch + 48)
290e : c9 41 __ CMP #$41
2910 : 90 14 __ BCC $2926 ; (getpch + 48)
2912 : c9 c1 __ CMP #$c1
2914 : 90 02 __ BCC $2918 ; (getpch + 34)
2916 : 49 a0 __ EOR #$a0
2918 : c9 7b __ CMP #$7b
291a : b0 0a __ BCS $2926 ; (getpch + 48)
291c : c9 61 __ CMP #$61
291e : b0 04 __ BCS $2924 ; (getpch + 46)
2920 : c9 5b __ CMP #$5b
2922 : b0 02 __ BCS $2926 ; (getpch + 48)
2924 : 49 20 __ EOR #$20
2926 : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2927 : 24 d7 __ BIT $d7 
2929 : 10 01 __ BPL $292c ; (screen_setmode.s6 + 0)
.s1001:
292b : 60 __ __ RTS
.s6:
292c : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
292f : 09 00 __ ORA #$00
2931 : d0 0d __ BNE $2940 ; (fastmode.s1 + 0)
.s2:
2933 : 8d 30 d0 STA $d030 
2936 : ad 11 d0 LDA $d011 
2939 : 29 7f __ AND #$7f
293b : 09 10 __ ORA #$10
293d : 4c 4a 29 JMP $294a ; (fastmode.s3 + 0)
.s1:
2940 : a9 01 __ LDA #$01
2942 : 8d 30 d0 STA $d030 
2945 : ad 11 d0 LDA $d011 
2948 : 29 6f __ AND #$6f
.s3:
294a : 8d 11 d0 STA $d011 
.s1001:
294d : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s0:
294e : a6 18 __ LDX P11 ; (mode + 0)
2950 : bd b4 50 LDA $50b4,x ; (__multab38L + 0)
2953 : 85 4b __ STA T1 + 0 
2955 : 18 __ __ CLC
2956 : 69 d4 __ ADC #$d4
2958 : 85 4d __ STA T2 + 0 
295a : bd bc 50 LDA $50bc,x ; (__multab38H + 0)
295d : 85 4c __ STA T1 + 1 
295f : 69 50 __ ADC #$50
2961 : 85 4e __ STA T2 + 1 
2963 : a0 06 __ LDY #$06
2965 : b1 4d __ LDA (T2 + 0),y 
2967 : f0 08 __ BEQ $2971 ; (vdc_set_mode.s3 + 0)
.s4:
2969 : ad 69 52 LDA $5269 ; (vdc_state + 0)
296c : c9 10 __ CMP #$10
296e : d0 01 __ BNE $2971 ; (vdc_set_mode.s3 + 0)
2970 : 60 __ __ RTS
.s3:
2971 : 8e 6b 52 STX $526b ; (vdc_state + 2)
2974 : a9 00 __ LDA #$00
2976 : 8d 83 52 STA $5283 ; (vdc_state + 26)
2979 : 8d 84 52 STA $5284 ; (vdc_state + 27)
297c : 8d 85 52 STA $5285 ; (vdc_state + 28)
297f : a8 __ __ TAY
2980 : b1 4d __ LDA (T2 + 0),y 
2982 : 8d 6c 52 STA $526c ; (vdc_state + 3)
2985 : c8 __ __ INY
2986 : b1 4d __ LDA (T2 + 0),y 
2988 : 8d 6d 52 STA $526d ; (vdc_state + 4)
298b : c8 __ __ INY
298c : b1 4d __ LDA (T2 + 0),y 
298e : 8d 6e 52 STA $526e ; (vdc_state + 5)
2991 : c8 __ __ INY
2992 : b1 4d __ LDA (T2 + 0),y 
2994 : 8d 6f 52 STA $526f ; (vdc_state + 6)
2997 : a0 05 __ LDY #$05
2999 : b1 4d __ LDA (T2 + 0),y 
299b : 8d 73 52 STA $5273 ; (vdc_state + 10)
299e : a0 0b __ LDY #$0b
29a0 : b1 4d __ LDA (T2 + 0),y 
29a2 : 8d 79 52 STA $5279 ; (vdc_state + 16)
29a5 : c8 __ __ INY
29a6 : b1 4d __ LDA (T2 + 0),y 
29a8 : 8d 7a 52 STA $527a ; (vdc_state + 17)
29ab : c8 __ __ INY
29ac : b1 4d __ LDA (T2 + 0),y 
29ae : 8d 7b 52 STA $527b ; (vdc_state + 18)
29b1 : c8 __ __ INY
29b2 : b1 4d __ LDA (T2 + 0),y 
29b4 : 8d 7c 52 STA $527c ; (vdc_state + 19)
29b7 : c8 __ __ INY
29b8 : b1 4d __ LDA (T2 + 0),y 
29ba : 8d 7d 52 STA $527d ; (vdc_state + 20)
29bd : c8 __ __ INY
29be : b1 4d __ LDA (T2 + 0),y 
29c0 : 8d 7e 52 STA $527e ; (vdc_state + 21)
29c3 : c8 __ __ INY
29c4 : b1 4d __ LDA (T2 + 0),y 
29c6 : 8d 7f 52 STA $527f ; (vdc_state + 22)
29c9 : c8 __ __ INY
29ca : b1 4d __ LDA (T2 + 0),y 
29cc : 8d 80 52 STA $5280 ; (vdc_state + 23)
29cf : c8 __ __ INY
29d0 : b1 4d __ LDA (T2 + 0),y 
29d2 : 8d 81 52 STA $5281 ; (vdc_state + 24)
29d5 : c8 __ __ INY
29d6 : b1 4d __ LDA (T2 + 0),y 
29d8 : 8d 82 52 STA $5282 ; (vdc_state + 25)
29db : a0 04 __ LDY #$04
29dd : b1 4d __ LDA (T2 + 0),y 
29df : 8d 72 52 STA $5272 ; (vdc_state + 9)
29e2 : a0 07 __ LDY #$07
29e4 : b1 4d __ LDA (T2 + 0),y 
29e6 : 85 4f __ STA T4 + 0 
29e8 : 8d 75 52 STA $5275 ; (vdc_state + 12)
29eb : c8 __ __ INY
29ec : b1 4d __ LDA (T2 + 0),y 
29ee : 85 50 __ STA T4 + 1 
29f0 : 8d 76 52 STA $5276 ; (vdc_state + 13)
29f3 : c8 __ __ INY
29f4 : b1 4d __ LDA (T2 + 0),y 
29f6 : 85 51 __ STA T5 + 0 
29f8 : 8d 77 52 STA $5277 ; (vdc_state + 14)
29fb : c8 __ __ INY
29fc : b1 4d __ LDA (T2 + 0),y 
29fe : 85 52 __ STA T5 + 1 
2a00 : 8d 78 52 STA $5278 ; (vdc_state + 15)
2a03 : ad 72 52 LDA $5272 ; (vdc_state + 9)
2a06 : d0 03 __ BNE $2a0b ; (vdc_set_mode.s8 + 0)
.s6:
2a08 : 20 51 2b JSR $2b51 ; (vdc_set_multab.s0 + 0)
.s8:
2a0b : a9 22 __ LDA #$22
2a0d : 8d 00 d6 STA $d600 
.l345:
2a10 : 2c 00 d6 BIT $d600 
2a13 : 10 fb __ BPL $2a10 ; (vdc_set_mode.l345 + 0)
.s14:
2a15 : a9 80 __ LDA #$80
2a17 : 8d 01 d6 STA $d601 
2a1a : a9 0c __ LDA #$0c
2a1c : 8d 00 d6 STA $d600 
.l347:
2a1f : 2c 00 d6 BIT $d600 
2a22 : 10 fb __ BPL $2a1f ; (vdc_set_mode.l347 + 0)
.s20:
2a24 : a5 50 __ LDA T4 + 1 
2a26 : 8d 01 d6 STA $d601 
2a29 : a9 0d __ LDA #$0d
2a2b : 8d 00 d6 STA $d600 
.l349:
2a2e : 2c 00 d6 BIT $d600 
2a31 : 10 fb __ BPL $2a2e ; (vdc_set_mode.l349 + 0)
.s25:
2a33 : a5 4f __ LDA T4 + 0 
2a35 : 8d 01 d6 STA $d601 
2a38 : a9 14 __ LDA #$14
2a3a : 8d 00 d6 STA $d600 
.l351:
2a3d : 2c 00 d6 BIT $d600 
2a40 : 10 fb __ BPL $2a3d ; (vdc_set_mode.l351 + 0)
.s30:
2a42 : a5 52 __ LDA T5 + 1 
2a44 : 8d 01 d6 STA $d601 
2a47 : a9 15 __ LDA #$15
2a49 : 8d 00 d6 STA $d600 
.l353:
2a4c : 2c 00 d6 BIT $d600 
2a4f : 10 fb __ BPL $2a4c ; (vdc_set_mode.l353 + 0)
.s35:
2a51 : a5 51 __ LDA T5 + 0 
2a53 : 8d 01 d6 STA $d601 
2a56 : 18 __ __ CLC
2a57 : a9 e3 __ LDA #$e3
2a59 : 65 4b __ ADC T1 + 0 
2a5b : 85 4f __ STA T4 + 0 
2a5d : a9 50 __ LDA #$50
2a5f : 65 4c __ ADC T1 + 1 
2a61 : 85 50 __ STA T4 + 1 
2a63 : a0 01 __ LDY #$01
2a65 : b1 4f __ LDA (T4 + 0),y 
2a67 : a2 1c __ LDX #$1c
2a69 : 8e 00 d6 STX $d600 
.l355:
2a6c : 2c 00 d6 BIT $d600 
2a6f : 10 fb __ BPL $2a6c ; (vdc_set_mode.l355 + 0)
.s42:
2a71 : aa __ __ TAX
2a72 : ad 01 d6 LDA $d601 
2a75 : 29 10 __ AND #$10
2a77 : 85 51 __ STA T5 + 0 
2a79 : a9 1c __ LDA #$1c
2a7b : 8d 00 d6 STA $d600 
2a7e : 8a __ __ TXA
2a7f : 29 e0 __ AND #$e0
2a81 : 05 51 __ ORA T5 + 0 
.l357:
2a83 : 2c 00 d6 BIT $d600 
2a86 : 10 fb __ BPL $2a83 ; (vdc_set_mode.l357 + 0)
.s48:
2a88 : 8d 01 d6 STA $d601 
2a8b : 20 a1 2b JSR $2ba1 ; (vdc_restore_charsets.s0 + 0)
2a8e : 18 __ __ CLC
2a8f : a9 e9 __ LDA #$e9
2a91 : 65 4b __ ADC T1 + 0 
2a93 : 85 4b __ STA T1 + 0 
2a95 : a9 50 __ LDA #$50
2a97 : 65 4c __ ADC T1 + 1 
2a99 : 85 4c __ STA T1 + 1 
2a9b : a9 00 __ LDA #$00
2a9d : 85 43 __ STA T0 + 0 
2a9f : 18 __ __ CLC
2aa0 : a5 4d __ LDA T2 + 0 
2aa2 : 69 15 __ ADC #$15
2aa4 : 85 4f __ STA T4 + 0 
2aa6 : a5 4e __ LDA T2 + 1 
2aa8 : 69 00 __ ADC #$00
2aaa : 85 50 __ STA T4 + 1 
.l49:
2aac : a4 43 __ LDY T0 + 0 
2aae : b1 4b __ LDA (T1 + 0),y 
2ab0 : 85 47 __ STA T7 + 0 
2ab2 : c8 __ __ INY
2ab3 : b1 4b __ LDA (T1 + 0),y 
2ab5 : aa __ __ TAX
2ab6 : a5 47 __ LDA T7 + 0 
2ab8 : 8d 00 d6 STA $d600 
2abb : c8 __ __ INY
2abc : 84 43 __ STY T0 + 0 
.l359:
2abe : 2c 00 d6 BIT $d600 
2ac1 : 10 fb __ BPL $2abe ; (vdc_set_mode.l359 + 0)
.s55:
2ac3 : 8e 01 d6 STX $d601 
2ac6 : b1 4f __ LDA (T4 + 0),y 
2ac8 : c9 ff __ CMP #$ff
2aca : d0 e0 __ BNE $2aac ; (vdc_set_mode.l49 + 0)
.s50:
2acc : a0 06 __ LDY #$06
2ace : b1 4d __ LDA (T2 + 0),y 
2ad0 : f0 08 __ BEQ $2ada ; (vdc_set_mode.s58 + 0)
.s59:
2ad2 : ad 6a 52 LDA $526a ; (vdc_state + 1)
2ad5 : d0 03 __ BNE $2ada ; (vdc_set_mode.s58 + 0)
.s56:
2ad7 : 20 ae 2b JSR $2bae ; (vdc_set_extended_memsize.s0 + 0)
.s58:
2ada : a9 19 __ LDA #$19
2adc : 8d 00 d6 STA $d600 
.l364:
2adf : 2c 00 d6 BIT $d600 
2ae2 : 10 fb __ BPL $2adf ; (vdc_set_mode.l364 + 0)
.s64:
2ae4 : ad 72 52 LDA $5272 ; (vdc_state + 9)
2ae7 : 85 43 __ STA T0 + 0 
2ae9 : d0 08 __ BNE $2af3 ; (vdc_set_mode.s67 + 0)
.s68:
2aeb : ad 01 d6 LDA $d601 
2aee : 29 7f __ AND #$7f
2af0 : 4c 1e 2b JMP $2b1e ; (vdc_set_mode.s367 + 0)
.s67:
2af3 : ad 6d 52 LDA $526d ; (vdc_state + 4)
2af6 : 4a __ __ LSR
2af7 : 85 4c __ STA T1 + 1 
2af9 : ad 6c 52 LDA $526c ; (vdc_state + 3)
2afc : 6a __ __ ROR
2afd : 46 4c __ LSR T1 + 1 
2aff : 6a __ __ ROR
2b00 : 46 4c __ LSR T1 + 1 
2b02 : 6a __ __ ROR
2b03 : 8d 70 52 STA $5270 ; (vdc_state + 7)
2b06 : ad 6f 52 LDA $526f ; (vdc_state + 6)
2b09 : 4a __ __ LSR
2b0a : 85 4c __ STA T1 + 1 
2b0c : ad 6e 52 LDA $526e ; (vdc_state + 5)
2b0f : 6a __ __ ROR
2b10 : 46 4c __ LSR T1 + 1 
2b12 : 6a __ __ ROR
2b13 : 46 4c __ LSR T1 + 1 
2b15 : 6a __ __ ROR
2b16 : 8d 71 52 STA $5271 ; (vdc_state + 8)
2b19 : ad 01 d6 LDA $d601 
2b1c : 09 80 __ ORA #$80
.s367:
2b1e : aa __ __ TAX
2b1f : ad 73 52 LDA $5273 ; (vdc_state + 10)
2b22 : d0 06 __ BNE $2b2a ; (vdc_set_mode.s70 + 0)
.s71:
2b24 : 8a __ __ TXA
2b25 : 29 bf __ AND #$bf
2b27 : 4c 2d 2b JMP $2b2d ; (vdc_set_mode.s72 + 0)
.s70:
2b2a : 8a __ __ TXA
2b2b : 09 40 __ ORA #$40
.s72:
2b2d : a2 19 __ LDX #$19
2b2f : 8e 00 d6 STX $d600 
.l368:
2b32 : 2c 00 d6 BIT $d600 
2b35 : 10 fb __ BPL $2b32 ; (vdc_set_mode.l368 + 0)
.s77:
2b37 : 8d 01 d6 STA $d601 
2b3a : a5 43 __ LDA T0 + 0 
2b3c : d0 03 __ BNE $2b41 ; (vdc_set_mode.s80 + 0)
.s78:
2b3e : 20 68 27 JSR $2768 ; (vdc_cls.s0 + 0)
.s80:
2b41 : a9 22 __ LDA #$22
2b43 : 8d 00 d6 STA $d600 
.l371:
2b46 : 2c 00 d6 BIT $d600 
2b49 : 10 fb __ BPL $2b46 ; (vdc_set_mode.l371 + 0)
.s86:
2b4b : a9 7d __ LDA #$7d
2b4d : 8d 01 d6 STA $d601 
.s1001:
2b50 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2b51 : ad 6e 52 LDA $526e ; (vdc_state + 5)
2b54 : 0d 6f 52 ORA $526f ; (vdc_state + 6)
2b57 : f0 47 __ BEQ $2ba0 ; (vdc_set_multab.s1001 + 0)
.s5:
2b59 : ad 6c 52 LDA $526c ; (vdc_state + 3)
2b5c : 18 __ __ CLC
2b5d : 6d 85 52 ADC $5285 ; (vdc_state + 28)
2b60 : 85 1b __ STA ACCU + 0 
2b62 : ad 6d 52 LDA $526d ; (vdc_state + 4)
2b65 : 69 00 __ ADC #$00
2b67 : 85 1c __ STA ACCU + 1 
2b69 : a9 00 __ LDA #$00
2b6b : 85 43 __ STA T3 + 0 
2b6d : 85 44 __ STA T3 + 1 
2b6f : a9 00 __ LDA #$00
2b71 : 85 45 __ STA T4 + 0 
2b73 : a9 54 __ LDA #$54
2b75 : 85 46 __ STA T4 + 1 
2b77 : ae 6e 52 LDX $526e ; (vdc_state + 5)
.l1002:
2b7a : a5 43 __ LDA T3 + 0 
2b7c : a0 00 __ LDY #$00
2b7e : 91 45 __ STA (T4 + 0),y 
2b80 : a5 44 __ LDA T3 + 1 
2b82 : c8 __ __ INY
2b83 : 91 45 __ STA (T4 + 0),y 
2b85 : 18 __ __ CLC
2b86 : a5 1b __ LDA ACCU + 0 
2b88 : 65 43 __ ADC T3 + 0 
2b8a : 85 43 __ STA T3 + 0 
2b8c : a5 1c __ LDA ACCU + 1 
2b8e : 65 44 __ ADC T3 + 1 
2b90 : 85 44 __ STA T3 + 1 
2b92 : 18 __ __ CLC
2b93 : a5 45 __ LDA T4 + 0 
2b95 : 69 02 __ ADC #$02
2b97 : 85 45 __ STA T4 + 0 
2b99 : 90 02 __ BCC $2b9d ; (vdc_set_multab.s1006 + 0)
.s1005:
2b9b : e6 46 __ INC T4 + 1 
.s1006:
2b9d : ca __ __ DEX
2b9e : d0 da __ BNE $2b7a ; (vdc_set_multab.l1002 + 0)
.s1001:
2ba0 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2ba1 : ad 7d 52 LDA $527d ; (vdc_state + 20)
2ba4 : 85 0f __ STA P2 
2ba6 : ad 7e 52 LDA $527e ; (vdc_state + 21)
2ba9 : 85 10 __ STA P3 
2bab : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2bae : ad 69 52 LDA $5269 ; (vdc_state + 0)
2bb1 : c9 10 __ CMP #$10
2bb3 : d0 01 __ BNE $2bb6 ; (vdc_set_extended_memsize.s4 + 0)
2bb5 : 60 __ __ RTS
.s4:
2bb6 : ad 6a 52 LDA $526a ; (vdc_state + 1)
2bb9 : f0 01 __ BEQ $2bbc ; (vdc_set_extended_memsize.s3 + 0)
2bbb : 60 __ __ RTS
.s3:
2bbc : a2 22 __ LDX #$22
2bbe : 8e 00 d6 STX $d600 
.l383:
2bc1 : 2c 00 d6 BIT $d600 
2bc4 : 10 fb __ BPL $2bc1 ; (vdc_set_extended_memsize.l383 + 0)
.s11:
2bc6 : 85 4a __ STA T1 + 1 
2bc8 : 85 0d __ STA P0 
2bca : a9 80 __ LDA #$80
2bcc : 8d 01 d6 STA $d601 
2bcf : a9 ff __ LDA #$ff
2bd1 : 85 48 __ STA T0 + 0 
.l14:
2bd3 : 20 99 28 JSR $2899 ; (vdc_mem_addr@proxy + 0)
.l385:
2bd6 : 2c 00 d6 BIT $d600 
2bd9 : 10 fb __ BPL $2bd6 ; (vdc_set_extended_memsize.l385 + 0)
.s20:
2bdb : a9 00 __ LDA #$00
2bdd : 8d 01 d6 STA $d601 
2be0 : a2 18 __ LDX #$18
2be2 : 8e 00 d6 STX $d600 
.l387:
2be5 : 2c 00 d6 BIT $d600 
2be8 : 10 fb __ BPL $2be5 ; (vdc_set_extended_memsize.l387 + 0)
.s26:
2bea : ad 01 d6 LDA $d601 
2bed : 29 7f __ AND #$7f
2bef : 8e 00 d6 STX $d600 
.l389:
2bf2 : 2c 00 d6 BIT $d600 
2bf5 : 10 fb __ BPL $2bf2 ; (vdc_set_extended_memsize.l389 + 0)
.s32:
2bf7 : 8d 01 d6 STA $d601 
2bfa : a9 1e __ LDA #$1e
2bfc : 8d 00 d6 STA $d600 
.l391:
2bff : 2c 00 d6 BIT $d600 
2c02 : 10 fb __ BPL $2bff ; (vdc_set_extended_memsize.l391 + 0)
.s37:
2c04 : e6 4a __ INC T1 + 1 
2c06 : a9 ff __ LDA #$ff
2c08 : 8d 01 d6 STA $d601 
2c0b : c6 48 __ DEC T0 + 0 
2c0d : d0 c4 __ BNE $2bd3 ; (vdc_set_extended_memsize.l14 + 0)
.s16:
2c0f : 20 99 28 JSR $2899 ; (vdc_mem_addr@proxy + 0)
.l394:
2c12 : 2c 00 d6 BIT $d600 
2c15 : 10 fb __ BPL $2c12 ; (vdc_set_extended_memsize.l394 + 0)
.s41:
2c17 : a9 00 __ LDA #$00
2c19 : 8d 01 d6 STA $d601 
2c1c : a2 18 __ LDX #$18
2c1e : 8e 00 d6 STX $d600 
.l396:
2c21 : 2c 00 d6 BIT $d600 
2c24 : 10 fb __ BPL $2c21 ; (vdc_set_extended_memsize.l396 + 0)
.s47:
2c26 : ad 01 d6 LDA $d601 
2c29 : 29 7f __ AND #$7f
2c2b : 8e 00 d6 STX $d600 
.l398:
2c2e : 2c 00 d6 BIT $d600 
2c31 : 10 fb __ BPL $2c2e ; (vdc_set_extended_memsize.l398 + 0)
.s53:
2c33 : 8d 01 d6 STA $d601 
2c36 : a9 1e __ LDA #$1e
2c38 : 8d 00 d6 STA $d600 
.l400:
2c3b : 2c 00 d6 BIT $d600 
2c3e : 10 fb __ BPL $2c3b ; (vdc_set_extended_memsize.l400 + 0)
.s58:
2c40 : a9 ff __ LDA #$ff
2c42 : 8d 01 d6 STA $d601 
2c45 : a0 1c __ LDY #$1c
2c47 : 8c 00 d6 STY $d600 
.l402:
2c4a : 2c 00 d6 BIT $d600 
2c4d : 10 fb __ BPL $2c4a ; (vdc_set_extended_memsize.l402 + 0)
.s64:
2c4f : ad 01 d6 LDA $d601 
2c52 : 09 10 __ ORA #$10
2c54 : 8c 00 d6 STY $d600 
.l404:
2c57 : 2c 00 d6 BIT $d600 
2c5a : 10 fb __ BPL $2c57 ; (vdc_set_extended_memsize.l404 + 0)
.s70:
2c5c : 8d 01 d6 STA $d601 
2c5f : 20 a1 2b JSR $2ba1 ; (vdc_restore_charsets.s0 + 0)
2c62 : ad 72 52 LDA $5272 ; (vdc_state + 9)
2c65 : d0 03 __ BNE $2c6a ; (vdc_set_extended_memsize.s73 + 0)
.s71:
2c67 : 20 68 27 JSR $2768 ; (vdc_cls.s0 + 0)
.s73:
2c6a : a9 22 __ LDA #$22
2c6c : 8d 00 d6 STA $d600 
.l407:
2c6f : 2c 00 d6 BIT $d600 
2c72 : 10 fb __ BPL $2c6f ; (vdc_set_extended_memsize.l407 + 0)
.s79:
2c74 : a9 7d __ LDA #$7d
2c76 : 8d 01 d6 STA $d601 
2c79 : a9 01 __ LDA #$01
2c7b : 8d 6a 52 STA $526a ; (vdc_state + 1)
.s1001:
2c7e : 60 __ __ RTS
--------------------------------------------------------------------
raster_place_test: ; raster_place_test()->void
.s1000:
2c7f : 38 __ __ SEC
2c80 : a5 23 __ LDA SP + 0 
2c82 : e9 08 __ SBC #$08
2c84 : 85 23 __ STA SP + 0 
2c86 : b0 02 __ BCS $2c8a ; (raster_place_test.s0 + 0)
2c88 : c6 24 __ DEC SP + 1 
.s0:
2c8a : a9 00 __ LDA #$00
2c8c : 85 4e __ STA T0 + 0 
2c8e : 85 4f __ STA T1 + 0 
2c90 : a9 64 __ LDA #$64
2c92 : 85 50 __ STA T2 + 0 
.l2:
2c94 : a9 86 __ LDA #$86
2c96 : a0 02 __ LDY #$02
2c98 : 91 23 __ STA (SP + 0),y 
2c9a : a9 52 __ LDA #$52
2c9c : c8 __ __ INY
2c9d : 91 23 __ STA (SP + 0),y 
2c9f : a9 fa __ LDA #$fa
2ca1 : c8 __ __ INY
2ca2 : 91 23 __ STA (SP + 0),y 
2ca4 : a9 25 __ LDA #$25
2ca6 : c8 __ __ INY
2ca7 : 91 23 __ STA (SP + 0),y 
2ca9 : a5 4f __ LDA T1 + 0 
2cab : c8 __ __ INY
2cac : 91 23 __ STA (SP + 0),y 
2cae : a9 00 __ LDA #$00
2cb0 : c8 __ __ INY
2cb1 : 91 23 __ STA (SP + 0),y 
2cb3 : 20 a4 2d JSR $2da4 ; (sprintf.s0 + 0)
2cb6 : a5 4e __ LDA T0 + 0 
2cb8 : 85 12 __ STA P5 
2cba : a9 00 __ LDA #$00
2cbc : 85 11 __ STA P4 
2cbe : 20 d2 2d JSR $2dd2 ; (vdc_prints@proxy + 0)
2cc1 : e6 4f __ INC T1 + 0 
2cc3 : e6 4e __ INC T0 + 0 
2cc5 : a5 4e __ LDA T0 + 0 
2cc7 : c9 19 __ CMP #$19
2cc9 : 90 c9 __ BCC $2c94 ; (raster_place_test.l2 + 0)
.s4:
2ccb : a9 05 __ LDA #$05
2ccd : 85 11 __ STA P4 
2ccf : a9 2e __ LDA #$2e
2cd1 : 85 14 __ STA P7 
2cd3 : a9 00 __ LDA #$00
2cd5 : 85 12 __ STA P5 
2cd7 : a9 c8 __ LDA #$c8
2cd9 : 85 13 __ STA P6 
2cdb : 20 da 2d JSR $2dda ; (vdc_prints.s0 + 0)
2cde : a9 02 __ LDA #$02
2ce0 : 85 12 __ STA P5 
2ce2 : a9 2f __ LDA #$2f
2ce4 : 85 14 __ STA P7 
2ce6 : a9 00 __ LDA #$00
2ce8 : 85 13 __ STA P6 
2cea : 20 da 2d JSR $2dda ; (vdc_prints.s0 + 0)
2ced : e6 12 __ INC P5 
2cef : a9 e3 __ LDA #$e3
2cf1 : 85 13 __ STA P6 
2cf3 : a9 2e __ LDA #$2e
2cf5 : 85 14 __ STA P7 
2cf7 : 20 da 2d JSR $2dda ; (vdc_prints.s0 + 0)
2cfa : a9 05 __ LDA #$05
2cfc : 85 12 __ STA P5 
2cfe : a9 2f __ LDA #$2f
2d00 : 85 14 __ STA P7 
2d02 : a9 29 __ LDA #$29
2d04 : 85 13 __ STA P6 
2d06 : 20 da 2d JSR $2dda ; (vdc_prints.s0 + 0)
.l102:
2d09 : 20 e4 ff JSR $ffe4 
2d0c : 09 00 __ ORA #$00
2d0e : d0 f9 __ BNE $2d09 ; (raster_place_test.l102 + 0)
.l8:
2d10 : a9 86 __ LDA #$86
2d12 : a0 02 __ LDY #$02
2d14 : 91 23 __ STA (SP + 0),y 
2d16 : a9 52 __ LDA #$52
2d18 : c8 __ __ INY
2d19 : 91 23 __ STA (SP + 0),y 
2d1b : a9 f6 __ LDA #$f6
2d1d : c8 __ __ INY
2d1e : 91 23 __ STA (SP + 0),y 
2d20 : a9 2e __ LDA #$2e
2d22 : c8 __ __ INY
2d23 : 91 23 __ STA (SP + 0),y 
2d25 : a5 50 __ LDA T2 + 0 
2d27 : c8 __ __ INY
2d28 : 91 23 __ STA (SP + 0),y 
2d2a : a9 00 __ LDA #$00
2d2c : 85 51 __ STA T5 + 0 
2d2e : c8 __ __ INY
2d2f : 91 23 __ STA (SP + 0),y 
2d31 : 20 a4 2d JSR $2da4 ; (sprintf.s0 + 0)
2d34 : a9 19 __ LDA #$19
2d36 : 85 11 __ STA P4 
2d38 : a9 05 __ LDA #$05
2d3a : 85 12 __ STA P5 
2d3c : 20 d2 2d JSR $2dd2 ; (vdc_prints@proxy + 0)
2d3f : a9 1a __ LDA #$1a
2d41 : 8d 00 d6 STA $d600 
2d44 : 20 3d 2f JSR $2f3d ; (raster_synch.s0 + 0)
2d47 : a5 50 __ LDA T2 + 0 
2d49 : 85 4e __ STA T0 + 0 
.l11:
2d4b : a5 4e __ LDA T0 + 0 
2d4d : 20 6d 2f JSR $2f6d ; (raster_waitline.s1000 + 0)
2d50 : a5 51 __ LDA T5 + 0 
2d52 : 49 0f __ EOR #$0f
2d54 : 8d 01 d6 STA $d601 
2d57 : c6 4e __ DEC T0 + 0 
2d59 : e6 51 __ INC T5 + 0 
2d5b : a5 51 __ LDA T5 + 0 
2d5d : c9 10 __ CMP #$10
2d5f : 90 ea __ BCC $2d4b ; (raster_place_test.l11 + 0)
.l15:
2d61 : ad 00 d6 LDA $d600 
2d64 : 29 20 __ AND #$20
2d66 : f0 f9 __ BEQ $2d61 ; (raster_place_test.l15 + 0)
.s14:
2d68 : 58 __ __ CLI
2d69 : 20 e4 ff JSR $ffe4 
2d6c : 85 1b __ STA ACCU + 0 
2d6e : c9 11 __ CMP #$11
2d70 : d0 0c __ BNE $2d7e ; (raster_place_test.s19 + 0)
.s20:
2d72 : a5 50 __ LDA T2 + 0 
2d74 : c9 11 __ CMP #$11
2d76 : 90 04 __ BCC $2d7c ; (raster_place_test.s1018 + 0)
.s17:
2d78 : c6 50 __ DEC T2 + 0 
2d7a : b0 10 __ BCS $2d8c ; (raster_place_test.s23 + 0)
.s1018:
2d7c : a5 1b __ LDA ACCU + 0 
.s19:
2d7e : c9 91 __ CMP #$91
2d80 : d0 0a __ BNE $2d8c ; (raster_place_test.s23 + 0)
.s24:
2d82 : a5 50 __ LDA T2 + 0 
2d84 : c9 ac __ CMP #$ac
2d86 : b0 04 __ BCS $2d8c ; (raster_place_test.s23 + 0)
.s21:
2d88 : e6 50 __ INC T2 + 0 
2d8a : 90 84 __ BCC $2d10 ; (raster_place_test.l8 + 0)
.s23:
2d8c : a5 1b __ LDA ACCU + 0 
2d8e : c9 1b __ CMP #$1b
2d90 : f0 03 __ BEQ $2d95 ; (raster_place_test.s9 + 0)
2d92 : 4c 10 2d JMP $2d10 ; (raster_place_test.l8 + 0)
.s9:
2d95 : 20 68 27 JSR $2768 ; (vdc_cls.s0 + 0)
.s1001:
2d98 : 18 __ __ CLC
2d99 : a5 23 __ LDA SP + 0 
2d9b : 69 08 __ ADC #$08
2d9d : 85 23 __ STA SP + 0 
2d9f : 90 02 __ BCC $2da3 ; (raster_place_test.s1001 + 11)
2da1 : e6 24 __ INC SP + 1 
2da3 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->void
.s0:
2da4 : a9 00 __ LDA #$00
2da6 : 8d fd bf STA $bffd ; (sstack + 4)
2da9 : a0 02 __ LDY #$02
2dab : b1 23 __ LDA (SP + 0),y 
2dad : 85 16 __ STA P9 
2daf : c8 __ __ INY
2db0 : b1 23 __ LDA (SP + 0),y 
2db2 : 85 17 __ STA P10 
2db4 : c8 __ __ INY
2db5 : b1 23 __ LDA (SP + 0),y 
2db7 : 8d f9 bf STA $bff9 ; (sstack + 0)
2dba : c8 __ __ INY
2dbb : b1 23 __ LDA (SP + 0),y 
2dbd : 8d fa bf STA $bffa ; (sstack + 1)
2dc0 : 18 __ __ CLC
2dc1 : a5 23 __ LDA SP + 0 
2dc3 : 69 06 __ ADC #$06
2dc5 : 8d fb bf STA $bffb ; (sstack + 2)
2dc8 : a5 24 __ LDA SP + 1 
2dca : 69 00 __ ADC #$00
2dcc : 8d fc bf STA $bffc ; (sstack + 3)
2dcf : 4c bb 1e JMP $1ebb ; (sformat.s0 + 0)
--------------------------------------------------------------------
vdc_prints@proxy: ; vdc_prints@proxy
2dd2 : a9 86 __ LDA #$86
2dd4 : 85 13 __ STA P6 
2dd6 : a9 52 __ LDA #$52
2dd8 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_prints: ; vdc_prints(u8,u8,const u8*)->void
.s0:
2dda : a5 11 __ LDA P4 ; (x + 0)
2ddc : 85 0d __ STA P0 
2dde : a9 00 __ LDA #$00
2de0 : 85 0e __ STA P1 
2de2 : 85 10 __ STA P3 
2de4 : a5 12 __ LDA P5 ; (y + 0)
2de6 : 85 0f __ STA P2 
2de8 : ad 74 52 LDA $5274 ; (vdc_state + 11)
2deb : 85 43 __ STA T0 + 0 
2ded : 20 54 28 JSR $2854 ; (vdc_coords.s0 + 0)
2df0 : a5 1b __ LDA ACCU + 0 
2df2 : 85 44 __ STA T1 + 0 
2df4 : a5 1c __ LDA ACCU + 1 
2df6 : 85 45 __ STA T1 + 1 
2df8 : ad 75 52 LDA $5275 ; (vdc_state + 12)
2dfb : 18 __ __ CLC
2dfc : 65 1b __ ADC ACCU + 0 
2dfe : 85 0d __ STA P0 
2e00 : ad 76 52 LDA $5276 ; (vdc_state + 13)
2e03 : 65 1c __ ADC ACCU + 1 
2e05 : 85 0e __ STA P1 
2e07 : a0 00 __ LDY #$00
2e09 : 84 46 __ STY T2 + 0 
2e0b : b1 13 __ LDA (P6),y ; (string + 0)
2e0d : f0 16 __ BEQ $2e25 ; (vdc_prints.s5 + 0)
.s4:
2e0f : a5 13 __ LDA P6 ; (string + 0)
2e11 : 85 1b __ STA ACCU + 0 
2e13 : a2 00 __ LDX #$00
.l1038:
2e15 : c8 __ __ INY
2e16 : d0 01 __ BNE $2e19 ; (vdc_prints.s1048 + 0)
.s1047:
2e18 : e8 __ __ INX
.s1048:
2e19 : 8a __ __ TXA
2e1a : 18 __ __ CLC
2e1b : 65 14 __ ADC P7 ; (string + 1)
2e1d : 85 1c __ STA ACCU + 1 
2e1f : b1 1b __ LDA (ACCU + 0),y 
2e21 : d0 f2 __ BNE $2e15 ; (vdc_prints.l1038 + 0)
.s1039:
2e23 : 84 46 __ STY T2 + 0 
.s5:
2e25 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
2e28 : a5 46 __ LDA T2 + 0 
2e2a : f0 55 __ BEQ $2e81 ; (vdc_prints.s10 + 0)
.s68:
2e2c : a0 00 __ LDY #$00
.l8:
2e2e : b1 13 __ LDA (P6),y ; (string + 0)
2e30 : c9 20 __ CMP #$20
2e32 : b0 05 __ BCS $2e39 ; (vdc_prints.s14 + 0)
.s13:
2e34 : 69 80 __ ADC #$80
2e36 : 4c 73 2e JMP $2e73 ; (vdc_prints.s1040 + 0)
.s14:
2e39 : c9 40 __ CMP #$40
2e3b : aa __ __ TAX
2e3c : 90 2f __ BCC $2e6d ; (vdc_prints.s33 + 0)
.s19:
2e3e : c9 60 __ CMP #$60
2e40 : 90 1b __ BCC $2e5d ; (vdc_prints.s16 + 0)
.s23:
2e42 : 09 00 __ ORA #$00
2e44 : 30 06 __ BMI $2e4c ; (vdc_prints.s21 + 0)
.s20:
2e46 : 38 __ __ SEC
2e47 : e9 20 __ SBC #$20
2e49 : 4c 73 2e JMP $2e73 ; (vdc_prints.s1040 + 0)
.s21:
2e4c : c9 80 __ CMP #$80
2e4e : 90 1d __ BCC $2e6d ; (vdc_prints.s33 + 0)
.s27:
2e50 : c9 a0 __ CMP #$a0
2e52 : b0 05 __ BCS $2e59 ; (vdc_prints.s31 + 0)
.s24:
2e54 : 69 40 __ ADC #$40
2e56 : 4c 73 2e JMP $2e73 ; (vdc_prints.s1040 + 0)
.s31:
2e59 : c9 c0 __ CMP #$c0
2e5b : b0 06 __ BCS $2e63 ; (vdc_prints.s35 + 0)
.s16:
2e5d : 38 __ __ SEC
2e5e : e9 40 __ SBC #$40
2e60 : 4c 73 2e JMP $2e73 ; (vdc_prints.s1040 + 0)
.s35:
2e63 : c9 ff __ CMP #$ff
2e65 : b0 06 __ BCS $2e6d ; (vdc_prints.s33 + 0)
.s32:
2e67 : 38 __ __ SEC
2e68 : e9 80 __ SBC #$80
2e6a : 4c 73 2e JMP $2e73 ; (vdc_prints.s1040 + 0)
.s33:
2e6d : c9 ff __ CMP #$ff
2e6f : d0 03 __ BNE $2e74 ; (vdc_prints.l221 + 0)
.s36:
2e71 : a9 5e __ LDA #$5e
.s1040:
2e73 : aa __ __ TAX
.l221:
2e74 : 2c 00 d6 BIT $d600 
2e77 : 10 fb __ BPL $2e74 ; (vdc_prints.l221 + 0)
.s41:
2e79 : 8e 01 d6 STX $d601 
2e7c : c8 __ __ INY
2e7d : c4 46 __ CPY T2 + 0 
2e7f : 90 ad __ BCC $2e2e ; (vdc_prints.l8 + 0)
.s10:
2e81 : ad 77 52 LDA $5277 ; (vdc_state + 14)
2e84 : 18 __ __ CLC
2e85 : 65 44 __ ADC T1 + 0 
2e87 : 85 0d __ STA P0 
2e89 : ad 78 52 LDA $5278 ; (vdc_state + 15)
2e8c : 65 45 __ ADC T1 + 1 
2e8e : 85 0e __ STA P1 
2e90 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
2e93 : a6 46 __ LDX T2 + 0 
2e95 : ca __ __ DEX
.l224:
2e96 : 2c 00 d6 BIT $d600 
2e99 : 10 fb __ BPL $2e96 ; (vdc_prints.l224 + 0)
.s45:
2e9b : a5 43 __ LDA T0 + 0 
2e9d : 8d 01 d6 STA $d601 
2ea0 : a0 18 __ LDY #$18
2ea2 : 8c 00 d6 STY $d600 
.l226:
2ea5 : 2c 00 d6 BIT $d600 
2ea8 : 10 fb __ BPL $2ea5 ; (vdc_prints.l226 + 0)
.s51:
2eaa : ad 01 d6 LDA $d601 
2ead : 29 7f __ AND #$7f
2eaf : 8c 00 d6 STY $d600 
.l228:
2eb2 : 2c 00 d6 BIT $d600 
2eb5 : 10 fb __ BPL $2eb2 ; (vdc_prints.l228 + 0)
.s57:
2eb7 : 8d 01 d6 STA $d601 
2eba : a9 1e __ LDA #$1e
2ebc : 8d 00 d6 STA $d600 
.l230:
2ebf : 2c 00 d6 BIT $d600 
2ec2 : 10 fb __ BPL $2ebf ; (vdc_prints.l230 + 0)
.s62:
2ec4 : 8e 01 d6 STX $d601 
.s1001:
2ec7 : 60 __ __ RTS
--------------------------------------------------------------------
2ec8 : __ __ __ BYT 72 41 53 54 45 52 4c 49 4e 45 20 50 4c 41 43 45 : rASTERLINE PLACE
2ed8 : __ __ __ BYT 4d 45 4e 54 20 54 45 53 54 2e 00                : MENT TEST..
--------------------------------------------------------------------
2ee3 : __ __ __ BYT 70 52 45 53 53 20 65 73 63 20 54 4f 20 45 58 49 : pRESS esc TO EXI
2ef3 : __ __ __ BYT 54 2e 00                                        : T..
--------------------------------------------------------------------
2ef6 : __ __ __ BYT 25 33 55 00                                     : %3U.
--------------------------------------------------------------------
seed:
2efa : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
c2A:
2efc : __ __ __ BSS	2
--------------------------------------------------------------------
c2B:
2efe : __ __ __ BSS	2
--------------------------------------------------------------------
2f00 : __ __ __ BYT 6d 4f 56 45 20 42 41 52 20 57 49 54 48 20 63 75 : mOVE BAR WITH cu
2f10 : __ __ __ BYT 72 73 6f 72 20 75 70 20 41 4e 44 20 63 75 72 73 : rsor up AND curs
2f20 : __ __ __ BYT 6f 72 20 64 6f 77 6e 2e 00                      : or down..
--------------------------------------------------------------------
2f29 : __ __ __ BYT 70 52 45 53 45 4e 54 20 52 41 53 54 45 52 4c 49 : pRESENT RASTERLI
2f39 : __ __ __ BYT 4e 45 3a 00                                     : NE:.
--------------------------------------------------------------------
raster_synch: ; raster_synch()->void
.s0:
2f3d : 78 __ __ SEI
2f3e : a9 20 __ LDA #$20
2f40 : a2 7f __ LDX #$7f
2f42 : 8e 0d dd STX $dd0d 
2f45 : a2 3e __ LDX #$3e
2f47 : 8e 04 dd STX $dd04 
2f4a : a2 ff __ LDX #$ff
2f4c : 8e 06 dd STX $dd06 
2f4f : a9 00 __ LDA #$00
2f51 : 8d 05 dd STA $dd05 
2f54 : 8d 07 dd STA $dd07 
2f57 : 2c 00 d6 BIT $d600 
2f5a : d0 fb __ BNE $2f57 ; (raster_synch.s0 + 26)
2f5c : a2 09 __ LDX #$09
2f5e : ea __ __ NOP
2f5f : ca __ __ DEX
2f60 : d0 fd __ BNE $2f5f ; (raster_synch.s0 + 34)
2f62 : a9 11 __ LDA #$11
2f64 : 8d 0e dd STA $dd0e 
2f67 : a9 51 __ LDA #$51
2f69 : 8d 0f dd STA $dd0f 
.s1001:
2f6c : 60 __ __ RTS
--------------------------------------------------------------------
raster_waitline: ; raster_waitline(u8)->void
.s1000:
2f6d : 85 0d __ STA P0 
.s0:
2f6f : a5 0d __ LDA P0 
2f71 : cd 06 dd CMP $dd06 
2f74 : d0 fb __ BNE $2f71 ; (raster_waitline.s0 + 2)
2f76 : 4a __ __ LSR
2f77 : 4a __ __ LSR
2f78 : 4a __ __ LSR
2f79 : 4a __ __ LSR
2f7a : 8d 7e 2f STA $2f7e ; (raster_waitline.s0 + 15)
2f7d : d0 0f __ BNE $2f8e ; (raster_waitline.s1001 + 0)
2f7f : ea __ __ NOP
2f80 : ea __ __ NOP
2f81 : ea __ __ NOP
2f82 : ea __ __ NOP
2f83 : ea __ __ NOP
2f84 : ea __ __ NOP
2f85 : ea __ __ NOP
2f86 : ea __ __ NOP
2f87 : ea __ __ NOP
2f88 : ea __ __ NOP
2f89 : ea __ __ NOP
2f8a : ea __ __ NOP
2f8b : ea __ __ NOP
2f8c : ea __ __ NOP
2f8d : ea __ __ NOP
.s1001:
2f8e : 60 __ __ RTS
--------------------------------------------------------------------
vdcwin_border_clear: ; vdcwin_border_clear(struct VDCWin*,u8)->void
.s0:
2f8f : ad 04 52 LDA $5204 ; (winStyles + 0)
2f92 : 85 46 __ STA T0 + 0 
2f94 : ad f9 bf LDA $bff9 ; (sstack + 0)
2f97 : 85 47 __ STA T1 + 0 
2f99 : ad fa bf LDA $bffa ; (sstack + 1)
2f9c : 85 48 __ STA T1 + 1 
2f9e : a0 00 __ LDY #$00
2fa0 : b1 47 __ LDA (T1 + 0),y 
2fa2 : f0 04 __ BEQ $2fa8 ; (vdcwin_border_clear.s1008 + 0)
.s1009:
2fa4 : a9 f0 __ LDA #$f0
2fa6 : d0 02 __ BNE $2faa ; (vdcwin_border_clear.s1010 + 0)
.s1008:
2fa8 : a9 b0 __ LDA #$b0
.s1010:
2faa : 85 4a __ STA T3 + 0 
2fac : b1 47 __ LDA (T1 + 0),y 
2fae : 85 4b __ STA T5 + 0 
2fb0 : a0 02 __ LDY #$02
2fb2 : b1 47 __ LDA (T1 + 0),y 
2fb4 : 85 49 __ STA T2 + 0 
2fb6 : 18 __ __ CLC
2fb7 : 65 4b __ ADC T5 + 0 
2fb9 : 85 4c __ STA T6 + 0 
2fbb : a9 00 __ LDA #$00
2fbd : 2a __ __ ROL
2fbe : aa __ __ TAX
2fbf : a5 4c __ LDA T6 + 0 
2fc1 : 69 01 __ ADC #$01
2fc3 : 85 4d __ STA T7 + 0 
2fc5 : 90 01 __ BCC $2fc8 ; (vdcwin_border_clear.s1012 + 0)
.s1011:
2fc7 : e8 __ __ INX
.s1012:
2fc8 : 86 4e __ STX T7 + 1 
2fca : ad 6d 52 LDA $526d ; (vdc_state + 4)
2fcd : c5 4e __ CMP T7 + 1 
2fcf : d0 05 __ BNE $2fd6 ; (vdcwin_border_clear.s1007 + 0)
.s1006:
2fd1 : ad 6c 52 LDA $526c ; (vdc_state + 3)
2fd4 : c5 4d __ CMP T7 + 0 
.s1007:
2fd6 : a5 4a __ LDA T3 + 0 
2fd8 : b0 04 __ BCS $2fde ; (vdcwin_border_clear.s53 + 0)
.s5:
2fda : 29 df __ AND #$df
2fdc : 85 4a __ STA T3 + 0 
.s53:
2fde : 10 4d __ BPL $302d ; (vdcwin_border_clear.s1013 + 0)
.s12:
2fe0 : a0 01 __ LDY #$01
2fe2 : b1 47 __ LDA (T1 + 0),y 
2fe4 : f0 49 __ BEQ $302f ; (vdcwin_border_clear.s22 + 0)
.s9:
2fe6 : 38 __ __ SEC
2fe7 : e9 01 __ SBC #$01
2fe9 : 85 4d __ STA T7 + 0 
2feb : a5 4a __ LDA T3 + 0 
2fed : 0a __ __ ASL
2fee : 10 15 __ BPL $3005 ; (vdcwin_border_clear.s15 + 0)
.s13:
2ff0 : a5 4d __ LDA T7 + 0 
2ff2 : 85 12 __ STA P5 
2ff4 : a5 46 __ LDA T0 + 0 
2ff6 : 85 14 __ STA P7 
2ff8 : a6 4b __ LDX T5 + 0 
2ffa : ca __ __ DEX
2ffb : 86 11 __ STX P4 
2ffd : ad 05 52 LDA $5205 ; (winStyles + 1)
3000 : 85 13 __ STA P6 
3002 : 20 06 31 JSR $3106 ; (vdc_printc.s0 + 0)
.s15:
3005 : a5 4b __ LDA T5 + 0 
3007 : 85 11 __ STA P4 
3009 : a9 00 __ LDA #$00
300b : 85 12 __ STA P5 
300d : 85 14 __ STA P7 
300f : ad 09 52 LDA $5209 ; (winStyles + 5)
3012 : 85 15 __ STA P8 
3014 : 20 c4 50 JSR $50c4 ; (vdc_hchar@proxy + 0)
3017 : a5 4a __ LDA T3 + 0 
3019 : 29 20 __ AND #$20
301b : f0 10 __ BEQ $302d ; (vdcwin_border_clear.s1013 + 0)
.s16:
301d : a5 4c __ LDA T6 + 0 
301f : 85 11 __ STA P4 
3021 : a5 13 __ LDA P6 
3023 : 85 12 __ STA P5 
3025 : ad 06 52 LDA $5206 ; (winStyles + 2)
3028 : 85 13 __ STA P6 
302a : 20 02 31 JSR $3102 ; (vdc_printc@proxy + 0)
.s1013:
302d : a0 01 __ LDY #$01
.s22:
302f : b1 47 __ LDA (T1 + 0),y 
3031 : 18 __ __ CLC
3032 : a0 03 __ LDY #$03
3034 : 71 47 __ ADC (T1 + 0),y 
3036 : 85 4d __ STA T7 + 0 
3038 : a9 00 __ LDA #$00
303a : 2a __ __ ROL
303b : 85 4e __ STA T7 + 1 
303d : cd 6f 52 CMP $526f ; (vdc_state + 6)
3040 : d0 05 __ BNE $3047 ; (vdcwin_border_clear.s1005 + 0)
.s1004:
3042 : a5 4d __ LDA T7 + 0 
3044 : cd 6e 52 CMP $526e ; (vdc_state + 5)
.s1005:
3047 : b0 44 __ BCS $308d ; (vdcwin_border_clear.s39 + 0)
.s19:
3049 : a5 4a __ LDA T3 + 0 
304b : 0a __ __ ASL
304c : 10 15 __ BPL $3063 ; (vdcwin_border_clear.s25 + 0)
.s23:
304e : a5 4d __ LDA T7 + 0 
3050 : 85 12 __ STA P5 
3052 : a5 46 __ LDA T0 + 0 
3054 : 85 14 __ STA P7 
3056 : a6 4b __ LDX T5 + 0 
3058 : ca __ __ DEX
3059 : 86 11 __ STX P4 
305b : ad 07 52 LDA $5207 ; (winStyles + 3)
305e : 85 13 __ STA P6 
3060 : 20 06 31 JSR $3106 ; (vdc_printc.s0 + 0)
.s25:
3063 : a5 4b __ LDA T5 + 0 
3065 : 85 11 __ STA P4 
3067 : a9 00 __ LDA #$00
3069 : 85 12 __ STA P5 
306b : a5 4e __ LDA T7 + 1 
306d : 85 14 __ STA P7 
306f : ad 0a 52 LDA $520a ; (winStyles + 6)
3072 : 85 15 __ STA P8 
3074 : 20 c4 50 JSR $50c4 ; (vdc_hchar@proxy + 0)
3077 : a5 4a __ LDA T3 + 0 
3079 : 29 20 __ AND #$20
307b : f0 10 __ BEQ $308d ; (vdcwin_border_clear.s39 + 0)
.s26:
307d : a5 4c __ LDA T6 + 0 
307f : 85 11 __ STA P4 
3081 : a5 13 __ LDA P6 
3083 : 85 12 __ STA P5 
3085 : ad 08 52 LDA $5208 ; (winStyles + 4)
3088 : 85 13 __ STA P6 
308a : 20 02 31 JSR $3102 ; (vdc_printc@proxy + 0)
.s39:
308d : a9 00 __ LDA #$00
308f : 85 49 __ STA T2 + 0 
3091 : f0 04 __ BEQ $3097 ; (vdcwin_border_clear.l29 + 0)
.s66:
3093 : e6 49 __ INC T2 + 0 
3095 : a5 49 __ LDA T2 + 0 
.l29:
3097 : a0 03 __ LDY #$03
3099 : d1 47 __ CMP (T1 + 0),y 
309b : 90 01 __ BCC $309e ; (vdcwin_border_clear.s30 + 0)
.s1001:
309d : 60 __ __ RTS
.s30:
309e : a5 4a __ LDA T3 + 0 
30a0 : 0a __ __ ASL
30a1 : 10 1d __ BPL $30c0 ; (vdcwin_border_clear.s35 + 0)
.s33:
30a3 : a5 46 __ LDA T0 + 0 
30a5 : 85 14 __ STA P7 
30a7 : 38 __ __ SEC
30a8 : a0 00 __ LDY #$00
30aa : b1 47 __ LDA (T1 + 0),y 
30ac : e9 01 __ SBC #$01
30ae : 85 11 __ STA P4 
30b0 : c8 __ __ INY
30b1 : b1 47 __ LDA (T1 + 0),y 
30b3 : 18 __ __ CLC
30b4 : 65 49 __ ADC T2 + 0 
30b6 : 85 12 __ STA P5 
30b8 : ad 0b 52 LDA $520b ; (winStyles + 7)
30bb : 85 13 __ STA P6 
30bd : 20 06 31 JSR $3106 ; (vdc_printc.s0 + 0)
.s35:
30c0 : a9 20 __ LDA #$20
30c2 : 85 15 __ STA P8 
30c4 : a0 02 __ LDY #$02
30c6 : b1 47 __ LDA (T1 + 0),y 
30c8 : 85 17 __ STA P10 
30ca : a0 00 __ LDY #$00
30cc : b1 47 __ LDA (T1 + 0),y 
30ce : 85 11 __ STA P4 
30d0 : c8 __ __ INY
30d1 : b1 47 __ LDA (T1 + 0),y 
30d3 : 18 __ __ CLC
30d4 : 65 49 __ ADC T2 + 0 
30d6 : 85 13 __ STA P6 
30d8 : a9 00 __ LDA #$00
30da : 85 12 __ STA P5 
30dc : 2a __ __ ROL
30dd : 85 14 __ STA P7 
30df : 20 a4 27 JSR $27a4 ; (vdc_hchar@proxy + 0)
30e2 : a5 4a __ LDA T3 + 0 
30e4 : 29 20 __ AND #$20
30e6 : f0 ab __ BEQ $3093 ; (vdcwin_border_clear.s66 + 0)
.s36:
30e8 : a5 13 __ LDA P6 
30ea : 85 12 __ STA P5 
30ec : a5 46 __ LDA T0 + 0 
30ee : 85 14 __ STA P7 
30f0 : 18 __ __ CLC
30f1 : a5 17 __ LDA P10 
30f3 : 65 11 __ ADC P4 
30f5 : 85 11 __ STA P4 
30f7 : ad 0c 52 LDA $520c ; (winStyles + 8)
30fa : 85 13 __ STA P6 
30fc : 20 06 31 JSR $3106 ; (vdc_printc.s0 + 0)
30ff : 4c 93 30 JMP $3093 ; (vdcwin_border_clear.s66 + 0)
--------------------------------------------------------------------
vdc_printc@proxy: ; vdc_printc@proxy
3102 : a5 46 __ LDA $46 
3104 : 85 14 __ STA P7 
--------------------------------------------------------------------
vdc_printc: ; vdc_printc(u8,u8,u8,u8)->void
.s0:
3106 : a5 11 __ LDA P4 ; (x + 0)
3108 : 85 0d __ STA P0 
310a : a9 00 __ LDA #$00
310c : 85 0e __ STA P1 
310e : 85 10 __ STA P3 
3110 : a5 12 __ LDA P5 ; (y + 0)
3112 : 85 0f __ STA P2 
3114 : 20 54 28 JSR $2854 ; (vdc_coords.s0 + 0)
3117 : a9 12 __ LDA #$12
3119 : 8d 00 d6 STA $d600 
311c : 18 __ __ CLC
311d : a5 1b __ LDA ACCU + 0 
311f : 6d 75 52 ADC $5275 ; (vdc_state + 12)
3122 : a8 __ __ TAY
3123 : a5 1c __ LDA ACCU + 1 
3125 : 6d 76 52 ADC $5276 ; (vdc_state + 13)
.l165:
3128 : 2c 00 d6 BIT $d600 
312b : 10 fb __ BPL $3128 ; (vdc_printc.l165 + 0)
.s7:
312d : 8d 01 d6 STA $d601 
3130 : a9 13 __ LDA #$13
3132 : 8d 00 d6 STA $d600 
.l167:
3135 : 2c 00 d6 BIT $d600 
3138 : 10 fb __ BPL $3135 ; (vdc_printc.l167 + 0)
.s12:
313a : 8c 01 d6 STY $d601 
313d : a9 1f __ LDA #$1f
313f : 8d 00 d6 STA $d600 
.l169:
3142 : 2c 00 d6 BIT $d600 
3145 : 10 fb __ BPL $3142 ; (vdc_printc.l169 + 0)
.s16:
3147 : a5 13 __ LDA P6 ; (val + 0)
3149 : 8d 01 d6 STA $d601 
314c : ad 77 52 LDA $5277 ; (vdc_state + 14)
314f : 18 __ __ CLC
3150 : 65 1b __ ADC ACCU + 0 
3152 : a8 __ __ TAY
3153 : a9 12 __ LDA #$12
3155 : 8d 00 d6 STA $d600 
3158 : ad 78 52 LDA $5278 ; (vdc_state + 15)
315b : 65 1c __ ADC ACCU + 1 
.l171:
315d : 2c 00 d6 BIT $d600 
3160 : 10 fb __ BPL $315d ; (vdc_printc.l171 + 0)
.s23:
3162 : 8d 01 d6 STA $d601 
3165 : a9 13 __ LDA #$13
3167 : 8d 00 d6 STA $d600 
.l173:
316a : 2c 00 d6 BIT $d600 
316d : 10 fb __ BPL $316a ; (vdc_printc.l173 + 0)
.s28:
316f : 8c 01 d6 STY $d601 
3172 : a9 1f __ LDA #$1f
3174 : 8d 00 d6 STA $d600 
.l175:
3177 : 2c 00 d6 BIT $d600 
317a : 10 fb __ BPL $3177 ; (vdc_printc.l175 + 0)
.s32:
317c : a5 14 __ LDA P7 ; (attr + 0)
317e : 8d 01 d6 STA $d601 
.s1001:
3181 : 60 __ __ RTS
--------------------------------------------------------------------
3182 : __ __ __ BYT 76 64 63 20 72 41 53 54 45 52 20 42 41 52 20 54 : vdc rASTER BAR T
3192 : __ __ __ BYT 45 53 54 00                                     : EST.
--------------------------------------------------------------------
raster_bar: ; raster_bar(u8,u8,u8)->void
.s0:
3196 : a9 a0 __ LDA #$a0
3198 : 85 43 __ STA T0 + 0 
319a : a9 ff __ LDA #$ff
319c : 85 44 __ STA T1 + 0 
.l76:
319e : 20 e4 ff JSR $ffe4 
31a1 : 09 00 __ ORA #$00
31a3 : d0 f9 __ BNE $319e ; (raster_bar.l76 + 0)
.l4:
31a5 : a9 1a __ LDA #$1a
31a7 : 8d 00 d6 STA $d600 
31aa : 20 3d 2f JSR $2f3d ; (raster_synch.s0 + 0)
31ad : a5 43 __ LDA T0 + 0 
31af : 85 45 __ STA T3 + 0 
31b1 : a9 00 __ LDA #$00
31b3 : 85 46 __ STA T4 + 0 
.l8:
31b5 : a5 45 __ LDA T3 + 0 
31b7 : 20 6d 2f JSR $2f6d ; (raster_waitline.s1000 + 0)
31ba : a6 46 __ LDX T4 + 0 
31bc : e8 __ __ INX
31bd : 86 46 __ STX T4 + 0 
31bf : bd 1d 52 LDA $521d,x ; (p2smap + 7)
31c2 : 8d 01 d6 STA $d601 
31c5 : c6 45 __ DEC T3 + 0 
31c7 : e0 0d __ CPX #$0d
31c9 : 90 ea __ BCC $31b5 ; (raster_bar.l8 + 0)
.l12:
31cb : ad 00 d6 LDA $d600 
31ce : 29 20 __ AND #$20
31d0 : f0 f9 __ BEQ $31cb ; (raster_bar.l12 + 0)
.s11:
31d2 : 58 __ __ CLI
31d3 : 18 __ __ CLC
31d4 : a5 44 __ LDA T1 + 0 
31d6 : 65 43 __ ADC T0 + 0 
31d8 : 85 43 __ STA T0 + 0 
31da : c9 a0 __ CMP #$a0
31dc : f0 04 __ BEQ $31e2 ; (raster_bar.s14 + 0)
.s17:
31de : 09 00 __ ORA #$00
31e0 : d0 07 __ BNE $31e9 ; (raster_bar.s81 + 0)
.s14:
31e2 : 38 __ __ SEC
31e3 : a9 00 __ LDA #$00
31e5 : e5 44 __ SBC T1 + 0 
31e7 : 85 44 __ STA T1 + 0 
.s81:
31e9 : 20 e4 ff JSR $ffe4 
31ec : 09 00 __ ORA #$00
31ee : f0 b5 __ BEQ $31a5 ; (raster_bar.l4 + 0)
.s1001:
31f0 : 60 __ __ RTS
--------------------------------------------------------------------
init_plasma: ; init_plasma(u8)->void
.s1000:
31f1 : a2 05 __ LDX #$05
31f3 : b5 53 __ LDA T0 + 0,x 
31f5 : 9d eb bf STA $bfeb,x ; (xbuf0 + 66)
31f8 : ca __ __ DEX
31f9 : 10 f8 __ BPL $31f3 ; (init_plasma.s1000 + 2)
.s0:
31fb : a9 01 __ LDA #$01
31fd : 8d f1 bf STA $bff1 ; (xbuf0 + 72)
3200 : 8d f7 bf STA $bff7 ; (xbuf0 + 78)
3203 : a9 06 __ LDA #$06
3205 : 85 18 __ STA P11 
3207 : a9 38 __ LDA #$38
3209 : 8d f2 bf STA $bff2 ; (xbuf0 + 73)
320c : 8d f6 bf STA $bff6 ; (xbuf0 + 77)
320f : a9 7c __ LDA #$7c
3211 : 8d f3 bf STA $bff3 ; (xbuf0 + 74)
3214 : 8d f4 bf STA $bff4 ; (xbuf0 + 75)
3217 : 8d f5 bf STA $bff5 ; (xbuf0 + 76)
321a : a9 83 __ LDA #$83
321c : 8d f8 bf STA $bff8 ; (xbuf0 + 79)
321f : 20 4e 29 JSR $294e ; (vdc_set_mode.s0 + 0)
3222 : ad 72 52 LDA $5272 ; (vdc_state + 9)
3225 : f0 45 __ BEQ $326c ; (init_plasma.s1001 + 0)
.s3:
3227 : ad 71 52 LDA $5271 ; (vdc_state + 8)
322a : d0 4b __ BNE $3277 ; (init_plasma.s44 + 0)
.s8:
322c : a9 00 __ LDA #$00
322e : 85 55 __ STA T2 + 0 
3230 : 85 56 __ STA T2 + 1 
.l1014:
3232 : 85 1b __ STA ACCU + 0 
3234 : a5 56 __ LDA T2 + 1 
3236 : 85 1c __ STA ACCU + 1 
3238 : a9 25 __ LDA #$25
323a : 85 03 __ STA WORK + 0 
323c : a9 00 __ LDA #$00
323e : 85 04 __ STA WORK + 1 
3240 : 20 52 4f JSR $4f52 ; (divmod + 0)
3243 : a6 1b __ LDX ACCU + 0 
3245 : bd 2b 52 LDA $522b,x ; (colors0 + 0)
3248 : a4 55 __ LDY T2 + 0 
324a : 99 00 55 STA $5500,y ; (colormap0 + 0)
324d : bd 32 52 LDA $5232,x ; (colors1 + 0)
3250 : 0a __ __ ASL
3251 : 0a __ __ ASL
3252 : 0a __ __ ASL
3253 : 0a __ __ ASL
3254 : 99 00 56 STA $5600,y ; (colormap1 + 0)
3257 : 98 __ __ TYA
3258 : 18 __ __ CLC
3259 : 69 01 __ ADC #$01
325b : 85 55 __ STA T2 + 0 
325d : 90 02 __ BCC $3261 ; (init_plasma.s1018 + 0)
.s1017:
325f : e6 56 __ INC T2 + 1 
.s1018:
3261 : 09 00 __ ORA #$00
3263 : d0 cd __ BNE $3232 ; (init_plasma.l1014 + 0)
.s37:
3265 : 85 0f __ STA P2 
3267 : 85 10 __ STA P3 
3269 : 20 e8 32 JSR $32e8 ; (memset@proxy + 0)
.s1001:
326c : a2 05 __ LDX #$05
326e : bd eb bf LDA $bfeb,x ; (xbuf0 + 66)
3271 : 95 53 __ STA T0 + 0,x 
3273 : ca __ __ DEX
3274 : 10 f8 __ BPL $326e ; (init_plasma.s1001 + 2)
3276 : 60 __ __ RTS
.s44:
3277 : ad 70 52 LDA $5270 ; (vdc_state + 7)
327a : 85 54 __ STA T1 + 0 
327c : a9 00 __ LDA #$00
327e : 85 53 __ STA T0 + 0 
3280 : ac 75 52 LDY $5275 ; (vdc_state + 12)
3283 : ae 76 52 LDX $5276 ; (vdc_state + 13)
.l6:
3286 : a9 00 __ LDA #$00
3288 : 85 57 __ STA T3 + 0 
.l10:
328a : 86 0e __ STX P1 
328c : 84 0d __ STY P0 
328e : a6 57 __ LDX T3 + 0 
3290 : bd f1 bf LDA $bff1,x ; (xbuf0 + 72)
3293 : 85 58 __ STA T5 + 0 
3295 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
.l198:
3298 : 2c 00 d6 BIT $d600 
329b : 10 fb __ BPL $3298 ; (init_plasma.l198 + 0)
.s16:
329d : a5 58 __ LDA T5 + 0 
329f : 8d 01 d6 STA $d601 
32a2 : a2 18 __ LDX #$18
32a4 : 8e 00 d6 STX $d600 
.l200:
32a7 : 2c 00 d6 BIT $d600 
32aa : 10 fb __ BPL $32a7 ; (init_plasma.l200 + 0)
.s22:
32ac : ad 01 d6 LDA $d601 
32af : 29 7f __ AND #$7f
32b1 : 8e 00 d6 STX $d600 
.l202:
32b4 : 2c 00 d6 BIT $d600 
32b7 : 10 fb __ BPL $32b4 ; (init_plasma.l202 + 0)
.s28:
32b9 : 8d 01 d6 STA $d601 
32bc : a9 1e __ LDA #$1e
32be : 8d 00 d6 STA $d600 
.l204:
32c1 : 2c 00 d6 BIT $d600 
32c4 : 10 fb __ BPL $32c1 ; (init_plasma.l204 + 0)
.s33:
32c6 : a5 54 __ LDA T1 + 0 
32c8 : 8d 01 d6 STA $d601 
32cb : 18 __ __ CLC
32cc : 65 0d __ ADC P0 
32ce : a8 __ __ TAY
32cf : a9 00 __ LDA #$00
32d1 : 65 0e __ ADC P1 
32d3 : e6 57 __ INC T3 + 0 
32d5 : aa __ __ TAX
32d6 : a5 57 __ LDA T3 + 0 
32d8 : c9 08 __ CMP #$08
32da : 90 ae __ BCC $328a ; (init_plasma.l10 + 0)
.s7:
32dc : e6 53 __ INC T0 + 0 
32de : a5 53 __ LDA T0 + 0 
32e0 : cd 71 52 CMP $5271 ; (vdc_state + 8)
32e3 : 90 a1 __ BCC $3286 ; (init_plasma.l6 + 0)
32e5 : 4c 2c 32 JMP $322c ; (init_plasma.s8 + 0)
--------------------------------------------------------------------
memset@proxy: ; memset@proxy
32e8 : a9 00 __ LDA #$00
32ea : 85 0d __ STA P0 
32ec : a9 57 __ LDA #$57
32ee : 85 0e __ STA P1 
32f0 : a9 a0 __ LDA #$a0
32f2 : 85 11 __ STA P4 
32f4 : a9 0f __ LDA #$0f
32f6 : 85 12 __ STA P5 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
32f8 : a5 0f __ LDA P2 
32fa : a6 12 __ LDX P5 
32fc : f0 0c __ BEQ $330a ; (memset.s0 + 18)
32fe : a0 00 __ LDY #$00
3300 : 91 0d __ STA (P0),y 
3302 : c8 __ __ INY
3303 : d0 fb __ BNE $3300 ; (memset.s0 + 8)
3305 : e6 0e __ INC P1 
3307 : ca __ __ DEX
3308 : d0 f6 __ BNE $3300 ; (memset.s0 + 8)
330a : a4 11 __ LDY P4 
330c : f0 05 __ BEQ $3313 ; (memset.s1001 + 0)
330e : 88 __ __ DEY
330f : 91 0d __ STA (P0),y 
3311 : d0 fb __ BNE $330e ; (memset.s0 + 22)
.s1001:
3313 : 60 __ __ RTS
--------------------------------------------------------------------
doplasma0: ; doplasma0()->void
.s1000:
3314 : a2 17 __ LDX #$17
3316 : b5 53 __ LDA T12 + 0,x 
3318 : 9d c3 be STA $bec3,x ; (doplasma0@stack + 0)
331b : ca __ __ DEX
331c : 10 f8 __ BPL $3316 ; (doplasma0.s1000 + 2)
.s0:
331e : ad fc 2e LDA $2efc ; (c2A + 0)
3321 : 85 43 __ STA T0 + 0 
3323 : ad fd 2e LDA $2efd ; (c2A + 1)
3326 : 85 44 __ STA T0 + 1 
3328 : 85 45 __ STA T1 + 0 
332a : ad fe 2e LDA $2efe ; (c2B + 0)
332d : 85 47 __ STA T2 + 0 
332f : ad ff 2e LDA $2eff ; (c2B + 1)
3332 : 85 48 __ STA T2 + 1 
3334 : 85 1b __ STA ACCU + 0 
3336 : ad d9 52 LDA $52d9 ; (c1B + 0)
3339 : 85 49 __ STA T4 + 0 
333b : ad da 52 LDA $52da ; (c1B + 1)
333e : 85 4a __ STA T4 + 1 
3340 : 85 1d __ STA ACCU + 2 
3342 : ad d7 52 LDA $52d7 ; (c1A + 0)
3345 : 85 4b __ STA T6 + 0 
3347 : ad d8 52 LDA $52d8 ; (c1A + 1)
334a : 85 4c __ STA T6 + 1 
334c : ad 77 52 LDA $5277 ; (vdc_state + 14)
334f : 85 4e __ STA T8 + 0 
3351 : ad 78 52 LDA $5278 ; (vdc_state + 15)
3354 : 85 4f __ STA T8 + 1 
3356 : ad 71 52 LDA $5271 ; (vdc_state + 8)
3359 : 85 4d __ STA T7 + 0 
335b : c9 01 __ CMP #$01
335d : a9 00 __ LDA #$00
335f : 2a __ __ ROL
3360 : 85 1c __ STA ACCU + 1 
3362 : f0 2d __ BEQ $3391 ; (doplasma0.s5 + 0)
.s111:
3364 : a9 00 __ LDA #$00
3366 : 85 52 __ STA T11 + 0 
3368 : a4 4c __ LDY T6 + 1 
336a : 18 __ __ CLC
.l1047:
336b : 98 __ __ TYA
336c : 65 44 __ ADC T0 + 1 
336e : aa __ __ TAX
336f : bd 00 53 LDA $5300,x ; (sintab + 0)
3372 : a6 1d __ LDX ACCU + 2 
3374 : 18 __ __ CLC
3375 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3378 : a6 52 __ LDX T11 + 0 
337a : 9d 27 bf STA $bf27,x ; (ybuf0 + 0)
337d : 38 __ __ SEC
337e : a5 1d __ LDA ACCU + 2 
3380 : e9 05 __ SBC #$05
3382 : 85 1d __ STA ACCU + 2 
3384 : 98 __ __ TYA
3385 : 18 __ __ CLC
3386 : 69 0d __ ADC #$0d
3388 : e6 52 __ INC T11 + 0 
338a : a8 __ __ TAY
338b : a5 52 __ LDA T11 + 0 
338d : c5 4d __ CMP T7 + 0 
338f : 90 da __ BCC $336b ; (doplasma0.l1047 + 0)
.s5:
3391 : ad 70 52 LDA $5270 ; (vdc_state + 7)
3394 : 85 52 __ STA T11 + 0 
3396 : d0 06 __ BNE $339e ; (doplasma0.s1005 + 0)
.s1006:
3398 : a9 00 __ LDA #$00
339a : 85 1e __ STA ACCU + 3 
339c : f0 31 __ BEQ $33cf ; (doplasma0.s9 + 0)
.s1005:
339e : a9 01 __ LDA #$01
33a0 : 85 1e __ STA ACCU + 3 
33a2 : a9 00 __ LDA #$00
33a4 : 85 55 __ STA T15 + 0 
33a6 : a4 45 __ LDY T1 + 0 
33a8 : 18 __ __ CLC
.l1049:
33a9 : 98 __ __ TYA
33aa : 65 1d __ ADC ACCU + 2 
33ac : aa __ __ TAX
33ad : bd 00 53 LDA $5300,x ; (sintab + 0)
33b0 : a6 1b __ LDX ACCU + 0 
33b2 : 18 __ __ CLC
33b3 : 7d 00 53 ADC $5300,x ; (sintab + 0)
33b6 : a6 55 __ LDX T15 + 0 
33b8 : 9d a9 bf STA $bfa9,x ; (pattern + 2)
33bb : 38 __ __ SEC
33bc : a5 1b __ LDA ACCU + 0 
33be : e9 07 __ SBC #$07
33c0 : 85 1b __ STA ACCU + 0 
33c2 : 98 __ __ TYA
33c3 : 18 __ __ CLC
33c4 : 69 0b __ ADC #$0b
33c6 : e6 55 __ INC T15 + 0 
33c8 : a8 __ __ TAY
33c9 : a5 55 __ LDA T15 + 0 
33cb : c5 52 __ CMP T11 + 0 
33cd : 90 da __ BCC $33a9 ; (doplasma0.l1049 + 0)
.s9:
33cf : ad db 52 LDA $52db ; (c3A + 0)
33d2 : 85 45 __ STA T1 + 0 
33d4 : ad dc 52 LDA $52dc ; (c3A + 1)
33d7 : 85 46 __ STA T1 + 1 
33d9 : 85 1b __ STA ACCU + 0 
33db : a5 4a __ LDA T4 + 1 
33dd : 85 1d __ STA ACCU + 2 
33df : a5 48 __ LDA T2 + 1 
33e1 : 85 50 __ STA T10 + 0 
33e3 : ad dd 52 LDA $52dd ; (c3B + 0)
33e6 : 85 53 __ STA T12 + 0 
33e8 : ad de 52 LDA $52de ; (c3B + 1)
33eb : 85 54 __ STA T12 + 1 
33ed : a5 1c __ LDA ACCU + 1 
33ef : f0 2d __ BEQ $341e ; (doplasma0.s13 + 0)
.s109:
33f1 : a9 00 __ LDA #$00
33f3 : 85 1c __ STA ACCU + 1 
33f5 : a4 54 __ LDY T12 + 1 
33f7 : 18 __ __ CLC
.l1051:
33f8 : 98 __ __ TYA
33f9 : 65 48 __ ADC T2 + 1 
33fb : aa __ __ TAX
33fc : bd 00 53 LDA $5300,x ; (sintab + 0)
33ff : a6 1d __ LDX ACCU + 2 
3401 : 18 __ __ CLC
3402 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3405 : a6 1c __ LDX ACCU + 1 
3407 : 9d f5 be STA $bef5,x ; (ybuf1 + 0)
340a : 18 __ __ CLC
340b : a5 1d __ LDA ACCU + 2 
340d : 69 04 __ ADC #$04
340f : 85 1d __ STA ACCU + 2 
3411 : 98 __ __ TYA
3412 : 38 __ __ SEC
3413 : e9 06 __ SBC #$06
3415 : e6 1c __ INC ACCU + 1 
3417 : a8 __ __ TAY
3418 : a5 1c __ LDA ACCU + 1 
341a : c5 4d __ CMP T7 + 0 
341c : 90 da __ BCC $33f8 ; (doplasma0.l1051 + 0)
.s13:
341e : a5 1e __ LDA ACCU + 3 
3420 : f0 2d __ BEQ $344f ; (doplasma0.s17 + 0)
.s108:
3422 : a9 00 __ LDA #$00
3424 : 85 1c __ STA ACCU + 1 
3426 : a4 1b __ LDY ACCU + 0 
3428 : 18 __ __ CLC
.l1053:
3429 : 98 __ __ TYA
342a : 65 1d __ ADC ACCU + 2 
342c : aa __ __ TAX
342d : bd 00 53 LDA $5300,x ; (sintab + 0)
3430 : a6 50 __ LDX T10 + 0 
3432 : 18 __ __ CLC
3433 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3436 : a6 1c __ LDX ACCU + 1 
3438 : 9d 59 bf STA $bf59,x ; (xbuf1 + 0)
343b : 18 __ __ CLC
343c : a5 50 __ LDA T10 + 0 
343e : 69 07 __ ADC #$07
3440 : 85 50 __ STA T10 + 0 
3442 : 98 __ __ TYA
3443 : 38 __ __ SEC
3444 : e9 09 __ SBC #$09
3446 : e6 1c __ INC ACCU + 1 
3448 : a8 __ __ TAY
3449 : a5 1c __ LDA ACCU + 1 
344b : c5 52 __ CMP T11 + 0 
344d : 90 da __ BCC $3429 ; (doplasma0.l1053 + 0)
.s17:
344f : a5 52 __ LDA T11 + 0 
3451 : 38 __ __ SEC
3452 : e9 01 __ SBC #$01
3454 : 30 03 __ BMI $3459 ; (doplasma0.s41 + 0)
3456 : 4c ab 3b JMP $3bab ; (doplasma0.s107 + 0)
.s41:
3459 : 38 __ __ SEC
345a : a5 52 __ LDA T11 + 0 
345c : e9 01 __ SBC #$01
345e : 30 03 __ BMI $3463 ; (doplasma0.s53 + 0)
3460 : 4c 59 3a JMP $3a59 ; (doplasma0.s106 + 0)
.s53:
3463 : 38 __ __ SEC
3464 : a5 52 __ LDA T11 + 0 
3466 : e9 01 __ SBC #$01
3468 : 30 03 __ BMI $346d ; (doplasma0.s65 + 0)
346a : 4c 01 39 JMP $3901 ; (doplasma0.s105 + 0)
.s65:
346d : 38 __ __ SEC
346e : a5 52 __ LDA T11 + 0 
3470 : e9 01 __ SBC #$01
3472 : 30 03 __ BMI $3477 ; (doplasma0.s77 + 0)
3474 : 4c 9c 37 JMP $379c ; (doplasma0.s104 + 0)
.s77:
3477 : a5 4e __ LDA T8 + 0 
3479 : 85 0d __ STA P0 
347b : a5 4f __ LDA T8 + 1 
347d : 85 0e __ STA P1 
347f : ae df 52 LDX $52df ; (d1A + 0)
3482 : bd 00 53 LDA $5300,x ; (sintab + 0)
3485 : 0a __ __ ASL
3486 : 85 4e __ STA T8 + 0 
3488 : a9 00 __ LDA #$00
348a : 2a __ __ ROL
348b : 06 4e __ ASL T8 + 0 
348d : 2a __ __ ROL
348e : 06 4e __ ASL T8 + 0 
3490 : 2a __ __ ROL
3491 : 38 __ __ SEC
3492 : e9 04 __ SBC #$04
3494 : aa __ __ TAX
3495 : 18 __ __ CLC
3496 : a5 4e __ LDA T8 + 0 
3498 : 65 4b __ ADC T6 + 0 
349a : 8d d7 52 STA $52d7 ; (c1A + 0)
349d : 8a __ __ TXA
349e : 65 4c __ ADC T6 + 1 
34a0 : 8d d8 52 STA $52d8 ; (c1A + 1)
34a3 : ad e2 52 LDA $52e2 ; (d1B + 1)
34a6 : 85 4c __ STA T6 + 1 
34a8 : ae e1 52 LDX $52e1 ; (d1B + 0)
34ab : 86 4b __ STX T6 + 0 
34ad : bd 00 53 LDA $5300,x ; (sintab + 0)
34b0 : 0a __ __ ASL
34b1 : 2a __ __ ROL
34b2 : 2a __ __ ROL
34b3 : 2a __ __ ROL
34b4 : aa __ __ TAX
34b5 : 29 07 __ AND #$07
34b7 : 2a __ __ ROL
34b8 : 38 __ __ SEC
34b9 : e9 08 __ SBC #$08
34bb : a8 __ __ TAY
34bc : 8a __ __ TXA
34bd : 29 f0 __ AND #$f0
34bf : 18 __ __ CLC
34c0 : 65 49 __ ADC T4 + 0 
34c2 : 8d d9 52 STA $52d9 ; (c1B + 0)
34c5 : 98 __ __ TYA
34c6 : 65 4a __ ADC T4 + 1 
34c8 : 8d da 52 STA $52da ; (c1B + 1)
34cb : ad e4 52 LDA $52e4 ; (d2A + 1)
34ce : 85 4a __ STA T4 + 1 
34d0 : ae e3 52 LDX $52e3 ; (d2A + 0)
34d3 : 86 49 __ STX T4 + 0 
34d5 : bd 00 53 LDA $5300,x ; (sintab + 0)
34d8 : 0a __ __ ASL
34d9 : 85 4e __ STA T8 + 0 
34db : a9 00 __ LDA #$00
34dd : 2a __ __ ROL
34de : 06 4e __ ASL T8 + 0 
34e0 : 2a __ __ ROL
34e1 : 06 4e __ ASL T8 + 0 
34e3 : 2a __ __ ROL
34e4 : 38 __ __ SEC
34e5 : e9 04 __ SBC #$04
34e7 : aa __ __ TAX
34e8 : 18 __ __ CLC
34e9 : a5 4e __ LDA T8 + 0 
34eb : 65 43 __ ADC T0 + 0 
34ed : 8d fc 2e STA $2efc ; (c2A + 0)
34f0 : 8a __ __ TXA
34f1 : 65 44 __ ADC T0 + 1 
34f3 : 8d fd 2e STA $2efd ; (c2A + 1)
34f6 : ad e6 52 LDA $52e6 ; (d2B + 1)
34f9 : 85 44 __ STA T0 + 1 
34fb : ae e5 52 LDX $52e5 ; (d2B + 0)
34fe : 86 43 __ STX T0 + 0 
3500 : bd 00 53 LDA $5300,x ; (sintab + 0)
3503 : 0a __ __ ASL
3504 : 2a __ __ ROL
3505 : 2a __ __ ROL
3506 : 2a __ __ ROL
3507 : aa __ __ TAX
3508 : 29 07 __ AND #$07
350a : 2a __ __ ROL
350b : 38 __ __ SEC
350c : e9 08 __ SBC #$08
350e : a8 __ __ TAY
350f : 8a __ __ TXA
3510 : 29 f0 __ AND #$f0
3512 : 18 __ __ CLC
3513 : 65 47 __ ADC T2 + 0 
3515 : 8d fe 2e STA $2efe ; (c2B + 0)
3518 : 98 __ __ TYA
3519 : 65 48 __ ADC T2 + 1 
351b : 8d ff 2e STA $2eff ; (c2B + 1)
351e : ad e8 52 LDA $52e8 ; (d3A + 1)
3521 : 85 48 __ STA T2 + 1 
3523 : ae e7 52 LDX $52e7 ; (d3A + 0)
3526 : 86 47 __ STX T2 + 0 
3528 : bd 00 53 LDA $5300,x ; (sintab + 0)
352b : 0a __ __ ASL
352c : a8 __ __ TAY
352d : a9 00 __ LDA #$00
352f : 2a __ __ ROL
3530 : 85 1c __ STA ACCU + 1 
3532 : 98 __ __ TYA
3533 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3536 : 85 4e __ STA T8 + 0 
3538 : a5 1c __ LDA ACCU + 1 
353a : 69 00 __ ADC #$00
353c : 06 4e __ ASL T8 + 0 
353e : 2a __ __ ROL
353f : 38 __ __ SEC
3540 : e9 03 __ SBC #$03
3542 : aa __ __ TAX
3543 : 18 __ __ CLC
3544 : a5 4e __ LDA T8 + 0 
3546 : 65 45 __ ADC T1 + 0 
3548 : 8d db 52 STA $52db ; (c3A + 0)
354b : 8a __ __ TXA
354c : 65 46 __ ADC T1 + 1 
354e : 8d dc 52 STA $52dc ; (c3A + 1)
3551 : ad ea 52 LDA $52ea ; (d3B + 1)
3554 : 85 46 __ STA T1 + 1 
3556 : ae e9 52 LDX $52e9 ; (d3B + 0)
3559 : 86 45 __ STX T1 + 0 
355b : bd 00 53 LDA $5300,x ; (sintab + 0)
355e : 0a __ __ ASL
355f : a8 __ __ TAY
3560 : a9 00 __ LDA #$00
3562 : 2a __ __ ROL
3563 : 85 1c __ STA ACCU + 1 
3565 : 98 __ __ TYA
3566 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3569 : 85 4e __ STA T8 + 0 
356b : a5 1c __ LDA ACCU + 1 
356d : 69 00 __ ADC #$00
356f : 06 4e __ ASL T8 + 0 
3571 : 2a __ __ ROL
3572 : 06 4e __ ASL T8 + 0 
3574 : 2a __ __ ROL
3575 : 38 __ __ SEC
3576 : e9 06 __ SBC #$06
3578 : aa __ __ TAX
3579 : 18 __ __ CLC
357a : a5 4e __ LDA T8 + 0 
357c : 65 53 __ ADC T12 + 0 
357e : 8d dd 52 STA $52dd ; (c3B + 0)
3581 : 8a __ __ TXA
3582 : 65 54 __ ADC T12 + 1 
3584 : 8d de 52 STA $52de ; (c3B + 1)
3587 : ad df 52 LDA $52df ; (d1A + 0)
358a : 18 __ __ CLC
358b : 69 03 __ ADC #$03
358d : 8d df 52 STA $52df ; (d1A + 0)
3590 : 90 03 __ BCC $3595 ; (doplasma0.s1074 + 0)
.s1073:
3592 : ee e0 52 INC $52e0 ; (d1A + 1)
.s1074:
3595 : 38 __ __ SEC
3596 : a5 52 __ LDA T11 + 0 
3598 : e9 01 __ SBC #$01
359a : 30 03 __ BMI $359f ; (doplasma0.s89 + 0)
359c : 4c 41 36 JMP $3641 ; (doplasma0.s103 + 0)
.s89:
359f : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
35a2 : a5 1b __ LDA ACCU + 0 
35a4 : 29 03 __ AND #$03
35a6 : 18 __ __ CLC
35a7 : 65 4b __ ADC T6 + 0 
35a9 : 8d e1 52 STA $52e1 ; (d1B + 0)
35ac : a9 00 __ LDA #$00
35ae : 65 4c __ ADC T6 + 1 
35b0 : 8d e2 52 STA $52e2 ; (d1B + 1)
35b3 : 18 __ __ CLC
35b4 : a5 49 __ LDA T4 + 0 
35b6 : 69 05 __ ADC #$05
35b8 : 8d e3 52 STA $52e3 ; (d2A + 0)
35bb : a5 4a __ LDA T4 + 1 
35bd : 69 00 __ ADC #$00
35bf : 8d e4 52 STA $52e4 ; (d2A + 1)
35c2 : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
35c5 : a5 1b __ LDA ACCU + 0 
35c7 : 29 03 __ AND #$03
35c9 : 18 __ __ CLC
35ca : 65 43 __ ADC T0 + 0 
35cc : 8d e5 52 STA $52e5 ; (d2B + 0)
35cf : a9 00 __ LDA #$00
35d1 : 65 44 __ ADC T0 + 1 
35d3 : 8d e6 52 STA $52e6 ; (d2B + 1)
35d6 : 18 __ __ CLC
35d7 : a5 47 __ LDA T2 + 0 
35d9 : 69 02 __ ADC #$02
35db : 8d e7 52 STA $52e7 ; (d3A + 0)
35de : a5 48 __ LDA T2 + 1 
35e0 : 69 00 __ ADC #$00
35e2 : 8d e8 52 STA $52e8 ; (d3A + 1)
35e5 : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
35e8 : a5 1b __ LDA ACCU + 0 
35ea : 29 03 __ AND #$03
35ec : 18 __ __ CLC
35ed : 65 45 __ ADC T1 + 0 
35ef : 8d e9 52 STA $52e9 ; (d3B + 0)
35f2 : a9 00 __ LDA #$00
35f4 : 65 46 __ ADC T1 + 1 
35f6 : 8d ea 52 STA $52ea ; (d3B + 1)
35f9 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
35fc : a5 4d __ LDA T7 + 0 
35fe : 85 1b __ STA ACCU + 0 
3600 : a9 00 __ LDA #$00
3602 : 85 1c __ STA ACCU + 1 
3604 : a5 52 __ LDA T11 + 0 
3606 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
3609 : a9 00 __ LDA #$00
360b : 85 47 __ STA T2 + 0 
360d : a9 00 __ LDA #$00
360f : a8 __ __ TAY
3610 : f0 0c __ BEQ $361e ; (doplasma0.l94 + 0)
.s100:
3612 : 8d 01 d6 STA $d601 
3615 : 98 __ __ TYA
3616 : 18 __ __ CLC
3617 : 69 01 __ ADC #$01
3619 : a8 __ __ TAY
361a : a5 46 __ LDA T1 + 1 
361c : 69 00 __ ADC #$00
.l94:
361e : 85 46 __ STA T1 + 1 
3620 : c5 06 __ CMP WORK + 3 
3622 : d0 02 __ BNE $3626 ; (doplasma0.s1011 + 0)
.s1010:
3624 : c4 05 __ CPY WORK + 2 
.s1011:
3626 : 90 0b __ BCC $3633 ; (doplasma0.s95 + 0)
.s1001:
3628 : a2 17 __ LDX #$17
362a : bd c3 be LDA $bec3,x ; (doplasma0@stack + 0)
362d : 95 53 __ STA T12 + 0,x 
362f : ca __ __ DEX
3630 : 10 f8 __ BPL $362a ; (doplasma0.s1001 + 2)
3632 : 60 __ __ RTS
.s95:
3633 : 69 57 __ ADC #$57
3635 : 85 48 __ STA T2 + 1 
3637 : b1 47 __ LDA (T2 + 0),y 
.l371:
3639 : 2c 00 d6 BIT $d600 
363c : 10 fb __ BPL $3639 ; (doplasma0.l371 + 0)
363e : 4c 12 36 JMP $3612 ; (doplasma0.s100 + 0)
.s103:
3641 : 85 1d __ STA ACCU + 2 
3643 : a5 52 __ LDA T11 + 0 
3645 : 85 61 __ STA T24 + 0 
3647 : 0a __ __ ASL
3648 : 85 1b __ STA ACCU + 0 
364a : a9 00 __ LDA #$00
364c : 2a __ __ ROL
364d : 06 1b __ ASL ACCU + 0 
364f : 2a __ __ ROL
3650 : aa __ __ TAX
3651 : a5 1b __ LDA ACCU + 0 
3653 : 65 52 __ ADC T11 + 0 
3655 : 85 4e __ STA T8 + 0 
3657 : 8a __ __ TXA
3658 : 69 00 __ ADC #$00
365a : 06 4e __ ASL T8 + 0 
365c : 2a __ __ ROL
365d : 06 4e __ ASL T8 + 0 
365f : 2a __ __ ROL
3660 : 85 4f __ STA T8 + 1 
3662 : 18 __ __ CLC
3663 : a9 00 __ LDA #$00
3665 : 65 4e __ ADC T8 + 0 
3667 : 85 50 __ STA T10 + 0 
3669 : a9 57 __ LDA #$57
366b : 65 4f __ ADC T8 + 1 
366d : 85 51 __ STA T10 + 1 
366f : 18 __ __ CLC
3670 : a5 50 __ LDA T10 + 0 
3672 : 65 52 __ ADC T11 + 0 
3674 : 85 53 __ STA T12 + 0 
3676 : a5 51 __ LDA T10 + 1 
3678 : 69 00 __ ADC #$00
367a : 85 54 __ STA T12 + 1 
367c : a5 52 __ LDA T11 + 0 
367e : 0a __ __ ASL
367f : 85 1b __ STA ACCU + 0 
3681 : a9 00 __ LDA #$00
3683 : 2a __ __ ROL
3684 : 06 1b __ ASL ACCU + 0 
3686 : 2a __ __ ROL
3687 : a8 __ __ TAY
3688 : a5 1b __ LDA ACCU + 0 
368a : 65 4e __ ADC T8 + 0 
368c : aa __ __ TAX
368d : 98 __ __ TYA
368e : 65 4f __ ADC T8 + 1 
3690 : a8 __ __ TAY
3691 : 8a __ __ TXA
3692 : 18 __ __ CLC
3693 : 69 00 __ ADC #$00
3695 : 85 1b __ STA ACCU + 0 
3697 : 98 __ __ TYA
3698 : 69 57 __ ADC #$57
369a : 85 1c __ STA ACCU + 1 
369c : ad 3f bf LDA $bf3f ; (ybuf0 + 24)
369f : 38 __ __ SEC
36a0 : ed 3e bf SBC $bf3e ; (ybuf0 + 23)
36a3 : 85 58 __ STA T18 + 0 
36a5 : ad 0d bf LDA $bf0d ; (ybuf1 + 24)
36a8 : 38 __ __ SEC
36a9 : ed 0c bf SBC $bf0c ; (ybuf1 + 23)
36ac : 85 5a __ STA T20 + 0 
36ae : a5 52 __ LDA T11 + 0 
36b0 : 0a __ __ ASL
36b1 : a0 00 __ LDY #$00
36b3 : 90 01 __ BCC $36b6 ; (doplasma0.s1076 + 0)
.s1075:
36b5 : c8 __ __ INY
.s1076:
36b6 : 18 __ __ CLC
36b7 : 65 52 __ ADC T11 + 0 
36b9 : 90 01 __ BCC $36bc ; (doplasma0.s1078 + 0)
.s1077:
36bb : c8 __ __ INY
.s1078:
36bc : 18 __ __ CLC
36bd : 65 4e __ ADC T8 + 0 
36bf : aa __ __ TAX
36c0 : 98 __ __ TYA
36c1 : 65 4f __ ADC T8 + 1 
36c3 : a8 __ __ TAY
36c4 : 8a __ __ TXA
36c5 : 18 __ __ CLC
36c6 : 69 00 __ ADC #$00
36c8 : 85 5c __ STA T21 + 0 
36ca : 98 __ __ TYA
36cb : 69 57 __ ADC #$57
36cd : 85 5d __ STA T21 + 1 
36cf : ad 3e bf LDA $bf3e ; (ybuf0 + 23)
36d2 : 38 __ __ SEC
36d3 : ed 3d bf SBC $bf3d ; (ybuf0 + 22)
36d6 : 85 56 __ STA T17 + 0 
36d8 : ad 0c bf LDA $bf0c ; (ybuf1 + 23)
36db : 38 __ __ SEC
36dc : ed 0b bf SBC $bf0b ; (ybuf1 + 22)
36df : 85 1e __ STA ACCU + 3 
36e1 : 06 61 __ ASL T24 + 0 
36e3 : a9 00 __ LDA #$00
36e5 : 2a __ __ ROL
36e6 : a8 __ __ TAY
36e7 : a5 61 __ LDA T24 + 0 
36e9 : 65 4e __ ADC T8 + 0 
36eb : aa __ __ TAX
36ec : 98 __ __ TYA
36ed : 65 4f __ ADC T8 + 1 
36ef : a8 __ __ TAY
36f0 : 8a __ __ TXA
36f1 : 18 __ __ CLC
36f2 : 69 00 __ ADC #$00
36f4 : 85 4e __ STA T8 + 0 
36f6 : 98 __ __ TYA
36f7 : 69 57 __ ADC #$57
36f9 : 85 4f __ STA T8 + 1 
36fb : ad 3d bf LDA $bf3d ; (ybuf0 + 22)
36fe : 38 __ __ SEC
36ff : ed 3c bf SBC $bf3c ; (ybuf0 + 21)
3702 : 85 5e __ STA T22 + 0 
3704 : ad 0b bf LDA $bf0b ; (ybuf1 + 22)
3707 : 38 __ __ SEC
3708 : ed 0a bf SBC $bf0a ; (ybuf1 + 21)
370b : 85 5f __ STA T23 + 0 
370d : ad 3c bf LDA $bf3c ; (ybuf0 + 21)
3710 : 38 __ __ SEC
3711 : ed 3b bf SBC $bf3b ; (ybuf0 + 20)
3714 : 85 61 __ STA T24 + 0 
3716 : ad 0a bf LDA $bf0a ; (ybuf1 + 21)
3719 : 38 __ __ SEC
371a : ed 09 bf SBC $bf09 ; (ybuf1 + 20)
371d : 85 62 __ STA T25 + 0 
.l87:
371f : a6 1d __ LDX ACCU + 2 
3721 : bd a9 bf LDA $bfa9,x ; (pattern + 2)
3724 : 18 __ __ CLC
3725 : 6d 3b bf ADC $bf3b ; (ybuf0 + 20)
3728 : 85 66 __ STA T30 + 0 
372a : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
372d : 18 __ __ CLC
372e : 6d 09 bf ADC $bf09 ; (ybuf1 + 20)
3731 : aa __ __ TAX
3732 : 18 __ __ CLC
3733 : 65 62 __ ADC T25 + 0 
3735 : 85 69 __ STA T32 + 0 
3737 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
373a : a6 66 __ LDX T30 + 0 
373c : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
373f : a4 1d __ LDY ACCU + 2 
3741 : 91 50 __ STA (T10 + 0),y 
3743 : 18 __ __ CLC
3744 : a5 61 __ LDA T24 + 0 
3746 : 65 66 __ ADC T30 + 0 
3748 : aa __ __ TAX
3749 : 18 __ __ CLC
374a : 65 5e __ ADC T22 + 0 
374c : 85 66 __ STA T30 + 0 
374e : a4 69 __ LDY T32 + 0 
3750 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3753 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3756 : a4 1d __ LDY ACCU + 2 
3758 : 91 53 __ STA (T12 + 0),y 
375a : 18 __ __ CLC
375b : a5 5f __ LDA T23 + 0 
375d : 65 69 __ ADC T32 + 0 
375f : aa __ __ TAX
3760 : 18 __ __ CLC
3761 : 65 1e __ ADC ACCU + 3 
3763 : 85 69 __ STA T32 + 0 
3765 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3768 : a6 66 __ LDX T30 + 0 
376a : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
376d : 91 4e __ STA (T8 + 0),y 
376f : 8a __ __ TXA
3770 : 18 __ __ CLC
3771 : 65 56 __ ADC T17 + 0 
3773 : aa __ __ TAX
3774 : 18 __ __ CLC
3775 : 65 58 __ ADC T18 + 0 
3777 : 85 65 __ STA T29 + 0 
3779 : a4 69 __ LDY T32 + 0 
377b : b9 00 56 LDA $5600,y ; (colormap1 + 0)
377e : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3781 : a4 1d __ LDY ACCU + 2 
3783 : 91 5c __ STA (T21 + 0),y 
3785 : 18 __ __ CLC
3786 : a5 5a __ LDA T20 + 0 
3788 : 65 69 __ ADC T32 + 0 
378a : aa __ __ TAX
378b : bd 00 56 LDA $5600,x ; (colormap1 + 0)
378e : a6 65 __ LDX T29 + 0 
3790 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3793 : 91 1b __ STA (ACCU + 0),y 
3795 : c6 1d __ DEC ACCU + 2 
3797 : 10 86 __ BPL $371f ; (doplasma0.l87 + 0)
3799 : 4c 9f 35 JMP $359f ; (doplasma0.s89 + 0)
.s104:
379c : 85 1d __ STA ACCU + 2 
379e : a5 52 __ LDA T11 + 0 
37a0 : 85 63 __ STA T26 + 0 
37a2 : 0a __ __ ASL
37a3 : 85 1b __ STA ACCU + 0 
37a5 : a9 00 __ LDA #$00
37a7 : 2a __ __ ROL
37a8 : 06 1b __ ASL ACCU + 0 
37aa : 2a __ __ ROL
37ab : aa __ __ TAX
37ac : a5 1b __ LDA ACCU + 0 
37ae : 65 52 __ ADC T11 + 0 
37b0 : 85 50 __ STA T10 + 0 
37b2 : 8a __ __ TXA
37b3 : 69 00 __ ADC #$00
37b5 : 85 1c __ STA ACCU + 1 
37b7 : aa __ __ TAX
37b8 : a5 50 __ LDA T10 + 0 
37ba : 0a __ __ ASL
37bb : 26 1c __ ROL ACCU + 1 
37bd : 18 __ __ CLC
37be : 65 50 __ ADC T10 + 0 
37c0 : 85 50 __ STA T10 + 0 
37c2 : 8a __ __ TXA
37c3 : 65 1c __ ADC ACCU + 1 
37c5 : 85 51 __ STA T10 + 1 
37c7 : 18 __ __ CLC
37c8 : a9 00 __ LDA #$00
37ca : 65 50 __ ADC T10 + 0 
37cc : 85 1b __ STA ACCU + 0 
37ce : a9 57 __ LDA #$57
37d0 : 65 51 __ ADC T10 + 1 
37d2 : 85 1c __ STA ACCU + 1 
37d4 : 18 __ __ CLC
37d5 : a5 1b __ LDA ACCU + 0 
37d7 : 65 52 __ ADC T11 + 0 
37d9 : 85 56 __ STA T17 + 0 
37db : a5 1c __ LDA ACCU + 1 
37dd : 69 00 __ ADC #$00
37df : 85 57 __ STA T17 + 1 
37e1 : a5 52 __ LDA T11 + 0 
37e3 : 0a __ __ ASL
37e4 : 85 58 __ STA T18 + 0 
37e6 : a9 00 __ LDA #$00
37e8 : 2a __ __ ROL
37e9 : 06 58 __ ASL T18 + 0 
37eb : 2a __ __ ROL
37ec : a8 __ __ TAY
37ed : a5 58 __ LDA T18 + 0 
37ef : 65 50 __ ADC T10 + 0 
37f1 : aa __ __ TAX
37f2 : 98 __ __ TYA
37f3 : 65 51 __ ADC T10 + 1 
37f5 : a8 __ __ TAY
37f6 : 8a __ __ TXA
37f7 : 18 __ __ CLC
37f8 : 69 00 __ ADC #$00
37fa : 85 58 __ STA T18 + 0 
37fc : 98 __ __ TYA
37fd : 69 57 __ ADC #$57
37ff : 85 59 __ STA T18 + 1 
3801 : ad 3a bf LDA $bf3a ; (ybuf0 + 19)
3804 : 38 __ __ SEC
3805 : ed 39 bf SBC $bf39 ; (ybuf0 + 18)
3808 : 85 5a __ STA T20 + 0 
380a : ad 08 bf LDA $bf08 ; (ybuf1 + 19)
380d : 38 __ __ SEC
380e : ed 07 bf SBC $bf07 ; (ybuf1 + 18)
3811 : 85 5e __ STA T22 + 0 
3813 : a5 52 __ LDA T11 + 0 
3815 : 0a __ __ ASL
3816 : a0 00 __ LDY #$00
3818 : 90 01 __ BCC $381b ; (doplasma0.s1070 + 0)
.s1069:
381a : c8 __ __ INY
.s1070:
381b : 18 __ __ CLC
381c : 65 52 __ ADC T11 + 0 
381e : 90 01 __ BCC $3821 ; (doplasma0.s1072 + 0)
.s1071:
3820 : c8 __ __ INY
.s1072:
3821 : 18 __ __ CLC
3822 : 65 50 __ ADC T10 + 0 
3824 : aa __ __ TAX
3825 : 98 __ __ TYA
3826 : 65 51 __ ADC T10 + 1 
3828 : a8 __ __ TAY
3829 : 8a __ __ TXA
382a : 18 __ __ CLC
382b : 69 00 __ ADC #$00
382d : 85 5f __ STA T23 + 0 
382f : 98 __ __ TYA
3830 : 69 57 __ ADC #$57
3832 : 85 60 __ STA T23 + 1 
3834 : ad 39 bf LDA $bf39 ; (ybuf0 + 18)
3837 : 38 __ __ SEC
3838 : ed 38 bf SBC $bf38 ; (ybuf0 + 17)
383b : 85 1e __ STA ACCU + 3 
383d : ad 07 bf LDA $bf07 ; (ybuf1 + 18)
3840 : 38 __ __ SEC
3841 : ed 06 bf SBC $bf06 ; (ybuf1 + 17)
3844 : 85 5c __ STA T21 + 0 
3846 : 06 63 __ ASL T26 + 0 
3848 : a9 00 __ LDA #$00
384a : 2a __ __ ROL
384b : a8 __ __ TAY
384c : a5 63 __ LDA T26 + 0 
384e : 65 50 __ ADC T10 + 0 
3850 : aa __ __ TAX
3851 : 98 __ __ TYA
3852 : 65 51 __ ADC T10 + 1 
3854 : a8 __ __ TAY
3855 : 8a __ __ TXA
3856 : 18 __ __ CLC
3857 : 69 00 __ ADC #$00
3859 : 85 50 __ STA T10 + 0 
385b : 98 __ __ TYA
385c : 69 57 __ ADC #$57
385e : 85 51 __ STA T10 + 1 
3860 : ad 38 bf LDA $bf38 ; (ybuf0 + 17)
3863 : 38 __ __ SEC
3864 : ed 37 bf SBC $bf37 ; (ybuf0 + 16)
3867 : 85 61 __ STA T24 + 0 
3869 : ad 06 bf LDA $bf06 ; (ybuf1 + 17)
386c : 38 __ __ SEC
386d : ed 05 bf SBC $bf05 ; (ybuf1 + 16)
3870 : 85 62 __ STA T25 + 0 
3872 : ad 37 bf LDA $bf37 ; (ybuf0 + 16)
3875 : 38 __ __ SEC
3876 : ed 36 bf SBC $bf36 ; (ybuf0 + 15)
3879 : 85 63 __ STA T26 + 0 
387b : ad 05 bf LDA $bf05 ; (ybuf1 + 16)
387e : 38 __ __ SEC
387f : ed 04 bf SBC $bf04 ; (ybuf1 + 15)
3882 : 85 64 __ STA T27 + 0 
.l75:
3884 : a6 1d __ LDX ACCU + 2 
3886 : bd a9 bf LDA $bfa9,x ; (pattern + 2)
3889 : 18 __ __ CLC
388a : 6d 36 bf ADC $bf36 ; (ybuf0 + 15)
388d : 85 69 __ STA T32 + 0 
388f : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
3892 : 18 __ __ CLC
3893 : 6d 04 bf ADC $bf04 ; (ybuf1 + 15)
3896 : aa __ __ TAX
3897 : 18 __ __ CLC
3898 : 65 64 __ ADC T27 + 0 
389a : 85 6a __ STA T34 + 0 
389c : bd 00 56 LDA $5600,x ; (colormap1 + 0)
389f : a6 69 __ LDX T32 + 0 
38a1 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
38a4 : a4 1d __ LDY ACCU + 2 
38a6 : 91 1b __ STA (ACCU + 0),y 
38a8 : 18 __ __ CLC
38a9 : a5 63 __ LDA T26 + 0 
38ab : 65 69 __ ADC T32 + 0 
38ad : aa __ __ TAX
38ae : 18 __ __ CLC
38af : 65 61 __ ADC T24 + 0 
38b1 : 85 69 __ STA T32 + 0 
38b3 : a4 6a __ LDY T34 + 0 
38b5 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
38b8 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
38bb : a4 1d __ LDY ACCU + 2 
38bd : 91 56 __ STA (T17 + 0),y 
38bf : 18 __ __ CLC
38c0 : a5 62 __ LDA T25 + 0 
38c2 : 65 6a __ ADC T34 + 0 
38c4 : aa __ __ TAX
38c5 : 18 __ __ CLC
38c6 : 65 5c __ ADC T21 + 0 
38c8 : 85 6a __ STA T34 + 0 
38ca : bd 00 56 LDA $5600,x ; (colormap1 + 0)
38cd : a6 69 __ LDX T32 + 0 
38cf : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
38d2 : 91 50 __ STA (T10 + 0),y 
38d4 : 8a __ __ TXA
38d5 : 18 __ __ CLC
38d6 : 65 1e __ ADC ACCU + 3 
38d8 : aa __ __ TAX
38d9 : 18 __ __ CLC
38da : 65 5a __ ADC T20 + 0 
38dc : 85 68 __ STA T31 + 0 
38de : a4 6a __ LDY T34 + 0 
38e0 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
38e3 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
38e6 : a4 1d __ LDY ACCU + 2 
38e8 : 91 5f __ STA (T23 + 0),y 
38ea : 18 __ __ CLC
38eb : a5 5e __ LDA T22 + 0 
38ed : 65 6a __ ADC T34 + 0 
38ef : aa __ __ TAX
38f0 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
38f3 : a6 68 __ LDX T31 + 0 
38f5 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
38f8 : 91 58 __ STA (T18 + 0),y 
38fa : c6 1d __ DEC ACCU + 2 
38fc : 10 86 __ BPL $3884 ; (doplasma0.l75 + 0)
38fe : 4c 77 34 JMP $3477 ; (doplasma0.s77 + 0)
.s105:
3901 : 85 1d __ STA ACCU + 2 
3903 : a5 52 __ LDA T11 + 0 
3905 : 85 63 __ STA T26 + 0 
3907 : 0a __ __ ASL
3908 : 85 1b __ STA ACCU + 0 
390a : a9 00 __ LDA #$00
390c : 2a __ __ ROL
390d : 06 1b __ ASL ACCU + 0 
390f : 2a __ __ ROL
3910 : aa __ __ TAX
3911 : a5 1b __ LDA ACCU + 0 
3913 : 65 52 __ ADC T11 + 0 
3915 : 85 50 __ STA T10 + 0 
3917 : 8a __ __ TXA
3918 : 69 00 __ ADC #$00
391a : 06 50 __ ASL T10 + 0 
391c : 2a __ __ ROL
391d : 85 51 __ STA T10 + 1 
391f : 18 __ __ CLC
3920 : a9 00 __ LDA #$00
3922 : 65 50 __ ADC T10 + 0 
3924 : 85 1b __ STA ACCU + 0 
3926 : a9 57 __ LDA #$57
3928 : 65 51 __ ADC T10 + 1 
392a : 85 1c __ STA ACCU + 1 
392c : 18 __ __ CLC
392d : a5 1b __ LDA ACCU + 0 
392f : 65 52 __ ADC T11 + 0 
3931 : 85 56 __ STA T17 + 0 
3933 : a5 1c __ LDA ACCU + 1 
3935 : 69 00 __ ADC #$00
3937 : 85 57 __ STA T17 + 1 
3939 : a5 52 __ LDA T11 + 0 
393b : 0a __ __ ASL
393c : 85 58 __ STA T18 + 0 
393e : a9 00 __ LDA #$00
3940 : 2a __ __ ROL
3941 : 06 58 __ ASL T18 + 0 
3943 : 2a __ __ ROL
3944 : a8 __ __ TAY
3945 : a5 58 __ LDA T18 + 0 
3947 : 65 50 __ ADC T10 + 0 
3949 : aa __ __ TAX
394a : 98 __ __ TYA
394b : 65 51 __ ADC T10 + 1 
394d : a8 __ __ TAY
394e : 8a __ __ TXA
394f : 18 __ __ CLC
3950 : 69 00 __ ADC #$00
3952 : 85 58 __ STA T18 + 0 
3954 : 98 __ __ TYA
3955 : 69 57 __ ADC #$57
3957 : 85 59 __ STA T18 + 1 
3959 : ad 35 bf LDA $bf35 ; (ybuf0 + 14)
395c : 38 __ __ SEC
395d : ed 34 bf SBC $bf34 ; (ybuf0 + 13)
3960 : 85 5a __ STA T20 + 0 
3962 : ad 03 bf LDA $bf03 ; (ybuf1 + 14)
3965 : 38 __ __ SEC
3966 : ed 02 bf SBC $bf02 ; (ybuf1 + 13)
3969 : 85 5e __ STA T22 + 0 
396b : a5 52 __ LDA T11 + 0 
396d : 0a __ __ ASL
396e : a0 00 __ LDY #$00
3970 : 90 01 __ BCC $3973 ; (doplasma0.s1066 + 0)
.s1065:
3972 : c8 __ __ INY
.s1066:
3973 : 18 __ __ CLC
3974 : 65 52 __ ADC T11 + 0 
3976 : 90 01 __ BCC $3979 ; (doplasma0.s1068 + 0)
.s1067:
3978 : c8 __ __ INY
.s1068:
3979 : 18 __ __ CLC
397a : 65 50 __ ADC T10 + 0 
397c : aa __ __ TAX
397d : 98 __ __ TYA
397e : 65 51 __ ADC T10 + 1 
3980 : a8 __ __ TAY
3981 : 8a __ __ TXA
3982 : 18 __ __ CLC
3983 : 69 00 __ ADC #$00
3985 : 85 5f __ STA T23 + 0 
3987 : 98 __ __ TYA
3988 : 69 57 __ ADC #$57
398a : 85 60 __ STA T23 + 1 
398c : ad 34 bf LDA $bf34 ; (ybuf0 + 13)
398f : 38 __ __ SEC
3990 : ed 33 bf SBC $bf33 ; (ybuf0 + 12)
3993 : 85 1e __ STA ACCU + 3 
3995 : ad 02 bf LDA $bf02 ; (ybuf1 + 13)
3998 : 38 __ __ SEC
3999 : ed 01 bf SBC $bf01 ; (ybuf1 + 12)
399c : 85 5c __ STA T21 + 0 
399e : 06 63 __ ASL T26 + 0 
39a0 : a9 00 __ LDA #$00
39a2 : 2a __ __ ROL
39a3 : a8 __ __ TAY
39a4 : a5 63 __ LDA T26 + 0 
39a6 : 65 50 __ ADC T10 + 0 
39a8 : aa __ __ TAX
39a9 : 98 __ __ TYA
39aa : 65 51 __ ADC T10 + 1 
39ac : a8 __ __ TAY
39ad : 8a __ __ TXA
39ae : 18 __ __ CLC
39af : 69 00 __ ADC #$00
39b1 : 85 50 __ STA T10 + 0 
39b3 : 98 __ __ TYA
39b4 : 69 57 __ ADC #$57
39b6 : 85 51 __ STA T10 + 1 
39b8 : ad 33 bf LDA $bf33 ; (ybuf0 + 12)
39bb : 38 __ __ SEC
39bc : ed 32 bf SBC $bf32 ; (ybuf0 + 11)
39bf : 85 61 __ STA T24 + 0 
39c1 : ad 01 bf LDA $bf01 ; (ybuf1 + 12)
39c4 : 38 __ __ SEC
39c5 : ed 00 bf SBC $bf00 ; (ybuf1 + 11)
39c8 : 85 62 __ STA T25 + 0 
39ca : ad 32 bf LDA $bf32 ; (ybuf0 + 11)
39cd : 38 __ __ SEC
39ce : ed 31 bf SBC $bf31 ; (ybuf0 + 10)
39d1 : 85 63 __ STA T26 + 0 
39d3 : ad 00 bf LDA $bf00 ; (ybuf1 + 11)
39d6 : 38 __ __ SEC
39d7 : ed ff be SBC $beff ; (ybuf1 + 10)
39da : 85 64 __ STA T27 + 0 
.l63:
39dc : a6 1d __ LDX ACCU + 2 
39de : bd a9 bf LDA $bfa9,x ; (pattern + 2)
39e1 : 18 __ __ CLC
39e2 : 6d 31 bf ADC $bf31 ; (ybuf0 + 10)
39e5 : 85 69 __ STA T32 + 0 
39e7 : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
39ea : 18 __ __ CLC
39eb : 6d ff be ADC $beff ; (ybuf1 + 10)
39ee : aa __ __ TAX
39ef : 18 __ __ CLC
39f0 : 65 64 __ ADC T27 + 0 
39f2 : 85 6a __ STA T34 + 0 
39f4 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
39f7 : a6 69 __ LDX T32 + 0 
39f9 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
39fc : a4 1d __ LDY ACCU + 2 
39fe : 91 1b __ STA (ACCU + 0),y 
3a00 : 18 __ __ CLC
3a01 : a5 63 __ LDA T26 + 0 
3a03 : 65 69 __ ADC T32 + 0 
3a05 : aa __ __ TAX
3a06 : 18 __ __ CLC
3a07 : 65 61 __ ADC T24 + 0 
3a09 : 85 69 __ STA T32 + 0 
3a0b : a4 6a __ LDY T34 + 0 
3a0d : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3a10 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3a13 : a4 1d __ LDY ACCU + 2 
3a15 : 91 56 __ STA (T17 + 0),y 
3a17 : 18 __ __ CLC
3a18 : a5 62 __ LDA T25 + 0 
3a1a : 65 6a __ ADC T34 + 0 
3a1c : aa __ __ TAX
3a1d : 18 __ __ CLC
3a1e : 65 5c __ ADC T21 + 0 
3a20 : 85 6a __ STA T34 + 0 
3a22 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3a25 : a6 69 __ LDX T32 + 0 
3a27 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3a2a : 91 50 __ STA (T10 + 0),y 
3a2c : 8a __ __ TXA
3a2d : 18 __ __ CLC
3a2e : 65 1e __ ADC ACCU + 3 
3a30 : aa __ __ TAX
3a31 : 18 __ __ CLC
3a32 : 65 5a __ ADC T20 + 0 
3a34 : 85 68 __ STA T31 + 0 
3a36 : a4 6a __ LDY T34 + 0 
3a38 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3a3b : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3a3e : a4 1d __ LDY ACCU + 2 
3a40 : 91 5f __ STA (T23 + 0),y 
3a42 : 18 __ __ CLC
3a43 : a5 5e __ LDA T22 + 0 
3a45 : 65 6a __ ADC T34 + 0 
3a47 : aa __ __ TAX
3a48 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3a4b : a6 68 __ LDX T31 + 0 
3a4d : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3a50 : 91 58 __ STA (T18 + 0),y 
3a52 : c6 1d __ DEC ACCU + 2 
3a54 : 10 86 __ BPL $39dc ; (doplasma0.l63 + 0)
3a56 : 4c 6d 34 JMP $346d ; (doplasma0.s65 + 0)
.s106:
3a59 : 85 1d __ STA ACCU + 2 
3a5b : a5 52 __ LDA T11 + 0 
3a5d : 85 63 __ STA T26 + 0 
3a5f : 0a __ __ ASL
3a60 : 85 1b __ STA ACCU + 0 
3a62 : a9 00 __ LDA #$00
3a64 : 2a __ __ ROL
3a65 : 06 1b __ ASL ACCU + 0 
3a67 : 2a __ __ ROL
3a68 : aa __ __ TAX
3a69 : a5 1b __ LDA ACCU + 0 
3a6b : 65 52 __ ADC T11 + 0 
3a6d : 85 50 __ STA T10 + 0 
3a6f : 90 01 __ BCC $3a72 ; (doplasma0.s1060 + 0)
.s1059:
3a71 : e8 __ __ INX
.s1060:
3a72 : 86 51 __ STX T10 + 1 
3a74 : 18 __ __ CLC
3a75 : 69 00 __ ADC #$00
3a77 : 85 1b __ STA ACCU + 0 
3a79 : 8a __ __ TXA
3a7a : 69 57 __ ADC #$57
3a7c : 85 1c __ STA ACCU + 1 
3a7e : 18 __ __ CLC
3a7f : a5 1b __ LDA ACCU + 0 
3a81 : 65 52 __ ADC T11 + 0 
3a83 : 85 56 __ STA T17 + 0 
3a85 : a5 1c __ LDA ACCU + 1 
3a87 : 69 00 __ ADC #$00
3a89 : 85 57 __ STA T17 + 1 
3a8b : a5 52 __ LDA T11 + 0 
3a8d : 0a __ __ ASL
3a8e : 85 58 __ STA T18 + 0 
3a90 : a9 00 __ LDA #$00
3a92 : 2a __ __ ROL
3a93 : 06 58 __ ASL T18 + 0 
3a95 : 2a __ __ ROL
3a96 : a8 __ __ TAY
3a97 : a5 58 __ LDA T18 + 0 
3a99 : 65 50 __ ADC T10 + 0 
3a9b : aa __ __ TAX
3a9c : 98 __ __ TYA
3a9d : 65 51 __ ADC T10 + 1 
3a9f : a8 __ __ TAY
3aa0 : 8a __ __ TXA
3aa1 : 18 __ __ CLC
3aa2 : 69 00 __ ADC #$00
3aa4 : 85 58 __ STA T18 + 0 
3aa6 : 98 __ __ TYA
3aa7 : 69 57 __ ADC #$57
3aa9 : 85 59 __ STA T18 + 1 
3aab : ad 30 bf LDA $bf30 ; (ybuf0 + 9)
3aae : 38 __ __ SEC
3aaf : ed 2f bf SBC $bf2f ; (ybuf0 + 8)
3ab2 : 85 5a __ STA T20 + 0 
3ab4 : ad fe be LDA $befe ; (ybuf1 + 9)
3ab7 : 38 __ __ SEC
3ab8 : ed fd be SBC $befd ; (ybuf1 + 8)
3abb : 85 5e __ STA T22 + 0 
3abd : a5 52 __ LDA T11 + 0 
3abf : 0a __ __ ASL
3ac0 : a0 00 __ LDY #$00
3ac2 : 90 01 __ BCC $3ac5 ; (doplasma0.s1062 + 0)
.s1061:
3ac4 : c8 __ __ INY
.s1062:
3ac5 : 18 __ __ CLC
3ac6 : 65 52 __ ADC T11 + 0 
3ac8 : 90 01 __ BCC $3acb ; (doplasma0.s1064 + 0)
.s1063:
3aca : c8 __ __ INY
.s1064:
3acb : 18 __ __ CLC
3acc : 65 50 __ ADC T10 + 0 
3ace : aa __ __ TAX
3acf : 98 __ __ TYA
3ad0 : 65 51 __ ADC T10 + 1 
3ad2 : a8 __ __ TAY
3ad3 : 8a __ __ TXA
3ad4 : 18 __ __ CLC
3ad5 : 69 00 __ ADC #$00
3ad7 : 85 5f __ STA T23 + 0 
3ad9 : 98 __ __ TYA
3ada : 69 57 __ ADC #$57
3adc : 85 60 __ STA T23 + 1 
3ade : ad 2f bf LDA $bf2f ; (ybuf0 + 8)
3ae1 : 38 __ __ SEC
3ae2 : ed 2e bf SBC $bf2e ; (ybuf0 + 7)
3ae5 : 85 1e __ STA ACCU + 3 
3ae7 : ad fd be LDA $befd ; (ybuf1 + 8)
3aea : 38 __ __ SEC
3aeb : ed fc be SBC $befc ; (ybuf1 + 7)
3aee : 85 5c __ STA T21 + 0 
3af0 : 06 63 __ ASL T26 + 0 
3af2 : a9 00 __ LDA #$00
3af4 : 2a __ __ ROL
3af5 : a8 __ __ TAY
3af6 : a5 63 __ LDA T26 + 0 
3af8 : 65 50 __ ADC T10 + 0 
3afa : aa __ __ TAX
3afb : 98 __ __ TYA
3afc : 65 51 __ ADC T10 + 1 
3afe : a8 __ __ TAY
3aff : 8a __ __ TXA
3b00 : 18 __ __ CLC
3b01 : 69 00 __ ADC #$00
3b03 : 85 50 __ STA T10 + 0 
3b05 : 98 __ __ TYA
3b06 : 69 57 __ ADC #$57
3b08 : 85 51 __ STA T10 + 1 
3b0a : ad 2e bf LDA $bf2e ; (ybuf0 + 7)
3b0d : 38 __ __ SEC
3b0e : ed 2d bf SBC $bf2d ; (ybuf0 + 6)
3b11 : 85 61 __ STA T24 + 0 
3b13 : ad fc be LDA $befc ; (ybuf1 + 7)
3b16 : 38 __ __ SEC
3b17 : ed fb be SBC $befb ; (ybuf1 + 6)
3b1a : 85 62 __ STA T25 + 0 
3b1c : ad 2d bf LDA $bf2d ; (ybuf0 + 6)
3b1f : 38 __ __ SEC
3b20 : ed 2c bf SBC $bf2c ; (ybuf0 + 5)
3b23 : 85 63 __ STA T26 + 0 
3b25 : ad fb be LDA $befb ; (ybuf1 + 6)
3b28 : 38 __ __ SEC
3b29 : ed fa be SBC $befa ; (ybuf1 + 5)
3b2c : 85 64 __ STA T27 + 0 
.l51:
3b2e : a6 1d __ LDX ACCU + 2 
3b30 : bd a9 bf LDA $bfa9,x ; (pattern + 2)
3b33 : 18 __ __ CLC
3b34 : 6d 2c bf ADC $bf2c ; (ybuf0 + 5)
3b37 : 85 69 __ STA T32 + 0 
3b39 : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
3b3c : 18 __ __ CLC
3b3d : 6d fa be ADC $befa ; (ybuf1 + 5)
3b40 : aa __ __ TAX
3b41 : 18 __ __ CLC
3b42 : 65 64 __ ADC T27 + 0 
3b44 : 85 6a __ STA T34 + 0 
3b46 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3b49 : a6 69 __ LDX T32 + 0 
3b4b : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3b4e : a4 1d __ LDY ACCU + 2 
3b50 : 91 1b __ STA (ACCU + 0),y 
3b52 : 18 __ __ CLC
3b53 : a5 63 __ LDA T26 + 0 
3b55 : 65 69 __ ADC T32 + 0 
3b57 : aa __ __ TAX
3b58 : 18 __ __ CLC
3b59 : 65 61 __ ADC T24 + 0 
3b5b : 85 69 __ STA T32 + 0 
3b5d : a4 6a __ LDY T34 + 0 
3b5f : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3b62 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3b65 : a4 1d __ LDY ACCU + 2 
3b67 : 91 56 __ STA (T17 + 0),y 
3b69 : 18 __ __ CLC
3b6a : a5 62 __ LDA T25 + 0 
3b6c : 65 6a __ ADC T34 + 0 
3b6e : aa __ __ TAX
3b6f : 18 __ __ CLC
3b70 : 65 5c __ ADC T21 + 0 
3b72 : 85 6a __ STA T34 + 0 
3b74 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3b77 : a6 69 __ LDX T32 + 0 
3b79 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3b7c : 91 50 __ STA (T10 + 0),y 
3b7e : 8a __ __ TXA
3b7f : 18 __ __ CLC
3b80 : 65 1e __ ADC ACCU + 3 
3b82 : aa __ __ TAX
3b83 : 18 __ __ CLC
3b84 : 65 5a __ ADC T20 + 0 
3b86 : 85 68 __ STA T31 + 0 
3b88 : a4 6a __ LDY T34 + 0 
3b8a : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3b8d : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3b90 : a4 1d __ LDY ACCU + 2 
3b92 : 91 5f __ STA (T23 + 0),y 
3b94 : 18 __ __ CLC
3b95 : a5 5e __ LDA T22 + 0 
3b97 : 65 6a __ ADC T34 + 0 
3b99 : aa __ __ TAX
3b9a : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3b9d : a6 68 __ LDX T31 + 0 
3b9f : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3ba2 : 91 58 __ STA (T18 + 0),y 
3ba4 : c6 1d __ DEC ACCU + 2 
3ba6 : 10 86 __ BPL $3b2e ; (doplasma0.l51 + 0)
3ba8 : 4c 63 34 JMP $3463 ; (doplasma0.s53 + 0)
.s107:
3bab : 85 1d __ STA ACCU + 2 
3bad : a5 52 __ LDA T11 + 0 
3baf : 85 5f __ STA T23 + 0 
3bb1 : 0a __ __ ASL
3bb2 : 85 50 __ STA T10 + 0 
3bb4 : a9 00 __ LDA #$00
3bb6 : 2a __ __ ROL
3bb7 : 06 50 __ ASL T10 + 0 
3bb9 : 2a __ __ ROL
3bba : aa __ __ TAX
3bbb : a9 00 __ LDA #$00
3bbd : 65 50 __ ADC T10 + 0 
3bbf : 85 50 __ STA T10 + 0 
3bc1 : 8a __ __ TXA
3bc2 : 69 57 __ ADC #$57
3bc4 : 85 51 __ STA T10 + 1 
3bc6 : ad 2b bf LDA $bf2b ; (ybuf0 + 4)
3bc9 : 38 __ __ SEC
3bca : ed 2a bf SBC $bf2a ; (ybuf0 + 3)
3bcd : 85 56 __ STA T17 + 0 
3bcf : ad f9 be LDA $bef9 ; (ybuf1 + 4)
3bd2 : 38 __ __ SEC
3bd3 : ed f8 be SBC $bef8 ; (ybuf1 + 3)
3bd6 : 85 1e __ STA ACCU + 3 
3bd8 : a5 52 __ LDA T11 + 0 
3bda : 0a __ __ ASL
3bdb : a2 00 __ LDX #$00
3bdd : 90 01 __ BCC $3be0 ; (doplasma0.s1056 + 0)
.s1055:
3bdf : e8 __ __ INX
.s1056:
3be0 : 18 __ __ CLC
3be1 : 65 52 __ ADC T11 + 0 
3be3 : 90 01 __ BCC $3be6 ; (doplasma0.s1058 + 0)
.s1057:
3be5 : e8 __ __ INX
.s1058:
3be6 : 18 __ __ CLC
3be7 : 69 00 __ ADC #$00
3be9 : 85 5a __ STA T20 + 0 
3beb : 8a __ __ TXA
3bec : 69 57 __ ADC #$57
3bee : 85 5b __ STA T20 + 1 
3bf0 : ad 2a bf LDA $bf2a ; (ybuf0 + 3)
3bf3 : 38 __ __ SEC
3bf4 : ed 29 bf SBC $bf29 ; (ybuf0 + 2)
3bf7 : 85 1b __ STA ACCU + 0 
3bf9 : ad f8 be LDA $bef8 ; (ybuf1 + 3)
3bfc : 38 __ __ SEC
3bfd : ed f7 be SBC $bef7 ; (ybuf1 + 2)
3c00 : 85 58 __ STA T18 + 0 
3c02 : 06 5f __ ASL T23 + 0 
3c04 : a9 00 __ LDA #$00
3c06 : 2a __ __ ROL
3c07 : aa __ __ TAX
3c08 : a9 00 __ LDA #$00
3c0a : 65 5f __ ADC T23 + 0 
3c0c : 85 5f __ STA T23 + 0 
3c0e : 8a __ __ TXA
3c0f : 69 57 __ ADC #$57
3c11 : 85 60 __ STA T23 + 1 
3c13 : ad 29 bf LDA $bf29 ; (ybuf0 + 2)
3c16 : 38 __ __ SEC
3c17 : ed 28 bf SBC $bf28 ; (ybuf0 + 1)
3c1a : 85 5c __ STA T21 + 0 
3c1c : ad f7 be LDA $bef7 ; (ybuf1 + 2)
3c1f : 38 __ __ SEC
3c20 : ed f6 be SBC $bef6 ; (ybuf1 + 1)
3c23 : 85 5e __ STA T22 + 0 
3c25 : ad 28 bf LDA $bf28 ; (ybuf0 + 1)
3c28 : 38 __ __ SEC
3c29 : ed 27 bf SBC $bf27 ; (ybuf0 + 0)
3c2c : 85 61 __ STA T24 + 0 
3c2e : ad f6 be LDA $bef6 ; (ybuf1 + 1)
3c31 : 38 __ __ SEC
3c32 : ed f5 be SBC $bef5 ; (ybuf1 + 0)
3c35 : 85 62 __ STA T25 + 0 
.l39:
3c37 : a4 1d __ LDY ACCU + 2 
3c39 : b9 a9 bf LDA $bfa9,y ; (pattern + 2)
3c3c : 18 __ __ CLC
3c3d : 6d 27 bf ADC $bf27 ; (ybuf0 + 0)
3c40 : aa __ __ TAX
3c41 : b9 59 bf LDA $bf59,y ; (xbuf1 + 0)
3c44 : 18 __ __ CLC
3c45 : 6d f5 be ADC $bef5 ; (ybuf1 + 0)
3c48 : a8 __ __ TAY
3c49 : 18 __ __ CLC
3c4a : 65 62 __ ADC T25 + 0 
3c4c : 85 68 __ STA T31 + 0 
3c4e : bd 00 55 LDA $5500,x ; (colormap0 + 0)
3c51 : 19 00 56 ORA $5600,y ; (colormap1 + 0)
3c54 : a4 1d __ LDY ACCU + 2 
3c56 : 99 00 57 STA $5700,y ; (Screen + 0)
3c59 : 8a __ __ TXA
3c5a : 18 __ __ CLC
3c5b : 65 61 __ ADC T24 + 0 
3c5d : aa __ __ TAX
3c5e : 18 __ __ CLC
3c5f : 65 5c __ ADC T21 + 0 
3c61 : 85 65 __ STA T29 + 0 
3c63 : 98 __ __ TYA
3c64 : 18 __ __ CLC
3c65 : 65 52 __ ADC T11 + 0 
3c67 : a8 __ __ TAY
3c68 : a9 00 __ LDA #$00
3c6a : 2a __ __ ROL
3c6b : 85 67 __ STA T30 + 1 
3c6d : 98 __ __ TYA
3c6e : 69 00 __ ADC #$00
3c70 : 85 66 __ STA T30 + 0 
3c72 : a9 57 __ LDA #$57
3c74 : 65 67 __ ADC T30 + 1 
3c76 : 85 67 __ STA T30 + 1 
3c78 : bd 00 55 LDA $5500,x ; (colormap0 + 0)
3c7b : a6 68 __ LDX T31 + 0 
3c7d : 1d 00 56 ORA $5600,x ; (colormap1 + 0)
3c80 : a0 00 __ LDY #$00
3c82 : 91 66 __ STA (T30 + 0),y 
3c84 : 18 __ __ CLC
3c85 : a5 5e __ LDA T22 + 0 
3c87 : 65 68 __ ADC T31 + 0 
3c89 : aa __ __ TAX
3c8a : 18 __ __ CLC
3c8b : 65 58 __ ADC T18 + 0 
3c8d : 85 68 __ STA T31 + 0 
3c8f : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3c92 : a6 65 __ LDX T29 + 0 
3c94 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3c97 : a4 1d __ LDY ACCU + 2 
3c99 : 91 5f __ STA (T23 + 0),y 
3c9b : 18 __ __ CLC
3c9c : a5 1b __ LDA ACCU + 0 
3c9e : 65 65 __ ADC T29 + 0 
3ca0 : aa __ __ TAX
3ca1 : 18 __ __ CLC
3ca2 : 65 56 __ ADC T17 + 0 
3ca4 : 85 65 __ STA T29 + 0 
3ca6 : a4 68 __ LDY T31 + 0 
3ca8 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
3cab : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3cae : a4 1d __ LDY ACCU + 2 
3cb0 : 91 5a __ STA (T20 + 0),y 
3cb2 : 18 __ __ CLC
3cb3 : a5 1e __ LDA ACCU + 3 
3cb5 : 65 68 __ ADC T31 + 0 
3cb7 : aa __ __ TAX
3cb8 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
3cbb : a6 65 __ LDX T29 + 0 
3cbd : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
3cc0 : 91 50 __ STA (T10 + 0),y 
3cc2 : c6 1d __ DEC ACCU + 2 
3cc4 : 30 03 __ BMI $3cc9 ; (doplasma0.l39 + 146)
3cc6 : 4c 37 3c JMP $3c37 ; (doplasma0.l39 + 0)
3cc9 : 4c 59 34 JMP $3459 ; (doplasma0.s41 + 0)
--------------------------------------------------------------------
rand: ; rand()->u16
.s0:
3ccc : ad fb 2e LDA $2efb ; (seed + 1)
3ccf : 4a __ __ LSR
3cd0 : ad fa 2e LDA $2efa ; (seed + 0)
3cd3 : 6a __ __ ROR
3cd4 : aa __ __ TAX
3cd5 : a9 00 __ LDA #$00
3cd7 : 6a __ __ ROR
3cd8 : 4d fa 2e EOR $2efa ; (seed + 0)
3cdb : 85 1b __ STA ACCU + 0 
3cdd : 8a __ __ TXA
3cde : 4d fb 2e EOR $2efb ; (seed + 1)
3ce1 : 85 1c __ STA ACCU + 1 
3ce3 : 4a __ __ LSR
3ce4 : 45 1b __ EOR ACCU + 0 
3ce6 : 8d fa 2e STA $2efa ; (seed + 0)
3ce9 : 85 1b __ STA ACCU + 0 
3ceb : 45 1c __ EOR ACCU + 1 
3ced : 8d fb 2e STA $2efb ; (seed + 1)
3cf0 : 85 1c __ STA ACCU + 1 
.s1001:
3cf2 : 60 __ __ RTS
--------------------------------------------------------------------
doplasma1: ; doplasma1()->void
.s1000:
3cf3 : a2 17 __ LDX #$17
3cf5 : b5 53 __ LDA T12 + 0,x 
3cf7 : 9d c3 be STA $bec3,x ; (doplasma0@stack + 0)
3cfa : ca __ __ DEX
3cfb : 10 f8 __ BPL $3cf5 ; (doplasma1.s1000 + 2)
.s0:
3cfd : ad fc 2e LDA $2efc ; (c2A + 0)
3d00 : 85 43 __ STA T0 + 0 
3d02 : ad fd 2e LDA $2efd ; (c2A + 1)
3d05 : 85 44 __ STA T0 + 1 
3d07 : 85 45 __ STA T1 + 0 
3d09 : ad fe 2e LDA $2efe ; (c2B + 0)
3d0c : 85 47 __ STA T2 + 0 
3d0e : ad ff 2e LDA $2eff ; (c2B + 1)
3d11 : 85 48 __ STA T2 + 1 
3d13 : 85 1b __ STA ACCU + 0 
3d15 : ad d9 52 LDA $52d9 ; (c1B + 0)
3d18 : 85 49 __ STA T4 + 0 
3d1a : ad da 52 LDA $52da ; (c1B + 1)
3d1d : 85 4a __ STA T4 + 1 
3d1f : 85 1d __ STA ACCU + 2 
3d21 : ad d7 52 LDA $52d7 ; (c1A + 0)
3d24 : 85 4b __ STA T6 + 0 
3d26 : ad d8 52 LDA $52d8 ; (c1A + 1)
3d29 : 85 4c __ STA T6 + 1 
3d2b : ad 7b 52 LDA $527b ; (vdc_state + 18)
3d2e : 85 4e __ STA T8 + 0 
3d30 : ad 7c 52 LDA $527c ; (vdc_state + 19)
3d33 : 85 4f __ STA T8 + 1 
3d35 : ad 71 52 LDA $5271 ; (vdc_state + 8)
3d38 : 85 4d __ STA T7 + 0 
3d3a : c9 01 __ CMP #$01
3d3c : a9 00 __ LDA #$00
3d3e : 2a __ __ ROL
3d3f : 85 1c __ STA ACCU + 1 
3d41 : f0 2d __ BEQ $3d70 ; (doplasma1.s5 + 0)
.s111:
3d43 : a9 00 __ LDA #$00
3d45 : 85 52 __ STA T11 + 0 
3d47 : a4 4c __ LDY T6 + 1 
3d49 : 18 __ __ CLC
.l1047:
3d4a : 98 __ __ TYA
3d4b : 65 44 __ ADC T0 + 1 
3d4d : aa __ __ TAX
3d4e : bd 00 53 LDA $5300,x ; (sintab + 0)
3d51 : a6 1d __ LDX ACCU + 2 
3d53 : 18 __ __ CLC
3d54 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3d57 : a6 52 __ LDX T11 + 0 
3d59 : 9d 27 bf STA $bf27,x ; (ybuf0 + 0)
3d5c : 38 __ __ SEC
3d5d : a5 1d __ LDA ACCU + 2 
3d5f : e9 05 __ SBC #$05
3d61 : 85 1d __ STA ACCU + 2 
3d63 : 98 __ __ TYA
3d64 : 18 __ __ CLC
3d65 : 69 0d __ ADC #$0d
3d67 : e6 52 __ INC T11 + 0 
3d69 : a8 __ __ TAY
3d6a : a5 52 __ LDA T11 + 0 
3d6c : c5 4d __ CMP T7 + 0 
3d6e : 90 da __ BCC $3d4a ; (doplasma1.l1047 + 0)
.s5:
3d70 : ad 70 52 LDA $5270 ; (vdc_state + 7)
3d73 : 85 52 __ STA T11 + 0 
3d75 : d0 06 __ BNE $3d7d ; (doplasma1.s1005 + 0)
.s1006:
3d77 : a9 00 __ LDA #$00
3d79 : 85 1e __ STA ACCU + 3 
3d7b : f0 31 __ BEQ $3dae ; (doplasma1.s9 + 0)
.s1005:
3d7d : a9 01 __ LDA #$01
3d7f : 85 1e __ STA ACCU + 3 
3d81 : a9 00 __ LDA #$00
3d83 : 85 55 __ STA T15 + 0 
3d85 : a4 45 __ LDY T1 + 0 
3d87 : 18 __ __ CLC
.l1049:
3d88 : 98 __ __ TYA
3d89 : 65 1d __ ADC ACCU + 2 
3d8b : aa __ __ TAX
3d8c : bd 00 53 LDA $5300,x ; (sintab + 0)
3d8f : a6 1b __ LDX ACCU + 0 
3d91 : 18 __ __ CLC
3d92 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3d95 : a6 55 __ LDX T15 + 0 
3d97 : 9d a9 bf STA $bfa9,x ; (pattern + 2)
3d9a : 38 __ __ SEC
3d9b : a5 1b __ LDA ACCU + 0 
3d9d : e9 07 __ SBC #$07
3d9f : 85 1b __ STA ACCU + 0 
3da1 : 98 __ __ TYA
3da2 : 18 __ __ CLC
3da3 : 69 0b __ ADC #$0b
3da5 : e6 55 __ INC T15 + 0 
3da7 : a8 __ __ TAY
3da8 : a5 55 __ LDA T15 + 0 
3daa : c5 52 __ CMP T11 + 0 
3dac : 90 da __ BCC $3d88 ; (doplasma1.l1049 + 0)
.s9:
3dae : ad db 52 LDA $52db ; (c3A + 0)
3db1 : 85 45 __ STA T1 + 0 
3db3 : ad dc 52 LDA $52dc ; (c3A + 1)
3db6 : 85 46 __ STA T1 + 1 
3db8 : 85 1b __ STA ACCU + 0 
3dba : a5 4a __ LDA T4 + 1 
3dbc : 85 1d __ STA ACCU + 2 
3dbe : a5 48 __ LDA T2 + 1 
3dc0 : 85 50 __ STA T10 + 0 
3dc2 : ad dd 52 LDA $52dd ; (c3B + 0)
3dc5 : 85 53 __ STA T12 + 0 
3dc7 : ad de 52 LDA $52de ; (c3B + 1)
3dca : 85 54 __ STA T12 + 1 
3dcc : a5 1c __ LDA ACCU + 1 
3dce : f0 2d __ BEQ $3dfd ; (doplasma1.s13 + 0)
.s109:
3dd0 : a9 00 __ LDA #$00
3dd2 : 85 1c __ STA ACCU + 1 
3dd4 : a4 54 __ LDY T12 + 1 
3dd6 : 18 __ __ CLC
.l1051:
3dd7 : 98 __ __ TYA
3dd8 : 65 48 __ ADC T2 + 1 
3dda : aa __ __ TAX
3ddb : bd 00 53 LDA $5300,x ; (sintab + 0)
3dde : a6 1d __ LDX ACCU + 2 
3de0 : 18 __ __ CLC
3de1 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3de4 : a6 1c __ LDX ACCU + 1 
3de6 : 9d f5 be STA $bef5,x ; (ybuf1 + 0)
3de9 : 18 __ __ CLC
3dea : a5 1d __ LDA ACCU + 2 
3dec : 69 04 __ ADC #$04
3dee : 85 1d __ STA ACCU + 2 
3df0 : 98 __ __ TYA
3df1 : 38 __ __ SEC
3df2 : e9 06 __ SBC #$06
3df4 : e6 1c __ INC ACCU + 1 
3df6 : a8 __ __ TAY
3df7 : a5 1c __ LDA ACCU + 1 
3df9 : c5 4d __ CMP T7 + 0 
3dfb : 90 da __ BCC $3dd7 ; (doplasma1.l1051 + 0)
.s13:
3dfd : a5 1e __ LDA ACCU + 3 
3dff : f0 2d __ BEQ $3e2e ; (doplasma1.s17 + 0)
.s108:
3e01 : a9 00 __ LDA #$00
3e03 : 85 1c __ STA ACCU + 1 
3e05 : a4 1b __ LDY ACCU + 0 
3e07 : 18 __ __ CLC
.l1053:
3e08 : 98 __ __ TYA
3e09 : 65 1d __ ADC ACCU + 2 
3e0b : aa __ __ TAX
3e0c : bd 00 53 LDA $5300,x ; (sintab + 0)
3e0f : a6 50 __ LDX T10 + 0 
3e11 : 18 __ __ CLC
3e12 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3e15 : a6 1c __ LDX ACCU + 1 
3e17 : 9d 59 bf STA $bf59,x ; (xbuf1 + 0)
3e1a : 18 __ __ CLC
3e1b : a5 50 __ LDA T10 + 0 
3e1d : 69 07 __ ADC #$07
3e1f : 85 50 __ STA T10 + 0 
3e21 : 98 __ __ TYA
3e22 : 38 __ __ SEC
3e23 : e9 09 __ SBC #$09
3e25 : e6 1c __ INC ACCU + 1 
3e27 : a8 __ __ TAY
3e28 : a5 1c __ LDA ACCU + 1 
3e2a : c5 52 __ CMP T11 + 0 
3e2c : 90 da __ BCC $3e08 ; (doplasma1.l1053 + 0)
.s17:
3e2e : a5 52 __ LDA T11 + 0 
3e30 : 38 __ __ SEC
3e31 : e9 01 __ SBC #$01
3e33 : 30 03 __ BMI $3e38 ; (doplasma1.s41 + 0)
3e35 : 4c 8a 45 JMP $458a ; (doplasma1.s107 + 0)
.s41:
3e38 : 38 __ __ SEC
3e39 : a5 52 __ LDA T11 + 0 
3e3b : e9 01 __ SBC #$01
3e3d : 30 03 __ BMI $3e42 ; (doplasma1.s53 + 0)
3e3f : 4c 38 44 JMP $4438 ; (doplasma1.s106 + 0)
.s53:
3e42 : 38 __ __ SEC
3e43 : a5 52 __ LDA T11 + 0 
3e45 : e9 01 __ SBC #$01
3e47 : 30 03 __ BMI $3e4c ; (doplasma1.s65 + 0)
3e49 : 4c e0 42 JMP $42e0 ; (doplasma1.s105 + 0)
.s65:
3e4c : 38 __ __ SEC
3e4d : a5 52 __ LDA T11 + 0 
3e4f : e9 01 __ SBC #$01
3e51 : 30 03 __ BMI $3e56 ; (doplasma1.s77 + 0)
3e53 : 4c 7b 41 JMP $417b ; (doplasma1.s104 + 0)
.s77:
3e56 : a5 4e __ LDA T8 + 0 
3e58 : 85 0d __ STA P0 
3e5a : a5 4f __ LDA T8 + 1 
3e5c : 85 0e __ STA P1 
3e5e : ae df 52 LDX $52df ; (d1A + 0)
3e61 : bd 00 53 LDA $5300,x ; (sintab + 0)
3e64 : 0a __ __ ASL
3e65 : 85 4e __ STA T8 + 0 
3e67 : a9 00 __ LDA #$00
3e69 : 2a __ __ ROL
3e6a : 06 4e __ ASL T8 + 0 
3e6c : 2a __ __ ROL
3e6d : 06 4e __ ASL T8 + 0 
3e6f : 2a __ __ ROL
3e70 : 38 __ __ SEC
3e71 : e9 04 __ SBC #$04
3e73 : aa __ __ TAX
3e74 : 18 __ __ CLC
3e75 : a5 4e __ LDA T8 + 0 
3e77 : 65 4b __ ADC T6 + 0 
3e79 : 8d d7 52 STA $52d7 ; (c1A + 0)
3e7c : 8a __ __ TXA
3e7d : 65 4c __ ADC T6 + 1 
3e7f : 8d d8 52 STA $52d8 ; (c1A + 1)
3e82 : ad e2 52 LDA $52e2 ; (d1B + 1)
3e85 : 85 4c __ STA T6 + 1 
3e87 : ae e1 52 LDX $52e1 ; (d1B + 0)
3e8a : 86 4b __ STX T6 + 0 
3e8c : bd 00 53 LDA $5300,x ; (sintab + 0)
3e8f : 0a __ __ ASL
3e90 : 2a __ __ ROL
3e91 : 2a __ __ ROL
3e92 : 2a __ __ ROL
3e93 : aa __ __ TAX
3e94 : 29 07 __ AND #$07
3e96 : 2a __ __ ROL
3e97 : 38 __ __ SEC
3e98 : e9 08 __ SBC #$08
3e9a : a8 __ __ TAY
3e9b : 8a __ __ TXA
3e9c : 29 f0 __ AND #$f0
3e9e : 18 __ __ CLC
3e9f : 65 49 __ ADC T4 + 0 
3ea1 : 8d d9 52 STA $52d9 ; (c1B + 0)
3ea4 : 98 __ __ TYA
3ea5 : 65 4a __ ADC T4 + 1 
3ea7 : 8d da 52 STA $52da ; (c1B + 1)
3eaa : ad e4 52 LDA $52e4 ; (d2A + 1)
3ead : 85 4a __ STA T4 + 1 
3eaf : ae e3 52 LDX $52e3 ; (d2A + 0)
3eb2 : 86 49 __ STX T4 + 0 
3eb4 : bd 00 53 LDA $5300,x ; (sintab + 0)
3eb7 : 0a __ __ ASL
3eb8 : 85 4e __ STA T8 + 0 
3eba : a9 00 __ LDA #$00
3ebc : 2a __ __ ROL
3ebd : 06 4e __ ASL T8 + 0 
3ebf : 2a __ __ ROL
3ec0 : 06 4e __ ASL T8 + 0 
3ec2 : 2a __ __ ROL
3ec3 : 38 __ __ SEC
3ec4 : e9 04 __ SBC #$04
3ec6 : aa __ __ TAX
3ec7 : 18 __ __ CLC
3ec8 : a5 4e __ LDA T8 + 0 
3eca : 65 43 __ ADC T0 + 0 
3ecc : 8d fc 2e STA $2efc ; (c2A + 0)
3ecf : 8a __ __ TXA
3ed0 : 65 44 __ ADC T0 + 1 
3ed2 : 8d fd 2e STA $2efd ; (c2A + 1)
3ed5 : ad e6 52 LDA $52e6 ; (d2B + 1)
3ed8 : 85 44 __ STA T0 + 1 
3eda : ae e5 52 LDX $52e5 ; (d2B + 0)
3edd : 86 43 __ STX T0 + 0 
3edf : bd 00 53 LDA $5300,x ; (sintab + 0)
3ee2 : 0a __ __ ASL
3ee3 : 2a __ __ ROL
3ee4 : 2a __ __ ROL
3ee5 : 2a __ __ ROL
3ee6 : aa __ __ TAX
3ee7 : 29 07 __ AND #$07
3ee9 : 2a __ __ ROL
3eea : 38 __ __ SEC
3eeb : e9 08 __ SBC #$08
3eed : a8 __ __ TAY
3eee : 8a __ __ TXA
3eef : 29 f0 __ AND #$f0
3ef1 : 18 __ __ CLC
3ef2 : 65 47 __ ADC T2 + 0 
3ef4 : 8d fe 2e STA $2efe ; (c2B + 0)
3ef7 : 98 __ __ TYA
3ef8 : 65 48 __ ADC T2 + 1 
3efa : 8d ff 2e STA $2eff ; (c2B + 1)
3efd : ad e8 52 LDA $52e8 ; (d3A + 1)
3f00 : 85 48 __ STA T2 + 1 
3f02 : ae e7 52 LDX $52e7 ; (d3A + 0)
3f05 : 86 47 __ STX T2 + 0 
3f07 : bd 00 53 LDA $5300,x ; (sintab + 0)
3f0a : 0a __ __ ASL
3f0b : a8 __ __ TAY
3f0c : a9 00 __ LDA #$00
3f0e : 2a __ __ ROL
3f0f : 85 1c __ STA ACCU + 1 
3f11 : 98 __ __ TYA
3f12 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3f15 : 85 4e __ STA T8 + 0 
3f17 : a5 1c __ LDA ACCU + 1 
3f19 : 69 00 __ ADC #$00
3f1b : 06 4e __ ASL T8 + 0 
3f1d : 2a __ __ ROL
3f1e : 38 __ __ SEC
3f1f : e9 03 __ SBC #$03
3f21 : aa __ __ TAX
3f22 : 18 __ __ CLC
3f23 : a5 4e __ LDA T8 + 0 
3f25 : 65 45 __ ADC T1 + 0 
3f27 : 8d db 52 STA $52db ; (c3A + 0)
3f2a : 8a __ __ TXA
3f2b : 65 46 __ ADC T1 + 1 
3f2d : 8d dc 52 STA $52dc ; (c3A + 1)
3f30 : ad ea 52 LDA $52ea ; (d3B + 1)
3f33 : 85 46 __ STA T1 + 1 
3f35 : ae e9 52 LDX $52e9 ; (d3B + 0)
3f38 : 86 45 __ STX T1 + 0 
3f3a : bd 00 53 LDA $5300,x ; (sintab + 0)
3f3d : 0a __ __ ASL
3f3e : a8 __ __ TAY
3f3f : a9 00 __ LDA #$00
3f41 : 2a __ __ ROL
3f42 : 85 1c __ STA ACCU + 1 
3f44 : 98 __ __ TYA
3f45 : 7d 00 53 ADC $5300,x ; (sintab + 0)
3f48 : 85 4e __ STA T8 + 0 
3f4a : a5 1c __ LDA ACCU + 1 
3f4c : 69 00 __ ADC #$00
3f4e : 06 4e __ ASL T8 + 0 
3f50 : 2a __ __ ROL
3f51 : 06 4e __ ASL T8 + 0 
3f53 : 2a __ __ ROL
3f54 : 38 __ __ SEC
3f55 : e9 06 __ SBC #$06
3f57 : aa __ __ TAX
3f58 : 18 __ __ CLC
3f59 : a5 4e __ LDA T8 + 0 
3f5b : 65 53 __ ADC T12 + 0 
3f5d : 8d dd 52 STA $52dd ; (c3B + 0)
3f60 : 8a __ __ TXA
3f61 : 65 54 __ ADC T12 + 1 
3f63 : 8d de 52 STA $52de ; (c3B + 1)
3f66 : ad df 52 LDA $52df ; (d1A + 0)
3f69 : 18 __ __ CLC
3f6a : 69 03 __ ADC #$03
3f6c : 8d df 52 STA $52df ; (d1A + 0)
3f6f : 90 03 __ BCC $3f74 ; (doplasma1.s1074 + 0)
.s1073:
3f71 : ee e0 52 INC $52e0 ; (d1A + 1)
.s1074:
3f74 : 38 __ __ SEC
3f75 : a5 52 __ LDA T11 + 0 
3f77 : e9 01 __ SBC #$01
3f79 : 30 03 __ BMI $3f7e ; (doplasma1.s89 + 0)
3f7b : 4c 20 40 JMP $4020 ; (doplasma1.s103 + 0)
.s89:
3f7e : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
3f81 : a5 1b __ LDA ACCU + 0 
3f83 : 29 03 __ AND #$03
3f85 : 18 __ __ CLC
3f86 : 65 4b __ ADC T6 + 0 
3f88 : 8d e1 52 STA $52e1 ; (d1B + 0)
3f8b : a9 00 __ LDA #$00
3f8d : 65 4c __ ADC T6 + 1 
3f8f : 8d e2 52 STA $52e2 ; (d1B + 1)
3f92 : 18 __ __ CLC
3f93 : a5 49 __ LDA T4 + 0 
3f95 : 69 05 __ ADC #$05
3f97 : 8d e3 52 STA $52e3 ; (d2A + 0)
3f9a : a5 4a __ LDA T4 + 1 
3f9c : 69 00 __ ADC #$00
3f9e : 8d e4 52 STA $52e4 ; (d2A + 1)
3fa1 : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
3fa4 : a5 1b __ LDA ACCU + 0 
3fa6 : 29 03 __ AND #$03
3fa8 : 18 __ __ CLC
3fa9 : 65 43 __ ADC T0 + 0 
3fab : 8d e5 52 STA $52e5 ; (d2B + 0)
3fae : a9 00 __ LDA #$00
3fb0 : 65 44 __ ADC T0 + 1 
3fb2 : 8d e6 52 STA $52e6 ; (d2B + 1)
3fb5 : 18 __ __ CLC
3fb6 : a5 47 __ LDA T2 + 0 
3fb8 : 69 02 __ ADC #$02
3fba : 8d e7 52 STA $52e7 ; (d3A + 0)
3fbd : a5 48 __ LDA T2 + 1 
3fbf : 69 00 __ ADC #$00
3fc1 : 8d e8 52 STA $52e8 ; (d3A + 1)
3fc4 : 20 cc 3c JSR $3ccc ; (rand.s0 + 0)
3fc7 : a5 1b __ LDA ACCU + 0 
3fc9 : 29 03 __ AND #$03
3fcb : 18 __ __ CLC
3fcc : 65 45 __ ADC T1 + 0 
3fce : 8d e9 52 STA $52e9 ; (d3B + 0)
3fd1 : a9 00 __ LDA #$00
3fd3 : 65 46 __ ADC T1 + 1 
3fd5 : 8d ea 52 STA $52ea ; (d3B + 1)
3fd8 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
3fdb : a5 4d __ LDA T7 + 0 
3fdd : 85 1b __ STA ACCU + 0 
3fdf : a9 00 __ LDA #$00
3fe1 : 85 1c __ STA ACCU + 1 
3fe3 : a5 52 __ LDA T11 + 0 
3fe5 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
3fe8 : a9 00 __ LDA #$00
3fea : 85 47 __ STA T2 + 0 
3fec : a9 00 __ LDA #$00
3fee : a8 __ __ TAY
3fef : f0 0c __ BEQ $3ffd ; (doplasma1.l94 + 0)
.s100:
3ff1 : 8d 01 d6 STA $d601 
3ff4 : 98 __ __ TYA
3ff5 : 18 __ __ CLC
3ff6 : 69 01 __ ADC #$01
3ff8 : a8 __ __ TAY
3ff9 : a5 46 __ LDA T1 + 1 
3ffb : 69 00 __ ADC #$00
.l94:
3ffd : 85 46 __ STA T1 + 1 
3fff : c5 06 __ CMP WORK + 3 
4001 : d0 02 __ BNE $4005 ; (doplasma1.s1011 + 0)
.s1010:
4003 : c4 05 __ CPY WORK + 2 
.s1011:
4005 : 90 0b __ BCC $4012 ; (doplasma1.s95 + 0)
.s1001:
4007 : a2 17 __ LDX #$17
4009 : bd c3 be LDA $bec3,x ; (doplasma0@stack + 0)
400c : 95 53 __ STA T12 + 0,x 
400e : ca __ __ DEX
400f : 10 f8 __ BPL $4009 ; (doplasma1.s1001 + 2)
4011 : 60 __ __ RTS
.s95:
4012 : 69 57 __ ADC #$57
4014 : 85 48 __ STA T2 + 1 
4016 : b1 47 __ LDA (T2 + 0),y 
.l371:
4018 : 2c 00 d6 BIT $d600 
401b : 10 fb __ BPL $4018 ; (doplasma1.l371 + 0)
401d : 4c f1 3f JMP $3ff1 ; (doplasma1.s100 + 0)
.s103:
4020 : 85 1d __ STA ACCU + 2 
4022 : a5 52 __ LDA T11 + 0 
4024 : 85 61 __ STA T24 + 0 
4026 : 0a __ __ ASL
4027 : 85 1b __ STA ACCU + 0 
4029 : a9 00 __ LDA #$00
402b : 2a __ __ ROL
402c : 06 1b __ ASL ACCU + 0 
402e : 2a __ __ ROL
402f : aa __ __ TAX
4030 : a5 1b __ LDA ACCU + 0 
4032 : 65 52 __ ADC T11 + 0 
4034 : 85 4e __ STA T8 + 0 
4036 : 8a __ __ TXA
4037 : 69 00 __ ADC #$00
4039 : 06 4e __ ASL T8 + 0 
403b : 2a __ __ ROL
403c : 06 4e __ ASL T8 + 0 
403e : 2a __ __ ROL
403f : 85 4f __ STA T8 + 1 
4041 : 18 __ __ CLC
4042 : a9 00 __ LDA #$00
4044 : 65 4e __ ADC T8 + 0 
4046 : 85 50 __ STA T10 + 0 
4048 : a9 57 __ LDA #$57
404a : 65 4f __ ADC T8 + 1 
404c : 85 51 __ STA T10 + 1 
404e : 18 __ __ CLC
404f : a5 50 __ LDA T10 + 0 
4051 : 65 52 __ ADC T11 + 0 
4053 : 85 53 __ STA T12 + 0 
4055 : a5 51 __ LDA T10 + 1 
4057 : 69 00 __ ADC #$00
4059 : 85 54 __ STA T12 + 1 
405b : a5 52 __ LDA T11 + 0 
405d : 0a __ __ ASL
405e : 85 1b __ STA ACCU + 0 
4060 : a9 00 __ LDA #$00
4062 : 2a __ __ ROL
4063 : 06 1b __ ASL ACCU + 0 
4065 : 2a __ __ ROL
4066 : a8 __ __ TAY
4067 : a5 1b __ LDA ACCU + 0 
4069 : 65 4e __ ADC T8 + 0 
406b : aa __ __ TAX
406c : 98 __ __ TYA
406d : 65 4f __ ADC T8 + 1 
406f : a8 __ __ TAY
4070 : 8a __ __ TXA
4071 : 18 __ __ CLC
4072 : 69 00 __ ADC #$00
4074 : 85 1b __ STA ACCU + 0 
4076 : 98 __ __ TYA
4077 : 69 57 __ ADC #$57
4079 : 85 1c __ STA ACCU + 1 
407b : ad 3f bf LDA $bf3f ; (ybuf0 + 24)
407e : 38 __ __ SEC
407f : ed 3e bf SBC $bf3e ; (ybuf0 + 23)
4082 : 85 58 __ STA T18 + 0 
4084 : ad 0d bf LDA $bf0d ; (ybuf1 + 24)
4087 : 38 __ __ SEC
4088 : ed 0c bf SBC $bf0c ; (ybuf1 + 23)
408b : 85 5a __ STA T20 + 0 
408d : a5 52 __ LDA T11 + 0 
408f : 0a __ __ ASL
4090 : a0 00 __ LDY #$00
4092 : 90 01 __ BCC $4095 ; (doplasma1.s1076 + 0)
.s1075:
4094 : c8 __ __ INY
.s1076:
4095 : 18 __ __ CLC
4096 : 65 52 __ ADC T11 + 0 
4098 : 90 01 __ BCC $409b ; (doplasma1.s1078 + 0)
.s1077:
409a : c8 __ __ INY
.s1078:
409b : 18 __ __ CLC
409c : 65 4e __ ADC T8 + 0 
409e : aa __ __ TAX
409f : 98 __ __ TYA
40a0 : 65 4f __ ADC T8 + 1 
40a2 : a8 __ __ TAY
40a3 : 8a __ __ TXA
40a4 : 18 __ __ CLC
40a5 : 69 00 __ ADC #$00
40a7 : 85 5c __ STA T21 + 0 
40a9 : 98 __ __ TYA
40aa : 69 57 __ ADC #$57
40ac : 85 5d __ STA T21 + 1 
40ae : ad 3e bf LDA $bf3e ; (ybuf0 + 23)
40b1 : 38 __ __ SEC
40b2 : ed 3d bf SBC $bf3d ; (ybuf0 + 22)
40b5 : 85 56 __ STA T17 + 0 
40b7 : ad 0c bf LDA $bf0c ; (ybuf1 + 23)
40ba : 38 __ __ SEC
40bb : ed 0b bf SBC $bf0b ; (ybuf1 + 22)
40be : 85 1e __ STA ACCU + 3 
40c0 : 06 61 __ ASL T24 + 0 
40c2 : a9 00 __ LDA #$00
40c4 : 2a __ __ ROL
40c5 : a8 __ __ TAY
40c6 : a5 61 __ LDA T24 + 0 
40c8 : 65 4e __ ADC T8 + 0 
40ca : aa __ __ TAX
40cb : 98 __ __ TYA
40cc : 65 4f __ ADC T8 + 1 
40ce : a8 __ __ TAY
40cf : 8a __ __ TXA
40d0 : 18 __ __ CLC
40d1 : 69 00 __ ADC #$00
40d3 : 85 4e __ STA T8 + 0 
40d5 : 98 __ __ TYA
40d6 : 69 57 __ ADC #$57
40d8 : 85 4f __ STA T8 + 1 
40da : ad 3d bf LDA $bf3d ; (ybuf0 + 22)
40dd : 38 __ __ SEC
40de : ed 3c bf SBC $bf3c ; (ybuf0 + 21)
40e1 : 85 5e __ STA T22 + 0 
40e3 : ad 0b bf LDA $bf0b ; (ybuf1 + 22)
40e6 : 38 __ __ SEC
40e7 : ed 0a bf SBC $bf0a ; (ybuf1 + 21)
40ea : 85 5f __ STA T23 + 0 
40ec : ad 3c bf LDA $bf3c ; (ybuf0 + 21)
40ef : 38 __ __ SEC
40f0 : ed 3b bf SBC $bf3b ; (ybuf0 + 20)
40f3 : 85 61 __ STA T24 + 0 
40f5 : ad 0a bf LDA $bf0a ; (ybuf1 + 21)
40f8 : 38 __ __ SEC
40f9 : ed 09 bf SBC $bf09 ; (ybuf1 + 20)
40fc : 85 62 __ STA T25 + 0 
.l87:
40fe : a6 1d __ LDX ACCU + 2 
4100 : bd a9 bf LDA $bfa9,x ; (pattern + 2)
4103 : 18 __ __ CLC
4104 : 6d 3b bf ADC $bf3b ; (ybuf0 + 20)
4107 : 85 66 __ STA T30 + 0 
4109 : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
410c : 18 __ __ CLC
410d : 6d 09 bf ADC $bf09 ; (ybuf1 + 20)
4110 : aa __ __ TAX
4111 : 18 __ __ CLC
4112 : 65 62 __ ADC T25 + 0 
4114 : 85 69 __ STA T32 + 0 
4116 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4119 : a6 66 __ LDX T30 + 0 
411b : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
411e : a4 1d __ LDY ACCU + 2 
4120 : 91 50 __ STA (T10 + 0),y 
4122 : 18 __ __ CLC
4123 : a5 61 __ LDA T24 + 0 
4125 : 65 66 __ ADC T30 + 0 
4127 : aa __ __ TAX
4128 : 18 __ __ CLC
4129 : 65 5e __ ADC T22 + 0 
412b : 85 66 __ STA T30 + 0 
412d : a4 69 __ LDY T32 + 0 
412f : b9 00 56 LDA $5600,y ; (colormap1 + 0)
4132 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4135 : a4 1d __ LDY ACCU + 2 
4137 : 91 53 __ STA (T12 + 0),y 
4139 : 18 __ __ CLC
413a : a5 5f __ LDA T23 + 0 
413c : 65 69 __ ADC T32 + 0 
413e : aa __ __ TAX
413f : 18 __ __ CLC
4140 : 65 1e __ ADC ACCU + 3 
4142 : 85 69 __ STA T32 + 0 
4144 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4147 : a6 66 __ LDX T30 + 0 
4149 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
414c : 91 4e __ STA (T8 + 0),y 
414e : 8a __ __ TXA
414f : 18 __ __ CLC
4150 : 65 56 __ ADC T17 + 0 
4152 : aa __ __ TAX
4153 : 18 __ __ CLC
4154 : 65 58 __ ADC T18 + 0 
4156 : 85 65 __ STA T29 + 0 
4158 : a4 69 __ LDY T32 + 0 
415a : b9 00 56 LDA $5600,y ; (colormap1 + 0)
415d : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4160 : a4 1d __ LDY ACCU + 2 
4162 : 91 5c __ STA (T21 + 0),y 
4164 : 18 __ __ CLC
4165 : a5 5a __ LDA T20 + 0 
4167 : 65 69 __ ADC T32 + 0 
4169 : aa __ __ TAX
416a : bd 00 56 LDA $5600,x ; (colormap1 + 0)
416d : a6 65 __ LDX T29 + 0 
416f : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4172 : 91 1b __ STA (ACCU + 0),y 
4174 : c6 1d __ DEC ACCU + 2 
4176 : 10 86 __ BPL $40fe ; (doplasma1.l87 + 0)
4178 : 4c 7e 3f JMP $3f7e ; (doplasma1.s89 + 0)
.s104:
417b : 85 1d __ STA ACCU + 2 
417d : a5 52 __ LDA T11 + 0 
417f : 85 63 __ STA T26 + 0 
4181 : 0a __ __ ASL
4182 : 85 1b __ STA ACCU + 0 
4184 : a9 00 __ LDA #$00
4186 : 2a __ __ ROL
4187 : 06 1b __ ASL ACCU + 0 
4189 : 2a __ __ ROL
418a : aa __ __ TAX
418b : a5 1b __ LDA ACCU + 0 
418d : 65 52 __ ADC T11 + 0 
418f : 85 50 __ STA T10 + 0 
4191 : 8a __ __ TXA
4192 : 69 00 __ ADC #$00
4194 : 85 1c __ STA ACCU + 1 
4196 : aa __ __ TAX
4197 : a5 50 __ LDA T10 + 0 
4199 : 0a __ __ ASL
419a : 26 1c __ ROL ACCU + 1 
419c : 18 __ __ CLC
419d : 65 50 __ ADC T10 + 0 
419f : 85 50 __ STA T10 + 0 
41a1 : 8a __ __ TXA
41a2 : 65 1c __ ADC ACCU + 1 
41a4 : 85 51 __ STA T10 + 1 
41a6 : 18 __ __ CLC
41a7 : a9 00 __ LDA #$00
41a9 : 65 50 __ ADC T10 + 0 
41ab : 85 1b __ STA ACCU + 0 
41ad : a9 57 __ LDA #$57
41af : 65 51 __ ADC T10 + 1 
41b1 : 85 1c __ STA ACCU + 1 
41b3 : 18 __ __ CLC
41b4 : a5 1b __ LDA ACCU + 0 
41b6 : 65 52 __ ADC T11 + 0 
41b8 : 85 56 __ STA T17 + 0 
41ba : a5 1c __ LDA ACCU + 1 
41bc : 69 00 __ ADC #$00
41be : 85 57 __ STA T17 + 1 
41c0 : a5 52 __ LDA T11 + 0 
41c2 : 0a __ __ ASL
41c3 : 85 58 __ STA T18 + 0 
41c5 : a9 00 __ LDA #$00
41c7 : 2a __ __ ROL
41c8 : 06 58 __ ASL T18 + 0 
41ca : 2a __ __ ROL
41cb : a8 __ __ TAY
41cc : a5 58 __ LDA T18 + 0 
41ce : 65 50 __ ADC T10 + 0 
41d0 : aa __ __ TAX
41d1 : 98 __ __ TYA
41d2 : 65 51 __ ADC T10 + 1 
41d4 : a8 __ __ TAY
41d5 : 8a __ __ TXA
41d6 : 18 __ __ CLC
41d7 : 69 00 __ ADC #$00
41d9 : 85 58 __ STA T18 + 0 
41db : 98 __ __ TYA
41dc : 69 57 __ ADC #$57
41de : 85 59 __ STA T18 + 1 
41e0 : ad 3a bf LDA $bf3a ; (ybuf0 + 19)
41e3 : 38 __ __ SEC
41e4 : ed 39 bf SBC $bf39 ; (ybuf0 + 18)
41e7 : 85 5a __ STA T20 + 0 
41e9 : ad 08 bf LDA $bf08 ; (ybuf1 + 19)
41ec : 38 __ __ SEC
41ed : ed 07 bf SBC $bf07 ; (ybuf1 + 18)
41f0 : 85 5e __ STA T22 + 0 
41f2 : a5 52 __ LDA T11 + 0 
41f4 : 0a __ __ ASL
41f5 : a0 00 __ LDY #$00
41f7 : 90 01 __ BCC $41fa ; (doplasma1.s1070 + 0)
.s1069:
41f9 : c8 __ __ INY
.s1070:
41fa : 18 __ __ CLC
41fb : 65 52 __ ADC T11 + 0 
41fd : 90 01 __ BCC $4200 ; (doplasma1.s1072 + 0)
.s1071:
41ff : c8 __ __ INY
.s1072:
4200 : 18 __ __ CLC
4201 : 65 50 __ ADC T10 + 0 
4203 : aa __ __ TAX
4204 : 98 __ __ TYA
4205 : 65 51 __ ADC T10 + 1 
4207 : a8 __ __ TAY
4208 : 8a __ __ TXA
4209 : 18 __ __ CLC
420a : 69 00 __ ADC #$00
420c : 85 5f __ STA T23 + 0 
420e : 98 __ __ TYA
420f : 69 57 __ ADC #$57
4211 : 85 60 __ STA T23 + 1 
4213 : ad 39 bf LDA $bf39 ; (ybuf0 + 18)
4216 : 38 __ __ SEC
4217 : ed 38 bf SBC $bf38 ; (ybuf0 + 17)
421a : 85 1e __ STA ACCU + 3 
421c : ad 07 bf LDA $bf07 ; (ybuf1 + 18)
421f : 38 __ __ SEC
4220 : ed 06 bf SBC $bf06 ; (ybuf1 + 17)
4223 : 85 5c __ STA T21 + 0 
4225 : 06 63 __ ASL T26 + 0 
4227 : a9 00 __ LDA #$00
4229 : 2a __ __ ROL
422a : a8 __ __ TAY
422b : a5 63 __ LDA T26 + 0 
422d : 65 50 __ ADC T10 + 0 
422f : aa __ __ TAX
4230 : 98 __ __ TYA
4231 : 65 51 __ ADC T10 + 1 
4233 : a8 __ __ TAY
4234 : 8a __ __ TXA
4235 : 18 __ __ CLC
4236 : 69 00 __ ADC #$00
4238 : 85 50 __ STA T10 + 0 
423a : 98 __ __ TYA
423b : 69 57 __ ADC #$57
423d : 85 51 __ STA T10 + 1 
423f : ad 38 bf LDA $bf38 ; (ybuf0 + 17)
4242 : 38 __ __ SEC
4243 : ed 37 bf SBC $bf37 ; (ybuf0 + 16)
4246 : 85 61 __ STA T24 + 0 
4248 : ad 06 bf LDA $bf06 ; (ybuf1 + 17)
424b : 38 __ __ SEC
424c : ed 05 bf SBC $bf05 ; (ybuf1 + 16)
424f : 85 62 __ STA T25 + 0 
4251 : ad 37 bf LDA $bf37 ; (ybuf0 + 16)
4254 : 38 __ __ SEC
4255 : ed 36 bf SBC $bf36 ; (ybuf0 + 15)
4258 : 85 63 __ STA T26 + 0 
425a : ad 05 bf LDA $bf05 ; (ybuf1 + 16)
425d : 38 __ __ SEC
425e : ed 04 bf SBC $bf04 ; (ybuf1 + 15)
4261 : 85 64 __ STA T27 + 0 
.l75:
4263 : a6 1d __ LDX ACCU + 2 
4265 : bd a9 bf LDA $bfa9,x ; (pattern + 2)
4268 : 18 __ __ CLC
4269 : 6d 36 bf ADC $bf36 ; (ybuf0 + 15)
426c : 85 69 __ STA T32 + 0 
426e : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
4271 : 18 __ __ CLC
4272 : 6d 04 bf ADC $bf04 ; (ybuf1 + 15)
4275 : aa __ __ TAX
4276 : 18 __ __ CLC
4277 : 65 64 __ ADC T27 + 0 
4279 : 85 6a __ STA T34 + 0 
427b : bd 00 56 LDA $5600,x ; (colormap1 + 0)
427e : a6 69 __ LDX T32 + 0 
4280 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4283 : a4 1d __ LDY ACCU + 2 
4285 : 91 1b __ STA (ACCU + 0),y 
4287 : 18 __ __ CLC
4288 : a5 63 __ LDA T26 + 0 
428a : 65 69 __ ADC T32 + 0 
428c : aa __ __ TAX
428d : 18 __ __ CLC
428e : 65 61 __ ADC T24 + 0 
4290 : 85 69 __ STA T32 + 0 
4292 : a4 6a __ LDY T34 + 0 
4294 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
4297 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
429a : a4 1d __ LDY ACCU + 2 
429c : 91 56 __ STA (T17 + 0),y 
429e : 18 __ __ CLC
429f : a5 62 __ LDA T25 + 0 
42a1 : 65 6a __ ADC T34 + 0 
42a3 : aa __ __ TAX
42a4 : 18 __ __ CLC
42a5 : 65 5c __ ADC T21 + 0 
42a7 : 85 6a __ STA T34 + 0 
42a9 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
42ac : a6 69 __ LDX T32 + 0 
42ae : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
42b1 : 91 50 __ STA (T10 + 0),y 
42b3 : 8a __ __ TXA
42b4 : 18 __ __ CLC
42b5 : 65 1e __ ADC ACCU + 3 
42b7 : aa __ __ TAX
42b8 : 18 __ __ CLC
42b9 : 65 5a __ ADC T20 + 0 
42bb : 85 68 __ STA T31 + 0 
42bd : a4 6a __ LDY T34 + 0 
42bf : b9 00 56 LDA $5600,y ; (colormap1 + 0)
42c2 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
42c5 : a4 1d __ LDY ACCU + 2 
42c7 : 91 5f __ STA (T23 + 0),y 
42c9 : 18 __ __ CLC
42ca : a5 5e __ LDA T22 + 0 
42cc : 65 6a __ ADC T34 + 0 
42ce : aa __ __ TAX
42cf : bd 00 56 LDA $5600,x ; (colormap1 + 0)
42d2 : a6 68 __ LDX T31 + 0 
42d4 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
42d7 : 91 58 __ STA (T18 + 0),y 
42d9 : c6 1d __ DEC ACCU + 2 
42db : 10 86 __ BPL $4263 ; (doplasma1.l75 + 0)
42dd : 4c 56 3e JMP $3e56 ; (doplasma1.s77 + 0)
.s105:
42e0 : 85 1d __ STA ACCU + 2 
42e2 : a5 52 __ LDA T11 + 0 
42e4 : 85 63 __ STA T26 + 0 
42e6 : 0a __ __ ASL
42e7 : 85 1b __ STA ACCU + 0 
42e9 : a9 00 __ LDA #$00
42eb : 2a __ __ ROL
42ec : 06 1b __ ASL ACCU + 0 
42ee : 2a __ __ ROL
42ef : aa __ __ TAX
42f0 : a5 1b __ LDA ACCU + 0 
42f2 : 65 52 __ ADC T11 + 0 
42f4 : 85 50 __ STA T10 + 0 
42f6 : 8a __ __ TXA
42f7 : 69 00 __ ADC #$00
42f9 : 06 50 __ ASL T10 + 0 
42fb : 2a __ __ ROL
42fc : 85 51 __ STA T10 + 1 
42fe : 18 __ __ CLC
42ff : a9 00 __ LDA #$00
4301 : 65 50 __ ADC T10 + 0 
4303 : 85 1b __ STA ACCU + 0 
4305 : a9 57 __ LDA #$57
4307 : 65 51 __ ADC T10 + 1 
4309 : 85 1c __ STA ACCU + 1 
430b : 18 __ __ CLC
430c : a5 1b __ LDA ACCU + 0 
430e : 65 52 __ ADC T11 + 0 
4310 : 85 56 __ STA T17 + 0 
4312 : a5 1c __ LDA ACCU + 1 
4314 : 69 00 __ ADC #$00
4316 : 85 57 __ STA T17 + 1 
4318 : a5 52 __ LDA T11 + 0 
431a : 0a __ __ ASL
431b : 85 58 __ STA T18 + 0 
431d : a9 00 __ LDA #$00
431f : 2a __ __ ROL
4320 : 06 58 __ ASL T18 + 0 
4322 : 2a __ __ ROL
4323 : a8 __ __ TAY
4324 : a5 58 __ LDA T18 + 0 
4326 : 65 50 __ ADC T10 + 0 
4328 : aa __ __ TAX
4329 : 98 __ __ TYA
432a : 65 51 __ ADC T10 + 1 
432c : a8 __ __ TAY
432d : 8a __ __ TXA
432e : 18 __ __ CLC
432f : 69 00 __ ADC #$00
4331 : 85 58 __ STA T18 + 0 
4333 : 98 __ __ TYA
4334 : 69 57 __ ADC #$57
4336 : 85 59 __ STA T18 + 1 
4338 : ad 35 bf LDA $bf35 ; (ybuf0 + 14)
433b : 38 __ __ SEC
433c : ed 34 bf SBC $bf34 ; (ybuf0 + 13)
433f : 85 5a __ STA T20 + 0 
4341 : ad 03 bf LDA $bf03 ; (ybuf1 + 14)
4344 : 38 __ __ SEC
4345 : ed 02 bf SBC $bf02 ; (ybuf1 + 13)
4348 : 85 5e __ STA T22 + 0 
434a : a5 52 __ LDA T11 + 0 
434c : 0a __ __ ASL
434d : a0 00 __ LDY #$00
434f : 90 01 __ BCC $4352 ; (doplasma1.s1066 + 0)
.s1065:
4351 : c8 __ __ INY
.s1066:
4352 : 18 __ __ CLC
4353 : 65 52 __ ADC T11 + 0 
4355 : 90 01 __ BCC $4358 ; (doplasma1.s1068 + 0)
.s1067:
4357 : c8 __ __ INY
.s1068:
4358 : 18 __ __ CLC
4359 : 65 50 __ ADC T10 + 0 
435b : aa __ __ TAX
435c : 98 __ __ TYA
435d : 65 51 __ ADC T10 + 1 
435f : a8 __ __ TAY
4360 : 8a __ __ TXA
4361 : 18 __ __ CLC
4362 : 69 00 __ ADC #$00
4364 : 85 5f __ STA T23 + 0 
4366 : 98 __ __ TYA
4367 : 69 57 __ ADC #$57
4369 : 85 60 __ STA T23 + 1 
436b : ad 34 bf LDA $bf34 ; (ybuf0 + 13)
436e : 38 __ __ SEC
436f : ed 33 bf SBC $bf33 ; (ybuf0 + 12)
4372 : 85 1e __ STA ACCU + 3 
4374 : ad 02 bf LDA $bf02 ; (ybuf1 + 13)
4377 : 38 __ __ SEC
4378 : ed 01 bf SBC $bf01 ; (ybuf1 + 12)
437b : 85 5c __ STA T21 + 0 
437d : 06 63 __ ASL T26 + 0 
437f : a9 00 __ LDA #$00
4381 : 2a __ __ ROL
4382 : a8 __ __ TAY
4383 : a5 63 __ LDA T26 + 0 
4385 : 65 50 __ ADC T10 + 0 
4387 : aa __ __ TAX
4388 : 98 __ __ TYA
4389 : 65 51 __ ADC T10 + 1 
438b : a8 __ __ TAY
438c : 8a __ __ TXA
438d : 18 __ __ CLC
438e : 69 00 __ ADC #$00
4390 : 85 50 __ STA T10 + 0 
4392 : 98 __ __ TYA
4393 : 69 57 __ ADC #$57
4395 : 85 51 __ STA T10 + 1 
4397 : ad 33 bf LDA $bf33 ; (ybuf0 + 12)
439a : 38 __ __ SEC
439b : ed 32 bf SBC $bf32 ; (ybuf0 + 11)
439e : 85 61 __ STA T24 + 0 
43a0 : ad 01 bf LDA $bf01 ; (ybuf1 + 12)
43a3 : 38 __ __ SEC
43a4 : ed 00 bf SBC $bf00 ; (ybuf1 + 11)
43a7 : 85 62 __ STA T25 + 0 
43a9 : ad 32 bf LDA $bf32 ; (ybuf0 + 11)
43ac : 38 __ __ SEC
43ad : ed 31 bf SBC $bf31 ; (ybuf0 + 10)
43b0 : 85 63 __ STA T26 + 0 
43b2 : ad 00 bf LDA $bf00 ; (ybuf1 + 11)
43b5 : 38 __ __ SEC
43b6 : ed ff be SBC $beff ; (ybuf1 + 10)
43b9 : 85 64 __ STA T27 + 0 
.l63:
43bb : a6 1d __ LDX ACCU + 2 
43bd : bd a9 bf LDA $bfa9,x ; (pattern + 2)
43c0 : 18 __ __ CLC
43c1 : 6d 31 bf ADC $bf31 ; (ybuf0 + 10)
43c4 : 85 69 __ STA T32 + 0 
43c6 : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
43c9 : 18 __ __ CLC
43ca : 6d ff be ADC $beff ; (ybuf1 + 10)
43cd : aa __ __ TAX
43ce : 18 __ __ CLC
43cf : 65 64 __ ADC T27 + 0 
43d1 : 85 6a __ STA T34 + 0 
43d3 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
43d6 : a6 69 __ LDX T32 + 0 
43d8 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
43db : a4 1d __ LDY ACCU + 2 
43dd : 91 1b __ STA (ACCU + 0),y 
43df : 18 __ __ CLC
43e0 : a5 63 __ LDA T26 + 0 
43e2 : 65 69 __ ADC T32 + 0 
43e4 : aa __ __ TAX
43e5 : 18 __ __ CLC
43e6 : 65 61 __ ADC T24 + 0 
43e8 : 85 69 __ STA T32 + 0 
43ea : a4 6a __ LDY T34 + 0 
43ec : b9 00 56 LDA $5600,y ; (colormap1 + 0)
43ef : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
43f2 : a4 1d __ LDY ACCU + 2 
43f4 : 91 56 __ STA (T17 + 0),y 
43f6 : 18 __ __ CLC
43f7 : a5 62 __ LDA T25 + 0 
43f9 : 65 6a __ ADC T34 + 0 
43fb : aa __ __ TAX
43fc : 18 __ __ CLC
43fd : 65 5c __ ADC T21 + 0 
43ff : 85 6a __ STA T34 + 0 
4401 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4404 : a6 69 __ LDX T32 + 0 
4406 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4409 : 91 50 __ STA (T10 + 0),y 
440b : 8a __ __ TXA
440c : 18 __ __ CLC
440d : 65 1e __ ADC ACCU + 3 
440f : aa __ __ TAX
4410 : 18 __ __ CLC
4411 : 65 5a __ ADC T20 + 0 
4413 : 85 68 __ STA T31 + 0 
4415 : a4 6a __ LDY T34 + 0 
4417 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
441a : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
441d : a4 1d __ LDY ACCU + 2 
441f : 91 5f __ STA (T23 + 0),y 
4421 : 18 __ __ CLC
4422 : a5 5e __ LDA T22 + 0 
4424 : 65 6a __ ADC T34 + 0 
4426 : aa __ __ TAX
4427 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
442a : a6 68 __ LDX T31 + 0 
442c : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
442f : 91 58 __ STA (T18 + 0),y 
4431 : c6 1d __ DEC ACCU + 2 
4433 : 10 86 __ BPL $43bb ; (doplasma1.l63 + 0)
4435 : 4c 4c 3e JMP $3e4c ; (doplasma1.s65 + 0)
.s106:
4438 : 85 1d __ STA ACCU + 2 
443a : a5 52 __ LDA T11 + 0 
443c : 85 63 __ STA T26 + 0 
443e : 0a __ __ ASL
443f : 85 1b __ STA ACCU + 0 
4441 : a9 00 __ LDA #$00
4443 : 2a __ __ ROL
4444 : 06 1b __ ASL ACCU + 0 
4446 : 2a __ __ ROL
4447 : aa __ __ TAX
4448 : a5 1b __ LDA ACCU + 0 
444a : 65 52 __ ADC T11 + 0 
444c : 85 50 __ STA T10 + 0 
444e : 90 01 __ BCC $4451 ; (doplasma1.s1060 + 0)
.s1059:
4450 : e8 __ __ INX
.s1060:
4451 : 86 51 __ STX T10 + 1 
4453 : 18 __ __ CLC
4454 : 69 00 __ ADC #$00
4456 : 85 1b __ STA ACCU + 0 
4458 : 8a __ __ TXA
4459 : 69 57 __ ADC #$57
445b : 85 1c __ STA ACCU + 1 
445d : 18 __ __ CLC
445e : a5 1b __ LDA ACCU + 0 
4460 : 65 52 __ ADC T11 + 0 
4462 : 85 56 __ STA T17 + 0 
4464 : a5 1c __ LDA ACCU + 1 
4466 : 69 00 __ ADC #$00
4468 : 85 57 __ STA T17 + 1 
446a : a5 52 __ LDA T11 + 0 
446c : 0a __ __ ASL
446d : 85 58 __ STA T18 + 0 
446f : a9 00 __ LDA #$00
4471 : 2a __ __ ROL
4472 : 06 58 __ ASL T18 + 0 
4474 : 2a __ __ ROL
4475 : a8 __ __ TAY
4476 : a5 58 __ LDA T18 + 0 
4478 : 65 50 __ ADC T10 + 0 
447a : aa __ __ TAX
447b : 98 __ __ TYA
447c : 65 51 __ ADC T10 + 1 
447e : a8 __ __ TAY
447f : 8a __ __ TXA
4480 : 18 __ __ CLC
4481 : 69 00 __ ADC #$00
4483 : 85 58 __ STA T18 + 0 
4485 : 98 __ __ TYA
4486 : 69 57 __ ADC #$57
4488 : 85 59 __ STA T18 + 1 
448a : ad 30 bf LDA $bf30 ; (ybuf0 + 9)
448d : 38 __ __ SEC
448e : ed 2f bf SBC $bf2f ; (ybuf0 + 8)
4491 : 85 5a __ STA T20 + 0 
4493 : ad fe be LDA $befe ; (ybuf1 + 9)
4496 : 38 __ __ SEC
4497 : ed fd be SBC $befd ; (ybuf1 + 8)
449a : 85 5e __ STA T22 + 0 
449c : a5 52 __ LDA T11 + 0 
449e : 0a __ __ ASL
449f : a0 00 __ LDY #$00
44a1 : 90 01 __ BCC $44a4 ; (doplasma1.s1062 + 0)
.s1061:
44a3 : c8 __ __ INY
.s1062:
44a4 : 18 __ __ CLC
44a5 : 65 52 __ ADC T11 + 0 
44a7 : 90 01 __ BCC $44aa ; (doplasma1.s1064 + 0)
.s1063:
44a9 : c8 __ __ INY
.s1064:
44aa : 18 __ __ CLC
44ab : 65 50 __ ADC T10 + 0 
44ad : aa __ __ TAX
44ae : 98 __ __ TYA
44af : 65 51 __ ADC T10 + 1 
44b1 : a8 __ __ TAY
44b2 : 8a __ __ TXA
44b3 : 18 __ __ CLC
44b4 : 69 00 __ ADC #$00
44b6 : 85 5f __ STA T23 + 0 
44b8 : 98 __ __ TYA
44b9 : 69 57 __ ADC #$57
44bb : 85 60 __ STA T23 + 1 
44bd : ad 2f bf LDA $bf2f ; (ybuf0 + 8)
44c0 : 38 __ __ SEC
44c1 : ed 2e bf SBC $bf2e ; (ybuf0 + 7)
44c4 : 85 1e __ STA ACCU + 3 
44c6 : ad fd be LDA $befd ; (ybuf1 + 8)
44c9 : 38 __ __ SEC
44ca : ed fc be SBC $befc ; (ybuf1 + 7)
44cd : 85 5c __ STA T21 + 0 
44cf : 06 63 __ ASL T26 + 0 
44d1 : a9 00 __ LDA #$00
44d3 : 2a __ __ ROL
44d4 : a8 __ __ TAY
44d5 : a5 63 __ LDA T26 + 0 
44d7 : 65 50 __ ADC T10 + 0 
44d9 : aa __ __ TAX
44da : 98 __ __ TYA
44db : 65 51 __ ADC T10 + 1 
44dd : a8 __ __ TAY
44de : 8a __ __ TXA
44df : 18 __ __ CLC
44e0 : 69 00 __ ADC #$00
44e2 : 85 50 __ STA T10 + 0 
44e4 : 98 __ __ TYA
44e5 : 69 57 __ ADC #$57
44e7 : 85 51 __ STA T10 + 1 
44e9 : ad 2e bf LDA $bf2e ; (ybuf0 + 7)
44ec : 38 __ __ SEC
44ed : ed 2d bf SBC $bf2d ; (ybuf0 + 6)
44f0 : 85 61 __ STA T24 + 0 
44f2 : ad fc be LDA $befc ; (ybuf1 + 7)
44f5 : 38 __ __ SEC
44f6 : ed fb be SBC $befb ; (ybuf1 + 6)
44f9 : 85 62 __ STA T25 + 0 
44fb : ad 2d bf LDA $bf2d ; (ybuf0 + 6)
44fe : 38 __ __ SEC
44ff : ed 2c bf SBC $bf2c ; (ybuf0 + 5)
4502 : 85 63 __ STA T26 + 0 
4504 : ad fb be LDA $befb ; (ybuf1 + 6)
4507 : 38 __ __ SEC
4508 : ed fa be SBC $befa ; (ybuf1 + 5)
450b : 85 64 __ STA T27 + 0 
.l51:
450d : a6 1d __ LDX ACCU + 2 
450f : bd a9 bf LDA $bfa9,x ; (pattern + 2)
4512 : 18 __ __ CLC
4513 : 6d 2c bf ADC $bf2c ; (ybuf0 + 5)
4516 : 85 69 __ STA T32 + 0 
4518 : bd 59 bf LDA $bf59,x ; (xbuf1 + 0)
451b : 18 __ __ CLC
451c : 6d fa be ADC $befa ; (ybuf1 + 5)
451f : aa __ __ TAX
4520 : 18 __ __ CLC
4521 : 65 64 __ ADC T27 + 0 
4523 : 85 6a __ STA T34 + 0 
4525 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4528 : a6 69 __ LDX T32 + 0 
452a : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
452d : a4 1d __ LDY ACCU + 2 
452f : 91 1b __ STA (ACCU + 0),y 
4531 : 18 __ __ CLC
4532 : a5 63 __ LDA T26 + 0 
4534 : 65 69 __ ADC T32 + 0 
4536 : aa __ __ TAX
4537 : 18 __ __ CLC
4538 : 65 61 __ ADC T24 + 0 
453a : 85 69 __ STA T32 + 0 
453c : a4 6a __ LDY T34 + 0 
453e : b9 00 56 LDA $5600,y ; (colormap1 + 0)
4541 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4544 : a4 1d __ LDY ACCU + 2 
4546 : 91 56 __ STA (T17 + 0),y 
4548 : 18 __ __ CLC
4549 : a5 62 __ LDA T25 + 0 
454b : 65 6a __ ADC T34 + 0 
454d : aa __ __ TAX
454e : 18 __ __ CLC
454f : 65 5c __ ADC T21 + 0 
4551 : 85 6a __ STA T34 + 0 
4553 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4556 : a6 69 __ LDX T32 + 0 
4558 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
455b : 91 50 __ STA (T10 + 0),y 
455d : 8a __ __ TXA
455e : 18 __ __ CLC
455f : 65 1e __ ADC ACCU + 3 
4561 : aa __ __ TAX
4562 : 18 __ __ CLC
4563 : 65 5a __ ADC T20 + 0 
4565 : 85 68 __ STA T31 + 0 
4567 : a4 6a __ LDY T34 + 0 
4569 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
456c : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
456f : a4 1d __ LDY ACCU + 2 
4571 : 91 5f __ STA (T23 + 0),y 
4573 : 18 __ __ CLC
4574 : a5 5e __ LDA T22 + 0 
4576 : 65 6a __ ADC T34 + 0 
4578 : aa __ __ TAX
4579 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
457c : a6 68 __ LDX T31 + 0 
457e : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4581 : 91 58 __ STA (T18 + 0),y 
4583 : c6 1d __ DEC ACCU + 2 
4585 : 10 86 __ BPL $450d ; (doplasma1.l51 + 0)
4587 : 4c 42 3e JMP $3e42 ; (doplasma1.s53 + 0)
.s107:
458a : 85 1d __ STA ACCU + 2 
458c : a5 52 __ LDA T11 + 0 
458e : 85 5f __ STA T23 + 0 
4590 : 0a __ __ ASL
4591 : 85 50 __ STA T10 + 0 
4593 : a9 00 __ LDA #$00
4595 : 2a __ __ ROL
4596 : 06 50 __ ASL T10 + 0 
4598 : 2a __ __ ROL
4599 : aa __ __ TAX
459a : a9 00 __ LDA #$00
459c : 65 50 __ ADC T10 + 0 
459e : 85 50 __ STA T10 + 0 
45a0 : 8a __ __ TXA
45a1 : 69 57 __ ADC #$57
45a3 : 85 51 __ STA T10 + 1 
45a5 : ad 2b bf LDA $bf2b ; (ybuf0 + 4)
45a8 : 38 __ __ SEC
45a9 : ed 2a bf SBC $bf2a ; (ybuf0 + 3)
45ac : 85 56 __ STA T17 + 0 
45ae : ad f9 be LDA $bef9 ; (ybuf1 + 4)
45b1 : 38 __ __ SEC
45b2 : ed f8 be SBC $bef8 ; (ybuf1 + 3)
45b5 : 85 1e __ STA ACCU + 3 
45b7 : a5 52 __ LDA T11 + 0 
45b9 : 0a __ __ ASL
45ba : a2 00 __ LDX #$00
45bc : 90 01 __ BCC $45bf ; (doplasma1.s1056 + 0)
.s1055:
45be : e8 __ __ INX
.s1056:
45bf : 18 __ __ CLC
45c0 : 65 52 __ ADC T11 + 0 
45c2 : 90 01 __ BCC $45c5 ; (doplasma1.s1058 + 0)
.s1057:
45c4 : e8 __ __ INX
.s1058:
45c5 : 18 __ __ CLC
45c6 : 69 00 __ ADC #$00
45c8 : 85 5a __ STA T20 + 0 
45ca : 8a __ __ TXA
45cb : 69 57 __ ADC #$57
45cd : 85 5b __ STA T20 + 1 
45cf : ad 2a bf LDA $bf2a ; (ybuf0 + 3)
45d2 : 38 __ __ SEC
45d3 : ed 29 bf SBC $bf29 ; (ybuf0 + 2)
45d6 : 85 1b __ STA ACCU + 0 
45d8 : ad f8 be LDA $bef8 ; (ybuf1 + 3)
45db : 38 __ __ SEC
45dc : ed f7 be SBC $bef7 ; (ybuf1 + 2)
45df : 85 58 __ STA T18 + 0 
45e1 : 06 5f __ ASL T23 + 0 
45e3 : a9 00 __ LDA #$00
45e5 : 2a __ __ ROL
45e6 : aa __ __ TAX
45e7 : a9 00 __ LDA #$00
45e9 : 65 5f __ ADC T23 + 0 
45eb : 85 5f __ STA T23 + 0 
45ed : 8a __ __ TXA
45ee : 69 57 __ ADC #$57
45f0 : 85 60 __ STA T23 + 1 
45f2 : ad 29 bf LDA $bf29 ; (ybuf0 + 2)
45f5 : 38 __ __ SEC
45f6 : ed 28 bf SBC $bf28 ; (ybuf0 + 1)
45f9 : 85 5c __ STA T21 + 0 
45fb : ad f7 be LDA $bef7 ; (ybuf1 + 2)
45fe : 38 __ __ SEC
45ff : ed f6 be SBC $bef6 ; (ybuf1 + 1)
4602 : 85 5e __ STA T22 + 0 
4604 : ad 28 bf LDA $bf28 ; (ybuf0 + 1)
4607 : 38 __ __ SEC
4608 : ed 27 bf SBC $bf27 ; (ybuf0 + 0)
460b : 85 61 __ STA T24 + 0 
460d : ad f6 be LDA $bef6 ; (ybuf1 + 1)
4610 : 38 __ __ SEC
4611 : ed f5 be SBC $bef5 ; (ybuf1 + 0)
4614 : 85 62 __ STA T25 + 0 
.l39:
4616 : a4 1d __ LDY ACCU + 2 
4618 : b9 a9 bf LDA $bfa9,y ; (pattern + 2)
461b : 18 __ __ CLC
461c : 6d 27 bf ADC $bf27 ; (ybuf0 + 0)
461f : aa __ __ TAX
4620 : b9 59 bf LDA $bf59,y ; (xbuf1 + 0)
4623 : 18 __ __ CLC
4624 : 6d f5 be ADC $bef5 ; (ybuf1 + 0)
4627 : a8 __ __ TAY
4628 : 18 __ __ CLC
4629 : 65 62 __ ADC T25 + 0 
462b : 85 68 __ STA T31 + 0 
462d : bd 00 55 LDA $5500,x ; (colormap0 + 0)
4630 : 19 00 56 ORA $5600,y ; (colormap1 + 0)
4633 : a4 1d __ LDY ACCU + 2 
4635 : 99 00 57 STA $5700,y ; (Screen + 0)
4638 : 8a __ __ TXA
4639 : 18 __ __ CLC
463a : 65 61 __ ADC T24 + 0 
463c : aa __ __ TAX
463d : 18 __ __ CLC
463e : 65 5c __ ADC T21 + 0 
4640 : 85 65 __ STA T29 + 0 
4642 : 98 __ __ TYA
4643 : 18 __ __ CLC
4644 : 65 52 __ ADC T11 + 0 
4646 : a8 __ __ TAY
4647 : a9 00 __ LDA #$00
4649 : 2a __ __ ROL
464a : 85 67 __ STA T30 + 1 
464c : 98 __ __ TYA
464d : 69 00 __ ADC #$00
464f : 85 66 __ STA T30 + 0 
4651 : a9 57 __ LDA #$57
4653 : 65 67 __ ADC T30 + 1 
4655 : 85 67 __ STA T30 + 1 
4657 : bd 00 55 LDA $5500,x ; (colormap0 + 0)
465a : a6 68 __ LDX T31 + 0 
465c : 1d 00 56 ORA $5600,x ; (colormap1 + 0)
465f : a0 00 __ LDY #$00
4661 : 91 66 __ STA (T30 + 0),y 
4663 : 18 __ __ CLC
4664 : a5 5e __ LDA T22 + 0 
4666 : 65 68 __ ADC T31 + 0 
4668 : aa __ __ TAX
4669 : 18 __ __ CLC
466a : 65 58 __ ADC T18 + 0 
466c : 85 68 __ STA T31 + 0 
466e : bd 00 56 LDA $5600,x ; (colormap1 + 0)
4671 : a6 65 __ LDX T29 + 0 
4673 : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
4676 : a4 1d __ LDY ACCU + 2 
4678 : 91 5f __ STA (T23 + 0),y 
467a : 18 __ __ CLC
467b : a5 1b __ LDA ACCU + 0 
467d : 65 65 __ ADC T29 + 0 
467f : aa __ __ TAX
4680 : 18 __ __ CLC
4681 : 65 56 __ ADC T17 + 0 
4683 : 85 65 __ STA T29 + 0 
4685 : a4 68 __ LDY T31 + 0 
4687 : b9 00 56 LDA $5600,y ; (colormap1 + 0)
468a : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
468d : a4 1d __ LDY ACCU + 2 
468f : 91 5a __ STA (T20 + 0),y 
4691 : 18 __ __ CLC
4692 : a5 1e __ LDA ACCU + 3 
4694 : 65 68 __ ADC T31 + 0 
4696 : aa __ __ TAX
4697 : bd 00 56 LDA $5600,x ; (colormap1 + 0)
469a : a6 65 __ LDX T29 + 0 
469c : 1d 00 55 ORA $5500,x ; (colormap0 + 0)
469f : 91 50 __ STA (T10 + 0),y 
46a1 : c6 1d __ DEC ACCU + 2 
46a3 : 30 03 __ BMI $46a8 ; (doplasma1.l39 + 146)
46a5 : 4c 16 46 JMP $4616 ; (doplasma1.l39 + 0)
46a8 : 4c 38 3e JMP $3e38 ; (doplasma1.s41 + 0)
--------------------------------------------------------------------
rotate_demo: ; rotate_demo(u8)->void
.s1000:
46ab : a2 06 __ LDX #$06
46ad : b5 53 __ LDA T0 + 0,x 
46af : 9d 65 bf STA $bf65,x ; (xbuf1 + 12)
46b2 : ca __ __ DEX
46b3 : 10 f8 __ BPL $46ad ; (rotate_demo.s1000 + 2)
.s0:
46b5 : 20 93 4d JSR $4d93 ; (init_rotate.s1000 + 0)
46b8 : a9 00 __ LDA #$00
46ba : a2 27 __ LDX #$27
.l1063:
46bc : 9d 79 bf STA $bf79,x ; (xbuf1 + 32)
46bf : ca __ __ DEX
46c0 : 10 fa __ BPL $46bc ; (rotate_demo.l1063 + 0)
.s1064:
46c2 : a2 0b __ LDX #$0b
.l1065:
46c4 : 9d 6d bf STA $bf6d,x ; (xbuf1 + 20)
46c7 : ca __ __ DEX
46c8 : 10 fa __ BPL $46c4 ; (rotate_demo.l1065 + 0)
.s1066:
46ca : 85 53 __ STA T0 + 0 
.l930:
46cc : 20 e4 ff JSR $ffe4 
46cf : 09 00 __ ORA #$00
46d1 : d0 f9 __ BNE $46cc ; (rotate_demo.l930 + 0)
.s740:
46d3 : ad 71 52 LDA $5271 ; (vdc_state + 8)
46d6 : 38 __ __ SEC
46d7 : e9 01 __ SBC #$01
46d9 : 85 54 __ STA T1 + 0 
46db : a9 00 __ LDA #$00
46dd : e9 00 __ SBC #$00
46df : 85 55 __ STA T1 + 1 
.l12:
46e1 : a9 00 __ LDA #$00
46e3 : 85 57 __ STA T3 + 0 
46e5 : a9 28 __ LDA #$28
46e7 : 85 56 __ STA T2 + 0 
.l15:
46e9 : 18 __ __ CLC
46ea : a5 57 __ LDA T3 + 0 
46ec : 69 01 __ ADC #$01
46ee : a4 57 __ LDY T3 + 0 
46f0 : 18 __ __ CLC
46f1 : 79 79 bf ADC $bf79,y ; (xbuf1 + 32)
46f4 : 99 79 bf STA $bf79,y ; (xbuf1 + 32)
46f7 : aa __ __ TAX
46f8 : a5 55 __ LDA T1 + 1 
46fa : 30 06 __ BMI $4702 ; (rotate_demo.s18 + 0)
.s1058:
46fc : d0 1b __ BNE $4719 ; (rotate_demo.s665 + 0)
.s1056:
46fe : e4 54 __ CPX T1 + 0 
4700 : 90 17 __ BCC $4719 ; (rotate_demo.s665 + 0)
.s18:
4702 : 8a __ __ TXA
4703 : 38 __ __ SEC
4704 : e5 54 __ SBC T1 + 0 
4706 : 99 79 bf STA $bf79,y ; (xbuf1 + 32)
4709 : 38 __ __ SEC
470a : a9 27 __ LDA #$27
470c : e5 57 __ SBC T3 + 0 
470e : 20 57 4e JSR $4e57 ; (rotdown.s1000 + 0)
4711 : 18 __ __ CLC
4712 : a5 57 __ LDA T3 + 0 
4714 : 69 28 __ ADC #$28
4716 : 20 b3 4e JSR $4eb3 ; (rotup.s0 + 0)
.s665:
4719 : e6 57 __ INC T3 + 0 
471b : c6 56 __ DEC T2 + 0 
471d : d0 ca __ BNE $46e9 ; (rotate_demo.l15 + 0)
.s17:
471f : ad 78 bf LDA $bf78 ; (xbuf1 + 31)
4722 : 18 __ __ CLC
4723 : 69 05 __ ADC #$05
4725 : 8d 78 bf STA $bf78 ; (xbuf1 + 31)
4728 : a2 00 __ LDX #$00
472a : f0 07 __ BEQ $4733 ; (rotate_demo.l42 + 0)
.s43:
472c : bd 01 57 LDA $5701,x ; (Screen + 1)
472f : 9d 00 57 STA $5700,x ; (Screen + 0)
4732 : e8 __ __ INX
.l42:
4733 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4736 : a8 __ __ TAY
4737 : 38 __ __ SEC
4738 : e9 01 __ SBC #$01
473a : 85 59 __ STA T4 + 0 
473c : 90 04 __ BCC $4742 ; (rotate_demo.s1107 + 0)
.s1053:
473e : e4 59 __ CPX T4 + 0 
4740 : 90 ea __ BCC $472c ; (rotate_demo.s43 + 0)
.s1107:
4742 : 84 57 __ STY T3 + 0 
4744 : aa __ __ TAX
4745 : a5 57 __ LDA T3 + 0 
4747 : 0a __ __ ASL
4748 : a8 __ __ TAY
4749 : a9 00 __ LDA #$00
474b : 9d 00 57 STA $5700,x ; (Screen + 0)
474e : 2a __ __ ROL
474f : 85 1c __ STA ACCU + 1 
4751 : 98 __ __ TYA
4752 : 65 57 __ ADC T3 + 0 
4754 : 85 43 __ STA T5 + 0 
4756 : a5 1c __ LDA ACCU + 1 
4758 : 69 00 __ ADC #$00
475a : 06 43 __ ASL T5 + 0 
475c : 2a __ __ ROL
475d : 06 43 __ ASL T5 + 0 
475f : 2a __ __ ROL
4760 : 06 43 __ ASL T5 + 0 
4762 : 2a __ __ ROL
4763 : a8 __ __ TAY
4764 : 18 __ __ CLC
4765 : a9 00 __ LDA #$00
4767 : 65 43 __ ADC T5 + 0 
4769 : 85 43 __ STA T5 + 0 
476b : 98 __ __ TYA
476c : 69 57 __ ADC #$57
476e : 85 44 __ STA T5 + 1 
4770 : 8a __ __ TXA
4771 : f0 0d __ BEQ $4780 ; (rotate_demo.s50 + 0)
.l48:
4773 : a8 __ __ TAY
4774 : 88 __ __ DEY
4775 : b1 43 __ LDA (T5 + 0),y 
4777 : c8 __ __ INY
4778 : 91 43 __ STA (T5 + 0),y 
477a : c6 59 __ DEC T4 + 0 
477c : a5 59 __ LDA T4 + 0 
477e : d0 f3 __ BNE $4773 ; (rotate_demo.l48 + 0)
.s50:
4780 : 85 56 __ STA T2 + 0 
4782 : a8 __ __ TAY
4783 : 91 43 __ STA (T5 + 0),y 
4785 : ad 77 bf LDA $bf77 ; (xbuf1 + 30)
4788 : 18 __ __ CLC
4789 : 69 04 __ ADC #$04
478b : 8d 77 bf STA $bf77 ; (xbuf1 + 30)
478e : 18 __ __ CLC
478f : a9 00 __ LDA #$00
4791 : 65 57 __ ADC T3 + 0 
4793 : 85 57 __ STA T3 + 0 
4795 : a9 57 __ LDA #$57
4797 : 69 00 __ ADC #$00
4799 : 85 58 __ STA T3 + 1 
479b : 4c a6 47 JMP $47a6 ; (rotate_demo.l55 + 0)
.s56:
479e : c8 __ __ INY
479f : b1 57 __ LDA (T3 + 0),y 
47a1 : 88 __ __ DEY
47a2 : 91 57 __ STA (T3 + 0),y 
47a4 : e6 56 __ INC T2 + 0 
.l55:
47a6 : ad 70 52 LDA $5270 ; (vdc_state + 7)
47a9 : 85 59 __ STA T4 + 0 
47ab : 38 __ __ SEC
47ac : e9 01 __ SBC #$01
47ae : 85 43 __ STA T5 + 0 
47b0 : a9 00 __ LDA #$00
47b2 : e9 00 __ SBC #$00
47b4 : 30 06 __ BMI $47bc ; (rotate_demo.s1109 + 0)
.s1050:
47b6 : a4 56 __ LDY T2 + 0 
47b8 : c4 43 __ CPY T5 + 0 
47ba : 90 e2 __ BCC $479e ; (rotate_demo.s56 + 0)
.s1109:
47bc : 18 __ __ CLC
47bd : 65 58 __ ADC T3 + 1 
47bf : 85 58 __ STA T3 + 1 
47c1 : a9 00 __ LDA #$00
47c3 : 85 1c __ STA ACCU + 1 
47c5 : a4 43 __ LDY T5 + 0 
47c7 : 91 57 __ STA (T3 + 0),y 
47c9 : a5 59 __ LDA T4 + 0 
47cb : 85 1b __ STA ACCU + 0 
47cd : a9 17 __ LDA #$17
47cf : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
47d2 : 18 __ __ CLC
47d3 : a9 00 __ LDA #$00
47d5 : 65 05 __ ADC WORK + 2 
47d7 : 85 57 __ STA T3 + 0 
47d9 : a9 57 __ LDA #$57
47db : 65 06 __ ADC WORK + 3 
47dd : 85 58 __ STA T3 + 1 
47df : a4 43 __ LDY T5 + 0 
47e1 : f0 09 __ BEQ $47ec ; (rotate_demo.s63 + 0)
.l1067:
47e3 : 88 __ __ DEY
47e4 : b1 57 __ LDA (T3 + 0),y 
47e6 : c8 __ __ INY
47e7 : 91 57 __ STA (T3 + 0),y 
47e9 : 88 __ __ DEY
47ea : d0 f7 __ BNE $47e3 ; (rotate_demo.l1067 + 0)
.s63:
47ec : 84 56 __ STY T2 + 0 
47ee : 98 __ __ TYA
47ef : 91 57 __ STA (T3 + 0),y 
47f1 : ad 76 bf LDA $bf76 ; (xbuf1 + 29)
47f4 : 18 __ __ CLC
47f5 : 69 03 __ ADC #$03
47f7 : 8d 76 bf STA $bf76 ; (xbuf1 + 29)
47fa : a5 59 __ LDA T4 + 0 
47fc : 0a __ __ ASL
47fd : aa __ __ TAX
47fe : 98 __ __ TYA
47ff : 2a __ __ ROL
4800 : a8 __ __ TAY
4801 : 8a __ __ TXA
4802 : 18 __ __ CLC
4803 : 69 00 __ ADC #$00
4805 : 85 57 __ STA T3 + 0 
4807 : 98 __ __ TYA
4808 : 69 57 __ ADC #$57
480a : 85 58 __ STA T3 + 1 
480c : 4c 17 48 JMP $4817 ; (rotate_demo.l68 + 0)
.s69:
480f : c8 __ __ INY
4810 : b1 57 __ LDA (T3 + 0),y 
4812 : 88 __ __ DEY
4813 : 91 57 __ STA (T3 + 0),y 
4815 : e6 56 __ INC T2 + 0 
.l68:
4817 : ad 70 52 LDA $5270 ; (vdc_state + 7)
481a : 85 59 __ STA T4 + 0 
481c : 38 __ __ SEC
481d : e9 01 __ SBC #$01
481f : 85 43 __ STA T5 + 0 
4821 : a9 00 __ LDA #$00
4823 : e9 00 __ SBC #$00
4825 : 30 06 __ BMI $482d ; (rotate_demo.s1111 + 0)
.s1047:
4827 : a4 56 __ LDY T2 + 0 
4829 : c4 43 __ CPY T5 + 0 
482b : 90 e2 __ BCC $480f ; (rotate_demo.s69 + 0)
.s1111:
482d : 18 __ __ CLC
482e : 65 58 __ ADC T3 + 1 
4830 : 85 58 __ STA T3 + 1 
4832 : a9 00 __ LDA #$00
4834 : 85 1c __ STA ACCU + 1 
4836 : a4 43 __ LDY T5 + 0 
4838 : 91 57 __ STA (T3 + 0),y 
483a : a5 59 __ LDA T4 + 0 
483c : 85 1b __ STA ACCU + 0 
483e : a9 16 __ LDA #$16
4840 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4843 : 18 __ __ CLC
4844 : a9 00 __ LDA #$00
4846 : 65 05 __ ADC WORK + 2 
4848 : 85 57 __ STA T3 + 0 
484a : a9 57 __ LDA #$57
484c : 65 06 __ ADC WORK + 3 
484e : 85 58 __ STA T3 + 1 
4850 : a4 43 __ LDY T5 + 0 
4852 : f0 09 __ BEQ $485d ; (rotate_demo.s76 + 0)
.l1069:
4854 : 88 __ __ DEY
4855 : b1 57 __ LDA (T3 + 0),y 
4857 : c8 __ __ INY
4858 : 91 57 __ STA (T3 + 0),y 
485a : 88 __ __ DEY
485b : d0 f7 __ BNE $4854 ; (rotate_demo.l1069 + 0)
.s76:
485d : 84 56 __ STY T2 + 0 
485f : 98 __ __ TYA
4860 : 91 57 __ STA (T3 + 0),y 
4862 : ee 75 bf INC $bf75 ; (xbuf1 + 28)
4865 : ee 75 bf INC $bf75 ; (xbuf1 + 28)
4868 : a5 59 __ LDA T4 + 0 
486a : 0a __ __ ASL
486b : aa __ __ TAX
486c : 98 __ __ TYA
486d : 2a __ __ ROL
486e : a8 __ __ TAY
486f : 8a __ __ TXA
4870 : 18 __ __ CLC
4871 : 65 59 __ ADC T4 + 0 
4873 : 90 01 __ BCC $4876 ; (rotate_demo.s1159 + 0)
.s1158:
4875 : c8 __ __ INY
.s1159:
4876 : 18 __ __ CLC
4877 : 69 00 __ ADC #$00
4879 : 85 57 __ STA T3 + 0 
487b : 98 __ __ TYA
487c : 69 57 __ ADC #$57
487e : 85 58 __ STA T3 + 1 
4880 : 4c 8b 48 JMP $488b ; (rotate_demo.l81 + 0)
.s82:
4883 : c8 __ __ INY
4884 : b1 57 __ LDA (T3 + 0),y 
4886 : 88 __ __ DEY
4887 : 91 57 __ STA (T3 + 0),y 
4889 : e6 56 __ INC T2 + 0 
.l81:
488b : ad 70 52 LDA $5270 ; (vdc_state + 7)
488e : 85 59 __ STA T4 + 0 
4890 : 38 __ __ SEC
4891 : e9 01 __ SBC #$01
4893 : 85 43 __ STA T5 + 0 
4895 : a9 00 __ LDA #$00
4897 : e9 00 __ SBC #$00
4899 : 30 06 __ BMI $48a1 ; (rotate_demo.s1113 + 0)
.s1044:
489b : a4 56 __ LDY T2 + 0 
489d : c4 43 __ CPY T5 + 0 
489f : 90 e2 __ BCC $4883 ; (rotate_demo.s82 + 0)
.s1113:
48a1 : 18 __ __ CLC
48a2 : 65 58 __ ADC T3 + 1 
48a4 : 85 58 __ STA T3 + 1 
48a6 : a9 00 __ LDA #$00
48a8 : 85 1c __ STA ACCU + 1 
48aa : a4 43 __ LDY T5 + 0 
48ac : 91 57 __ STA (T3 + 0),y 
48ae : a5 59 __ LDA T4 + 0 
48b0 : 85 1b __ STA ACCU + 0 
48b2 : a9 15 __ LDA #$15
48b4 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
48b7 : 18 __ __ CLC
48b8 : a9 00 __ LDA #$00
48ba : 65 05 __ ADC WORK + 2 
48bc : 85 57 __ STA T3 + 0 
48be : a9 57 __ LDA #$57
48c0 : 65 06 __ ADC WORK + 3 
48c2 : 85 58 __ STA T3 + 1 
48c4 : a4 43 __ LDY T5 + 0 
48c6 : f0 09 __ BEQ $48d1 ; (rotate_demo.s89 + 0)
.l1071:
48c8 : 88 __ __ DEY
48c9 : b1 57 __ LDA (T3 + 0),y 
48cb : c8 __ __ INY
48cc : 91 57 __ STA (T3 + 0),y 
48ce : 88 __ __ DEY
48cf : d0 f7 __ BNE $48c8 ; (rotate_demo.l1071 + 0)
.s89:
48d1 : 84 56 __ STY T2 + 0 
48d3 : 98 __ __ TYA
48d4 : 91 57 __ STA (T3 + 0),y 
48d6 : ee 74 bf INC $bf74 ; (xbuf1 + 27)
48d9 : a5 59 __ LDA T4 + 0 
48db : 0a __ __ ASL
48dc : 85 57 __ STA T3 + 0 
48de : 98 __ __ TYA
48df : 2a __ __ ROL
48e0 : 06 57 __ ASL T3 + 0 
48e2 : 2a __ __ ROL
48e3 : aa __ __ TAX
48e4 : 18 __ __ CLC
48e5 : a9 00 __ LDA #$00
48e7 : 65 57 __ ADC T3 + 0 
48e9 : 85 57 __ STA T3 + 0 
48eb : 8a __ __ TXA
48ec : 69 57 __ ADC #$57
48ee : 85 58 __ STA T3 + 1 
48f0 : 4c fb 48 JMP $48fb ; (rotate_demo.l94 + 0)
.s95:
48f3 : c8 __ __ INY
48f4 : b1 57 __ LDA (T3 + 0),y 
48f6 : 88 __ __ DEY
48f7 : 91 57 __ STA (T3 + 0),y 
48f9 : e6 56 __ INC T2 + 0 
.l94:
48fb : ad 70 52 LDA $5270 ; (vdc_state + 7)
48fe : 85 59 __ STA T4 + 0 
4900 : 38 __ __ SEC
4901 : e9 01 __ SBC #$01
4903 : 85 43 __ STA T5 + 0 
4905 : a9 00 __ LDA #$00
4907 : e9 00 __ SBC #$00
4909 : 30 06 __ BMI $4911 ; (rotate_demo.s1115 + 0)
.s1041:
490b : a4 56 __ LDY T2 + 0 
490d : c4 43 __ CPY T5 + 0 
490f : 90 e2 __ BCC $48f3 ; (rotate_demo.s95 + 0)
.s1115:
4911 : 18 __ __ CLC
4912 : 65 58 __ ADC T3 + 1 
4914 : 85 58 __ STA T3 + 1 
4916 : a9 00 __ LDA #$00
4918 : a4 43 __ LDY T5 + 0 
491a : 91 57 __ STA (T3 + 0),y 
491c : a5 59 __ LDA T4 + 0 
491e : 0a __ __ ASL
491f : 85 1b __ STA ACCU + 0 
4921 : a9 00 __ LDA #$00
4923 : 2a __ __ ROL
4924 : 06 1b __ ASL ACCU + 0 
4926 : 2a __ __ ROL
4927 : aa __ __ TAX
4928 : a5 1b __ LDA ACCU + 0 
492a : 65 59 __ ADC T4 + 0 
492c : 85 57 __ STA T3 + 0 
492e : 8a __ __ TXA
492f : 69 00 __ ADC #$00
4931 : 06 57 __ ASL T3 + 0 
4933 : 2a __ __ ROL
4934 : 06 57 __ ASL T3 + 0 
4936 : 2a __ __ ROL
4937 : aa __ __ TAX
4938 : 18 __ __ CLC
4939 : a9 00 __ LDA #$00
493b : 65 57 __ ADC T3 + 0 
493d : 85 57 __ STA T3 + 0 
493f : 8a __ __ TXA
4940 : 69 57 __ ADC #$57
4942 : 85 58 __ STA T3 + 1 
4944 : 98 __ __ TYA
4945 : f0 09 __ BEQ $4950 ; (rotate_demo.s102 + 0)
.l1073:
4947 : 88 __ __ DEY
4948 : b1 57 __ LDA (T3 + 0),y 
494a : c8 __ __ INY
494b : 91 57 __ STA (T3 + 0),y 
494d : 88 __ __ DEY
494e : d0 f7 __ BNE $4947 ; (rotate_demo.l1073 + 0)
.s102:
4950 : a9 00 __ LDA #$00
4952 : 85 56 __ STA T2 + 0 
4954 : a8 __ __ TAY
4955 : 91 57 __ STA (T3 + 0),y 
4957 : a5 59 __ LDA T4 + 0 
4959 : 0a __ __ ASL
495a : 85 1b __ STA ACCU + 0 
495c : 98 __ __ TYA
495d : 2a __ __ ROL
495e : 06 1b __ ASL ACCU + 0 
4960 : 2a __ __ ROL
4961 : aa __ __ TAX
4962 : 18 __ __ CLC
4963 : a5 1b __ LDA ACCU + 0 
4965 : 65 59 __ ADC T4 + 0 
4967 : 90 01 __ BCC $496a ; (rotate_demo.s1161 + 0)
.s1160:
4969 : e8 __ __ INX
.s1161:
496a : 18 __ __ CLC
496b : 69 00 __ ADC #$00
496d : 85 57 __ STA T3 + 0 
496f : 8a __ __ TXA
4970 : 69 57 __ ADC #$57
4972 : 85 58 __ STA T3 + 1 
4974 : 4c 7f 49 JMP $497f ; (rotate_demo.l107 + 0)
.s108:
4977 : c8 __ __ INY
4978 : b1 57 __ LDA (T3 + 0),y 
497a : 88 __ __ DEY
497b : 91 57 __ STA (T3 + 0),y 
497d : e6 56 __ INC T2 + 0 
.l107:
497f : ad 70 52 LDA $5270 ; (vdc_state + 7)
4982 : 85 59 __ STA T4 + 0 
4984 : 38 __ __ SEC
4985 : e9 01 __ SBC #$01
4987 : 85 43 __ STA T5 + 0 
4989 : a9 00 __ LDA #$00
498b : e9 00 __ SBC #$00
498d : 30 06 __ BMI $4995 ; (rotate_demo.s1117 + 0)
.s1038:
498f : a4 56 __ LDY T2 + 0 
4991 : c4 43 __ CPY T5 + 0 
4993 : 90 e2 __ BCC $4977 ; (rotate_demo.s108 + 0)
.s1117:
4995 : 18 __ __ CLC
4996 : 65 58 __ ADC T3 + 1 
4998 : 85 58 __ STA T3 + 1 
499a : a9 00 __ LDA #$00
499c : 85 1c __ STA ACCU + 1 
499e : a4 43 __ LDY T5 + 0 
49a0 : 91 57 __ STA (T3 + 0),y 
49a2 : a5 59 __ LDA T4 + 0 
49a4 : 85 1b __ STA ACCU + 0 
49a6 : a9 13 __ LDA #$13
49a8 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
49ab : 18 __ __ CLC
49ac : a9 00 __ LDA #$00
49ae : 65 05 __ ADC WORK + 2 
49b0 : 85 57 __ STA T3 + 0 
49b2 : a9 57 __ LDA #$57
49b4 : 65 06 __ ADC WORK + 3 
49b6 : 85 58 __ STA T3 + 1 
49b8 : a4 43 __ LDY T5 + 0 
49ba : f0 09 __ BEQ $49c5 ; (rotate_demo.s115 + 0)
.l1075:
49bc : 88 __ __ DEY
49bd : b1 57 __ LDA (T3 + 0),y 
49bf : c8 __ __ INY
49c0 : 91 57 __ STA (T3 + 0),y 
49c2 : 88 __ __ DEY
49c3 : d0 f7 __ BNE $49bc ; (rotate_demo.l1075 + 0)
.s115:
49c5 : 98 __ __ TYA
49c6 : 91 57 __ STA (T3 + 0),y 
49c8 : ad 72 bf LDA $bf72 ; (xbuf1 + 25)
49cb : 18 __ __ CLC
49cc : 69 06 __ ADC #$06
49ce : 8d 72 bf STA $bf72 ; (xbuf1 + 25)
49d1 : c9 07 __ CMP #$07
49d3 : b0 03 __ BCS $49d8 ; (rotate_demo.s116 + 0)
49d5 : 4c 64 4a JMP $4a64 ; (rotate_demo.s118 + 0)
.s116:
49d8 : 84 56 __ STY T2 + 0 
49da : e9 07 __ SBC #$07
49dc : 8d 72 bf STA $bf72 ; (xbuf1 + 25)
49df : a5 59 __ LDA T4 + 0 
49e1 : 0a __ __ ASL
49e2 : aa __ __ TAX
49e3 : 98 __ __ TYA
49e4 : 2a __ __ ROL
49e5 : a8 __ __ TAY
49e6 : 8a __ __ TXA
49e7 : 18 __ __ CLC
49e8 : 65 59 __ ADC T4 + 0 
49ea : 85 57 __ STA T3 + 0 
49ec : 98 __ __ TYA
49ed : 69 00 __ ADC #$00
49ef : 06 57 __ ASL T3 + 0 
49f1 : 2a __ __ ROL
49f2 : aa __ __ TAX
49f3 : 18 __ __ CLC
49f4 : a9 00 __ LDA #$00
49f6 : 65 57 __ ADC T3 + 0 
49f8 : 85 57 __ STA T3 + 0 
49fa : 8a __ __ TXA
49fb : 69 57 __ ADC #$57
49fd : 85 58 __ STA T3 + 1 
49ff : 4c 0a 4a JMP $4a0a ; (rotate_demo.l120 + 0)
.s121:
4a02 : c8 __ __ INY
4a03 : b1 57 __ LDA (T3 + 0),y 
4a05 : 88 __ __ DEY
4a06 : 91 57 __ STA (T3 + 0),y 
4a08 : e6 56 __ INC T2 + 0 
.l120:
4a0a : ad 70 52 LDA $5270 ; (vdc_state + 7)
4a0d : 85 59 __ STA T4 + 0 
4a0f : 38 __ __ SEC
4a10 : e9 01 __ SBC #$01
4a12 : 85 43 __ STA T5 + 0 
4a14 : a9 00 __ LDA #$00
4a16 : e9 00 __ SBC #$00
4a18 : 30 06 __ BMI $4a20 ; (rotate_demo.s1129 + 0)
.s1033:
4a1a : a4 56 __ LDY T2 + 0 
4a1c : c4 43 __ CPY T5 + 0 
4a1e : 90 e2 __ BCC $4a02 ; (rotate_demo.s121 + 0)
.s1129:
4a20 : 18 __ __ CLC
4a21 : 65 58 __ ADC T3 + 1 
4a23 : 85 58 __ STA T3 + 1 
4a25 : a9 00 __ LDA #$00
4a27 : a4 43 __ LDY T5 + 0 
4a29 : 91 57 __ STA (T3 + 0),y 
4a2b : a5 59 __ LDA T4 + 0 
4a2d : 0a __ __ ASL
4a2e : 85 1b __ STA ACCU + 0 
4a30 : a9 00 __ LDA #$00
4a32 : 2a __ __ ROL
4a33 : 06 1b __ ASL ACCU + 0 
4a35 : 2a __ __ ROL
4a36 : 06 1b __ ASL ACCU + 0 
4a38 : 2a __ __ ROL
4a39 : aa __ __ TAX
4a3a : a5 1b __ LDA ACCU + 0 
4a3c : 65 59 __ ADC T4 + 0 
4a3e : 85 57 __ STA T3 + 0 
4a40 : 8a __ __ TXA
4a41 : 69 00 __ ADC #$00
4a43 : 06 57 __ ASL T3 + 0 
4a45 : 2a __ __ ROL
4a46 : aa __ __ TAX
4a47 : 18 __ __ CLC
4a48 : a9 00 __ LDA #$00
4a4a : 65 57 __ ADC T3 + 0 
4a4c : 85 57 __ STA T3 + 0 
4a4e : 8a __ __ TXA
4a4f : 69 57 __ ADC #$57
4a51 : 85 58 __ STA T3 + 1 
4a53 : 98 __ __ TYA
4a54 : f0 09 __ BEQ $4a5f ; (rotate_demo.s128 + 0)
.l1089:
4a56 : 88 __ __ DEY
4a57 : b1 57 __ LDA (T3 + 0),y 
4a59 : c8 __ __ INY
4a5a : 91 57 __ STA (T3 + 0),y 
4a5c : 88 __ __ DEY
4a5d : d0 f7 __ BNE $4a56 ; (rotate_demo.l1089 + 0)
.s128:
4a5f : a9 00 __ LDA #$00
4a61 : a8 __ __ TAY
4a62 : 91 57 __ STA (T3 + 0),y 
.s118:
4a64 : ad 71 bf LDA $bf71 ; (xbuf1 + 24)
4a67 : 18 __ __ CLC
4a68 : 69 05 __ ADC #$05
4a6a : 8d 71 bf STA $bf71 ; (xbuf1 + 24)
4a6d : c9 07 __ CMP #$07
4a6f : 90 79 __ BCC $4aea ; (rotate_demo.s131 + 0)
.s129:
4a71 : 84 56 __ STY T2 + 0 
4a73 : e9 07 __ SBC #$07
4a75 : 8d 71 bf STA $bf71 ; (xbuf1 + 24)
4a78 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4a7b : 0a __ __ ASL
4a7c : 85 1b __ STA ACCU + 0 
4a7e : 98 __ __ TYA
4a7f : 2a __ __ ROL
4a80 : 06 1b __ ASL ACCU + 0 
4a82 : 2a __ __ ROL
4a83 : 06 1b __ ASL ACCU + 0 
4a85 : 2a __ __ ROL
4a86 : aa __ __ TAX
4a87 : 38 __ __ SEC
4a88 : a5 1b __ LDA ACCU + 0 
4a8a : ed 70 52 SBC $5270 ; (vdc_state + 7)
4a8d : b0 01 __ BCS $4a90 ; (rotate_demo.s1167 + 0)
.s1166:
4a8f : ca __ __ DEX
.s1167:
4a90 : 18 __ __ CLC
4a91 : 69 00 __ ADC #$00
4a93 : 85 57 __ STA T3 + 0 
4a95 : 8a __ __ TXA
4a96 : 69 57 __ ADC #$57
4a98 : 85 58 __ STA T3 + 1 
4a9a : 4c a5 4a JMP $4aa5 ; (rotate_demo.l133 + 0)
.s134:
4a9d : c8 __ __ INY
4a9e : b1 57 __ LDA (T3 + 0),y 
4aa0 : 88 __ __ DEY
4aa1 : 91 57 __ STA (T3 + 0),y 
4aa3 : e6 56 __ INC T2 + 0 
.l133:
4aa5 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4aa8 : 85 1b __ STA ACCU + 0 
4aaa : 38 __ __ SEC
4aab : e9 01 __ SBC #$01
4aad : 85 43 __ STA T5 + 0 
4aaf : a9 00 __ LDA #$00
4ab1 : e9 00 __ SBC #$00
4ab3 : 30 06 __ BMI $4abb ; (rotate_demo.s1127 + 0)
.s1028:
4ab5 : a4 56 __ LDY T2 + 0 
4ab7 : c4 43 __ CPY T5 + 0 
4ab9 : 90 e2 __ BCC $4a9d ; (rotate_demo.s134 + 0)
.s1127:
4abb : 18 __ __ CLC
4abc : 65 58 __ ADC T3 + 1 
4abe : 85 58 __ STA T3 + 1 
4ac0 : a9 00 __ LDA #$00
4ac2 : 85 1c __ STA ACCU + 1 
4ac4 : a4 43 __ LDY T5 + 0 
4ac6 : 91 57 __ STA (T3 + 0),y 
4ac8 : a9 11 __ LDA #$11
4aca : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4acd : 18 __ __ CLC
4ace : a9 00 __ LDA #$00
4ad0 : 65 05 __ ADC WORK + 2 
4ad2 : 85 57 __ STA T3 + 0 
4ad4 : a9 57 __ LDA #$57
4ad6 : 65 06 __ ADC WORK + 3 
4ad8 : 85 58 __ STA T3 + 1 
4ada : a4 43 __ LDY T5 + 0 
4adc : f0 09 __ BEQ $4ae7 ; (rotate_demo.s141 + 0)
.l1087:
4ade : 88 __ __ DEY
4adf : b1 57 __ LDA (T3 + 0),y 
4ae1 : c8 __ __ INY
4ae2 : 91 57 __ STA (T3 + 0),y 
4ae4 : 88 __ __ DEY
4ae5 : d0 f7 __ BNE $4ade ; (rotate_demo.l1087 + 0)
.s141:
4ae7 : 98 __ __ TYA
4ae8 : 91 57 __ STA (T3 + 0),y 
.s131:
4aea : ad 70 bf LDA $bf70 ; (xbuf1 + 23)
4aed : 18 __ __ CLC
4aee : 69 04 __ ADC #$04
4af0 : 8d 70 bf STA $bf70 ; (xbuf1 + 23)
4af3 : c9 07 __ CMP #$07
4af5 : 90 76 __ BCC $4b6d ; (rotate_demo.s144 + 0)
.s142:
4af7 : 84 56 __ STY T2 + 0 
4af9 : e9 07 __ SBC #$07
4afb : 8d 70 bf STA $bf70 ; (xbuf1 + 23)
4afe : ad 70 52 LDA $5270 ; (vdc_state + 7)
4b01 : 0a __ __ ASL
4b02 : 85 57 __ STA T3 + 0 
4b04 : 98 __ __ TYA
4b05 : 2a __ __ ROL
4b06 : 06 57 __ ASL T3 + 0 
4b08 : 2a __ __ ROL
4b09 : 06 57 __ ASL T3 + 0 
4b0b : 2a __ __ ROL
4b0c : aa __ __ TAX
4b0d : 18 __ __ CLC
4b0e : a9 00 __ LDA #$00
4b10 : 65 57 __ ADC T3 + 0 
4b12 : 85 57 __ STA T3 + 0 
4b14 : 8a __ __ TXA
4b15 : 69 57 __ ADC #$57
4b17 : 85 58 __ STA T3 + 1 
4b19 : 4c 24 4b JMP $4b24 ; (rotate_demo.l146 + 0)
.s147:
4b1c : c8 __ __ INY
4b1d : b1 57 __ LDA (T3 + 0),y 
4b1f : 88 __ __ DEY
4b20 : 91 57 __ STA (T3 + 0),y 
4b22 : e6 56 __ INC T2 + 0 
.l146:
4b24 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4b27 : aa __ __ TAX
4b28 : 38 __ __ SEC
4b29 : e9 01 __ SBC #$01
4b2b : 85 43 __ STA T5 + 0 
4b2d : a9 00 __ LDA #$00
4b2f : e9 00 __ SBC #$00
4b31 : 30 06 __ BMI $4b39 ; (rotate_demo.s1125 + 0)
.s1023:
4b33 : a4 56 __ LDY T2 + 0 
4b35 : c4 43 __ CPY T5 + 0 
4b37 : 90 e3 __ BCC $4b1c ; (rotate_demo.s147 + 0)
.s1125:
4b39 : 18 __ __ CLC
4b3a : 65 58 __ ADC T3 + 1 
4b3c : 85 58 __ STA T3 + 1 
4b3e : a9 00 __ LDA #$00
4b40 : a4 43 __ LDY T5 + 0 
4b42 : 91 57 __ STA (T3 + 0),y 
4b44 : 8a __ __ TXA
4b45 : 0a __ __ ASL
4b46 : 2a __ __ ROL
4b47 : 2a __ __ ROL
4b48 : 2a __ __ ROL
4b49 : aa __ __ TAX
4b4a : 29 07 __ AND #$07
4b4c : 2a __ __ ROL
4b4d : 85 58 __ STA T3 + 1 
4b4f : 8a __ __ TXA
4b50 : 29 f0 __ AND #$f0
4b52 : 69 00 __ ADC #$00
4b54 : 85 57 __ STA T3 + 0 
4b56 : a9 57 __ LDA #$57
4b58 : 65 58 __ ADC T3 + 1 
4b5a : 85 58 __ STA T3 + 1 
4b5c : 98 __ __ TYA
4b5d : f0 09 __ BEQ $4b68 ; (rotate_demo.s154 + 0)
.l1085:
4b5f : 88 __ __ DEY
4b60 : b1 57 __ LDA (T3 + 0),y 
4b62 : c8 __ __ INY
4b63 : 91 57 __ STA (T3 + 0),y 
4b65 : 88 __ __ DEY
4b66 : d0 f7 __ BNE $4b5f ; (rotate_demo.l1085 + 0)
.s154:
4b68 : a9 00 __ LDA #$00
4b6a : a8 __ __ TAY
4b6b : 91 57 __ STA (T3 + 0),y 
.s144:
4b6d : ad 6f bf LDA $bf6f ; (xbuf1 + 22)
4b70 : 18 __ __ CLC
4b71 : 69 03 __ ADC #$03
4b73 : 8d 6f bf STA $bf6f ; (xbuf1 + 22)
4b76 : c9 07 __ CMP #$07
4b78 : 90 79 __ BCC $4bf3 ; (rotate_demo.s157 + 0)
.s155:
4b7a : 84 56 __ STY T2 + 0 
4b7c : e9 07 __ SBC #$07
4b7e : 8d 6f bf STA $bf6f ; (xbuf1 + 22)
4b81 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4b84 : 0a __ __ ASL
4b85 : 85 1b __ STA ACCU + 0 
4b87 : 98 __ __ TYA
4b88 : 2a __ __ ROL
4b89 : 06 1b __ ASL ACCU + 0 
4b8b : 2a __ __ ROL
4b8c : 06 1b __ ASL ACCU + 0 
4b8e : 2a __ __ ROL
4b8f : aa __ __ TAX
4b90 : 18 __ __ CLC
4b91 : a5 1b __ LDA ACCU + 0 
4b93 : 6d 70 52 ADC $5270 ; (vdc_state + 7)
4b96 : 90 01 __ BCC $4b99 ; (rotate_demo.s1165 + 0)
.s1164:
4b98 : e8 __ __ INX
.s1165:
4b99 : 18 __ __ CLC
4b9a : 69 00 __ ADC #$00
4b9c : 85 57 __ STA T3 + 0 
4b9e : 8a __ __ TXA
4b9f : 69 57 __ ADC #$57
4ba1 : 85 58 __ STA T3 + 1 
4ba3 : 4c ae 4b JMP $4bae ; (rotate_demo.l159 + 0)
.s160:
4ba6 : c8 __ __ INY
4ba7 : b1 57 __ LDA (T3 + 0),y 
4ba9 : 88 __ __ DEY
4baa : 91 57 __ STA (T3 + 0),y 
4bac : e6 56 __ INC T2 + 0 
.l159:
4bae : ad 70 52 LDA $5270 ; (vdc_state + 7)
4bb1 : 85 1b __ STA ACCU + 0 
4bb3 : 38 __ __ SEC
4bb4 : e9 01 __ SBC #$01
4bb6 : 85 43 __ STA T5 + 0 
4bb8 : a9 00 __ LDA #$00
4bba : e9 00 __ SBC #$00
4bbc : 30 06 __ BMI $4bc4 ; (rotate_demo.s1123 + 0)
.s1018:
4bbe : a4 56 __ LDY T2 + 0 
4bc0 : c4 43 __ CPY T5 + 0 
4bc2 : 90 e2 __ BCC $4ba6 ; (rotate_demo.s160 + 0)
.s1123:
4bc4 : 18 __ __ CLC
4bc5 : 65 58 __ ADC T3 + 1 
4bc7 : 85 58 __ STA T3 + 1 
4bc9 : a9 00 __ LDA #$00
4bcb : 85 1c __ STA ACCU + 1 
4bcd : a4 43 __ LDY T5 + 0 
4bcf : 91 57 __ STA (T3 + 0),y 
4bd1 : a9 0f __ LDA #$0f
4bd3 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4bd6 : 18 __ __ CLC
4bd7 : a9 00 __ LDA #$00
4bd9 : 65 05 __ ADC WORK + 2 
4bdb : 85 57 __ STA T3 + 0 
4bdd : a9 57 __ LDA #$57
4bdf : 65 06 __ ADC WORK + 3 
4be1 : 85 58 __ STA T3 + 1 
4be3 : a4 43 __ LDY T5 + 0 
4be5 : f0 09 __ BEQ $4bf0 ; (rotate_demo.s167 + 0)
.l1083:
4be7 : 88 __ __ DEY
4be8 : b1 57 __ LDA (T3 + 0),y 
4bea : c8 __ __ INY
4beb : 91 57 __ STA (T3 + 0),y 
4bed : 88 __ __ DEY
4bee : d0 f7 __ BNE $4be7 ; (rotate_demo.l1083 + 0)
.s167:
4bf0 : 98 __ __ TYA
4bf1 : 91 57 __ STA (T3 + 0),y 
.s157:
4bf3 : ad 6e bf LDA $bf6e ; (xbuf1 + 21)
4bf6 : 18 __ __ CLC
4bf7 : 69 02 __ ADC #$02
4bf9 : 8d 6e bf STA $bf6e ; (xbuf1 + 21)
4bfc : c9 07 __ CMP #$07
4bfe : b0 03 __ BCS $4c03 ; (rotate_demo.s168 + 0)
4c00 : 4c 97 4c JMP $4c97 ; (rotate_demo.s170 + 0)
.s168:
4c03 : 84 56 __ STY T2 + 0 
4c05 : e9 07 __ SBC #$07
4c07 : 8d 6e bf STA $bf6e ; (xbuf1 + 21)
4c0a : ad 70 52 LDA $5270 ; (vdc_state + 7)
4c0d : 0a __ __ ASL
4c0e : 85 1b __ STA ACCU + 0 
4c10 : 98 __ __ TYA
4c11 : 2a __ __ ROL
4c12 : 06 1b __ ASL ACCU + 0 
4c14 : 2a __ __ ROL
4c15 : aa __ __ TAX
4c16 : 18 __ __ CLC
4c17 : a5 1b __ LDA ACCU + 0 
4c19 : 6d 70 52 ADC $5270 ; (vdc_state + 7)
4c1c : 85 57 __ STA T3 + 0 
4c1e : 8a __ __ TXA
4c1f : 69 00 __ ADC #$00
4c21 : 06 57 __ ASL T3 + 0 
4c23 : 2a __ __ ROL
4c24 : aa __ __ TAX
4c25 : 18 __ __ CLC
4c26 : a9 00 __ LDA #$00
4c28 : 65 57 __ ADC T3 + 0 
4c2a : 85 57 __ STA T3 + 0 
4c2c : 8a __ __ TXA
4c2d : 69 57 __ ADC #$57
4c2f : 85 58 __ STA T3 + 1 
4c31 : 4c 3c 4c JMP $4c3c ; (rotate_demo.l172 + 0)
.s173:
4c34 : c8 __ __ INY
4c35 : b1 57 __ LDA (T3 + 0),y 
4c37 : 88 __ __ DEY
4c38 : 91 57 __ STA (T3 + 0),y 
4c3a : e6 56 __ INC T2 + 0 
.l172:
4c3c : ad 70 52 LDA $5270 ; (vdc_state + 7)
4c3f : 85 59 __ STA T4 + 0 
4c41 : 38 __ __ SEC
4c42 : e9 01 __ SBC #$01
4c44 : 85 43 __ STA T5 + 0 
4c46 : a9 00 __ LDA #$00
4c48 : e9 00 __ SBC #$00
4c4a : 30 06 __ BMI $4c52 ; (rotate_demo.s1121 + 0)
.s1013:
4c4c : a4 56 __ LDY T2 + 0 
4c4e : c4 43 __ CPY T5 + 0 
4c50 : 90 e2 __ BCC $4c34 ; (rotate_demo.s173 + 0)
.s1121:
4c52 : 18 __ __ CLC
4c53 : 65 58 __ ADC T3 + 1 
4c55 : 85 58 __ STA T3 + 1 
4c57 : a9 00 __ LDA #$00
4c59 : a4 43 __ LDY T5 + 0 
4c5b : 91 57 __ STA (T3 + 0),y 
4c5d : a5 59 __ LDA T4 + 0 
4c5f : 0a __ __ ASL
4c60 : 85 1b __ STA ACCU + 0 
4c62 : a9 00 __ LDA #$00
4c64 : 2a __ __ ROL
4c65 : 06 1b __ ASL ACCU + 0 
4c67 : 2a __ __ ROL
4c68 : 06 1b __ ASL ACCU + 0 
4c6a : 2a __ __ ROL
4c6b : aa __ __ TAX
4c6c : 38 __ __ SEC
4c6d : a5 1b __ LDA ACCU + 0 
4c6f : e5 59 __ SBC T4 + 0 
4c71 : 85 57 __ STA T3 + 0 
4c73 : 8a __ __ TXA
4c74 : e9 00 __ SBC #$00
4c76 : 06 57 __ ASL T3 + 0 
4c78 : 2a __ __ ROL
4c79 : aa __ __ TAX
4c7a : 18 __ __ CLC
4c7b : a9 00 __ LDA #$00
4c7d : 65 57 __ ADC T3 + 0 
4c7f : 85 57 __ STA T3 + 0 
4c81 : 8a __ __ TXA
4c82 : 69 57 __ ADC #$57
4c84 : 85 58 __ STA T3 + 1 
4c86 : 98 __ __ TYA
4c87 : f0 09 __ BEQ $4c92 ; (rotate_demo.s180 + 0)
.l1081:
4c89 : 88 __ __ DEY
4c8a : b1 57 __ LDA (T3 + 0),y 
4c8c : c8 __ __ INY
4c8d : 91 57 __ STA (T3 + 0),y 
4c8f : 88 __ __ DEY
4c90 : d0 f7 __ BNE $4c89 ; (rotate_demo.l1081 + 0)
.s180:
4c92 : a9 00 __ LDA #$00
4c94 : a8 __ __ TAY
4c95 : 91 57 __ STA (T3 + 0),y 
.s170:
4c97 : ee 6d bf INC $bf6d ; (xbuf1 + 20)
4c9a : ad 6d bf LDA $bf6d ; (xbuf1 + 20)
4c9d : c9 07 __ CMP #$07
4c9f : 90 70 __ BCC $4d11 ; (rotate_demo.s207 + 0)
.s181:
4ca1 : 84 56 __ STY T2 + 0 
4ca3 : 84 1c __ STY ACCU + 1 
4ca5 : e9 07 __ SBC #$07
4ca7 : 8d 6d bf STA $bf6d ; (xbuf1 + 20)
4caa : ad 70 52 LDA $5270 ; (vdc_state + 7)
4cad : 85 1b __ STA ACCU + 0 
4caf : a9 0b __ LDA #$0b
4cb1 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4cb4 : 18 __ __ CLC
4cb5 : a9 00 __ LDA #$00
4cb7 : 65 05 __ ADC WORK + 2 
4cb9 : 85 57 __ STA T3 + 0 
4cbb : a9 57 __ LDA #$57
4cbd : 65 06 __ ADC WORK + 3 
4cbf : 85 58 __ STA T3 + 1 
4cc1 : 4c cc 4c JMP $4ccc ; (rotate_demo.l185 + 0)
.s186:
4cc4 : c8 __ __ INY
4cc5 : b1 57 __ LDA (T3 + 0),y 
4cc7 : 88 __ __ DEY
4cc8 : 91 57 __ STA (T3 + 0),y 
4cca : e6 56 __ INC T2 + 0 
.l185:
4ccc : ad 70 52 LDA $5270 ; (vdc_state + 7)
4ccf : 85 1b __ STA ACCU + 0 
4cd1 : 38 __ __ SEC
4cd2 : e9 01 __ SBC #$01
4cd4 : 85 43 __ STA T5 + 0 
4cd6 : a9 00 __ LDA #$00
4cd8 : e9 00 __ SBC #$00
4cda : 30 06 __ BMI $4ce2 ; (rotate_demo.s1119 + 0)
.s1008:
4cdc : a4 56 __ LDY T2 + 0 
4cde : c4 43 __ CPY T5 + 0 
4ce0 : 90 e2 __ BCC $4cc4 ; (rotate_demo.s186 + 0)
.s1119:
4ce2 : 18 __ __ CLC
4ce3 : 65 58 __ ADC T3 + 1 
4ce5 : 85 58 __ STA T3 + 1 
4ce7 : a9 00 __ LDA #$00
4ce9 : 85 1c __ STA ACCU + 1 
4ceb : a4 43 __ LDY T5 + 0 
4ced : 91 57 __ STA (T3 + 0),y 
4cef : a9 0d __ LDA #$0d
4cf1 : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4cf4 : 18 __ __ CLC
4cf5 : a9 00 __ LDA #$00
4cf7 : 65 05 __ ADC WORK + 2 
4cf9 : 85 57 __ STA T3 + 0 
4cfb : a9 57 __ LDA #$57
4cfd : 65 06 __ ADC WORK + 3 
4cff : 85 58 __ STA T3 + 1 
4d01 : a4 43 __ LDY T5 + 0 
4d03 : f0 09 __ BEQ $4d0e ; (rotate_demo.s193 + 0)
.l1079:
4d05 : 88 __ __ DEY
4d06 : b1 57 __ LDA (T3 + 0),y 
4d08 : c8 __ __ INY
4d09 : 91 57 __ STA (T3 + 0),y 
4d0b : 88 __ __ DEY
4d0c : d0 f7 __ BNE $4d05 ; (rotate_demo.l1079 + 0)
.s193:
4d0e : 98 __ __ TYA
4d0f : 91 57 __ STA (T3 + 0),y 
.s207:
4d11 : 84 1c __ STY ACCU + 1 
4d13 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4d16 : 0a __ __ ASL
4d17 : 26 1c __ ROL ACCU + 1 
4d19 : 18 __ __ CLC
4d1a : 6d 70 52 ADC $5270 ; (vdc_state + 7)
4d1d : 85 57 __ STA T3 + 0 
4d1f : a5 1c __ LDA ACCU + 1 
4d21 : 69 00 __ ADC #$00
4d23 : 06 57 __ ASL T3 + 0 
4d25 : 2a __ __ ROL
4d26 : 06 57 __ ASL T3 + 0 
4d28 : 2a __ __ ROL
4d29 : aa __ __ TAX
4d2a : 18 __ __ CLC
4d2b : a9 00 __ LDA #$00
4d2d : 65 57 __ ADC T3 + 0 
4d2f : 85 57 __ STA T3 + 0 
4d31 : 8a __ __ TXA
4d32 : 69 57 __ ADC #$57
4d34 : 85 58 __ STA T3 + 1 
4d36 : 18 __ __ CLC
.l1156:
4d37 : 98 __ __ TYA
4d38 : 65 53 __ ADC T0 + 0 
4d3a : 4a __ __ LSR
4d3b : 4a __ __ LSR
4d3c : 29 1f __ AND #$1f
4d3e : aa __ __ TAX
4d3f : bd 39 52 LDA $5239,x ; (colors + 0)
4d42 : 91 57 __ STA (T3 + 0),y 
4d44 : c8 __ __ INY
4d45 : c0 28 __ CPY #$28
4d47 : 90 ee __ BCC $4d37 ; (rotate_demo.l1156 + 0)
.s1078:
4d49 : ad 77 52 LDA $5277 ; (vdc_state + 14)
4d4c : 85 0d __ STA P0 
4d4e : ad 78 52 LDA $5278 ; (vdc_state + 15)
4d51 : 85 0e __ STA P1 
4d53 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
4d56 : e6 53 __ INC T0 + 0 
4d58 : a9 00 __ LDA #$00
4d5a : 85 57 __ STA T3 + 0 
4d5c : a9 57 __ LDA #$57
4d5e : 85 58 __ STA T3 + 1 
.l199:
4d60 : a0 00 __ LDY #$00
4d62 : b1 57 __ LDA (T3 + 0),y 
.l977:
4d64 : 2c 00 d6 BIT $d600 
4d67 : 10 fb __ BPL $4d64 ; (rotate_demo.l977 + 0)
.s204:
4d69 : 8d 01 d6 STA $d601 
4d6c : e6 57 __ INC T3 + 0 
4d6e : d0 02 __ BNE $4d72 ; (rotate_demo.s1163 + 0)
.s1162:
4d70 : e6 58 __ INC T3 + 1 
.s1163:
4d72 : a5 57 __ LDA T3 + 0 
4d74 : c9 d0 __ CMP #$d0
4d76 : d0 e8 __ BNE $4d60 ; (rotate_demo.l199 + 0)
.s1002:
4d78 : a5 58 __ LDA T3 + 1 
4d7a : c9 5e __ CMP #$5e
4d7c : d0 e2 __ BNE $4d60 ; (rotate_demo.l199 + 0)
.s201:
4d7e : 20 e4 ff JSR $ffe4 
4d81 : 09 00 __ ORA #$00
4d83 : d0 03 __ BNE $4d88 ; (rotate_demo.s1001 + 0)
4d85 : 4c e1 46 JMP $46e1 ; (rotate_demo.l12 + 0)
.s1001:
4d88 : a2 06 __ LDX #$06
4d8a : bd 65 bf LDA $bf65,x ; (xbuf1 + 12)
4d8d : 95 53 __ STA T0 + 0,x 
4d8f : ca __ __ DEX
4d90 : 10 f8 __ BPL $4d8a ; (rotate_demo.s1001 + 2)
4d92 : 60 __ __ RTS
--------------------------------------------------------------------
init_rotate: ; init_rotate(u8)->void
.s1000:
4d93 : a2 03 __ LDX #$03
4d95 : b5 53 __ LDA T0 + 0,x 
4d97 : 9d a1 bf STA $bfa1,x ; (xbuf1 + 72)
4d9a : ca __ __ DEX
4d9b : 10 f8 __ BPL $4d95 ; (init_rotate.s1000 + 2)
.s0:
4d9d : a9 00 __ LDA #$00
4d9f : 8d ff bf STA $bfff ; (sstack + 6)
4da2 : 8d a7 bf STA $bfa7 ; (xbuf1 + 78)
4da5 : a9 06 __ LDA #$06
4da7 : 8d fe bf STA $bffe ; (sstack + 5)
4daa : a9 d4 __ LDA #$d4
4dac : 8d a8 bf STA $bfa8 ; (xbuf1 + 79)
4daf : 8d aa bf STA $bfaa ; (pattern + 3)
4db2 : 8d ac bf STA $bfac ; (pattern + 5)
4db5 : a9 aa __ LDA #$aa
4db7 : 8d a9 bf STA $bfa9 ; (pattern + 2)
4dba : 8d ab bf STA $bfab ; (pattern + 4)
4dbd : 8d ad bf STA $bfad ; (pattern + 6)
4dc0 : a9 ff __ LDA #$ff
4dc2 : 8d ae bf STA $bfae ; (pattern + 7)
4dc5 : 20 21 26 JSR $2621 ; (vdc_init.s1000 + 0)
4dc8 : ad 72 52 LDA $5272 ; (vdc_state + 9)
4dcb : f0 0e __ BEQ $4ddb ; (init_rotate.s1001 + 0)
.s3:
4dcd : ad 71 52 LDA $5271 ; (vdc_state + 8)
4dd0 : d0 14 __ BNE $4de6 ; (init_rotate.s39 + 0)
.s8:
4dd2 : a9 00 __ LDA #$00
4dd4 : 85 0f __ STA P2 
4dd6 : 85 10 __ STA P3 
4dd8 : 20 e8 32 JSR $32e8 ; (memset@proxy + 0)
.s1001:
4ddb : a2 03 __ LDX #$03
4ddd : bd a1 bf LDA $bfa1,x ; (xbuf1 + 72)
4de0 : 95 53 __ STA T0 + 0,x 
4de2 : ca __ __ DEX
4de3 : 10 f8 __ BPL $4ddd ; (init_rotate.s1001 + 2)
4de5 : 60 __ __ RTS
.s39:
4de6 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4de9 : 85 54 __ STA T1 + 0 
4deb : a9 00 __ LDA #$00
4ded : 85 53 __ STA T0 + 0 
4def : ac 75 52 LDY $5275 ; (vdc_state + 12)
4df2 : ae 76 52 LDX $5276 ; (vdc_state + 13)
.l6:
4df5 : a9 00 __ LDA #$00
4df7 : 85 55 __ STA T3 + 0 
.l10:
4df9 : 86 0e __ STX P1 
4dfb : 84 0d __ STY P0 
4dfd : a6 55 __ LDX T3 + 0 
4dff : bd a7 bf LDA $bfa7,x ; (xbuf1 + 78)
4e02 : 85 56 __ STA T5 + 0 
4e04 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
.l180:
4e07 : 2c 00 d6 BIT $d600 
4e0a : 10 fb __ BPL $4e07 ; (init_rotate.l180 + 0)
.s16:
4e0c : a5 56 __ LDA T5 + 0 
4e0e : 8d 01 d6 STA $d601 
4e11 : a2 18 __ LDX #$18
4e13 : 8e 00 d6 STX $d600 
.l182:
4e16 : 2c 00 d6 BIT $d600 
4e19 : 10 fb __ BPL $4e16 ; (init_rotate.l182 + 0)
.s22:
4e1b : ad 01 d6 LDA $d601 
4e1e : 29 7f __ AND #$7f
4e20 : 8e 00 d6 STX $d600 
.l184:
4e23 : 2c 00 d6 BIT $d600 
4e26 : 10 fb __ BPL $4e23 ; (init_rotate.l184 + 0)
.s28:
4e28 : 8d 01 d6 STA $d601 
4e2b : a9 1e __ LDA #$1e
4e2d : 8d 00 d6 STA $d600 
.l186:
4e30 : 2c 00 d6 BIT $d600 
4e33 : 10 fb __ BPL $4e30 ; (init_rotate.l186 + 0)
.s33:
4e35 : a5 54 __ LDA T1 + 0 
4e37 : 8d 01 d6 STA $d601 
4e3a : 18 __ __ CLC
4e3b : 65 0d __ ADC P0 
4e3d : a8 __ __ TAY
4e3e : a9 00 __ LDA #$00
4e40 : 65 0e __ ADC P1 
4e42 : e6 55 __ INC T3 + 0 
4e44 : aa __ __ TAX
4e45 : a5 55 __ LDA T3 + 0 
4e47 : c9 08 __ CMP #$08
4e49 : 90 ae __ BCC $4df9 ; (init_rotate.l10 + 0)
.s7:
4e4b : e6 53 __ INC T0 + 0 
4e4d : a5 53 __ LDA T0 + 0 
4e4f : cd 71 52 CMP $5271 ; (vdc_state + 8)
4e52 : 90 a1 __ BCC $4df5 ; (init_rotate.l6 + 0)
4e54 : 4c d2 4d JMP $4dd2 ; (init_rotate.s8 + 0)
--------------------------------------------------------------------
rotdown: ; rotdown(u8)->void
.s1000:
4e57 : 85 0d __ STA P0 ; (x + 0)
.s0:
4e59 : ad 71 52 LDA $5271 ; (vdc_state + 8)
4e5c : 38 __ __ SEC
4e5d : e9 01 __ SBC #$01
4e5f : 85 1b __ STA ACCU + 0 
4e61 : a9 00 __ LDA #$00
4e63 : e9 00 __ SBC #$00
4e65 : 85 1c __ STA ACCU + 1 
4e67 : ad 70 52 LDA $5270 ; (vdc_state + 7)
4e6a : 20 f0 4e JSR $4ef0 ; (mul16by8 + 0)
4e6d : 18 __ __ CLC
4e6e : a9 00 __ LDA #$00
4e70 : 65 05 __ ADC WORK + 2 
4e72 : aa __ __ TAX
4e73 : a9 57 __ LDA #$57
4e75 : 65 06 __ ADC WORK + 3 
4e77 : a8 __ __ TAY
4e78 : 8a __ __ TXA
4e79 : 18 __ __ CLC
4e7a : 65 0d __ ADC P0 ; (x + 0)
4e7c : 85 1b __ STA ACCU + 0 
4e7e : 90 01 __ BCC $4e81 ; (rotdown.s1006 + 0)
.s1005:
4e80 : c8 __ __ INY
.s1006:
4e81 : 84 1c __ STY ACCU + 1 
4e83 : a2 00 __ LDX #$00
4e85 : f0 0a __ BEQ $4e91 ; (rotdown.l1 + 0)
.s1008:
4e87 : a0 00 __ LDY #$00
4e89 : b1 1b __ LDA (ACCU + 0),y 
4e8b : ac 70 52 LDY $5270 ; (vdc_state + 7)
4e8e : 91 1b __ STA (ACCU + 0),y 
4e90 : e8 __ __ INX
.l1:
4e91 : ad 71 52 LDA $5271 ; (vdc_state + 8)
4e94 : 38 __ __ SEC
4e95 : e9 01 __ SBC #$01
4e97 : 90 14 __ BCC $4ead ; (rotdown.s4 + 0)
.s1002:
4e99 : 85 1d __ STA ACCU + 2 
4e9b : e4 1d __ CPX ACCU + 2 
4e9d : b0 0e __ BCS $4ead ; (rotdown.s4 + 0)
.s2:
4e9f : 38 __ __ SEC
4ea0 : a5 1b __ LDA ACCU + 0 
4ea2 : ed 70 52 SBC $5270 ; (vdc_state + 7)
4ea5 : 85 1b __ STA ACCU + 0 
4ea7 : b0 de __ BCS $4e87 ; (rotdown.s1008 + 0)
.s1007:
4ea9 : c6 1c __ DEC ACCU + 1 
4eab : 90 da __ BCC $4e87 ; (rotdown.s1008 + 0)
.s4:
4ead : a9 00 __ LDA #$00
4eaf : a8 __ __ TAY
4eb0 : 91 1b __ STA (ACCU + 0),y 
.s1001:
4eb2 : 60 __ __ RTS
--------------------------------------------------------------------
rotup: ; rotup(u8)->void
.s0:
4eb3 : 18 __ __ CLC
4eb4 : 69 00 __ ADC #$00
4eb6 : 85 1b __ STA ACCU + 0 
4eb8 : a9 57 __ LDA #$57
4eba : 69 00 __ ADC #$00
4ebc : a2 00 __ LDX #$00
4ebe : f0 1a __ BEQ $4eda ; (rotup.l1 + 0)
.s2:
4ec0 : a5 1b __ LDA ACCU + 0 
4ec2 : 6d 70 52 ADC $5270 ; (vdc_state + 7)
4ec5 : 85 43 __ STA T3 + 0 
4ec7 : a5 1c __ LDA ACCU + 1 
4ec9 : 69 00 __ ADC #$00
4ecb : 85 44 __ STA T3 + 1 
4ecd : a0 00 __ LDY #$00
4ecf : b1 43 __ LDA (T3 + 0),y 
4ed1 : 91 1b __ STA (ACCU + 0),y 
4ed3 : a5 43 __ LDA T3 + 0 
4ed5 : 85 1b __ STA ACCU + 0 
4ed7 : a5 44 __ LDA T3 + 1 
4ed9 : e8 __ __ INX
.l1:
4eda : 85 1c __ STA ACCU + 1 
4edc : ad 71 52 LDA $5271 ; (vdc_state + 8)
4edf : 38 __ __ SEC
4ee0 : e9 01 __ SBC #$01
4ee2 : 90 06 __ BCC $4eea ; (rotup.s4 + 0)
.s1002:
4ee4 : 85 43 __ STA T3 + 0 
4ee6 : e4 43 __ CPX T3 + 0 
4ee8 : 90 d6 __ BCC $4ec0 ; (rotup.s2 + 0)
.s4:
4eea : a9 00 __ LDA #$00
4eec : a8 __ __ TAY
4eed : 91 1b __ STA (ACCU + 0),y 
.s1001:
4eef : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
4ef0 : a0 00 __ LDY #$00
4ef2 : 84 06 __ STY WORK + 3 
4ef4 : 4a __ __ LSR
4ef5 : 90 0d __ BCC $4f04 ; (mul16by8 + 20)
4ef7 : aa __ __ TAX
4ef8 : 18 __ __ CLC
4ef9 : 98 __ __ TYA
4efa : 65 1b __ ADC ACCU + 0 
4efc : a8 __ __ TAY
4efd : a5 06 __ LDA WORK + 3 
4eff : 65 1c __ ADC ACCU + 1 
4f01 : 85 06 __ STA WORK + 3 
4f03 : 8a __ __ TXA
4f04 : 06 1b __ ASL ACCU + 0 
4f06 : 26 1c __ ROL ACCU + 1 
4f08 : 4a __ __ LSR
4f09 : b0 ec __ BCS $4ef7 ; (mul16by8 + 7)
4f0b : d0 f7 __ BNE $4f04 ; (mul16by8 + 20)
4f0d : 84 05 __ STY WORK + 2 
4f0f : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
4f10 : a0 00 __ LDY #$00
4f12 : 84 06 __ STY WORK + 3 
4f14 : a5 03 __ LDA WORK + 0 
4f16 : a6 04 __ LDX WORK + 1 
4f18 : f0 1c __ BEQ $4f36 ; (mul16 + 38)
4f1a : 38 __ __ SEC
4f1b : 6a __ __ ROR
4f1c : 90 0d __ BCC $4f2b ; (mul16 + 27)
4f1e : aa __ __ TAX
4f1f : 18 __ __ CLC
4f20 : 98 __ __ TYA
4f21 : 65 1b __ ADC ACCU + 0 
4f23 : a8 __ __ TAY
4f24 : a5 06 __ LDA WORK + 3 
4f26 : 65 1c __ ADC ACCU + 1 
4f28 : 85 06 __ STA WORK + 3 
4f2a : 8a __ __ TXA
4f2b : 06 1b __ ASL ACCU + 0 
4f2d : 26 1c __ ROL ACCU + 1 
4f2f : 4a __ __ LSR
4f30 : 90 f9 __ BCC $4f2b ; (mul16 + 27)
4f32 : d0 ea __ BNE $4f1e ; (mul16 + 14)
4f34 : a5 04 __ LDA WORK + 1 
4f36 : 4a __ __ LSR
4f37 : 90 0d __ BCC $4f46 ; (mul16 + 54)
4f39 : aa __ __ TAX
4f3a : 18 __ __ CLC
4f3b : 98 __ __ TYA
4f3c : 65 1b __ ADC ACCU + 0 
4f3e : a8 __ __ TAY
4f3f : a5 06 __ LDA WORK + 3 
4f41 : 65 1c __ ADC ACCU + 1 
4f43 : 85 06 __ STA WORK + 3 
4f45 : 8a __ __ TXA
4f46 : 06 1b __ ASL ACCU + 0 
4f48 : 26 1c __ ROL ACCU + 1 
4f4a : 4a __ __ LSR
4f4b : b0 ec __ BCS $4f39 ; (mul16 + 41)
4f4d : d0 f7 __ BNE $4f46 ; (mul16 + 54)
4f4f : 84 05 __ STY WORK + 2 
4f51 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
4f52 : a5 1c __ LDA ACCU + 1 
4f54 : d0 31 __ BNE $4f87 ; (divmod + 53)
4f56 : a5 04 __ LDA WORK + 1 
4f58 : d0 1e __ BNE $4f78 ; (divmod + 38)
4f5a : 85 06 __ STA WORK + 3 
4f5c : a2 04 __ LDX #$04
4f5e : 06 1b __ ASL ACCU + 0 
4f60 : 2a __ __ ROL
4f61 : c5 03 __ CMP WORK + 0 
4f63 : 90 02 __ BCC $4f67 ; (divmod + 21)
4f65 : e5 03 __ SBC WORK + 0 
4f67 : 26 1b __ ROL ACCU + 0 
4f69 : 2a __ __ ROL
4f6a : c5 03 __ CMP WORK + 0 
4f6c : 90 02 __ BCC $4f70 ; (divmod + 30)
4f6e : e5 03 __ SBC WORK + 0 
4f70 : 26 1b __ ROL ACCU + 0 
4f72 : ca __ __ DEX
4f73 : d0 eb __ BNE $4f60 ; (divmod + 14)
4f75 : 85 05 __ STA WORK + 2 
4f77 : 60 __ __ RTS
4f78 : a5 1b __ LDA ACCU + 0 
4f7a : 85 05 __ STA WORK + 2 
4f7c : a5 1c __ LDA ACCU + 1 
4f7e : 85 06 __ STA WORK + 3 
4f80 : a9 00 __ LDA #$00
4f82 : 85 1b __ STA ACCU + 0 
4f84 : 85 1c __ STA ACCU + 1 
4f86 : 60 __ __ RTS
4f87 : a5 04 __ LDA WORK + 1 
4f89 : d0 1f __ BNE $4faa ; (divmod + 88)
4f8b : a5 03 __ LDA WORK + 0 
4f8d : 30 1b __ BMI $4faa ; (divmod + 88)
4f8f : a9 00 __ LDA #$00
4f91 : 85 06 __ STA WORK + 3 
4f93 : a2 10 __ LDX #$10
4f95 : 06 1b __ ASL ACCU + 0 
4f97 : 26 1c __ ROL ACCU + 1 
4f99 : 2a __ __ ROL
4f9a : c5 03 __ CMP WORK + 0 
4f9c : 90 02 __ BCC $4fa0 ; (divmod + 78)
4f9e : e5 03 __ SBC WORK + 0 
4fa0 : 26 1b __ ROL ACCU + 0 
4fa2 : 26 1c __ ROL ACCU + 1 
4fa4 : ca __ __ DEX
4fa5 : d0 f2 __ BNE $4f99 ; (divmod + 71)
4fa7 : 85 05 __ STA WORK + 2 
4fa9 : 60 __ __ RTS
4faa : a9 00 __ LDA #$00
4fac : 85 05 __ STA WORK + 2 
4fae : 85 06 __ STA WORK + 3 
4fb0 : 84 02 __ STY $02 
4fb2 : a0 10 __ LDY #$10
4fb4 : 18 __ __ CLC
4fb5 : 26 1b __ ROL ACCU + 0 
4fb7 : 26 1c __ ROL ACCU + 1 
4fb9 : 26 05 __ ROL WORK + 2 
4fbb : 26 06 __ ROL WORK + 3 
4fbd : 38 __ __ SEC
4fbe : a5 05 __ LDA WORK + 2 
4fc0 : e5 03 __ SBC WORK + 0 
4fc2 : aa __ __ TAX
4fc3 : a5 06 __ LDA WORK + 3 
4fc5 : e5 04 __ SBC WORK + 1 
4fc7 : 90 04 __ BCC $4fcd ; (divmod + 123)
4fc9 : 86 05 __ STX WORK + 2 
4fcb : 85 06 __ STA WORK + 3 
4fcd : 88 __ __ DEY
4fce : d0 e5 __ BNE $4fb5 ; (divmod + 99)
4fd0 : 26 1b __ ROL ACCU + 0 
4fd2 : 26 1c __ ROL ACCU + 1 
4fd4 : a4 02 __ LDY $02 
4fd6 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
4fd7 : 84 02 __ STY $02 
4fd9 : a0 20 __ LDY #$20
4fdb : a9 00 __ LDA #$00
4fdd : 85 07 __ STA WORK + 4 
4fdf : 85 08 __ STA WORK + 5 
4fe1 : 85 09 __ STA WORK + 6 
4fe3 : 85 0a __ STA WORK + 7 
4fe5 : a5 05 __ LDA WORK + 2 
4fe7 : 05 06 __ ORA WORK + 3 
4fe9 : d0 78 __ BNE $5063 ; (divmod32 + 140)
4feb : a5 04 __ LDA WORK + 1 
4fed : d0 27 __ BNE $5016 ; (divmod32 + 63)
4fef : 18 __ __ CLC
4ff0 : 26 1b __ ROL ACCU + 0 
4ff2 : 26 1c __ ROL ACCU + 1 
4ff4 : 26 1d __ ROL ACCU + 2 
4ff6 : 26 1e __ ROL ACCU + 3 
4ff8 : 2a __ __ ROL
4ff9 : 90 05 __ BCC $5000 ; (divmod32 + 41)
4ffb : e5 03 __ SBC WORK + 0 
4ffd : 38 __ __ SEC
4ffe : b0 06 __ BCS $5006 ; (divmod32 + 47)
5000 : c5 03 __ CMP WORK + 0 
5002 : 90 02 __ BCC $5006 ; (divmod32 + 47)
5004 : e5 03 __ SBC WORK + 0 
5006 : 88 __ __ DEY
5007 : d0 e7 __ BNE $4ff0 ; (divmod32 + 25)
5009 : 85 07 __ STA WORK + 4 
500b : 26 1b __ ROL ACCU + 0 
500d : 26 1c __ ROL ACCU + 1 
500f : 26 1d __ ROL ACCU + 2 
5011 : 26 1e __ ROL ACCU + 3 
5013 : a4 02 __ LDY $02 
5015 : 60 __ __ RTS
5016 : a5 1e __ LDA ACCU + 3 
5018 : d0 10 __ BNE $502a ; (divmod32 + 83)
501a : a6 1d __ LDX ACCU + 2 
501c : 86 1e __ STX ACCU + 3 
501e : a6 1c __ LDX ACCU + 1 
5020 : 86 1d __ STX ACCU + 2 
5022 : a6 1b __ LDX ACCU + 0 
5024 : 86 1c __ STX ACCU + 1 
5026 : 85 1b __ STA ACCU + 0 
5028 : a0 18 __ LDY #$18
502a : 18 __ __ CLC
502b : 26 1b __ ROL ACCU + 0 
502d : 26 1c __ ROL ACCU + 1 
502f : 26 1d __ ROL ACCU + 2 
5031 : 26 1e __ ROL ACCU + 3 
5033 : 26 07 __ ROL WORK + 4 
5035 : 26 08 __ ROL WORK + 5 
5037 : 90 0c __ BCC $5045 ; (divmod32 + 110)
5039 : a5 07 __ LDA WORK + 4 
503b : e5 03 __ SBC WORK + 0 
503d : aa __ __ TAX
503e : a5 08 __ LDA WORK + 5 
5040 : e5 04 __ SBC WORK + 1 
5042 : 38 __ __ SEC
5043 : b0 0c __ BCS $5051 ; (divmod32 + 122)
5045 : 38 __ __ SEC
5046 : a5 07 __ LDA WORK + 4 
5048 : e5 03 __ SBC WORK + 0 
504a : aa __ __ TAX
504b : a5 08 __ LDA WORK + 5 
504d : e5 04 __ SBC WORK + 1 
504f : 90 04 __ BCC $5055 ; (divmod32 + 126)
5051 : 86 07 __ STX WORK + 4 
5053 : 85 08 __ STA WORK + 5 
5055 : 88 __ __ DEY
5056 : d0 d3 __ BNE $502b ; (divmod32 + 84)
5058 : 26 1b __ ROL ACCU + 0 
505a : 26 1c __ ROL ACCU + 1 
505c : 26 1d __ ROL ACCU + 2 
505e : 26 1e __ ROL ACCU + 3 
5060 : a4 02 __ LDY $02 
5062 : 60 __ __ RTS
5063 : a0 10 __ LDY #$10
5065 : a5 1e __ LDA ACCU + 3 
5067 : 85 08 __ STA WORK + 5 
5069 : a5 1d __ LDA ACCU + 2 
506b : 85 07 __ STA WORK + 4 
506d : a9 00 __ LDA #$00
506f : 85 1d __ STA ACCU + 2 
5071 : 85 1e __ STA ACCU + 3 
5073 : 18 __ __ CLC
5074 : 26 1b __ ROL ACCU + 0 
5076 : 26 1c __ ROL ACCU + 1 
5078 : 26 07 __ ROL WORK + 4 
507a : 26 08 __ ROL WORK + 5 
507c : 26 09 __ ROL WORK + 6 
507e : 26 0a __ ROL WORK + 7 
5080 : a5 07 __ LDA WORK + 4 
5082 : c5 03 __ CMP WORK + 0 
5084 : a5 08 __ LDA WORK + 5 
5086 : e5 04 __ SBC WORK + 1 
5088 : a5 09 __ LDA WORK + 6 
508a : e5 05 __ SBC WORK + 2 
508c : a5 0a __ LDA WORK + 7 
508e : e5 06 __ SBC WORK + 3 
5090 : 90 18 __ BCC $50aa ; (divmod32 + 211)
5092 : a5 07 __ LDA WORK + 4 
5094 : e5 03 __ SBC WORK + 0 
5096 : 85 07 __ STA WORK + 4 
5098 : a5 08 __ LDA WORK + 5 
509a : e5 04 __ SBC WORK + 1 
509c : 85 08 __ STA WORK + 5 
509e : a5 09 __ LDA WORK + 6 
50a0 : e5 05 __ SBC WORK + 2 
50a2 : 85 09 __ STA WORK + 6 
50a4 : a5 0a __ LDA WORK + 7 
50a6 : e5 06 __ SBC WORK + 3 
50a8 : 85 0a __ STA WORK + 7 
50aa : 88 __ __ DEY
50ab : d0 c7 __ BNE $5074 ; (divmod32 + 157)
50ad : 26 1b __ ROL ACCU + 0 
50af : 26 1c __ ROL ACCU + 1 
50b1 : a4 02 __ LDY $02 
50b3 : 60 __ __ RTS
--------------------------------------------------------------------
__multab38L:
50b4 : __ __ __ BYT 00 26 4c 72 98 be e4 0a                         : .&Lr....
--------------------------------------------------------------------
__multab38H:
50bc : __ __ __ BYT 00 00 00 00 00 00 00 01                         : ........
--------------------------------------------------------------------
vdc_hchar@proxy: ; vdc_hchar@proxy
50c4 : a5 4d __ LDA $4d 
50c6 : 85 13 __ STA P6 
50c8 : a5 46 __ LDA $46 
50ca : 85 16 __ STA P9 
50cc : a5 49 __ LDA $49 
50ce : 85 17 __ STA P10 
50d0 : 4c a9 27 JMP $27a9 ; (vdc_hchar.s0 + 0)
--------------------------------------------------------------------
vdc_modes:
50d4 : __ __ __ BYT 50 00 19 00 00 08 00 00 00 00 08 00 10 00 18 00 : P...............
50e4 : __ __ __ BYT 20 00 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 :  .0.@...&..... .
50f4 : __ __ __ BYT fc 09 e7 24 7e ff 50 00 32 00 00 08 00 00 00 00 : ...$~.P.2.......
5104 : __ __ __ BYT 10 00 40 00 50 00 20 00 30 00 60 00 7f 04 4d 05 : ..@.P. .0.`...M.
5114 : __ __ __ BYT 00 06 32 07 40 08 03 09 07 24 00 ff 50 00 46 00 : ..2.@....$..P.F.
5124 : __ __ __ BYT 00 08 01 00 00 00 18 00 60 00 78 00 40 00 50 00 : ........`.x.@.P.
5134 : __ __ __ BYT 90 00 7f 04 4d 05 00 06 46 07 48 08 03 09 07 24 : ....M...F.H....$
5144 : __ __ __ BYT 00 ff 50 00 19 00 00 08 00 00 00 00 08 00 10 00 : ..P.............
5154 : __ __ __ BYT 18 00 20 00 30 00 40 00 7e 04 20 05 e0 06 19 07 : .. .0.@.~. .....
5164 : __ __ __ BYT 1d 08 fc 09 e7 24 f5 ff 50 00 32 00 00 08 00 00 : .....$..P.2.....
5174 : __ __ __ BYT 00 00 10 00 40 00 50 00 20 00 30 00 60 00 7e 04 : ....@.P. .0.`.~.
5184 : __ __ __ BYT 41 05 00 06 32 07 3b 08 03 09 07 24 00 ff 50 00 : A...2.;....$..P.
5194 : __ __ __ BYT 3c 00 00 08 01 00 00 00 18 00 60 00 78 00 40 00 : <.........`.x.@.
51a4 : __ __ __ BYT 50 00 90 00 7e 04 41 05 00 06 3c 07 3d 08 03 09 : P...~.A...<.=...
51b4 : __ __ __ BYT 07 24 00 ff 80 02 c8 00 01 08 01 00 00 00 40 00 : .$............@.
51c4 : __ __ __ BYT 48 00 88 00 90 00 a0 00 b0 00 7f 04 26 05 e0 06 : H...........&...
51d4 : __ __ __ BYT 19 07 20 08 fc 09 e7 24 7e ff 80 02 90 01 01 08 : .. ....$~.......
51e4 : __ __ __ BYT 01 00 00 00 80 00 90 00 d0 00 e0 00 f0 00 00 00 : ................
51f4 : __ __ __ BYT 7f 04 4d 05 00 06 32 07 40 08 03 09 07 24 00 ff : ..M...2.@....$..
--------------------------------------------------------------------
winStyles:
5204 : __ __ __ BYT 08 6c 7b 7c 7e 62 e2 e1 61 0d 70 6e 6d 7d 40 40 : .l{|~b..a.pnm}@@
5214 : __ __ __ BYT 5d 5d                                           : ]]
--------------------------------------------------------------------
p2smap:
5216 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
rasterbar:
521e : __ __ __ BYT 00 01 0e 0f 06 03 02 03 06 0f 0e 01 00          : .............
--------------------------------------------------------------------
colors0:
522b : __ __ __ BYT 00 02 03 0f 05 04 00                            : .......
--------------------------------------------------------------------
colors1:
5232 : __ __ __ BYT 00 0c 0d 0f 0e 01 00                            : .......
--------------------------------------------------------------------
colors:
5239 : __ __ __ BYT 00 10 11 e1 ee fe ff 6f 66 63 33 32 22 20 00 00 : .......ofc32" ..
5249 : __ __ __ BYT 00 80 88 c8 cc dc dd 6d 66 65 55 54 44 40 00 00 : .......mfeUTD@..
--------------------------------------------------------------------
krnio_pstatus:
5259 : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
5269 : __ __ __ BSS	29
--------------------------------------------------------------------
linebuffer:
5286 : __ __ __ BSS	81
--------------------------------------------------------------------
c1A:
52d7 : __ __ __ BSS	2
--------------------------------------------------------------------
c1B:
52d9 : __ __ __ BSS	2
--------------------------------------------------------------------
c3A:
52db : __ __ __ BSS	2
--------------------------------------------------------------------
c3B:
52dd : __ __ __ BSS	2
--------------------------------------------------------------------
d1A:
52df : __ __ __ BSS	2
--------------------------------------------------------------------
d1B:
52e1 : __ __ __ BSS	2
--------------------------------------------------------------------
d2A:
52e3 : __ __ __ BSS	2
--------------------------------------------------------------------
d2B:
52e5 : __ __ __ BSS	2
--------------------------------------------------------------------
d3A:
52e7 : __ __ __ BSS	2
--------------------------------------------------------------------
d3B:
52e9 : __ __ __ BSS	2
--------------------------------------------------------------------
sintab:
5300 : __ __ __ BYT 80 83 86 89 8c 90 93 96 99 9c 9f a2 a5 a8 ab ae : ................
5310 : __ __ __ BYT b1 b3 b6 b9 bc bf c1 c4 c7 c9 cc ce d1 d3 d5 d8 : ................
5320 : __ __ __ BYT da dc de e0 e2 e4 e6 e8 ea eb ed ef f0 f1 f3 f4 : ................
5330 : __ __ __ BYT f5 f6 f8 f9 fa fa fb fc fd fd fe fe fe ff ff ff : ................
5340 : __ __ __ BYT ff ff ff ff fe fe fe fd fd fc fb fa fa f9 f8 f6 : ................
5350 : __ __ __ BYT f5 f4 f3 f1 f0 ef ed eb ea e8 e6 e4 e2 e0 de dc : ................
5360 : __ __ __ BYT da d8 d5 d3 d1 ce cc c9 c7 c4 c1 bf bc b9 b6 b3 : ................
5370 : __ __ __ BYT b1 ae ab a8 a5 a2 9f 9c 99 96 93 90 8c 89 86 83 : ................
5380 : __ __ __ BYT 80 7d 7a 77 74 70 6d 6a 67 64 61 5e 5b 58 55 52 : .}zwtpmjgda^[XUR
5390 : __ __ __ BYT 4f 4d 4a 47 44 41 3f 3c 39 37 34 32 2f 2d 2b 28 : OMJGDA?<9742/-+(
53a0 : __ __ __ BYT 26 24 22 20 1e 1c 1a 18 16 15 13 11 10 0f 0d 0c : &$" ............
53b0 : __ __ __ BYT 0b 0a 08 07 06 06 05 04 03 03 02 02 02 01 01 01 : ................
53c0 : __ __ __ BYT 01 01 01 01 02 02 02 03 03 04 05 06 06 07 08 0a : ................
53d0 : __ __ __ BYT 0b 0c 0d 0f 10 11 13 15 16 18 1a 1c 1e 20 22 24 : ............. "$
53e0 : __ __ __ BYT 26 28 2b 2d 2f 32 34 37 39 3c 3f 41 44 47 4a 4d : &(+-/2479<?ADGJM
53f0 : __ __ __ BYT 4f 52 55 58 5b 5e 61 64 67 6a 6d 70 74 77 7a 7d : ORUX[^adgjmptwz}
--------------------------------------------------------------------
multab:
5400 : __ __ __ BSS	144
--------------------------------------------------------------------
colormap0:
5500 : __ __ __ BSS	256
--------------------------------------------------------------------
colormap1:
5600 : __ __ __ BSS	256
--------------------------------------------------------------------
Screen:
5700 : __ __ __ BSS	4000
--------------------------------------------------------------------
bnk_redef_charset: ; bnk_redef_charset(u16,u8,volatile u8*,u16)->void
.s0:
01:1300 : ad 00 ff LDA $ff00 
01:1303 : 85 43 __ STA T0 + 0 
01:1305 : a9 0e __ LDA #$0e
01:1307 : 8d 00 ff STA $ff00 
01:130a : a5 0f __ LDA P2 ; (vdcdest + 0)
01:130c : 85 0d __ STA P0 
01:130e : a5 10 __ LDA P3 ; (vdcdest + 1)
01:1310 : 85 0e __ STA P1 
01:1312 : 20 9d 28 JSR $289d ; (vdc_mem_addr.s0 + 0)
01:1315 : a9 00 __ LDA #$00
01:1317 : 85 1b __ STA ACCU + 0 
01:1319 : 85 44 __ STA T2 + 0 
01:131b : a9 02 __ LDA #$02
01:131d : 85 1c __ STA ACCU + 1 
01:131f : a9 d0 __ LDA #$d0
01:1321 : 85 45 __ STA T2 + 1 
.l2:
01:1323 : a2 08 __ LDX #$08
.l5:
01:1325 : a9 01 __ LDA #$01
01:1327 : 8d 00 ff STA $ff00 
01:132a : a0 00 __ LDY #$00
01:132c : b1 44 __ LDA (T2 + 0),y 
01:132e : a0 0e __ LDY #$0e
01:1330 : 8c 00 ff STY $ff00 
01:1333 : a8 __ __ TAY
01:1334 : e6 44 __ INC T2 + 0 
01:1336 : d0 02 __ BNE $133a ; (bnk_redef_charset.l105 + 0)
.s1009:
01:1338 : e6 45 __ INC T2 + 1 
.l105:
01:133a : 2c 00 d6 BIT $d600 
01:133d : 10 fb __ BPL $133a ; (bnk_redef_charset.l105 + 0)
.s10:
01:133f : 8c 01 d6 STY $d601 
01:1342 : ca __ __ DEX
01:1343 : d0 e0 __ BNE $1325 ; (bnk_redef_charset.l5 + 0)
.s7:
01:1345 : a2 08 __ LDX #$08
.l12:
01:1347 : 2c 00 d6 BIT $d600 
01:134a : 10 fb __ BPL $1347 ; (bnk_redef_charset.l12 + 0)
.s17:
01:134c : a9 00 __ LDA #$00
01:134e : 8d 01 d6 STA $d601 
01:1351 : ca __ __ DEX
01:1352 : d0 f3 __ BNE $1347 ; (bnk_redef_charset.l12 + 0)
.s14:
01:1354 : a5 1b __ LDA ACCU + 0 
01:1356 : d0 02 __ BNE $135a ; (bnk_redef_charset.s1007 + 0)
.s1006:
01:1358 : c6 1c __ DEC ACCU + 1 
.s1007:
01:135a : c6 1b __ DEC ACCU + 0 
01:135c : d0 c5 __ BNE $1323 ; (bnk_redef_charset.l2 + 0)
.s1008:
01:135e : a5 1c __ LDA ACCU + 1 
01:1360 : d0 c1 __ BNE $1323 ; (bnk_redef_charset.l2 + 0)
.s3:
01:1362 : a5 43 __ LDA T0 + 0 
01:1364 : 8d 00 ff STA $ff00 
.s1001:
01:1367 : 60 __ __ RTS
