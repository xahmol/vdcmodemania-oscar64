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
1c13 : 8e 9b 30 STX $309b ; (spentry + 0)
1c16 : a9 c8 __ LDA #$c8
1c18 : 85 19 __ STA IP + 0 
1c1a : a9 31 __ LDA #$31
1c1c : 85 1a __ STA IP + 1 
1c1e : 38 __ __ SEC
1c1f : a9 3a __ LDA #$3a
1c21 : e9 31 __ SBC #$31
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
1c35 : a9 60 __ LDA #$60
1c37 : e9 c8 __ SBC #$c8
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
1c50 : a9 6c __ LDA #$6c
1c52 : 85 23 __ STA SP + 0 
1c54 : a9 bf __ LDA #$bf
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
1c80 : a2 03 __ LDX #$03
1c82 : b5 53 __ LDA T0 + 0,x 
1c84 : 9d 6e bf STA $bf6e,x ; (main@stack + 0)
1c87 : ca __ __ DEX
1c88 : 10 f8 __ BPL $1c82 ; (main.s1000 + 2)
.s0:
1c8a : 20 54 1f JSR $1f54 ; (bnk_init.s1000 + 0)
1c8d : 20 e8 26 JSR $26e8 ; (init.s1000 + 0)
1c90 : a9 00 __ LDA #$00
1c92 : a2 27 __ LDX #$27
.l1050:
1c94 : 9d 80 bf STA $bf80,x ; (cy + 0)
1c97 : ca __ __ DEX
1c98 : 10 fa __ BPL $1c94 ; (main.l1050 + 0)
.s1051:
1c9a : a2 0b __ LDX #$0b
.l1052:
1c9c : 9d 74 bf STA $bf74,x ; (cx + 0)
1c9f : ca __ __ DEX
1ca0 : 10 fa __ BPL $1c9c ; (main.l1052 + 0)
.s1053:
1ca2 : 85 53 __ STA T0 + 0 
.l754:
1ca4 : 20 e4 ff JSR $ffe4 
1ca7 : 09 00 __ ORA #$00
1ca9 : d0 f9 __ BNE $1ca4 ; (main.l754 + 0)
.l13:
1cab : 85 54 __ STA T1 + 0 
1cad : a9 28 __ LDA #$28
1caf : 85 56 __ STA T2 + 0 
.l16:
1cb1 : 18 __ __ CLC
1cb2 : a5 54 __ LDA T1 + 0 
1cb4 : 69 01 __ ADC #$01
1cb6 : a6 54 __ LDX T1 + 0 
1cb8 : 18 __ __ CLC
1cb9 : 7d 80 bf ADC $bf80,x ; (cy + 0)
1cbc : 9d 80 bf STA $bf80,x ; (cy + 0)
1cbf : c9 18 __ CMP #$18
1cc1 : 90 15 __ BCC $1cd8 ; (main.s549 + 0)
.s19:
1cc3 : e9 18 __ SBC #$18
1cc5 : 9d 80 bf STA $bf80,x ; (cy + 0)
1cc8 : 38 __ __ SEC
1cc9 : a9 27 __ LDA #$27
1ccb : e5 54 __ SBC T1 + 0 
1ccd : 20 c2 2d JSR $2dc2 ; (rotdown.s0 + 0)
1cd0 : 18 __ __ CLC
1cd1 : a5 54 __ LDA T1 + 0 
1cd3 : 69 28 __ ADC #$28
1cd5 : 20 59 2e JSR $2e59 ; (rotup.s0 + 0)
.s549:
1cd8 : e6 54 __ INC T1 + 0 
1cda : c6 56 __ DEC T2 + 0 
1cdc : d0 d3 __ BNE $1cb1 ; (main.l16 + 0)
.s18:
1cde : ad 7f bf LDA $bf7f ; (cx + 11)
1ce1 : 18 __ __ CLC
1ce2 : 69 05 __ ADC #$05
1ce4 : 8d 7f bf STA $bf7f ; (cx + 11)
1ce7 : a2 00 __ LDX #$00
.l1054:
1ce9 : bd 91 32 LDA $3291,x ; (Screen + 1)
1cec : 9d 90 32 STA $3290,x ; (Screen + 0)
1cef : e8 __ __ INX
1cf0 : e0 4f __ CPX #$4f
1cf2 : 90 f5 __ BCC $1ce9 ; (main.l1054 + 0)
.s1055:
1cf4 : a9 00 __ LDA #$00
1cf6 : 8d df 32 STA $32df ; (Screen + 79)
1cf9 : a2 4f __ LDX #$4f
.l1056:
1cfb : bd 0f 3a LDA $3a0f,x ; (Screen + 1919)
1cfe : 9d 10 3a STA $3a10,x ; (Screen + 1920)
1d01 : ca __ __ DEX
1d02 : d0 f7 __ BNE $1cfb ; (main.l1056 + 0)
.s1057:
1d04 : 8e 10 3a STX $3a10 ; (Screen + 1920)
1d07 : ad 7e bf LDA $bf7e ; (cx + 10)
1d0a : 18 __ __ CLC
1d0b : 69 04 __ ADC #$04
1d0d : 8d 7e bf STA $bf7e ; (cx + 10)
.l1058:
1d10 : bd e1 32 LDA $32e1,x ; (Screen + 81)
1d13 : 9d e0 32 STA $32e0,x ; (Screen + 80)
1d16 : e8 __ __ INX
1d17 : e0 4f __ CPX #$4f
1d19 : 90 f5 __ BCC $1d10 ; (main.l1058 + 0)
.s1059:
1d1b : a9 00 __ LDA #$00
1d1d : 8d 2f 33 STA $332f ; (Screen + 159)
1d20 : a2 4f __ LDX #$4f
.l1060:
1d22 : bd bf 39 LDA $39bf,x ; (Screen + 1839)
1d25 : 9d c0 39 STA $39c0,x ; (Screen + 1840)
1d28 : ca __ __ DEX
1d29 : d0 f7 __ BNE $1d22 ; (main.l1060 + 0)
.s1061:
1d2b : 8e c0 39 STX $39c0 ; (Screen + 1840)
1d2e : ad 7d bf LDA $bf7d ; (cx + 9)
1d31 : 18 __ __ CLC
1d32 : 69 03 __ ADC #$03
1d34 : 8d 7d bf STA $bf7d ; (cx + 9)
.l1062:
1d37 : bd 31 33 LDA $3331,x ; (Screen + 161)
1d3a : 9d 30 33 STA $3330,x ; (Screen + 160)
1d3d : e8 __ __ INX
1d3e : e0 4f __ CPX #$4f
1d40 : 90 f5 __ BCC $1d37 ; (main.l1062 + 0)
.s1063:
1d42 : a9 00 __ LDA #$00
1d44 : 8d 7f 33 STA $337f ; (Screen + 239)
1d47 : a2 4f __ LDX #$4f
.l1064:
1d49 : bd 6f 39 LDA $396f,x ; (Screen + 1759)
1d4c : 9d 70 39 STA $3970,x ; (Screen + 1760)
1d4f : ca __ __ DEX
1d50 : d0 f7 __ BNE $1d49 ; (main.l1064 + 0)
.s1065:
1d52 : 8e 70 39 STX $3970 ; (Screen + 1760)
1d55 : ee 7c bf INC $bf7c ; (cx + 8)
1d58 : ee 7c bf INC $bf7c ; (cx + 8)
.l1066:
1d5b : bd 81 33 LDA $3381,x ; (Screen + 241)
1d5e : 9d 80 33 STA $3380,x ; (Screen + 240)
1d61 : e8 __ __ INX
1d62 : e0 4f __ CPX #$4f
1d64 : 90 f5 __ BCC $1d5b ; (main.l1066 + 0)
.s1067:
1d66 : a9 00 __ LDA #$00
1d68 : 8d cf 33 STA $33cf ; (Screen + 319)
1d6b : a2 4f __ LDX #$4f
.l1068:
1d6d : bd 1f 39 LDA $391f,x ; (Screen + 1679)
1d70 : 9d 20 39 STA $3920,x ; (Screen + 1680)
1d73 : ca __ __ DEX
1d74 : d0 f7 __ BNE $1d6d ; (main.l1068 + 0)
.s1069:
1d76 : 8e 20 39 STX $3920 ; (Screen + 1680)
1d79 : ee 7b bf INC $bf7b ; (cx + 7)
.l1070:
1d7c : bd d1 33 LDA $33d1,x ; (Screen + 321)
1d7f : 9d d0 33 STA $33d0,x ; (Screen + 320)
1d82 : e8 __ __ INX
1d83 : e0 4f __ CPX #$4f
1d85 : 90 f5 __ BCC $1d7c ; (main.l1070 + 0)
.s1071:
1d87 : a9 00 __ LDA #$00
1d89 : 8d 1f 34 STA $341f ; (Screen + 399)
1d8c : a2 4f __ LDX #$4f
.l1072:
1d8e : bd cf 38 LDA $38cf,x ; (Screen + 1599)
1d91 : 9d d0 38 STA $38d0,x ; (Screen + 1600)
1d94 : ca __ __ DEX
1d95 : d0 f7 __ BNE $1d8e ; (main.l1072 + 0)
.s1073:
1d97 : 8e d0 38 STX $38d0 ; (Screen + 1600)
.l1074:
1d9a : bd 21 34 LDA $3421,x ; (Screen + 401)
1d9d : 9d 20 34 STA $3420,x ; (Screen + 400)
1da0 : e8 __ __ INX
1da1 : e0 4f __ CPX #$4f
1da3 : 90 f5 __ BCC $1d9a ; (main.l1074 + 0)
.s1075:
1da5 : a9 00 __ LDA #$00
1da7 : 8d 6f 34 STA $346f ; (Screen + 479)
1daa : a2 4f __ LDX #$4f
.l1076:
1dac : bd 7f 38 LDA $387f,x ; (Screen + 1519)
1daf : 9d 80 38 STA $3880,x ; (Screen + 1520)
1db2 : ca __ __ DEX
1db3 : d0 f7 __ BNE $1dac ; (main.l1076 + 0)
.s1077:
1db5 : 8e 80 38 STX $3880 ; (Screen + 1520)
1db8 : ad 79 bf LDA $bf79 ; (cx + 5)
1dbb : 18 __ __ CLC
1dbc : 69 06 __ ADC #$06
1dbe : 8d 79 bf STA $bf79 ; (cx + 5)
1dc1 : c9 07 __ CMP #$07
1dc3 : 90 23 __ BCC $1de8 ; (main.s119 + 0)
.s117:
1dc5 : e9 07 __ SBC #$07
1dc7 : 8d 79 bf STA $bf79 ; (cx + 5)
.l1100:
1dca : bd 71 34 LDA $3471,x ; (Screen + 481)
1dcd : 9d 70 34 STA $3470,x ; (Screen + 480)
1dd0 : e8 __ __ INX
1dd1 : e0 4f __ CPX #$4f
1dd3 : 90 f5 __ BCC $1dca ; (main.l1100 + 0)
.s1101:
1dd5 : a9 00 __ LDA #$00
1dd7 : 8d bf 34 STA $34bf ; (Screen + 559)
1dda : a2 4f __ LDX #$4f
.l1102:
1ddc : bd 2f 38 LDA $382f,x ; (Screen + 1439)
1ddf : 9d 30 38 STA $3830,x ; (Screen + 1440)
1de2 : ca __ __ DEX
1de3 : d0 f7 __ BNE $1ddc ; (main.l1102 + 0)
.s1103:
1de5 : 8e 30 38 STX $3830 ; (Screen + 1440)
.s119:
1de8 : ad 78 bf LDA $bf78 ; (cx + 4)
1deb : 18 __ __ CLC
1dec : 69 05 __ ADC #$05
1dee : 8d 78 bf STA $bf78 ; (cx + 4)
1df1 : c9 07 __ CMP #$07
1df3 : 90 23 __ BCC $1e18 ; (main.s132 + 0)
.s130:
1df5 : e9 07 __ SBC #$07
1df7 : 8d 78 bf STA $bf78 ; (cx + 4)
.l1096:
1dfa : bd c1 34 LDA $34c1,x ; (Screen + 561)
1dfd : 9d c0 34 STA $34c0,x ; (Screen + 560)
1e00 : e8 __ __ INX
1e01 : e0 4f __ CPX #$4f
1e03 : 90 f5 __ BCC $1dfa ; (main.l1096 + 0)
.s1097:
1e05 : a9 00 __ LDA #$00
1e07 : 8d 0f 35 STA $350f ; (Screen + 639)
1e0a : a2 4f __ LDX #$4f
.l1098:
1e0c : bd df 37 LDA $37df,x ; (Screen + 1359)
1e0f : 9d e0 37 STA $37e0,x ; (Screen + 1360)
1e12 : ca __ __ DEX
1e13 : d0 f7 __ BNE $1e0c ; (main.l1098 + 0)
.s1099:
1e15 : 8e e0 37 STX $37e0 ; (Screen + 1360)
.s132:
1e18 : ad 77 bf LDA $bf77 ; (cx + 3)
1e1b : 18 __ __ CLC
1e1c : 69 04 __ ADC #$04
1e1e : 8d 77 bf STA $bf77 ; (cx + 3)
1e21 : c9 07 __ CMP #$07
1e23 : 90 23 __ BCC $1e48 ; (main.s145 + 0)
.s143:
1e25 : e9 07 __ SBC #$07
1e27 : 8d 77 bf STA $bf77 ; (cx + 3)
.l1092:
1e2a : bd 11 35 LDA $3511,x ; (Screen + 641)
1e2d : 9d 10 35 STA $3510,x ; (Screen + 640)
1e30 : e8 __ __ INX
1e31 : e0 4f __ CPX #$4f
1e33 : 90 f5 __ BCC $1e2a ; (main.l1092 + 0)
.s1093:
1e35 : a9 00 __ LDA #$00
1e37 : 8d 5f 35 STA $355f ; (Screen + 719)
1e3a : a2 4f __ LDX #$4f
.l1094:
1e3c : bd 8f 37 LDA $378f,x ; (Screen + 1279)
1e3f : 9d 90 37 STA $3790,x ; (Screen + 1280)
1e42 : ca __ __ DEX
1e43 : d0 f7 __ BNE $1e3c ; (main.l1094 + 0)
.s1095:
1e45 : 8e 90 37 STX $3790 ; (Screen + 1280)
.s145:
1e48 : ad 76 bf LDA $bf76 ; (cx + 2)
1e4b : 18 __ __ CLC
1e4c : 69 03 __ ADC #$03
1e4e : 8d 76 bf STA $bf76 ; (cx + 2)
1e51 : c9 07 __ CMP #$07
1e53 : 90 23 __ BCC $1e78 ; (main.s158 + 0)
.s156:
1e55 : e9 07 __ SBC #$07
1e57 : 8d 76 bf STA $bf76 ; (cx + 2)
.l1088:
1e5a : bd 61 35 LDA $3561,x ; (Screen + 721)
1e5d : 9d 60 35 STA $3560,x ; (Screen + 720)
1e60 : e8 __ __ INX
1e61 : e0 4f __ CPX #$4f
1e63 : 90 f5 __ BCC $1e5a ; (main.l1088 + 0)
.s1089:
1e65 : a9 00 __ LDA #$00
1e67 : 8d af 35 STA $35af ; (Screen + 799)
1e6a : a2 4f __ LDX #$4f
.l1090:
1e6c : bd 3f 37 LDA $373f,x ; (Screen + 1199)
1e6f : 9d 40 37 STA $3740,x ; (Screen + 1200)
1e72 : ca __ __ DEX
1e73 : d0 f7 __ BNE $1e6c ; (main.l1090 + 0)
.s1091:
1e75 : 8e 40 37 STX $3740 ; (Screen + 1200)
.s158:
1e78 : ad 75 bf LDA $bf75 ; (cx + 1)
1e7b : 18 __ __ CLC
1e7c : 69 02 __ ADC #$02
1e7e : 8d 75 bf STA $bf75 ; (cx + 1)
1e81 : c9 07 __ CMP #$07
1e83 : 90 23 __ BCC $1ea8 ; (main.s171 + 0)
.s169:
1e85 : e9 07 __ SBC #$07
1e87 : 8d 75 bf STA $bf75 ; (cx + 1)
.l1084:
1e8a : bd b1 35 LDA $35b1,x ; (Screen + 801)
1e8d : 9d b0 35 STA $35b0,x ; (Screen + 800)
1e90 : e8 __ __ INX
1e91 : e0 4f __ CPX #$4f
1e93 : 90 f5 __ BCC $1e8a ; (main.l1084 + 0)
.s1085:
1e95 : a9 00 __ LDA #$00
1e97 : 8d ff 35 STA $35ff ; (Screen + 879)
1e9a : a2 4f __ LDX #$4f
.l1086:
1e9c : bd ef 36 LDA $36ef,x ; (Screen + 1119)
1e9f : 9d f0 36 STA $36f0,x ; (Screen + 1120)
1ea2 : ca __ __ DEX
1ea3 : d0 f7 __ BNE $1e9c ; (main.l1086 + 0)
.s1087:
1ea5 : 8e f0 36 STX $36f0 ; (Screen + 1120)
.s171:
1ea8 : ee 74 bf INC $bf74 ; (cx + 0)
1eab : ad 74 bf LDA $bf74 ; (cx + 0)
1eae : c9 07 __ CMP #$07
1eb0 : 90 23 __ BCC $1ed5 ; (main.s211 + 0)
.s182:
1eb2 : e9 07 __ SBC #$07
1eb4 : 8d 74 bf STA $bf74 ; (cx + 0)
.l1080:
1eb7 : bd 01 36 LDA $3601,x ; (Screen + 881)
1eba : 9d 00 36 STA $3600,x ; (Screen + 880)
1ebd : e8 __ __ INX
1ebe : e0 4f __ CPX #$4f
1ec0 : 90 f5 __ BCC $1eb7 ; (main.l1080 + 0)
.s1081:
1ec2 : a9 00 __ LDA #$00
1ec4 : 8d 4f 36 STA $364f ; (Screen + 959)
1ec7 : a2 4f __ LDX #$4f
.l1082:
1ec9 : bd 9f 36 LDA $369f,x ; (Screen + 1039)
1ecc : 9d a0 36 STA $36a0,x ; (Screen + 1040)
1ecf : ca __ __ DEX
1ed0 : d0 f7 __ BNE $1ec9 ; (main.l1082 + 0)
.s1083:
1ed2 : 8e a0 36 STX $36a0 ; (Screen + 1040)
.s211:
1ed5 : 86 1b __ STX ACCU + 0 
1ed7 : a2 28 __ LDX #$28
.l1078:
1ed9 : 18 __ __ CLC
1eda : a5 1b __ LDA ACCU + 0 
1edc : 65 53 __ ADC T0 + 0 
1ede : 4a __ __ LSR
1edf : 4a __ __ LSR
1ee0 : 29 1f __ AND #$1f
1ee2 : a8 __ __ TAY
1ee3 : b9 a8 31 LDA $31a8,y ; (colors + 0)
1ee6 : a4 1b __ LDY ACCU + 0 
1ee8 : 99 50 36 STA $3650,y ; (Screen + 960)
1eeb : e6 1b __ INC ACCU + 0 
1eed : ca __ __ DEX
1eee : d0 e9 __ BNE $1ed9 ; (main.l1078 + 0)
.s1079:
1ef0 : ad e4 31 LDA $31e4 ; (vdc_state + 12)
1ef3 : 85 0d __ STA P0 
1ef5 : ad e5 31 LDA $31e5 ; (vdc_state + 13)
1ef8 : 85 0e __ STA P1 
1efa : 20 f5 29 JSR $29f5 ; (vdc_mem_addr.s0 + 0)
1efd : e6 53 __ INC T0 + 0 
1eff : a9 90 __ LDA #$90
1f01 : 85 54 __ STA T1 + 0 
1f03 : a9 32 __ LDA #$32
1f05 : 85 55 __ STA T1 + 1 
.l200:
1f07 : a0 00 __ LDY #$00
1f09 : b1 54 __ LDA (T1 + 0),y 
.l789:
1f0b : 2c 00 d6 BIT $d600 
1f0e : 10 fb __ BPL $1f0b ; (main.l789 + 0)
.s205:
1f10 : 8d 01 d6 STA $d601 
1f13 : e6 54 __ INC T1 + 0 
1f15 : d0 02 __ BNE $1f19 ; (main.s1107 + 0)
.s1106:
1f17 : e6 55 __ INC T1 + 1 
.s1107:
1f19 : a5 54 __ LDA T1 + 0 
1f1b : c9 60 __ CMP #$60
1f1d : d0 e8 __ BNE $1f07 ; (main.l200 + 0)
.s1002:
1f1f : a5 55 __ LDA T1 + 1 
1f21 : c9 3a __ CMP #$3a
1f23 : d0 e2 __ BNE $1f07 ; (main.l200 + 0)
.s202:
1f25 : 20 e4 ff JSR $ffe4 
1f28 : 09 00 __ ORA #$00
1f2a : d0 03 __ BNE $1f2f ; (main.s14 + 0)
1f2c : 4c ab 1c JMP $1cab ; (main.l13 + 0)
.s14:
1f2f : a9 00 __ LDA #$00
1f31 : 20 87 2a JSR $2a87 ; (fastmode.s0 + 0)
1f34 : a9 00 __ LDA #$00
1f36 : 85 15 __ STA P8 
1f38 : 20 a6 2a JSR $2aa6 ; (vdc_set_mode.s1000 + 0)
1f3b : 20 f7 28 JSR $28f7 ; (vdc_cls.s0 + 0)
1f3e : a9 00 __ LDA #$00
1f40 : 85 1b __ STA ACCU + 0 
1f42 : 85 1c __ STA ACCU + 1 
1f44 : a9 04 __ LDA #$04
1f46 : 8d 06 d5 STA $d506 
.s1001:
1f49 : a2 03 __ LDX #$03
1f4b : bd 6e bf LDA $bf6e,x ; (main@stack + 0)
1f4e : 95 53 __ STA T0 + 0,x 
1f50 : ca __ __ DEX
1f51 : 10 f8 __ BPL $1f4b ; (main.s1001 + 2)
1f53 : 60 __ __ RTS
--------------------------------------------------------------------
bnk_init: ; bnk_init()->void
.s1000:
1f54 : 38 __ __ SEC
1f55 : a5 23 __ LDA SP + 0 
1f57 : e9 06 __ SBC #$06
1f59 : 85 23 __ STA SP + 0 
1f5b : b0 02 __ BCS $1f5f ; (bnk_init.s0 + 0)
1f5d : c6 24 __ DEC SP + 1 
.s0:
1f5f : a9 3c __ LDA #$3c
1f61 : a0 02 __ LDY #$02
1f63 : 91 23 __ STA (SP + 0),y 
1f65 : a9 26 __ LDA #$26
1f67 : c8 __ __ INY
1f68 : 91 23 __ STA (SP + 0),y 
1f6a : a5 ba __ LDA $ba 
1f6c : d0 02 __ BNE $1f70 ; (bnk_init.s4 + 0)
.s2:
1f6e : a9 08 __ LDA #$08
.s4:
1f70 : 85 4f __ STA T1 + 0 
1f72 : a0 04 __ LDY #$04
1f74 : 91 23 __ STA (SP + 0),y 
1f76 : a9 00 __ LDA #$00
1f78 : c8 __ __ INY
1f79 : 91 23 __ STA (SP + 0),y 
1f7b : 20 0a 20 JSR $200a ; (printf.s0 + 0)
1f7e : a9 06 __ LDA #$06
1f80 : 8d 06 d5 STA $d506 
1f83 : a9 4c __ LDA #$4c
1f85 : a0 02 __ LDY #$02
1f87 : 91 23 __ STA (SP + 0),y 
1f89 : a9 26 __ LDA #$26
1f8b : c8 __ __ INY
1f8c : 91 23 __ STA (SP + 0),y 
1f8e : 20 0a 20 JSR $200a ; (printf.s0 + 0)
1f91 : a9 00 __ LDA #$00
1f93 : aa __ __ TAX
1f94 : 20 68 ff JSR $ff68 
1f97 : a9 66 __ LDA #$66
1f99 : 85 0d __ STA P0 
1f9b : a9 26 __ LDA #$26
1f9d : 85 0e __ STA P1 
1f9f : 20 71 26 JSR $2671 ; (krnio_setnam.s0 + 0)
1fa2 : a9 66 __ LDA #$66
1fa4 : a0 04 __ LDY #$04
1fa6 : 91 23 __ STA (SP + 0),y 
1fa8 : a9 26 __ LDA #$26
1faa : c8 __ __ INY
1fab : 91 23 __ STA (SP + 0),y 
1fad : a9 87 __ LDA #$87
1faf : a0 02 __ LDY #$02
1fb1 : 91 23 __ STA (SP + 0),y 
1fb3 : a9 26 __ LDA #$26
1fb5 : c8 __ __ INY
1fb6 : 91 23 __ STA (SP + 0),y 
1fb8 : 20 0a 20 JSR $200a ; (printf.s0 + 0)
1fbb : a9 01 __ LDA #$01
1fbd : 85 0d __ STA P0 
1fbf : 85 0f __ STA P2 
1fc1 : a5 4f __ LDA T1 + 0 
1fc3 : 85 0e __ STA P1 
1fc5 : 20 94 26 JSR $2694 ; (krnio_load.s0 + 0)
1fc8 : 09 00 __ ORA #$00
1fca : d0 32 __ BNE $1ffe ; (bnk_init.s1001 + 0)
.s7:
1fcc : a9 a9 __ LDA #$a9
1fce : a0 02 __ LDY #$02
1fd0 : 91 23 __ STA (SP + 0),y 
1fd2 : a9 26 __ LDA #$26
1fd4 : c8 __ __ INY
1fd5 : 91 23 __ STA (SP + 0),y 
1fd7 : 20 0a 20 JSR $200a ; (printf.s0 + 0)
1fda : a9 c7 __ LDA #$c7
1fdc : a0 02 __ LDY #$02
1fde : 91 23 __ STA (SP + 0),y 
1fe0 : a9 26 __ LDA #$26
1fe2 : c8 __ __ INY
1fe3 : 91 23 __ STA (SP + 0),y 
1fe5 : ad c9 31 LDA $31c9 ; (krnio_pstatus + 1)
1fe8 : c8 __ __ INY
1fe9 : 91 23 __ STA (SP + 0),y 
1feb : a9 00 __ LDA #$00
1fed : c8 __ __ INY
1fee : 91 23 __ STA (SP + 0),y 
1ff0 : 20 0a 20 JSR $200a ; (printf.s0 + 0)
1ff3 : a9 01 __ LDA #$01
1ff5 : 85 0d __ STA P0 
1ff7 : a9 00 __ LDA #$00
1ff9 : 85 0e __ STA P1 
1ffb : 20 d3 26 JSR $26d3 ; (exit.s0 + 0)
.s1001:
1ffe : 18 __ __ CLC
1fff : a5 23 __ LDA SP + 0 
2001 : 69 06 __ ADC #$06
2003 : 85 23 __ STA SP + 0 
2005 : 90 02 __ BCC $2009 ; (bnk_init.s1001 + 11)
2007 : e6 24 __ INC SP + 1 
2009 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
.s0:
200a : 18 __ __ CLC
200b : a5 23 __ LDA SP + 0 
200d : 69 04 __ ADC #$04
200f : 85 47 __ STA T0 + 0 
2011 : a5 24 __ LDA SP + 1 
2013 : 69 00 __ ADC #$00
2015 : 85 48 __ STA T0 + 1 
2017 : a9 00 __ LDA #$00
2019 : 85 49 __ STA T2 + 0 
201b : a0 02 __ LDY #$02
201d : b1 23 __ LDA (SP + 0),y 
201f : 85 4a __ STA T3 + 0 
2021 : c8 __ __ INY
2022 : b1 23 __ LDA (SP + 0),y 
2024 : 85 4b __ STA T3 + 1 
.l2:
2026 : a0 00 __ LDY #$00
2028 : b1 4a __ LDA (T3 + 0),y 
202a : d0 0c __ BNE $2038 ; (printf.s3 + 0)
.s4:
202c : a6 49 __ LDX T2 + 0 
202e : 9d be bf STA $bfbe,x ; (buff + 0)
2031 : 8a __ __ TXA
2032 : d0 01 __ BNE $2035 ; (printf.s117 + 0)
.s1001:
2034 : 60 __ __ RTS
.s117:
2035 : 4c 31 23 JMP $2331 ; (puts@proxy + 0)
.s3:
2038 : c9 25 __ CMP #$25
203a : f0 28 __ BEQ $2064 ; (printf.s5 + 0)
.s6:
203c : a6 49 __ LDX T2 + 0 
203e : 9d be bf STA $bfbe,x ; (buff + 0)
2041 : e6 4a __ INC T3 + 0 
2043 : d0 02 __ BNE $2047 ; (printf.s1097 + 0)
.s1096:
2045 : e6 4b __ INC T3 + 1 
.s1097:
2047 : e8 __ __ INX
2048 : 86 49 __ STX T2 + 0 
204a : e0 28 __ CPX #$28
204c : 90 d8 __ BCC $2026 ; (printf.l2 + 0)
.s111:
204e : a9 be __ LDA #$be
2050 : 85 0d __ STA P0 ; (fmt + 0)
2052 : a9 bf __ LDA #$bf
2054 : 85 0e __ STA P1 ; (fmt + 1)
2056 : 98 __ __ TYA
2057 : 9d be bf STA $bfbe,x ; (buff + 0)
205a : 20 39 23 JSR $2339 ; (puts.s0 + 0)
205d : a9 00 __ LDA #$00
.s1068:
205f : 85 49 __ STA T2 + 0 
2061 : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s5:
2064 : a5 49 __ LDA T2 + 0 
2066 : f0 0d __ BEQ $2075 ; (printf.s10 + 0)
.s8:
2068 : 98 __ __ TYA
2069 : a6 49 __ LDX T2 + 0 
206b : 9d be bf STA $bfbe,x ; (buff + 0)
206e : 20 31 23 JSR $2331 ; (puts@proxy + 0)
2071 : a9 00 __ LDA #$00
2073 : 85 49 __ STA T2 + 0 
.s10:
2075 : 8d ba bf STA $bfba ; (si + 4)
2078 : 8d bb bf STA $bfbb ; (si + 5)
207b : 8d bc bf STA $bfbc ; (si + 6)
207e : 8d bd bf STA $bfbd ; (si + 7)
2081 : a9 0a __ LDA #$0a
2083 : 8d b9 bf STA $bfb9 ; (si + 3)
2086 : a0 01 __ LDY #$01
2088 : b1 4a __ LDA (T3 + 0),y 
208a : a2 20 __ LDX #$20
208c : 8e b6 bf STX $bfb6 ; (si + 0)
208f : a2 00 __ LDX #$00
2091 : 8e b7 bf STX $bfb7 ; (si + 1)
2094 : ca __ __ DEX
2095 : 8e b8 bf STX $bfb8 ; (si + 2)
2098 : aa __ __ TAX
2099 : 18 __ __ CLC
209a : a5 4a __ LDA T3 + 0 
209c : 69 02 __ ADC #$02
209e : 4c ab 20 JMP $20ab ; (printf.l15 + 0)
.s246:
20a1 : a0 00 __ LDY #$00
20a3 : b1 4a __ LDA (T3 + 0),y 
20a5 : aa __ __ TAX
20a6 : 18 __ __ CLC
20a7 : a5 4a __ LDA T3 + 0 
20a9 : 69 01 __ ADC #$01
.l15:
20ab : 85 4a __ STA T3 + 0 
20ad : 90 02 __ BCC $20b1 ; (printf.s1079 + 0)
.s1078:
20af : e6 4b __ INC T3 + 1 
.s1079:
20b1 : 8a __ __ TXA
20b2 : e0 2b __ CPX #$2b
20b4 : d0 07 __ BNE $20bd ; (printf.s18 + 0)
.s17:
20b6 : a9 01 __ LDA #$01
20b8 : 8d bb bf STA $bfbb ; (si + 5)
20bb : d0 e4 __ BNE $20a1 ; (printf.s246 + 0)
.s18:
20bd : c9 30 __ CMP #$30
20bf : d0 06 __ BNE $20c7 ; (printf.s21 + 0)
.s20:
20c1 : 8d b6 bf STA $bfb6 ; (si + 0)
20c4 : 4c a1 20 JMP $20a1 ; (printf.s246 + 0)
.s21:
20c7 : c9 23 __ CMP #$23
20c9 : d0 07 __ BNE $20d2 ; (printf.s24 + 0)
.s23:
20cb : a9 01 __ LDA #$01
20cd : 8d bd bf STA $bfbd ; (si + 7)
20d0 : d0 cf __ BNE $20a1 ; (printf.s246 + 0)
.s24:
20d2 : c9 2d __ CMP #$2d
20d4 : d0 07 __ BNE $20dd ; (printf.s16 + 0)
.s26:
20d6 : a9 01 __ LDA #$01
20d8 : 8d bc bf STA $bfbc ; (si + 6)
20db : d0 c4 __ BNE $20a1 ; (printf.s246 + 0)
.s16:
20dd : c9 30 __ CMP #$30
20df : 90 5b __ BCC $213c ; (printf.s32 + 0)
.s33:
20e1 : c9 3a __ CMP #$3a
20e3 : b0 57 __ BCS $213c ; (printf.s32 + 0)
.s30:
20e5 : 85 4c __ STA T4 + 0 
20e7 : a9 00 __ LDA #$00
20e9 : 85 4d __ STA T6 + 0 
20eb : 85 4e __ STA T6 + 1 
20ed : e0 3a __ CPX #$3a
20ef : a6 1c __ LDX ACCU + 1 
20f1 : b0 40 __ BCS $2133 ; (printf.s36 + 0)
.l35:
20f3 : a5 4d __ LDA T6 + 0 
20f5 : 0a __ __ ASL
20f6 : 85 1b __ STA ACCU + 0 
20f8 : a5 4e __ LDA T6 + 1 
20fa : 2a __ __ ROL
20fb : 06 1b __ ASL ACCU + 0 
20fd : 2a __ __ ROL
20fe : aa __ __ TAX
20ff : 18 __ __ CLC
2100 : a5 1b __ LDA ACCU + 0 
2102 : 65 4d __ ADC T6 + 0 
2104 : 85 4d __ STA T6 + 0 
2106 : 8a __ __ TXA
2107 : 65 4e __ ADC T6 + 1 
2109 : 06 4d __ ASL T6 + 0 
210b : 2a __ __ ROL
210c : a8 __ __ TAY
210d : 18 __ __ CLC
210e : a5 4d __ LDA T6 + 0 
2110 : 65 4c __ ADC T4 + 0 
2112 : 90 01 __ BCC $2115 ; (printf.s1093 + 0)
.s1092:
2114 : c8 __ __ INY
.s1093:
2115 : 38 __ __ SEC
2116 : e9 30 __ SBC #$30
2118 : 85 4d __ STA T6 + 0 
211a : 98 __ __ TYA
211b : e9 00 __ SBC #$00
211d : 85 4e __ STA T6 + 1 
211f : a0 00 __ LDY #$00
2121 : b1 4a __ LDA (T3 + 0),y 
2123 : 85 4c __ STA T4 + 0 
2125 : e6 4a __ INC T3 + 0 
2127 : d0 02 __ BNE $212b ; (printf.s1095 + 0)
.s1094:
2129 : e6 4b __ INC T3 + 1 
.s1095:
212b : c9 30 __ CMP #$30
212d : 90 04 __ BCC $2133 ; (printf.s36 + 0)
.s37:
212f : c9 3a __ CMP #$3a
2131 : 90 c0 __ BCC $20f3 ; (printf.l35 + 0)
.s36:
2133 : 86 1c __ STX ACCU + 1 
2135 : a5 4d __ LDA T6 + 0 
2137 : 8d b7 bf STA $bfb7 ; (si + 1)
213a : a5 4c __ LDA T4 + 0 
.s32:
213c : c9 2e __ CMP #$2e
213e : d0 52 __ BNE $2192 ; (printf.s40 + 0)
.s38:
2140 : a9 00 __ LDA #$00
2142 : 85 4d __ STA T6 + 0 
2144 : a6 1c __ LDX ACCU + 1 
2146 : 4c 51 21 JMP $2151 ; (printf.l231 + 0)
.s1091:
2149 : 38 __ __ SEC
214a : e9 30 __ SBC #$30
214c : 85 4d __ STA T6 + 0 
214e : 98 __ __ TYA
214f : e9 00 __ SBC #$00
.l231:
2151 : 85 4e __ STA T6 + 1 
2153 : a0 00 __ LDY #$00
2155 : b1 4a __ LDA (T3 + 0),y 
2157 : 85 4c __ STA T4 + 0 
2159 : e6 4a __ INC T3 + 0 
215b : d0 02 __ BNE $215f ; (printf.s1081 + 0)
.s1080:
215d : e6 4b __ INC T3 + 1 
.s1081:
215f : c9 30 __ CMP #$30
2161 : 90 28 __ BCC $218b ; (printf.s43 + 0)
.s44:
2163 : c9 3a __ CMP #$3a
2165 : b0 24 __ BCS $218b ; (printf.s43 + 0)
.s42:
2167 : a5 4d __ LDA T6 + 0 
2169 : 0a __ __ ASL
216a : 85 1b __ STA ACCU + 0 
216c : a5 4e __ LDA T6 + 1 
216e : 2a __ __ ROL
216f : 06 1b __ ASL ACCU + 0 
2171 : 2a __ __ ROL
2172 : aa __ __ TAX
2173 : 18 __ __ CLC
2174 : a5 1b __ LDA ACCU + 0 
2176 : 65 4d __ ADC T6 + 0 
2178 : 85 4d __ STA T6 + 0 
217a : 8a __ __ TXA
217b : 65 4e __ ADC T6 + 1 
217d : 06 4d __ ASL T6 + 0 
217f : 2a __ __ ROL
2180 : a8 __ __ TAY
2181 : 18 __ __ CLC
2182 : a5 4d __ LDA T6 + 0 
2184 : 65 4c __ ADC T4 + 0 
2186 : 90 c1 __ BCC $2149 ; (printf.s1091 + 0)
.s1090:
2188 : c8 __ __ INY
2189 : b0 be __ BCS $2149 ; (printf.s1091 + 0)
.s43:
218b : 86 1c __ STX ACCU + 1 
218d : a6 4d __ LDX T6 + 0 
218f : 8e b8 bf STX $bfb8 ; (si + 2)
.s40:
2192 : c9 64 __ CMP #$64
2194 : f0 04 __ BEQ $219a ; (printf.s45 + 0)
.s48:
2196 : c9 44 __ CMP #$44
2198 : d0 05 __ BNE $219f ; (printf.s46 + 0)
.s45:
219a : a9 01 __ LDA #$01
219c : 4c 0a 23 JMP $230a ; (printf.s247 + 0)
.s46:
219f : c9 75 __ CMP #$75
21a1 : d0 03 __ BNE $21a6 ; (printf.s52 + 0)
21a3 : 4c 08 23 JMP $2308 ; (printf.s269 + 0)
.s52:
21a6 : c9 55 __ CMP #$55
21a8 : d0 03 __ BNE $21ad ; (printf.s50 + 0)
21aa : 4c 08 23 JMP $2308 ; (printf.s269 + 0)
.s50:
21ad : c9 78 __ CMP #$78
21af : f0 04 __ BEQ $21b5 ; (printf.s53 + 0)
.s56:
21b1 : c9 58 __ CMP #$58
21b3 : d0 0d __ BNE $21c2 ; (printf.s54 + 0)
.s53:
21b5 : a9 10 __ LDA #$10
21b7 : 8d b9 bf STA $bfb9 ; (si + 3)
21ba : a9 00 __ LDA #$00
21bc : 8d ba bf STA $bfba ; (si + 4)
21bf : 4c 08 23 JMP $2308 ; (printf.s269 + 0)
.s54:
21c2 : c9 6c __ CMP #$6c
21c4 : d0 03 __ BNE $21c9 ; (printf.s60 + 0)
21c6 : 4c 9a 22 JMP $229a ; (printf.s57 + 0)
.s60:
21c9 : c9 4c __ CMP #$4c
21cb : d0 03 __ BNE $21d0 ; (printf.s58 + 0)
21cd : 4c 9a 22 JMP $229a ; (printf.s57 + 0)
.s58:
21d0 : c9 73 __ CMP #$73
21d2 : f0 39 __ BEQ $220d ; (printf.s73 + 0)
.s76:
21d4 : c9 53 __ CMP #$53
21d6 : f0 35 __ BEQ $220d ; (printf.s73 + 0)
.s74:
21d8 : c9 63 __ CMP #$63
21da : f0 15 __ BEQ $21f1 ; (printf.s104 + 0)
.s107:
21dc : c9 43 __ CMP #$43
21de : f0 11 __ BEQ $21f1 ; (printf.s104 + 0)
.s105:
21e0 : 09 00 __ ORA #$00
21e2 : d0 03 __ BNE $21e7 ; (printf.s108 + 0)
21e4 : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s108:
21e7 : a6 49 __ LDX T2 + 0 
21e9 : 9d be bf STA $bfbe,x ; (buff + 0)
21ec : e6 49 __ INC T2 + 0 
21ee : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s104:
21f1 : a0 00 __ LDY #$00
21f3 : b1 47 __ LDA (T0 + 0),y 
21f5 : a6 49 __ LDX T2 + 0 
21f7 : 9d be bf STA $bfbe,x ; (buff + 0)
21fa : e6 49 __ INC T2 + 0 
.s244:
21fc : 18 __ __ CLC
21fd : a5 47 __ LDA T0 + 0 
21ff : 69 02 __ ADC #$02
2201 : 85 47 __ STA T0 + 0 
2203 : b0 03 __ BCS $2208 ; (printf.s1082 + 0)
2205 : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s1082:
2208 : e6 48 __ INC T0 + 1 
220a : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s73:
220d : a0 00 __ LDY #$00
220f : 84 4c __ STY T4 + 0 
2211 : b1 47 __ LDA (T0 + 0),y 
2213 : 85 4d __ STA T6 + 0 
2215 : c8 __ __ INY
2216 : b1 47 __ LDA (T0 + 0),y 
2218 : 85 4e __ STA T6 + 1 
221a : 18 __ __ CLC
221b : a5 47 __ LDA T0 + 0 
221d : 69 02 __ ADC #$02
221f : 85 47 __ STA T0 + 0 
2221 : 90 02 __ BCC $2225 ; (printf.s1089 + 0)
.s1088:
2223 : e6 48 __ INC T0 + 1 
.s1089:
2225 : ad b7 bf LDA $bfb7 ; (si + 1)
2228 : f0 0d __ BEQ $2237 ; (printf.s79 + 0)
.s1075:
222a : a0 00 __ LDY #$00
222c : b1 4d __ LDA (T6 + 0),y 
222e : f0 05 __ BEQ $2235 ; (printf.s1076 + 0)
.l81:
2230 : c8 __ __ INY
2231 : b1 4d __ LDA (T6 + 0),y 
2233 : d0 fb __ BNE $2230 ; (printf.l81 + 0)
.s1076:
2235 : 84 4c __ STY T4 + 0 
.s79:
2237 : ad bc bf LDA $bfbc ; (si + 6)
223a : d0 1a __ BNE $2256 ; (printf.s85 + 0)
.s1073:
223c : a4 4c __ LDY T4 + 0 
223e : cc b7 bf CPY $bfb7 ; (si + 1)
2241 : a6 49 __ LDX T2 + 0 
2243 : b0 0d __ BCS $2252 ; (printf.s1074 + 0)
.l87:
2245 : ad b6 bf LDA $bfb6 ; (si + 0)
2248 : 9d be bf STA $bfbe,x ; (buff + 0)
224b : e8 __ __ INX
224c : c8 __ __ INY
224d : cc b7 bf CPY $bfb7 ; (si + 1)
2250 : 90 f3 __ BCC $2245 ; (printf.l87 + 0)
.s1074:
2252 : 86 49 __ STX T2 + 0 
2254 : 84 4c __ STY T4 + 0 
.s85:
2256 : a4 49 __ LDY T2 + 0 
2258 : f0 12 __ BEQ $226c ; (printf.s238 + 0)
.s92:
225a : a9 be __ LDA #$be
225c : 85 0d __ STA P0 ; (fmt + 0)
225e : a9 bf __ LDA #$bf
2260 : 85 0e __ STA P1 ; (fmt + 1)
2262 : a9 00 __ LDA #$00
2264 : 85 49 __ STA T2 + 0 
2266 : 99 be bf STA $bfbe,y ; (buff + 0)
2269 : 20 39 23 JSR $2339 ; (puts.s0 + 0)
.s238:
226c : a5 4d __ LDA T6 + 0 
226e : 85 0d __ STA P0 ; (fmt + 0)
2270 : a5 4e __ LDA T6 + 1 
2272 : 85 0e __ STA P1 ; (fmt + 1)
2274 : 20 39 23 JSR $2339 ; (puts.s0 + 0)
2277 : ad bc bf LDA $bfbc ; (si + 6)
227a : d0 03 __ BNE $227f ; (printf.s1071 + 0)
227c : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s1071:
227f : a4 4c __ LDY T4 + 0 
2281 : cc b7 bf CPY $bfb7 ; (si + 1)
2284 : a2 00 __ LDX #$00
2286 : b0 0d __ BCS $2295 ; (printf.s1077 + 0)
.l102:
2288 : ad b6 bf LDA $bfb6 ; (si + 0)
228b : 9d be bf STA $bfbe,x ; (buff + 0)
228e : e8 __ __ INX
228f : c8 __ __ INY
2290 : cc b7 bf CPY $bfb7 ; (si + 1)
2293 : 90 f3 __ BCC $2288 ; (printf.l102 + 0)
.s1077:
2295 : 86 49 __ STX T2 + 0 
2297 : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s57:
229a : a0 00 __ LDY #$00
229c : b1 47 __ LDA (T0 + 0),y 
229e : 85 11 __ STA P4 
22a0 : c8 __ __ INY
22a1 : b1 47 __ LDA (T0 + 0),y 
22a3 : 85 12 __ STA P5 
22a5 : c8 __ __ INY
22a6 : b1 47 __ LDA (T0 + 0),y 
22a8 : 85 13 __ STA P6 
22aa : c8 __ __ INY
22ab : b1 47 __ LDA (T0 + 0),y 
22ad : 85 14 __ STA P7 
22af : 18 __ __ CLC
22b0 : a5 47 __ LDA T0 + 0 
22b2 : 69 04 __ ADC #$04
22b4 : 85 47 __ STA T0 + 0 
22b6 : 90 02 __ BCC $22ba ; (printf.s1085 + 0)
.s1084:
22b8 : e6 48 __ INC T0 + 1 
.s1085:
22ba : a0 00 __ LDY #$00
22bc : b1 4a __ LDA (T3 + 0),y 
22be : aa __ __ TAX
22bf : e6 4a __ INC T3 + 0 
22c1 : d0 02 __ BNE $22c5 ; (printf.s1087 + 0)
.s1086:
22c3 : e6 4b __ INC T3 + 1 
.s1087:
22c5 : 8a __ __ TXA
22c6 : e0 64 __ CPX #$64
22c8 : f0 04 __ BEQ $22ce ; (printf.s61 + 0)
.s64:
22ca : c9 44 __ CMP #$44
22cc : d0 04 __ BNE $22d2 ; (printf.s62 + 0)
.s61:
22ce : a9 01 __ LDA #$01
22d0 : d0 1c __ BNE $22ee ; (printf.s245 + 0)
.s62:
22d2 : c9 75 __ CMP #$75
22d4 : f0 17 __ BEQ $22ed ; (printf.s268 + 0)
.s68:
22d6 : c9 55 __ CMP #$55
22d8 : f0 13 __ BEQ $22ed ; (printf.s268 + 0)
.s66:
22da : c9 78 __ CMP #$78
22dc : f0 07 __ BEQ $22e5 ; (printf.s69 + 0)
.s72:
22de : c9 58 __ CMP #$58
22e0 : f0 03 __ BEQ $22e5 ; (printf.s69 + 0)
22e2 : 4c 26 20 JMP $2026 ; (printf.l2 + 0)
.s69:
22e5 : 8c ba bf STY $bfba ; (si + 4)
22e8 : a9 10 __ LDA #$10
22ea : 8d b9 bf STA $bfb9 ; (si + 3)
.s268:
22ed : 98 __ __ TYA
.s245:
22ee : 85 15 __ STA P8 
22f0 : a9 be __ LDA #$be
22f2 : 85 0f __ STA P2 ; (fmt + 2)
22f4 : a9 bf __ LDA #$bf
22f6 : 85 0e __ STA P1 ; (fmt + 1)
22f8 : a9 bf __ LDA #$bf
22fa : 85 10 __ STA P3 ; (fmt + 3)
22fc : a9 b6 __ LDA #$b6
22fe : 85 0d __ STA P0 ; (fmt + 0)
2300 : 20 c9 24 JSR $24c9 ; (nforml.s0 + 0)
2303 : a5 1b __ LDA ACCU + 0 
2305 : 4c 5f 20 JMP $205f ; (printf.s1068 + 0)
.s269:
2308 : a9 00 __ LDA #$00
.s247:
230a : 85 13 __ STA P6 
230c : a9 be __ LDA #$be
230e : 85 0f __ STA P2 ; (fmt + 2)
2310 : a9 bf __ LDA #$bf
2312 : 85 10 __ STA P3 ; (fmt + 3)
2314 : a0 00 __ LDY #$00
2316 : b1 47 __ LDA (T0 + 0),y 
2318 : 85 11 __ STA P4 
231a : c8 __ __ INY
231b : b1 47 __ LDA (T0 + 0),y 
231d : 85 12 __ STA P5 
231f : a9 b6 __ LDA #$b6
2321 : 85 0d __ STA P0 ; (fmt + 0)
2323 : a9 bf __ LDA #$bf
2325 : 85 0e __ STA P1 ; (fmt + 1)
2327 : 20 8e 23 JSR $238e ; (nformi.s0 + 0)
232a : a5 1b __ LDA ACCU + 0 
232c : 85 49 __ STA T2 + 0 
232e : 4c fc 21 JMP $21fc ; (printf.s244 + 0)
--------------------------------------------------------------------
puts@proxy: ; puts@proxy
2331 : a9 be __ LDA #$be
2333 : 85 0d __ STA P0 
2335 : a9 bf __ LDA #$bf
2337 : 85 0e __ STA P1 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
.s0:
2339 : a0 00 __ LDY #$00
233b : b1 0d __ LDA (P0),y 
233d : f0 0b __ BEQ $234a ; (puts.s1001 + 0)
233f : 20 4b 23 JSR $234b ; (putpch + 0)
2342 : e6 0d __ INC P0 
2344 : d0 f3 __ BNE $2339 ; (puts.s0 + 0)
2346 : e6 0e __ INC P1 
2348 : d0 ef __ BNE $2339 ; (puts.s0 + 0)
.s1001:
234a : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch
234b : ae 9c 30 LDX $309c ; (giocharmap + 0)
234e : e0 01 __ CPX #$01
2350 : 90 26 __ BCC $2378 ; (putpch + 45)
2352 : c9 0a __ CMP #$0a
2354 : d0 02 __ BNE $2358 ; (putpch + 13)
2356 : a9 0d __ LDA #$0d
2358 : c9 09 __ CMP #$09
235a : f0 1f __ BEQ $237b ; (putpch + 48)
235c : e0 02 __ CPX #$02
235e : 90 18 __ BCC $2378 ; (putpch + 45)
2360 : c9 41 __ CMP #$41
2362 : 90 14 __ BCC $2378 ; (putpch + 45)
2364 : c9 7b __ CMP #$7b
2366 : b0 10 __ BCS $2378 ; (putpch + 45)
2368 : c9 61 __ CMP #$61
236a : b0 04 __ BCS $2370 ; (putpch + 37)
236c : c9 5b __ CMP #$5b
236e : b0 08 __ BCS $2378 ; (putpch + 45)
2370 : 49 20 __ EOR #$20
2372 : e0 03 __ CPX #$03
2374 : f0 02 __ BEQ $2378 ; (putpch + 45)
2376 : 29 df __ AND #$df
2378 : 4c d2 ff JMP $ffd2 
237b : 38 __ __ SEC
237c : 20 f0 ff JSR $fff0 
237f : 98 __ __ TYA
2380 : 29 03 __ AND #$03
2382 : 49 03 __ EOR #$03
2384 : aa __ __ TAX
2385 : a9 20 __ LDA #$20
2387 : 20 d2 ff JSR $ffd2 
238a : ca __ __ DEX
238b : 10 fa __ BPL $2387 ; (putpch + 60)
238d : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->i16
.s0:
238e : a9 00 __ LDA #$00
2390 : 85 43 __ STA T0 + 0 
2392 : a5 13 __ LDA P6 ; (s + 0)
2394 : f0 19 __ BEQ $23af ; (nformi.s3 + 0)
.s4:
2396 : 24 12 __ BIT P5 ; (v + 1)
2398 : 10 15 __ BPL $23af ; (nformi.s3 + 0)
.s1:
239a : 38 __ __ SEC
239b : a9 00 __ LDA #$00
239d : e5 11 __ SBC P4 ; (v + 0)
239f : 85 11 __ STA P4 ; (v + 0)
23a1 : a9 00 __ LDA #$00
23a3 : e5 12 __ SBC P5 ; (v + 1)
23a5 : 85 12 __ STA P5 ; (v + 1)
23a7 : e6 43 __ INC T0 + 0 
23a9 : a9 10 __ LDA #$10
23ab : 85 44 __ STA T2 + 0 
23ad : d0 0a __ BNE $23b9 ; (nformi.s42 + 0)
.s3:
23af : a9 10 __ LDA #$10
23b1 : 85 44 __ STA T2 + 0 
23b3 : a5 11 __ LDA P4 ; (v + 0)
23b5 : 05 12 __ ORA P5 ; (v + 1)
23b7 : f0 46 __ BEQ $23ff ; (nformi.s7 + 0)
.s42:
23b9 : a0 03 __ LDY #$03
23bb : b1 0d __ LDA (P0),y ; (si + 0)
23bd : 85 45 __ STA T3 + 0 
23bf : c8 __ __ INY
23c0 : b1 0d __ LDA (P0),y ; (si + 0)
23c2 : 85 46 __ STA T3 + 1 
.l6:
23c4 : a5 11 __ LDA P4 ; (v + 0)
23c6 : 85 1b __ STA ACCU + 0 
23c8 : a5 12 __ LDA P5 ; (v + 1)
23ca : 85 1c __ STA ACCU + 1 
23cc : a5 45 __ LDA T3 + 0 
23ce : 85 03 __ STA WORK + 0 
23d0 : a5 46 __ LDA T3 + 1 
23d2 : 85 04 __ STA WORK + 1 
23d4 : 20 32 2f JSR $2f32 ; (divmod + 0)
23d7 : a5 06 __ LDA WORK + 3 
23d9 : 30 08 __ BMI $23e3 ; (nformi.s78 + 0)
.s1019:
23db : d0 0a __ BNE $23e7 ; (nformi.s77 + 0)
.s1018:
23dd : a5 05 __ LDA WORK + 2 
23df : c9 0a __ CMP #$0a
23e1 : b0 04 __ BCS $23e7 ; (nformi.s77 + 0)
.s78:
23e3 : a9 30 __ LDA #$30
23e5 : d0 02 __ BNE $23e9 ; (nformi.s79 + 0)
.s77:
23e7 : a9 37 __ LDA #$37
.s79:
23e9 : c6 44 __ DEC T2 + 0 
23eb : 18 __ __ CLC
23ec : 65 05 __ ADC WORK + 2 
23ee : a6 44 __ LDX T2 + 0 
23f0 : 9d f0 bf STA $bff0,x ; (buffer + 0)
23f3 : a5 1b __ LDA ACCU + 0 
23f5 : 85 11 __ STA P4 ; (v + 0)
23f7 : a5 1c __ LDA ACCU + 1 
23f9 : 85 12 __ STA P5 ; (v + 1)
23fb : 05 11 __ ORA P4 ; (v + 0)
23fd : d0 c5 __ BNE $23c4 ; (nformi.l6 + 0)
.s7:
23ff : a0 02 __ LDY #$02
2401 : b1 0d __ LDA (P0),y ; (si + 0)
2403 : c9 ff __ CMP #$ff
2405 : d0 04 __ BNE $240b ; (nformi.s80 + 0)
.s81:
2407 : a9 0f __ LDA #$0f
2409 : d0 05 __ BNE $2410 ; (nformi.s1026 + 0)
.s80:
240b : 38 __ __ SEC
240c : a9 10 __ LDA #$10
240e : f1 0d __ SBC (P0),y ; (si + 0)
.s1026:
2410 : a8 __ __ TAY
2411 : c4 44 __ CPY T2 + 0 
2413 : b0 0d __ BCS $2422 ; (nformi.s10 + 0)
.s9:
2415 : a9 30 __ LDA #$30
.l1035:
2417 : c6 44 __ DEC T2 + 0 
2419 : a6 44 __ LDX T2 + 0 
241b : 9d f0 bf STA $bff0,x ; (buffer + 0)
241e : c4 44 __ CPY T2 + 0 
2420 : 90 f5 __ BCC $2417 ; (nformi.l1035 + 0)
.s10:
2422 : a0 07 __ LDY #$07
2424 : b1 0d __ LDA (P0),y ; (si + 0)
2426 : f0 20 __ BEQ $2448 ; (nformi.s13 + 0)
.s14:
2428 : a0 04 __ LDY #$04
242a : b1 0d __ LDA (P0),y ; (si + 0)
242c : d0 1a __ BNE $2448 ; (nformi.s13 + 0)
.s1013:
242e : 88 __ __ DEY
242f : b1 0d __ LDA (P0),y ; (si + 0)
2431 : c9 10 __ CMP #$10
2433 : d0 13 __ BNE $2448 ; (nformi.s13 + 0)
.s11:
2435 : a9 58 __ LDA #$58
2437 : a6 44 __ LDX T2 + 0 
2439 : 9d ef bf STA $bfef,x ; (buff + 49)
243c : 8a __ __ TXA
243d : 18 __ __ CLC
243e : 69 fe __ ADC #$fe
2440 : 85 44 __ STA T2 + 0 
2442 : aa __ __ TAX
2443 : a9 30 __ LDA #$30
2445 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
2448 : a9 00 __ LDA #$00
244a : 85 1b __ STA ACCU + 0 
244c : a5 43 __ LDA T0 + 0 
244e : f0 06 __ BEQ $2456 ; (nformi.s16 + 0)
.s15:
2450 : c6 44 __ DEC T2 + 0 
2452 : a9 2d __ LDA #$2d
2454 : d0 0a __ BNE $2460 ; (nformi.s1025 + 0)
.s16:
2456 : a0 05 __ LDY #$05
2458 : b1 0d __ LDA (P0),y ; (si + 0)
245a : f0 09 __ BEQ $2465 ; (nformi.s162 + 0)
.s18:
245c : c6 44 __ DEC T2 + 0 
245e : a9 2b __ LDA #$2b
.s1025:
2460 : a6 44 __ LDX T2 + 0 
2462 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s162:
2465 : a0 06 __ LDY #$06
2467 : b1 0d __ LDA (P0),y ; (si + 0)
2469 : d0 33 __ BNE $249e ; (nformi.s24 + 0)
.l30:
246b : a0 01 __ LDY #$01
246d : b1 0d __ LDA (P0),y ; (si + 0)
246f : 18 __ __ CLC
2470 : 65 44 __ ADC T2 + 0 
2472 : b0 04 __ BCS $2478 ; (nformi.s31 + 0)
.s1006:
2474 : c9 11 __ CMP #$11
2476 : 90 0d __ BCC $2485 ; (nformi.s33 + 0)
.s31:
2478 : c6 44 __ DEC T2 + 0 
247a : a0 00 __ LDY #$00
247c : b1 0d __ LDA (P0),y ; (si + 0)
247e : a6 44 __ LDX T2 + 0 
2480 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2483 : b0 e6 __ BCS $246b ; (nformi.l30 + 0)
.s33:
2485 : a6 44 __ LDX T2 + 0 
2487 : e0 10 __ CPX #$10
2489 : b0 0e __ BCS $2499 ; (nformi.s23 + 0)
.s34:
248b : 88 __ __ DEY
.l1022:
248c : bd f0 bf LDA $bff0,x ; (buffer + 0)
248f : 91 0f __ STA (P2),y ; (str + 0)
2491 : c8 __ __ INY
2492 : e8 __ __ INX
2493 : e0 10 __ CPX #$10
2495 : 90 f5 __ BCC $248c ; (nformi.l1022 + 0)
.s1023:
2497 : 84 1b __ STY ACCU + 0 
.s23:
2499 : a9 00 __ LDA #$00
249b : 85 1c __ STA ACCU + 1 
.s1001:
249d : 60 __ __ RTS
.s24:
249e : a6 44 __ LDX T2 + 0 
24a0 : e0 10 __ CPX #$10
24a2 : b0 1a __ BCS $24be ; (nformi.l27 + 0)
.s25:
24a4 : a0 00 __ LDY #$00
.l1020:
24a6 : bd f0 bf LDA $bff0,x ; (buffer + 0)
24a9 : 91 0f __ STA (P2),y ; (str + 0)
24ab : c8 __ __ INY
24ac : e8 __ __ INX
24ad : e0 10 __ CPX #$10
24af : 90 f5 __ BCC $24a6 ; (nformi.l1020 + 0)
.s1021:
24b1 : 84 1b __ STY ACCU + 0 
24b3 : b0 09 __ BCS $24be ; (nformi.l27 + 0)
.s28:
24b5 : 88 __ __ DEY
24b6 : b1 0d __ LDA (P0),y ; (si + 0)
24b8 : a4 1b __ LDY ACCU + 0 
24ba : 91 0f __ STA (P2),y ; (str + 0)
24bc : e6 1b __ INC ACCU + 0 
.l27:
24be : a5 1b __ LDA ACCU + 0 
24c0 : a0 01 __ LDY #$01
24c2 : d1 0d __ CMP (P0),y ; (si + 0)
24c4 : 90 ef __ BCC $24b5 ; (nformi.s28 + 0)
24c6 : 4c 99 24 JMP $2499 ; (nformi.s23 + 0)
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->i16
.s0:
24c9 : a9 00 __ LDA #$00
24cb : 85 43 __ STA T0 + 0 
24cd : a5 15 __ LDA P8 ; (s + 0)
24cf : f0 21 __ BEQ $24f2 ; (nforml.s182 + 0)
.s4:
24d1 : a5 14 __ LDA P7 ; (v + 3)
24d3 : f0 1d __ BEQ $24f2 ; (nforml.s182 + 0)
.s1032:
24d5 : 10 1b __ BPL $24f2 ; (nforml.s182 + 0)
.s1:
24d7 : 38 __ __ SEC
24d8 : a9 00 __ LDA #$00
24da : e5 11 __ SBC P4 ; (v + 0)
24dc : 85 11 __ STA P4 ; (v + 0)
24de : a9 00 __ LDA #$00
24e0 : e5 12 __ SBC P5 ; (v + 1)
24e2 : 85 12 __ STA P5 ; (v + 1)
24e4 : a9 00 __ LDA #$00
24e6 : e5 13 __ SBC P6 ; (v + 2)
24e8 : 85 13 __ STA P6 ; (v + 2)
24ea : a9 00 __ LDA #$00
24ec : e5 14 __ SBC P7 ; (v + 3)
24ee : 85 14 __ STA P7 ; (v + 3)
24f0 : e6 43 __ INC T0 + 0 
.s182:
24f2 : a9 10 __ LDA #$10
24f4 : 85 44 __ STA T2 + 0 
24f6 : a5 14 __ LDA P7 ; (v + 3)
24f8 : d0 0c __ BNE $2506 ; (nforml.s42 + 0)
.s1024:
24fa : a5 13 __ LDA P6 ; (v + 2)
24fc : d0 08 __ BNE $2506 ; (nforml.s42 + 0)
.s1025:
24fe : a5 12 __ LDA P5 ; (v + 1)
2500 : d0 04 __ BNE $2506 ; (nforml.s42 + 0)
.s1026:
2502 : c5 11 __ CMP P4 ; (v + 0)
2504 : b0 0e __ BCS $2514 ; (nforml.s7 + 0)
.s42:
2506 : a0 03 __ LDY #$03
2508 : b1 0d __ LDA (P0),y ; (si + 0)
250a : 85 45 __ STA T5 + 0 
250c : c8 __ __ INY
250d : b1 0d __ LDA (P0),y ; (si + 0)
250f : 85 46 __ STA T5 + 1 
2511 : 4c de 25 JMP $25de ; (nforml.l6 + 0)
.s7:
2514 : a0 02 __ LDY #$02
2516 : b1 0d __ LDA (P0),y ; (si + 0)
2518 : c9 ff __ CMP #$ff
251a : d0 04 __ BNE $2520 ; (nforml.s80 + 0)
.s81:
251c : a9 0f __ LDA #$0f
251e : d0 05 __ BNE $2525 ; (nforml.s1039 + 0)
.s80:
2520 : 38 __ __ SEC
2521 : a9 10 __ LDA #$10
2523 : f1 0d __ SBC (P0),y ; (si + 0)
.s1039:
2525 : a8 __ __ TAY
2526 : c4 44 __ CPY T2 + 0 
2528 : b0 0d __ BCS $2537 ; (nforml.s10 + 0)
.s9:
252a : a9 30 __ LDA #$30
.l1048:
252c : c6 44 __ DEC T2 + 0 
252e : a6 44 __ LDX T2 + 0 
2530 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2533 : c4 44 __ CPY T2 + 0 
2535 : 90 f5 __ BCC $252c ; (nforml.l1048 + 0)
.s10:
2537 : a0 07 __ LDY #$07
2539 : b1 0d __ LDA (P0),y ; (si + 0)
253b : f0 20 __ BEQ $255d ; (nforml.s13 + 0)
.s14:
253d : a0 04 __ LDY #$04
253f : b1 0d __ LDA (P0),y ; (si + 0)
2541 : d0 1a __ BNE $255d ; (nforml.s13 + 0)
.s1013:
2543 : 88 __ __ DEY
2544 : b1 0d __ LDA (P0),y ; (si + 0)
2546 : c9 10 __ CMP #$10
2548 : d0 13 __ BNE $255d ; (nforml.s13 + 0)
.s11:
254a : a9 58 __ LDA #$58
254c : a6 44 __ LDX T2 + 0 
254e : 9d ef bf STA $bfef,x ; (buff + 49)
2551 : 8a __ __ TXA
2552 : 18 __ __ CLC
2553 : 69 fe __ ADC #$fe
2555 : 85 44 __ STA T2 + 0 
2557 : aa __ __ TAX
2558 : a9 30 __ LDA #$30
255a : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s13:
255d : a9 00 __ LDA #$00
255f : 85 1b __ STA ACCU + 0 
2561 : a5 43 __ LDA T0 + 0 
2563 : f0 06 __ BEQ $256b ; (nforml.s16 + 0)
.s15:
2565 : c6 44 __ DEC T2 + 0 
2567 : a9 2d __ LDA #$2d
2569 : d0 0a __ BNE $2575 ; (nforml.s1038 + 0)
.s16:
256b : a0 05 __ LDY #$05
256d : b1 0d __ LDA (P0),y ; (si + 0)
256f : f0 09 __ BEQ $257a ; (nforml.s163 + 0)
.s18:
2571 : c6 44 __ DEC T2 + 0 
2573 : a9 2b __ LDA #$2b
.s1038:
2575 : a6 44 __ LDX T2 + 0 
2577 : 9d f0 bf STA $bff0,x ; (buffer + 0)
.s163:
257a : a0 06 __ LDY #$06
257c : b1 0d __ LDA (P0),y ; (si + 0)
257e : d0 33 __ BNE $25b3 ; (nforml.s24 + 0)
.l30:
2580 : a0 01 __ LDY #$01
2582 : b1 0d __ LDA (P0),y ; (si + 0)
2584 : 18 __ __ CLC
2585 : 65 44 __ ADC T2 + 0 
2587 : b0 04 __ BCS $258d ; (nforml.s31 + 0)
.s1006:
2589 : c9 11 __ CMP #$11
258b : 90 0d __ BCC $259a ; (nforml.s33 + 0)
.s31:
258d : c6 44 __ DEC T2 + 0 
258f : a0 00 __ LDY #$00
2591 : b1 0d __ LDA (P0),y ; (si + 0)
2593 : a6 44 __ LDX T2 + 0 
2595 : 9d f0 bf STA $bff0,x ; (buffer + 0)
2598 : b0 e6 __ BCS $2580 ; (nforml.l30 + 0)
.s33:
259a : a6 44 __ LDX T2 + 0 
259c : e0 10 __ CPX #$10
259e : b0 0e __ BCS $25ae ; (nforml.s23 + 0)
.s34:
25a0 : 88 __ __ DEY
.l1035:
25a1 : bd f0 bf LDA $bff0,x ; (buffer + 0)
25a4 : 91 0f __ STA (P2),y ; (str + 0)
25a6 : c8 __ __ INY
25a7 : e8 __ __ INX
25a8 : e0 10 __ CPX #$10
25aa : 90 f5 __ BCC $25a1 ; (nforml.l1035 + 0)
.s1036:
25ac : 84 1b __ STY ACCU + 0 
.s23:
25ae : a9 00 __ LDA #$00
25b0 : 85 1c __ STA ACCU + 1 
.s1001:
25b2 : 60 __ __ RTS
.s24:
25b3 : a6 44 __ LDX T2 + 0 
25b5 : e0 10 __ CPX #$10
25b7 : b0 1a __ BCS $25d3 ; (nforml.l27 + 0)
.s25:
25b9 : a0 00 __ LDY #$00
.l1033:
25bb : bd f0 bf LDA $bff0,x ; (buffer + 0)
25be : 91 0f __ STA (P2),y ; (str + 0)
25c0 : c8 __ __ INY
25c1 : e8 __ __ INX
25c2 : e0 10 __ CPX #$10
25c4 : 90 f5 __ BCC $25bb ; (nforml.l1033 + 0)
.s1034:
25c6 : 84 1b __ STY ACCU + 0 
25c8 : b0 09 __ BCS $25d3 ; (nforml.l27 + 0)
.s28:
25ca : 88 __ __ DEY
25cb : b1 0d __ LDA (P0),y ; (si + 0)
25cd : a4 1b __ LDY ACCU + 0 
25cf : 91 0f __ STA (P2),y ; (str + 0)
25d1 : e6 1b __ INC ACCU + 0 
.l27:
25d3 : a5 1b __ LDA ACCU + 0 
25d5 : a0 01 __ LDY #$01
25d7 : d1 0d __ CMP (P0),y ; (si + 0)
25d9 : 90 ef __ BCC $25ca ; (nforml.s28 + 0)
25db : 4c ae 25 JMP $25ae ; (nforml.s23 + 0)
.l6:
25de : a5 11 __ LDA P4 ; (v + 0)
25e0 : 85 1b __ STA ACCU + 0 
25e2 : a5 12 __ LDA P5 ; (v + 1)
25e4 : 85 1c __ STA ACCU + 1 
25e6 : a5 13 __ LDA P6 ; (v + 2)
25e8 : 85 1d __ STA ACCU + 2 
25ea : a5 14 __ LDA P7 ; (v + 3)
25ec : 85 1e __ STA ACCU + 3 
25ee : a5 45 __ LDA T5 + 0 
25f0 : 85 03 __ STA WORK + 0 
25f2 : a5 46 __ LDA T5 + 1 
25f4 : 85 04 __ STA WORK + 1 
25f6 : a9 00 __ LDA #$00
25f8 : 85 05 __ STA WORK + 2 
25fa : 85 06 __ STA WORK + 3 
25fc : 20 b7 2f JSR $2fb7 ; (divmod32 + 0)
25ff : a5 08 __ LDA WORK + 5 
2601 : 30 08 __ BMI $260b ; (nforml.s78 + 0)
.s1023:
2603 : d0 0a __ BNE $260f ; (nforml.s77 + 0)
.s1022:
2605 : a5 07 __ LDA WORK + 4 
2607 : c9 0a __ CMP #$0a
2609 : b0 04 __ BCS $260f ; (nforml.s77 + 0)
.s78:
260b : a9 30 __ LDA #$30
260d : d0 02 __ BNE $2611 ; (nforml.s79 + 0)
.s77:
260f : a9 37 __ LDA #$37
.s79:
2611 : c6 44 __ DEC T2 + 0 
2613 : 18 __ __ CLC
2614 : 65 07 __ ADC WORK + 4 
2616 : a6 44 __ LDX T2 + 0 
2618 : 9d f0 bf STA $bff0,x ; (buffer + 0)
261b : a5 1b __ LDA ACCU + 0 
261d : 85 11 __ STA P4 ; (v + 0)
261f : a5 1c __ LDA ACCU + 1 
2621 : 85 12 __ STA P5 ; (v + 1)
2623 : a5 1d __ LDA ACCU + 2 
2625 : 85 13 __ STA P6 ; (v + 2)
2627 : a5 1e __ LDA ACCU + 3 
2629 : 85 14 __ STA P7 ; (v + 3)
262b : d0 b1 __ BNE $25de ; (nforml.l6 + 0)
.s1018:
262d : a5 13 __ LDA P6 ; (v + 2)
262f : d0 ad __ BNE $25de ; (nforml.l6 + 0)
.s1019:
2631 : a5 12 __ LDA P5 ; (v + 1)
2633 : d0 a9 __ BNE $25de ; (nforml.l6 + 0)
.s1020:
2635 : c5 11 __ CMP P4 ; (v + 0)
2637 : 90 a5 __ BCC $25de ; (nforml.l6 + 0)
2639 : 4c 14 25 JMP $2514 ; (nforml.s7 + 0)
--------------------------------------------------------------------
263c : __ __ __ BYT 42 4f 4f 54 44 45 56 49 43 45 3a 20 25 55 0a 00 : BOOTDEVICE: %U..
--------------------------------------------------------------------
264c : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4c 4f 57 20 4d 45 4d 4f : LOADING LOW MEMO
265c : __ __ __ BYT 52 59 20 43 4f 44 45 2e 0a 00                   : RY CODE...
--------------------------------------------------------------------
2666 : __ __ __ BYT 56 44 43 54 45 53 54 4c 4d 43 00                : VDCTESTLMC.
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
.s0:
2671 : a5 0d __ LDA P0 
2673 : 05 0e __ ORA P1 
2675 : f0 08 __ BEQ $267f ; (krnio_setnam.s0 + 14)
2677 : a0 ff __ LDY #$ff
2679 : c8 __ __ INY
267a : b1 0d __ LDA (P0),y 
267c : d0 fb __ BNE $2679 ; (krnio_setnam.s0 + 8)
267e : 98 __ __ TYA
267f : a6 0d __ LDX P0 
2681 : a4 0e __ LDY P1 
2683 : 20 bd ff JSR $ffbd 
.s1001:
2686 : 60 __ __ RTS
--------------------------------------------------------------------
2687 : __ __ __ BYT 4c 4f 41 44 49 4e 47 3a 20 25 53 0a 00          : LOADING: %S..
--------------------------------------------------------------------
krnio_load: ; krnio_load(u8,u8,u8)->bool
.s0:
2694 : a5 0d __ LDA P0 
2696 : a6 0e __ LDX P1 
2698 : a4 0f __ LDY P2 
269a : 20 ba ff JSR $ffba 
269d : a9 00 __ LDA #$00
269f : a8 __ __ TAY
26a0 : 20 d5 ff JSR $ffd5 
26a3 : a9 00 __ LDA #$00
26a5 : 2a __ __ ROL
26a6 : 49 01 __ EOR #$01
.s1001:
26a8 : 60 __ __ RTS
--------------------------------------------------------------------
26a9 : __ __ __ BYT 4c 4f 41 44 49 4e 47 20 4f 56 45 52 4c 41 59 20 : LOADING OVERLAY 
26b9 : __ __ __ BYT 46 49 4c 45 20 46 41 49 4c 45 44 2e 0a 00       : FILE FAILED...
--------------------------------------------------------------------
26c7 : __ __ __ BYT 53 54 41 54 55 53 3a 20 25 44 0a 00             : STATUS: %D..
--------------------------------------------------------------------
exit: ; exit(i16)->void
.s0:
26d3 : a5 0d __ LDA P0 
26d5 : 85 1b __ STA ACCU + 0 
26d7 : a5 0e __ LDA P1 
26d9 : 85 1c __ STA ACCU + 1 
26db : ae 9b 30 LDX $309b ; (spentry + 0)
26de : 9a __ __ TXS
26df : a9 4c __ LDA #$4c
26e1 : 85 54 __ STA $54 
26e3 : a9 00 __ LDA #$00
26e5 : 85 13 __ STA P6 
.s1001:
26e7 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init(u8)->void
.s1000:
26e8 : a5 53 __ LDA T1 + 0 
26ea : 8d a8 bf STA $bfa8 ; (init@stack + 0)
26ed : a5 54 __ LDA T3 + 0 
26ef : 8d a9 bf STA $bfa9 ; (init@stack + 1)
26f2 : a5 55 __ LDA T5 + 0 
26f4 : 8d aa bf STA $bfaa ; (init@stack + 2)
.s0:
26f7 : a9 d4 __ LDA #$d4
26f9 : 8d af bf STA $bfaf ; (pattern + 1)
26fc : 8d b1 bf STA $bfb1 ; (pattern + 3)
26ff : 8d b3 bf STA $bfb3 ; (pattern + 5)
2702 : a9 00 __ LDA #$00
2704 : 8d ae bf STA $bfae ; (pattern + 0)
2707 : a9 aa __ LDA #$aa
2709 : 8d b0 bf STA $bfb0 ; (pattern + 2)
270c : 8d b2 bf STA $bfb2 ; (pattern + 4)
270f : 8d b4 bf STA $bfb4 ; (pattern + 6)
2712 : a9 ff __ LDA #$ff
2714 : 8d b5 bf STA $bfb5 ; (pattern + 7)
2717 : 20 c0 27 JSR $27c0 ; (vdc_init.s1000 + 0)
271a : ad df 31 LDA $31df ; (vdc_state + 7)
271d : d0 10 __ BNE $272f ; (init.s3 + 0)
.s1001:
271f : ad a8 bf LDA $bfa8 ; (init@stack + 0)
2722 : 85 53 __ STA T1 + 0 
2724 : ad a9 bf LDA $bfa9 ; (init@stack + 1)
2727 : 85 54 __ STA T3 + 0 
2729 : ad aa bf LDA $bfaa ; (init@stack + 2)
272c : 85 55 __ STA T5 + 0 
272e : 60 __ __ RTS
.s3:
272f : ad db 31 LDA $31db ; (vdc_state + 3)
2732 : 85 53 __ STA T1 + 0 
2734 : ad dc 31 LDA $31dc ; (vdc_state + 4)
2737 : 4a __ __ LSR
2738 : 66 53 __ ROR T1 + 0 
273a : 4a __ __ LSR
273b : 66 53 __ ROR T1 + 0 
273d : 4a __ __ LSR
273e : 66 53 __ ROR T1 + 0 
2740 : a9 19 __ LDA #$19
2742 : 85 52 __ STA T0 + 0 
2744 : ac e2 31 LDY $31e2 ; (vdc_state + 10)
2747 : ae e3 31 LDX $31e3 ; (vdc_state + 11)
.l6:
274a : a9 00 __ LDA #$00
274c : 85 54 __ STA T3 + 0 
.l10:
274e : 86 0e __ STX P1 
2750 : 84 0d __ STY P0 
2752 : a6 54 __ LDX T3 + 0 
2754 : bd ae bf LDA $bfae,x ; (pattern + 0)
2757 : 85 55 __ STA T5 + 0 
2759 : 20 f5 29 JSR $29f5 ; (vdc_mem_addr.s0 + 0)
.l157:
275c : 2c 00 d6 BIT $d600 
275f : 10 fb __ BPL $275c ; (init.l157 + 0)
.s16:
2761 : a5 55 __ LDA T5 + 0 
2763 : 8d 01 d6 STA $d601 
2766 : a2 18 __ LDX #$18
2768 : 8e 00 d6 STX $d600 
.l159:
276b : 2c 00 d6 BIT $d600 
276e : 10 fb __ BPL $276b ; (init.l159 + 0)
.s22:
2770 : ad 01 d6 LDA $d601 
2773 : 29 7f __ AND #$7f
2775 : 8e 00 d6 STX $d600 
.l161:
2778 : 2c 00 d6 BIT $d600 
277b : 10 fb __ BPL $2778 ; (init.l161 + 0)
.s28:
277d : 8d 01 d6 STA $d601 
2780 : a9 1e __ LDA #$1e
2782 : 8d 00 d6 STA $d600 
.l163:
2785 : 2c 00 d6 BIT $d600 
2788 : 10 fb __ BPL $2785 ; (init.l163 + 0)
.s33:
278a : a5 53 __ LDA T1 + 0 
278c : 8d 01 d6 STA $d601 
278f : 18 __ __ CLC
2790 : 65 0d __ ADC P0 
2792 : a8 __ __ TAY
2793 : a9 00 __ LDA #$00
2795 : 65 0e __ ADC P1 
2797 : e6 54 __ INC T3 + 0 
2799 : aa __ __ TAX
279a : a5 54 __ LDA T3 + 0 
279c : c9 08 __ CMP #$08
279e : 90 ae __ BCC $274e ; (init.l10 + 0)
.s7:
27a0 : c6 52 __ DEC T0 + 0 
27a2 : d0 a6 __ BNE $274a ; (init.l6 + 0)
.s8:
27a4 : a9 00 __ LDA #$00
27a6 : 85 0f __ STA P2 
27a8 : 85 10 __ STA P3 
27aa : a9 d0 __ LDA #$d0
27ac : 85 11 __ STA P4 
27ae : a9 32 __ LDA #$32
27b0 : 85 0e __ STA P1 
27b2 : a9 07 __ LDA #$07
27b4 : 85 12 __ STA P5 
27b6 : a9 90 __ LDA #$90
27b8 : 85 0d __ STA P0 
27ba : 20 a6 2d JSR $2da6 ; (memset.s0 + 0)
27bd : 4c 1f 27 JMP $271f ; (init.s1001 + 0)
--------------------------------------------------------------------
vdc_init: ; vdc_init(u8,u8)->void
.s1000:
27c0 : 38 __ __ SEC
27c1 : a5 23 __ LDA SP + 0 
27c3 : e9 04 __ SBC #$04
27c5 : 85 23 __ STA SP + 0 
27c7 : b0 02 __ BCS $27cb ; (vdc_init.s0 + 0)
27c9 : c6 24 __ DEC SP + 1 
.s0:
27cb : a9 1a __ LDA #$1a
27cd : 8d 00 d6 STA $d600 
.l463:
27d0 : 2c 00 d6 BIT $d600 
27d3 : 10 fb __ BPL $27d0 ; (vdc_init.l463 + 0)
.s7:
27d5 : ad 01 d6 LDA $d601 
27d8 : 29 f0 __ AND #$f0
27da : aa __ __ TAX
27db : a9 1a __ LDA #$1a
27dd : 8d 00 d6 STA $d600 
.l465:
27e0 : 2c 00 d6 BIT $d600 
27e3 : 10 fb __ BPL $27e0 ; (vdc_init.l465 + 0)
.s13:
27e5 : 8e 01 d6 STX $d601 
27e8 : 8d 00 d6 STA $d600 
.l467:
27eb : 2c 00 d6 BIT $d600 
27ee : 10 fb __ BPL $27eb ; (vdc_init.l467 + 0)
.s20:
27f0 : ad 01 d6 LDA $d601 
27f3 : 29 0f __ AND #$0f
27f5 : 09 d0 __ ORA #$d0
27f7 : a2 1a __ LDX #$1a
27f9 : 8e 00 d6 STX $d600 
.l469:
27fc : 2c 00 d6 BIT $d600 
27ff : 10 fb __ BPL $27fc ; (vdc_init.l469 + 0)
.s26:
2801 : 8d 01 d6 STA $d601 
2804 : a9 8d __ LDA #$8d
2806 : 8d e1 31 STA $31e1 ; (vdc_state + 9)
2809 : a9 1c __ LDA #$1c
280b : 8d 00 d6 STA $d600 
.l471:
280e : 2c 00 d6 BIT $d600 
2811 : 10 fb __ BPL $280e ; (vdc_init.l471 + 0)
.s32:
2813 : ad 01 d6 LDA $d601 
2816 : aa __ __ TAX
2817 : 09 10 __ ORA #$10
2819 : a0 1c __ LDY #$1c
281b : 8c 00 d6 STY $d600 
.l473:
281e : 2c 00 d6 BIT $d600 
2821 : 10 fb __ BPL $281e ; (vdc_init.l473 + 0)
.s39:
2823 : 8d 01 d6 STA $d601 
2826 : a9 12 __ LDA #$12
2828 : 8d 00 d6 STA $d600 
.l475:
282b : 2c 00 d6 BIT $d600 
282e : 10 fb __ BPL $282b ; (vdc_init.l475 + 0)
.s46:
2830 : a9 1f __ LDA #$1f
2832 : 8d 01 d6 STA $d601 
2835 : a9 13 __ LDA #$13
2837 : 8d 00 d6 STA $d600 
.l477:
283a : 2c 00 d6 BIT $d600 
283d : 10 fb __ BPL $283a ; (vdc_init.l477 + 0)
.s51:
283f : a9 ff __ LDA #$ff
2841 : 8d 01 d6 STA $d601 
2844 : a9 1f __ LDA #$1f
2846 : 8d 00 d6 STA $d600 
.l479:
2849 : 2c 00 d6 BIT $d600 
284c : 10 fb __ BPL $2849 ; (vdc_init.l479 + 0)
.s55:
284e : a9 00 __ LDA #$00
2850 : 8d 01 d6 STA $d601 
2853 : a9 12 __ LDA #$12
2855 : 8d 00 d6 STA $d600 
.l481:
2858 : 2c 00 d6 BIT $d600 
285b : 10 fb __ BPL $2858 ; (vdc_init.l481 + 0)
.s62:
285d : a9 9f __ LDA #$9f
285f : 8d 01 d6 STA $d601 
2862 : a9 13 __ LDA #$13
2864 : 8d 00 d6 STA $d600 
.l483:
2867 : 2c 00 d6 BIT $d600 
286a : 10 fb __ BPL $2867 ; (vdc_init.l483 + 0)
.s67:
286c : a9 ff __ LDA #$ff
286e : 8d 01 d6 STA $d601 
2871 : a9 1f __ LDA #$1f
2873 : 8d 00 d6 STA $d600 
.l485:
2876 : 2c 00 d6 BIT $d600 
2879 : 10 fb __ BPL $2876 ; (vdc_init.l485 + 0)
.s71:
287b : a9 ff __ LDA #$ff
287d : 8d 01 d6 STA $d601 
2880 : a9 12 __ LDA #$12
2882 : 8d 00 d6 STA $d600 
.l487:
2885 : 2c 00 d6 BIT $d600 
2888 : 10 fb __ BPL $2885 ; (vdc_init.l487 + 0)
.s78:
288a : a9 1f __ LDA #$1f
288c : 8d 01 d6 STA $d601 
288f : a9 13 __ LDA #$13
2891 : 8d 00 d6 STA $d600 
.l489:
2894 : 2c 00 d6 BIT $d600 
2897 : 10 fb __ BPL $2894 ; (vdc_init.l489 + 0)
.s83:
2899 : a9 ff __ LDA #$ff
289b : 8d 01 d6 STA $d601 
289e : a9 1f __ LDA #$1f
28a0 : 8d 00 d6 STA $d600 
.l491:
28a3 : 2c 00 d6 BIT $d600 
28a6 : 10 fb __ BPL $28a3 ; (vdc_init.l491 + 0)
.s87:
28a8 : ad 01 d6 LDA $d601 
28ab : f0 04 __ BEQ $28b1 ; (vdc_init.s1036 + 0)
.s1037:
28ad : a9 10 __ LDA #$10
28af : d0 02 __ BNE $28b3 ; (vdc_init.s1038 + 0)
.s1036:
28b1 : a9 40 __ LDA #$40
.s1038:
28b3 : 8d d8 31 STA $31d8 ; (vdc_state + 0)
28b6 : 8c 00 d6 STY $d600 
.l494:
28b9 : 2c 00 d6 BIT $d600 
28bc : 10 fb __ BPL $28b9 ; (vdc_init.l494 + 0)
.s94:
28be : 8e 01 d6 STX $d601 
28c1 : 20 f7 28 JSR $28f7 ; (vdc_cls.s0 + 0)
28c4 : 24 d7 __ BIT $d7 
28c6 : 30 17 __ BMI $28df ; (vdc_init.s97 + 0)
.s100:
28c8 : a9 19 __ LDA #$19
28ca : a0 02 __ LDY #$02
28cc : 91 23 __ STA (SP + 0),y 
28ce : a9 2a __ LDA #$2a
28d0 : c8 __ __ INY
28d1 : 91 23 __ STA (SP + 0),y 
28d3 : 20 0a 20 JSR $200a ; (printf.s0 + 0)
28d6 : 20 44 2a JSR $2a44 ; (getch.s0 + 0)
28d9 : 20 81 ff JSR $ff81 
28dc : 20 7f 2a JSR $2a7f ; (screen_setmode.s0 + 0)
.s97:
28df : a9 01 __ LDA #$01
28e1 : 20 87 2a JSR $2a87 ; (fastmode.s0 + 0)
28e4 : a9 06 __ LDA #$06
28e6 : 85 15 __ STA P8 
28e8 : 20 a6 2a JSR $2aa6 ; (vdc_set_mode.s1000 + 0)
.s1001:
28eb : 18 __ __ CLC
28ec : a5 23 __ LDA SP + 0 
28ee : 69 04 __ ADC #$04
28f0 : 85 23 __ STA SP + 0 
28f2 : 90 02 __ BCC $28f6 ; (vdc_init.s1001 + 11)
28f4 : e6 24 __ INC SP + 1 
28f6 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_cls: ; vdc_cls()->void
.s0:
28f7 : ad de 31 LDA $31de ; (vdc_state + 6)
28fa : 85 44 __ STA T0 + 1 
28fc : ad dd 31 LDA $31dd ; (vdc_state + 5)
28ff : 85 43 __ STA T0 + 0 
2901 : 05 44 __ ORA T0 + 1 
2903 : d0 01 __ BNE $2906 ; (vdc_cls.s63 + 0)
.s1001:
2905 : 60 __ __ RTS
.s63:
2906 : ae db 31 LDX $31db ; (vdc_state + 3)
2909 : ca __ __ DEX
290a : 86 46 __ STX T2 + 0 
290c : a9 00 __ LDA #$00
290e : 85 47 __ STA T3 + 0 
2910 : 85 48 __ STA T3 + 1 
2912 : ad e1 31 LDA $31e1 ; (vdc_state + 9)
2915 : 85 49 __ STA T4 + 0 
2917 : ad df 31 LDA $31df ; (vdc_state + 7)
291a : 85 45 __ STA T1 + 0 
291c : d0 0f __ BNE $292d ; (vdc_cls.l8 + 0)
.s9:
291e : a5 47 __ LDA T3 + 0 
2920 : 0a __ __ ASL
2921 : aa __ __ TAX
2922 : bd 00 32 LDA $3200,x ; (multab + 0)
2925 : 85 4a __ STA T5 + 0 
2927 : bd 01 32 LDA $3201,x ; (multab + 1)
292a : 4c 48 29 JMP $2948 ; (vdc_cls.l7 + 0)
.l8:
292d : ad db 31 LDA $31db ; (vdc_state + 3)
2930 : 85 1b __ STA ACCU + 0 
2932 : ad dc 31 LDA $31dc ; (vdc_state + 4)
2935 : 85 1c __ STA ACCU + 1 
2937 : a5 47 __ LDA T3 + 0 
2939 : 85 03 __ STA WORK + 0 
293b : a5 48 __ LDA T3 + 1 
293d : 85 04 __ STA WORK + 1 
293f : 20 f0 2e JSR $2ef0 ; (mul16 + 0)
2942 : a5 05 __ LDA WORK + 2 
2944 : 85 4a __ STA T5 + 0 
2946 : a5 06 __ LDA WORK + 3 
.l7:
2948 : 85 4b __ STA T5 + 1 
294a : ad e2 31 LDA $31e2 ; (vdc_state + 10)
294d : 18 __ __ CLC
294e : 65 4a __ ADC T5 + 0 
2950 : 85 0d __ STA P0 
2952 : ad e3 31 LDA $31e3 ; (vdc_state + 11)
2955 : 65 4b __ ADC T5 + 1 
2957 : 85 0e __ STA P1 
2959 : 20 f5 29 JSR $29f5 ; (vdc_mem_addr.s0 + 0)
.l272:
295c : 2c 00 d6 BIT $d600 
295f : 10 fb __ BPL $295c ; (vdc_cls.l272 + 0)
.s16:
2961 : a9 20 __ LDA #$20
2963 : 8d 01 d6 STA $d601 
2966 : a2 18 __ LDX #$18
2968 : 8e 00 d6 STX $d600 
.l274:
296b : 2c 00 d6 BIT $d600 
296e : 10 fb __ BPL $296b ; (vdc_cls.l274 + 0)
.s22:
2970 : ad 01 d6 LDA $d601 
2973 : 29 7f __ AND #$7f
2975 : 8e 00 d6 STX $d600 
.l276:
2978 : 2c 00 d6 BIT $d600 
297b : 10 fb __ BPL $2978 ; (vdc_cls.l276 + 0)
.s28:
297d : 8d 01 d6 STA $d601 
2980 : a9 1e __ LDA #$1e
2982 : 8d 00 d6 STA $d600 
.l278:
2985 : 2c 00 d6 BIT $d600 
2988 : 10 fb __ BPL $2985 ; (vdc_cls.l278 + 0)
.s33:
298a : a5 46 __ LDA T2 + 0 
298c : 8d 01 d6 STA $d601 
298f : ad e4 31 LDA $31e4 ; (vdc_state + 12)
2992 : 18 __ __ CLC
2993 : 65 4a __ ADC T5 + 0 
2995 : 85 0d __ STA P0 
2997 : ad e5 31 LDA $31e5 ; (vdc_state + 13)
299a : 65 4b __ ADC T5 + 1 
299c : 85 0e __ STA P1 
299e : 20 f5 29 JSR $29f5 ; (vdc_mem_addr.s0 + 0)
.l280:
29a1 : 2c 00 d6 BIT $d600 
29a4 : 10 fb __ BPL $29a1 ; (vdc_cls.l280 + 0)
.s37:
29a6 : a5 49 __ LDA T4 + 0 
29a8 : 8d 01 d6 STA $d601 
29ab : a2 18 __ LDX #$18
29ad : 8e 00 d6 STX $d600 
.l282:
29b0 : 2c 00 d6 BIT $d600 
29b3 : 10 fb __ BPL $29b0 ; (vdc_cls.l282 + 0)
.s43:
29b5 : ad 01 d6 LDA $d601 
29b8 : 29 7f __ AND #$7f
29ba : 8e 00 d6 STX $d600 
.l284:
29bd : 2c 00 d6 BIT $d600 
29c0 : 10 fb __ BPL $29bd ; (vdc_cls.l284 + 0)
.s49:
29c2 : 8d 01 d6 STA $d601 
29c5 : a9 1e __ LDA #$1e
29c7 : 8d 00 d6 STA $d600 
.l286:
29ca : 2c 00 d6 BIT $d600 
29cd : 10 fb __ BPL $29ca ; (vdc_cls.l286 + 0)
.s54:
29cf : a5 46 __ LDA T2 + 0 
29d1 : 8d 01 d6 STA $d601 
29d4 : e6 47 __ INC T3 + 0 
29d6 : d0 02 __ BNE $29da ; (vdc_cls.s1021 + 0)
.s1020:
29d8 : e6 48 __ INC T3 + 1 
.s1021:
29da : a5 48 __ LDA T3 + 1 
29dc : c5 44 __ CMP T0 + 1 
29de : d0 04 __ BNE $29e4 ; (vdc_cls.s1003 + 0)
.s1002:
29e0 : a5 47 __ LDA T3 + 0 
29e2 : c5 43 __ CMP T0 + 0 
.s1003:
29e4 : 90 01 __ BCC $29e7 ; (vdc_cls.s3 + 0)
29e6 : 60 __ __ RTS
.s3:
29e7 : a5 45 __ LDA T1 + 0 
29e9 : f0 03 __ BEQ $29ee ; (vdc_cls.s3 + 7)
29eb : 4c 2d 29 JMP $292d ; (vdc_cls.l8 + 0)
29ee : 4c 1e 29 JMP $291e ; (vdc_cls.s9 + 0)
--------------------------------------------------------------------
vdc_mem_addr@proxy: ; vdc_mem_addr@proxy
29f1 : a5 4e __ LDA $4e 
29f3 : 85 0e __ STA P1 
--------------------------------------------------------------------
vdc_mem_addr: ; vdc_mem_addr(u16)->void
.s0:
29f5 : a9 12 __ LDA #$12
29f7 : 8d 00 d6 STA $d600 
.l56:
29fa : 2c 00 d6 BIT $d600 
29fd : 10 fb __ BPL $29fa ; (vdc_mem_addr.l56 + 0)
.s5:
29ff : a5 0e __ LDA P1 ; (addr + 1)
2a01 : 8d 01 d6 STA $d601 
2a04 : a9 13 __ LDA #$13
2a06 : 8d 00 d6 STA $d600 
.l58:
2a09 : 2c 00 d6 BIT $d600 
2a0c : 10 fb __ BPL $2a09 ; (vdc_mem_addr.l58 + 0)
.s10:
2a0e : a5 0d __ LDA P0 ; (addr + 0)
2a10 : 8d 01 d6 STA $d601 
2a13 : a9 1f __ LDA #$1f
2a15 : 8d 00 d6 STA $d600 
.s1001:
2a18 : 60 __ __ RTS
--------------------------------------------------------------------
2a19 : __ __ __ BYT 53 57 49 54 43 48 20 54 4f 20 38 30 20 43 4f 4c : SWITCH TO 80 COL
2a29 : __ __ __ BYT 55 4d 4e 20 53 43 52 45 45 4e 0a 41 4e 44 20 50 : UMN SCREEN.AND P
2a39 : __ __ __ BYT 52 45 53 53 20 4b 45 59 2e 0a 00                : RESS KEY...
--------------------------------------------------------------------
getch: ; getch()->void
.s0:
2a44 : 20 4e 2a JSR $2a4e ; (getpch + 0)
2a47 : c9 00 __ CMP #$00
2a49 : f0 f9 __ BEQ $2a44 ; (getch.s0 + 0)
2a4b : 85 1b __ STA ACCU + 0 
.s1001:
2a4d : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch
2a4e : 20 e4 ff JSR $ffe4 
2a51 : ae 9c 30 LDX $309c ; (giocharmap + 0)
2a54 : e0 01 __ CPX #$01
2a56 : 90 26 __ BCC $2a7e ; (getpch + 48)
2a58 : c9 0d __ CMP #$0d
2a5a : d0 02 __ BNE $2a5e ; (getpch + 16)
2a5c : a9 0a __ LDA #$0a
2a5e : e0 02 __ CPX #$02
2a60 : 90 1c __ BCC $2a7e ; (getpch + 48)
2a62 : c9 db __ CMP #$db
2a64 : b0 18 __ BCS $2a7e ; (getpch + 48)
2a66 : c9 41 __ CMP #$41
2a68 : 90 14 __ BCC $2a7e ; (getpch + 48)
2a6a : c9 c1 __ CMP #$c1
2a6c : 90 02 __ BCC $2a70 ; (getpch + 34)
2a6e : 49 a0 __ EOR #$a0
2a70 : c9 7b __ CMP #$7b
2a72 : b0 0a __ BCS $2a7e ; (getpch + 48)
2a74 : c9 61 __ CMP #$61
2a76 : b0 04 __ BCS $2a7c ; (getpch + 46)
2a78 : c9 5b __ CMP #$5b
2a7a : b0 02 __ BCS $2a7e ; (getpch + 48)
2a7c : 49 20 __ EOR #$20
2a7e : 60 __ __ RTS
--------------------------------------------------------------------
screen_setmode: ; screen_setmode(u8)->void
.s0:
2a7f : 24 d7 __ BIT $d7 
2a81 : 10 01 __ BPL $2a84 ; (screen_setmode.s6 + 0)
.s1001:
2a83 : 60 __ __ RTS
.s6:
2a84 : 4c 5f ff JMP $ff5f 
--------------------------------------------------------------------
fastmode: ; fastmode(u8)->void
.s0:
2a87 : 09 00 __ ORA #$00
2a89 : d0 0d __ BNE $2a98 ; (fastmode.s1 + 0)
.s2:
2a8b : 8d 30 d0 STA $d030 
2a8e : ad 11 d0 LDA $d011 
2a91 : 29 7f __ AND #$7f
2a93 : 09 10 __ ORA #$10
2a95 : 4c a2 2a JMP $2aa2 ; (fastmode.s3 + 0)
.s1:
2a98 : a9 01 __ LDA #$01
2a9a : 8d 30 d0 STA $d030 
2a9d : ad 11 d0 LDA $d011 
2aa0 : 29 6f __ AND #$6f
.s3:
2aa2 : 8d 11 d0 STA $d011 
.s1001:
2aa5 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_mode: ; vdc_set_mode(u8)->void
.s1000:
2aa6 : a2 03 __ LDX #$03
2aa8 : b5 53 __ LDA T3 + 0,x 
2aaa : 9d fc bf STA $bffc,x ; (buffer + 12)
2aad : ca __ __ DEX
2aae : 10 f8 __ BPL $2aa8 ; (vdc_set_mode.s1000 + 2)
.s0:
2ab0 : a4 15 __ LDY P8 ; (mode + 0)
2ab2 : be 94 30 LDX $3094,y ; (__multab38L + 0)
2ab5 : 86 4f __ STX T1 + 0 
2ab7 : 86 51 __ STX T2 + 0 
2ab9 : bd a4 30 LDA $30a4,x ; (vdc_modes + 6)
2abc : f0 0a __ BEQ $2ac8 ; (vdc_set_mode.s3 + 0)
.s4:
2abe : ad d8 31 LDA $31d8 ; (vdc_state + 0)
2ac1 : c9 10 __ CMP #$10
2ac3 : d0 03 __ BNE $2ac8 ; (vdc_set_mode.s3 + 0)
2ac5 : 4c 6d 2c JMP $2c6d ; (vdc_set_mode.s1001 + 0)
.s3:
2ac8 : 8c da 31 STY $31da ; (vdc_state + 2)
2acb : a9 00 __ LDA #$00
2acd : 8d f0 31 STA $31f0 ; (vdc_state + 24)
2ad0 : 8d f1 31 STA $31f1 ; (vdc_state + 25)
2ad3 : 8d f2 31 STA $31f2 ; (vdc_state + 26)
2ad6 : bd 9e 30 LDA $309e,x ; (vdc_modes + 0)
2ad9 : 8d db 31 STA $31db ; (vdc_state + 3)
2adc : bd 9f 30 LDA $309f,x ; (vdc_modes + 1)
2adf : 8d dc 31 STA $31dc ; (vdc_state + 4)
2ae2 : bd a0 30 LDA $30a0,x ; (vdc_modes + 2)
2ae5 : 8d dd 31 STA $31dd ; (vdc_state + 5)
2ae8 : bd a1 30 LDA $30a1,x ; (vdc_modes + 3)
2aeb : 8d de 31 STA $31de ; (vdc_state + 6)
2aee : bd a3 30 LDA $30a3,x ; (vdc_modes + 5)
2af1 : 8d e0 31 STA $31e0 ; (vdc_state + 8)
2af4 : bd a9 30 LDA $30a9,x ; (vdc_modes + 11)
2af7 : 8d e6 31 STA $31e6 ; (vdc_state + 14)
2afa : bd aa 30 LDA $30aa,x ; (vdc_modes + 12)
2afd : 8d e7 31 STA $31e7 ; (vdc_state + 15)
2b00 : bd ab 30 LDA $30ab,x ; (vdc_modes + 13)
2b03 : 8d e8 31 STA $31e8 ; (vdc_state + 16)
2b06 : bd ac 30 LDA $30ac,x ; (vdc_modes + 14)
2b09 : 8d e9 31 STA $31e9 ; (vdc_state + 17)
2b0c : bd ad 30 LDA $30ad,x ; (vdc_modes + 15)
2b0f : 8d ea 31 STA $31ea ; (vdc_state + 18)
2b12 : bd ae 30 LDA $30ae,x ; (vdc_modes + 16)
2b15 : 8d eb 31 STA $31eb ; (vdc_state + 19)
2b18 : bd af 30 LDA $30af,x ; (vdc_modes + 17)
2b1b : 8d ec 31 STA $31ec ; (vdc_state + 20)
2b1e : bd b0 30 LDA $30b0,x ; (vdc_modes + 18)
2b21 : 8d ed 31 STA $31ed ; (vdc_state + 21)
2b24 : bd b1 30 LDA $30b1,x ; (vdc_modes + 19)
2b27 : 8d ee 31 STA $31ee ; (vdc_state + 22)
2b2a : bd b2 30 LDA $30b2,x ; (vdc_modes + 20)
2b2d : 8d ef 31 STA $31ef ; (vdc_state + 23)
2b30 : bd a5 30 LDA $30a5,x ; (vdc_modes + 7)
2b33 : 85 53 __ STA T3 + 0 
2b35 : 8d e2 31 STA $31e2 ; (vdc_state + 10)
2b38 : bd a6 30 LDA $30a6,x ; (vdc_modes + 8)
2b3b : 85 54 __ STA T3 + 1 
2b3d : 8d e3 31 STA $31e3 ; (vdc_state + 11)
2b40 : bd a7 30 LDA $30a7,x ; (vdc_modes + 9)
2b43 : 85 55 __ STA T5 + 0 
2b45 : 8d e4 31 STA $31e4 ; (vdc_state + 12)
2b48 : bd a8 30 LDA $30a8,x ; (vdc_modes + 10)
2b4b : 85 56 __ STA T5 + 1 
2b4d : 8d e5 31 STA $31e5 ; (vdc_state + 13)
2b50 : bd a2 30 LDA $30a2,x ; (vdc_modes + 4)
2b53 : 8d df 31 STA $31df ; (vdc_state + 7)
2b56 : d0 03 __ BNE $2b5b ; (vdc_set_mode.s8 + 0)
.s6:
2b58 : 20 78 2c JSR $2c78 ; (vdc_set_multab.s0 + 0)
.s8:
2b5b : a9 22 __ LDA #$22
2b5d : 8d 00 d6 STA $d600 
.l368:
2b60 : 2c 00 d6 BIT $d600 
2b63 : 10 fb __ BPL $2b60 ; (vdc_set_mode.l368 + 0)
.s14:
2b65 : a9 80 __ LDA #$80
2b67 : 8d 01 d6 STA $d601 
2b6a : a9 0c __ LDA #$0c
2b6c : 8d 00 d6 STA $d600 
.l370:
2b6f : 2c 00 d6 BIT $d600 
2b72 : 10 fb __ BPL $2b6f ; (vdc_set_mode.l370 + 0)
.s20:
2b74 : a5 54 __ LDA T3 + 1 
2b76 : 8d 01 d6 STA $d601 
2b79 : a9 0d __ LDA #$0d
2b7b : 8d 00 d6 STA $d600 
.l372:
2b7e : 2c 00 d6 BIT $d600 
2b81 : 10 fb __ BPL $2b7e ; (vdc_set_mode.l372 + 0)
.s25:
2b83 : a5 53 __ LDA T3 + 0 
2b85 : 8d 01 d6 STA $d601 
2b88 : a9 14 __ LDA #$14
2b8a : 8d 00 d6 STA $d600 
.l374:
2b8d : 2c 00 d6 BIT $d600 
2b90 : 10 fb __ BPL $2b8d ; (vdc_set_mode.l374 + 0)
.s30:
2b92 : a5 56 __ LDA T5 + 1 
2b94 : 8d 01 d6 STA $d601 
2b97 : a9 15 __ LDA #$15
2b99 : 8d 00 d6 STA $d600 
.l376:
2b9c : 2c 00 d6 BIT $d600 
2b9f : 10 fb __ BPL $2b9c ; (vdc_set_mode.l376 + 0)
.s35:
2ba1 : a5 55 __ LDA T5 + 0 
2ba3 : 8d 01 d6 STA $d601 
2ba6 : a6 4f __ LDX T1 + 0 
2ba8 : bd ae 30 LDA $30ae,x ; (vdc_modes + 16)
2bab : a2 1c __ LDX #$1c
2bad : 8e 00 d6 STX $d600 
.l378:
2bb0 : 2c 00 d6 BIT $d600 
2bb3 : 10 fb __ BPL $2bb0 ; (vdc_set_mode.l378 + 0)
.s42:
2bb5 : aa __ __ TAX
2bb6 : ad 01 d6 LDA $d601 
2bb9 : 29 10 __ AND #$10
2bbb : 85 55 __ STA T5 + 0 
2bbd : a9 1c __ LDA #$1c
2bbf : 8d 00 d6 STA $d600 
2bc2 : 8a __ __ TXA
2bc3 : 29 e0 __ AND #$e0
2bc5 : 05 55 __ ORA T5 + 0 
.l380:
2bc7 : 2c 00 d6 BIT $d600 
2bca : 10 fb __ BPL $2bc7 ; (vdc_set_mode.l380 + 0)
.s48:
2bcc : 8d 01 d6 STA $d601 
2bcf : 20 c8 2c JSR $2cc8 ; (vdc_restore_charsets.s0 + 0)
2bd2 : 18 __ __ CLC
2bd3 : a9 b3 __ LDA #$b3
2bd5 : 65 4f __ ADC T1 + 0 
2bd7 : 85 4f __ STA T1 + 0 
2bd9 : a9 30 __ LDA #$30
2bdb : 69 00 __ ADC #$00
2bdd : 85 50 __ STA T1 + 1 
2bdf : 18 __ __ CLC
2be0 : a5 51 __ LDA T2 + 0 
2be2 : 69 b3 __ ADC #$b3
2be4 : 85 53 __ STA T3 + 0 
2be6 : a9 00 __ LDA #$00
2be8 : 85 43 __ STA T0 + 0 
2bea : 69 30 __ ADC #$30
2bec : 85 54 __ STA T3 + 1 
.l49:
2bee : a4 43 __ LDY T0 + 0 
2bf0 : b1 4f __ LDA (T1 + 0),y 
2bf2 : 85 47 __ STA T7 + 0 
2bf4 : c8 __ __ INY
2bf5 : b1 4f __ LDA (T1 + 0),y 
2bf7 : aa __ __ TAX
2bf8 : a5 47 __ LDA T7 + 0 
2bfa : 8d 00 d6 STA $d600 
2bfd : c8 __ __ INY
2bfe : 84 43 __ STY T0 + 0 
.l382:
2c00 : 2c 00 d6 BIT $d600 
2c03 : 10 fb __ BPL $2c00 ; (vdc_set_mode.l382 + 0)
.s55:
2c05 : 8e 01 d6 STX $d601 
2c08 : b1 53 __ LDA (T3 + 0),y 
2c0a : c9 ff __ CMP #$ff
2c0c : d0 e0 __ BNE $2bee ; (vdc_set_mode.l49 + 0)
.s50:
2c0e : a6 51 __ LDX T2 + 0 
2c10 : bd a4 30 LDA $30a4,x ; (vdc_modes + 6)
2c13 : f0 08 __ BEQ $2c1d ; (vdc_set_mode.s58 + 0)
.s59:
2c15 : ad d9 31 LDA $31d9 ; (vdc_state + 1)
2c18 : d0 03 __ BNE $2c1d ; (vdc_set_mode.s58 + 0)
.s56:
2c1a : 20 d5 2c JSR $2cd5 ; (vdc_set_extended_memsize.s0 + 0)
.s58:
2c1d : a9 19 __ LDA #$19
2c1f : 8d 00 d6 STA $d600 
.l387:
2c22 : 2c 00 d6 BIT $d600 
2c25 : 10 fb __ BPL $2c22 ; (vdc_set_mode.l387 + 0)
.s64:
2c27 : ad df 31 LDA $31df ; (vdc_state + 7)
2c2a : 85 43 __ STA T0 + 0 
2c2c : d0 08 __ BNE $2c36 ; (vdc_set_mode.s67 + 0)
.s68:
2c2e : ad 01 d6 LDA $d601 
2c31 : 29 7f __ AND #$7f
2c33 : 4c 3b 2c JMP $2c3b ; (vdc_set_mode.s390 + 0)
.s67:
2c36 : ad 01 d6 LDA $d601 
2c39 : 09 80 __ ORA #$80
.s390:
2c3b : aa __ __ TAX
2c3c : ad e0 31 LDA $31e0 ; (vdc_state + 8)
2c3f : d0 06 __ BNE $2c47 ; (vdc_set_mode.s70 + 0)
.s71:
2c41 : 8a __ __ TXA
2c42 : 29 bf __ AND #$bf
2c44 : 4c 4a 2c JMP $2c4a ; (vdc_set_mode.s72 + 0)
.s70:
2c47 : 8a __ __ TXA
2c48 : 09 40 __ ORA #$40
.s72:
2c4a : a2 19 __ LDX #$19
2c4c : 8e 00 d6 STX $d600 
.l391:
2c4f : 2c 00 d6 BIT $d600 
2c52 : 10 fb __ BPL $2c4f ; (vdc_set_mode.l391 + 0)
.s77:
2c54 : 8d 01 d6 STA $d601 
2c57 : a5 43 __ LDA T0 + 0 
2c59 : d0 03 __ BNE $2c5e ; (vdc_set_mode.s80 + 0)
.s78:
2c5b : 20 f7 28 JSR $28f7 ; (vdc_cls.s0 + 0)
.s80:
2c5e : a9 22 __ LDA #$22
2c60 : 8d 00 d6 STA $d600 
.l394:
2c63 : 2c 00 d6 BIT $d600 
2c66 : 10 fb __ BPL $2c63 ; (vdc_set_mode.l394 + 0)
.s86:
2c68 : a9 7d __ LDA #$7d
2c6a : 8d 01 d6 STA $d601 
.s1001:
2c6d : a2 03 __ LDX #$03
2c6f : bd fc bf LDA $bffc,x ; (buffer + 12)
2c72 : 95 53 __ STA T3 + 0,x 
2c74 : ca __ __ DEX
2c75 : 10 f8 __ BPL $2c6f ; (vdc_set_mode.s1001 + 2)
2c77 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_set_multab: ; vdc_set_multab()->void
.s0:
2c78 : ad dd 31 LDA $31dd ; (vdc_state + 5)
2c7b : 0d de 31 ORA $31de ; (vdc_state + 6)
2c7e : f0 47 __ BEQ $2cc7 ; (vdc_set_multab.s1001 + 0)
.s5:
2c80 : ad db 31 LDA $31db ; (vdc_state + 3)
2c83 : 18 __ __ CLC
2c84 : 6d f2 31 ADC $31f2 ; (vdc_state + 26)
2c87 : 85 1b __ STA ACCU + 0 
2c89 : ad dc 31 LDA $31dc ; (vdc_state + 4)
2c8c : 69 00 __ ADC #$00
2c8e : 85 1c __ STA ACCU + 1 
2c90 : a9 00 __ LDA #$00
2c92 : 85 43 __ STA T3 + 0 
2c94 : 85 44 __ STA T3 + 1 
2c96 : a9 00 __ LDA #$00
2c98 : 85 45 __ STA T4 + 0 
2c9a : a9 32 __ LDA #$32
2c9c : 85 46 __ STA T4 + 1 
2c9e : ae dd 31 LDX $31dd ; (vdc_state + 5)
.l1002:
2ca1 : a5 43 __ LDA T3 + 0 
2ca3 : a0 00 __ LDY #$00
2ca5 : 91 45 __ STA (T4 + 0),y 
2ca7 : a5 44 __ LDA T3 + 1 
2ca9 : c8 __ __ INY
2caa : 91 45 __ STA (T4 + 0),y 
2cac : 18 __ __ CLC
2cad : a5 1b __ LDA ACCU + 0 
2caf : 65 43 __ ADC T3 + 0 
2cb1 : 85 43 __ STA T3 + 0 
2cb3 : a5 1c __ LDA ACCU + 1 
2cb5 : 65 44 __ ADC T3 + 1 
2cb7 : 85 44 __ STA T3 + 1 
2cb9 : 18 __ __ CLC
2cba : a5 45 __ LDA T4 + 0 
2cbc : 69 02 __ ADC #$02
2cbe : 85 45 __ STA T4 + 0 
2cc0 : 90 02 __ BCC $2cc4 ; (vdc_set_multab.s1006 + 0)
.s1005:
2cc2 : e6 46 __ INC T4 + 1 
.s1006:
2cc4 : ca __ __ DEX
2cc5 : d0 da __ BNE $2ca1 ; (vdc_set_multab.l1002 + 0)
.s1001:
2cc7 : 60 __ __ RTS
--------------------------------------------------------------------
vdc_restore_charsets: ; vdc_restore_charsets()->void
.s0:
2cc8 : ad ea 31 LDA $31ea ; (vdc_state + 18)
2ccb : 85 0f __ STA P2 
2ccd : ad eb 31 LDA $31eb ; (vdc_state + 19)
2cd0 : 85 10 __ STA P3 
2cd2 : 4c 00 13 JMP $1300 ; (bnk_redef_charset.s0 + 0)
--------------------------------------------------------------------
vdc_set_extended_memsize: ; vdc_set_extended_memsize()->void
.s0:
2cd5 : ad d8 31 LDA $31d8 ; (vdc_state + 0)
2cd8 : c9 10 __ CMP #$10
2cda : d0 01 __ BNE $2cdd ; (vdc_set_extended_memsize.s4 + 0)
2cdc : 60 __ __ RTS
.s4:
2cdd : ad d9 31 LDA $31d9 ; (vdc_state + 1)
2ce0 : f0 01 __ BEQ $2ce3 ; (vdc_set_extended_memsize.s3 + 0)
2ce2 : 60 __ __ RTS
.s3:
2ce3 : a2 22 __ LDX #$22
2ce5 : 8e 00 d6 STX $d600 
.l383:
2ce8 : 2c 00 d6 BIT $d600 
2ceb : 10 fb __ BPL $2ce8 ; (vdc_set_extended_memsize.l383 + 0)
.s11:
2ced : 85 4e __ STA T1 + 1 
2cef : 85 0d __ STA P0 
2cf1 : a9 80 __ LDA #$80
2cf3 : 8d 01 d6 STA $d601 
2cf6 : a9 ff __ LDA #$ff
2cf8 : 85 4c __ STA T0 + 0 
.l14:
2cfa : 20 f1 29 JSR $29f1 ; (vdc_mem_addr@proxy + 0)
.l385:
2cfd : 2c 00 d6 BIT $d600 
2d00 : 10 fb __ BPL $2cfd ; (vdc_set_extended_memsize.l385 + 0)
.s20:
2d02 : a9 00 __ LDA #$00
2d04 : 8d 01 d6 STA $d601 
2d07 : a2 18 __ LDX #$18
2d09 : 8e 00 d6 STX $d600 
.l387:
2d0c : 2c 00 d6 BIT $d600 
2d0f : 10 fb __ BPL $2d0c ; (vdc_set_extended_memsize.l387 + 0)
.s26:
2d11 : ad 01 d6 LDA $d601 
2d14 : 29 7f __ AND #$7f
2d16 : 8e 00 d6 STX $d600 
.l389:
2d19 : 2c 00 d6 BIT $d600 
2d1c : 10 fb __ BPL $2d19 ; (vdc_set_extended_memsize.l389 + 0)
.s32:
2d1e : 8d 01 d6 STA $d601 
2d21 : a9 1e __ LDA #$1e
2d23 : 8d 00 d6 STA $d600 
.l391:
2d26 : 2c 00 d6 BIT $d600 
2d29 : 10 fb __ BPL $2d26 ; (vdc_set_extended_memsize.l391 + 0)
.s37:
2d2b : e6 4e __ INC T1 + 1 
2d2d : a9 ff __ LDA #$ff
2d2f : 8d 01 d6 STA $d601 
2d32 : c6 4c __ DEC T0 + 0 
2d34 : d0 c4 __ BNE $2cfa ; (vdc_set_extended_memsize.l14 + 0)
.s16:
2d36 : 20 f1 29 JSR $29f1 ; (vdc_mem_addr@proxy + 0)
.l394:
2d39 : 2c 00 d6 BIT $d600 
2d3c : 10 fb __ BPL $2d39 ; (vdc_set_extended_memsize.l394 + 0)
.s41:
2d3e : a9 00 __ LDA #$00
2d40 : 8d 01 d6 STA $d601 
2d43 : a2 18 __ LDX #$18
2d45 : 8e 00 d6 STX $d600 
.l396:
2d48 : 2c 00 d6 BIT $d600 
2d4b : 10 fb __ BPL $2d48 ; (vdc_set_extended_memsize.l396 + 0)
.s47:
2d4d : ad 01 d6 LDA $d601 
2d50 : 29 7f __ AND #$7f
2d52 : 8e 00 d6 STX $d600 
.l398:
2d55 : 2c 00 d6 BIT $d600 
2d58 : 10 fb __ BPL $2d55 ; (vdc_set_extended_memsize.l398 + 0)
.s53:
2d5a : 8d 01 d6 STA $d601 
2d5d : a9 1e __ LDA #$1e
2d5f : 8d 00 d6 STA $d600 
.l400:
2d62 : 2c 00 d6 BIT $d600 
2d65 : 10 fb __ BPL $2d62 ; (vdc_set_extended_memsize.l400 + 0)
.s58:
2d67 : a9 ff __ LDA #$ff
2d69 : 8d 01 d6 STA $d601 
2d6c : a0 1c __ LDY #$1c
2d6e : 8c 00 d6 STY $d600 
.l402:
2d71 : 2c 00 d6 BIT $d600 
2d74 : 10 fb __ BPL $2d71 ; (vdc_set_extended_memsize.l402 + 0)
.s64:
2d76 : ad 01 d6 LDA $d601 
2d79 : 09 10 __ ORA #$10
2d7b : 8c 00 d6 STY $d600 
.l404:
2d7e : 2c 00 d6 BIT $d600 
2d81 : 10 fb __ BPL $2d7e ; (vdc_set_extended_memsize.l404 + 0)
.s70:
2d83 : 8d 01 d6 STA $d601 
2d86 : 20 c8 2c JSR $2cc8 ; (vdc_restore_charsets.s0 + 0)
2d89 : ad df 31 LDA $31df ; (vdc_state + 7)
2d8c : d0 03 __ BNE $2d91 ; (vdc_set_extended_memsize.s73 + 0)
.s71:
2d8e : 20 f7 28 JSR $28f7 ; (vdc_cls.s0 + 0)
.s73:
2d91 : a9 22 __ LDA #$22
2d93 : 8d 00 d6 STA $d600 
.l407:
2d96 : 2c 00 d6 BIT $d600 
2d99 : 10 fb __ BPL $2d96 ; (vdc_set_extended_memsize.l407 + 0)
.s79:
2d9b : a9 7d __ LDA #$7d
2d9d : 8d 01 d6 STA $d601 
2da0 : a9 01 __ LDA #$01
2da2 : 8d d9 31 STA $31d9 ; (vdc_state + 1)
.s1001:
2da5 : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
.s0:
2da6 : a5 0f __ LDA P2 
2da8 : a6 12 __ LDX P5 
2daa : f0 0c __ BEQ $2db8 ; (memset.s0 + 18)
2dac : a0 00 __ LDY #$00
2dae : 91 0d __ STA (P0),y 
2db0 : c8 __ __ INY
2db1 : d0 fb __ BNE $2dae ; (memset.s0 + 8)
2db3 : e6 0e __ INC P1 
2db5 : ca __ __ DEX
2db6 : d0 f6 __ BNE $2dae ; (memset.s0 + 8)
2db8 : a4 11 __ LDY P4 
2dba : f0 05 __ BEQ $2dc1 ; (memset.s1001 + 0)
2dbc : 88 __ __ DEY
2dbd : 91 0d __ STA (P0),y 
2dbf : d0 fb __ BNE $2dbc ; (memset.s0 + 22)
.s1001:
2dc1 : 60 __ __ RTS
--------------------------------------------------------------------
rotdown: ; rotdown(u8)->void
.s0:
2dc2 : aa __ __ TAX
2dc3 : bd c0 39 LDA $39c0,x ; (Screen + 1840)
2dc6 : 9d 10 3a STA $3a10,x ; (Screen + 1920)
2dc9 : bd 70 39 LDA $3970,x ; (Screen + 1760)
2dcc : 9d c0 39 STA $39c0,x ; (Screen + 1840)
2dcf : bd 20 39 LDA $3920,x ; (Screen + 1680)
2dd2 : 9d 70 39 STA $3970,x ; (Screen + 1760)
2dd5 : bd d0 38 LDA $38d0,x ; (Screen + 1600)
2dd8 : 9d 20 39 STA $3920,x ; (Screen + 1680)
2ddb : bd 80 38 LDA $3880,x ; (Screen + 1520)
2dde : 9d d0 38 STA $38d0,x ; (Screen + 1600)
2de1 : bd 30 38 LDA $3830,x ; (Screen + 1440)
2de4 : 9d 80 38 STA $3880,x ; (Screen + 1520)
2de7 : bd e0 37 LDA $37e0,x ; (Screen + 1360)
2dea : 9d 30 38 STA $3830,x ; (Screen + 1440)
2ded : bd 90 37 LDA $3790,x ; (Screen + 1280)
2df0 : 9d e0 37 STA $37e0,x ; (Screen + 1360)
2df3 : bd 40 37 LDA $3740,x ; (Screen + 1200)
2df6 : 9d 90 37 STA $3790,x ; (Screen + 1280)
2df9 : bd f0 36 LDA $36f0,x ; (Screen + 1120)
2dfc : 9d 40 37 STA $3740,x ; (Screen + 1200)
2dff : bd a0 36 LDA $36a0,x ; (Screen + 1040)
2e02 : 9d f0 36 STA $36f0,x ; (Screen + 1120)
2e05 : bd 50 36 LDA $3650,x ; (Screen + 960)
2e08 : 9d a0 36 STA $36a0,x ; (Screen + 1040)
2e0b : bd 00 36 LDA $3600,x ; (Screen + 880)
2e0e : 9d 50 36 STA $3650,x ; (Screen + 960)
2e11 : bd b0 35 LDA $35b0,x ; (Screen + 800)
2e14 : 9d 00 36 STA $3600,x ; (Screen + 880)
2e17 : bd 60 35 LDA $3560,x ; (Screen + 720)
2e1a : 9d b0 35 STA $35b0,x ; (Screen + 800)
2e1d : bd 10 35 LDA $3510,x ; (Screen + 640)
2e20 : 9d 60 35 STA $3560,x ; (Screen + 720)
2e23 : bd c0 34 LDA $34c0,x ; (Screen + 560)
2e26 : 9d 10 35 STA $3510,x ; (Screen + 640)
2e29 : bd 70 34 LDA $3470,x ; (Screen + 480)
2e2c : 9d c0 34 STA $34c0,x ; (Screen + 560)
2e2f : bd 20 34 LDA $3420,x ; (Screen + 400)
2e32 : 9d 70 34 STA $3470,x ; (Screen + 480)
2e35 : bd d0 33 LDA $33d0,x ; (Screen + 320)
2e38 : 9d 20 34 STA $3420,x ; (Screen + 400)
2e3b : bd 80 33 LDA $3380,x ; (Screen + 240)
2e3e : 9d d0 33 STA $33d0,x ; (Screen + 320)
2e41 : bd 30 33 LDA $3330,x ; (Screen + 160)
2e44 : 9d 80 33 STA $3380,x ; (Screen + 240)
2e47 : bd e0 32 LDA $32e0,x ; (Screen + 80)
2e4a : 9d 30 33 STA $3330,x ; (Screen + 160)
2e4d : bd 90 32 LDA $3290,x ; (Screen + 0)
2e50 : 9d e0 32 STA $32e0,x ; (Screen + 80)
2e53 : a9 00 __ LDA #$00
2e55 : 9d 90 32 STA $3290,x ; (Screen + 0)
.s1001:
2e58 : 60 __ __ RTS
--------------------------------------------------------------------
rotup: ; rotup(u8)->void
.s0:
2e59 : aa __ __ TAX
2e5a : bd e0 32 LDA $32e0,x ; (Screen + 80)
2e5d : 9d 90 32 STA $3290,x ; (Screen + 0)
2e60 : bd 30 33 LDA $3330,x ; (Screen + 160)
2e63 : 9d e0 32 STA $32e0,x ; (Screen + 80)
2e66 : bd 80 33 LDA $3380,x ; (Screen + 240)
2e69 : 9d 30 33 STA $3330,x ; (Screen + 160)
2e6c : bd d0 33 LDA $33d0,x ; (Screen + 320)
2e6f : 9d 80 33 STA $3380,x ; (Screen + 240)
2e72 : bd 20 34 LDA $3420,x ; (Screen + 400)
2e75 : 9d d0 33 STA $33d0,x ; (Screen + 320)
2e78 : bd 70 34 LDA $3470,x ; (Screen + 480)
2e7b : 9d 20 34 STA $3420,x ; (Screen + 400)
2e7e : bd c0 34 LDA $34c0,x ; (Screen + 560)
2e81 : 9d 70 34 STA $3470,x ; (Screen + 480)
2e84 : bd 10 35 LDA $3510,x ; (Screen + 640)
2e87 : 9d c0 34 STA $34c0,x ; (Screen + 560)
2e8a : bd 60 35 LDA $3560,x ; (Screen + 720)
2e8d : 9d 10 35 STA $3510,x ; (Screen + 640)
2e90 : bd b0 35 LDA $35b0,x ; (Screen + 800)
2e93 : 9d 60 35 STA $3560,x ; (Screen + 720)
2e96 : bd 00 36 LDA $3600,x ; (Screen + 880)
2e99 : 9d b0 35 STA $35b0,x ; (Screen + 800)
2e9c : bd 50 36 LDA $3650,x ; (Screen + 960)
2e9f : 9d 00 36 STA $3600,x ; (Screen + 880)
2ea2 : bd a0 36 LDA $36a0,x ; (Screen + 1040)
2ea5 : 9d 50 36 STA $3650,x ; (Screen + 960)
2ea8 : bd f0 36 LDA $36f0,x ; (Screen + 1120)
2eab : 9d a0 36 STA $36a0,x ; (Screen + 1040)
2eae : bd 40 37 LDA $3740,x ; (Screen + 1200)
2eb1 : 9d f0 36 STA $36f0,x ; (Screen + 1120)
2eb4 : bd 90 37 LDA $3790,x ; (Screen + 1280)
2eb7 : 9d 40 37 STA $3740,x ; (Screen + 1200)
2eba : bd e0 37 LDA $37e0,x ; (Screen + 1360)
2ebd : 9d 90 37 STA $3790,x ; (Screen + 1280)
2ec0 : bd 30 38 LDA $3830,x ; (Screen + 1440)
2ec3 : 9d e0 37 STA $37e0,x ; (Screen + 1360)
2ec6 : bd 80 38 LDA $3880,x ; (Screen + 1520)
2ec9 : 9d 30 38 STA $3830,x ; (Screen + 1440)
2ecc : bd d0 38 LDA $38d0,x ; (Screen + 1600)
2ecf : 9d 80 38 STA $3880,x ; (Screen + 1520)
2ed2 : bd 20 39 LDA $3920,x ; (Screen + 1680)
2ed5 : 9d d0 38 STA $38d0,x ; (Screen + 1600)
2ed8 : bd 70 39 LDA $3970,x ; (Screen + 1760)
2edb : 9d 20 39 STA $3920,x ; (Screen + 1680)
2ede : bd c0 39 LDA $39c0,x ; (Screen + 1840)
2ee1 : 9d 70 39 STA $3970,x ; (Screen + 1760)
2ee4 : bd 10 3a LDA $3a10,x ; (Screen + 1920)
2ee7 : 9d c0 39 STA $39c0,x ; (Screen + 1840)
2eea : a9 00 __ LDA #$00
2eec : 9d 10 3a STA $3a10,x ; (Screen + 1920)
.s1001:
2eef : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
2ef0 : a0 00 __ LDY #$00
2ef2 : 84 06 __ STY WORK + 3 
2ef4 : a5 03 __ LDA WORK + 0 
2ef6 : a6 04 __ LDX WORK + 1 
2ef8 : f0 1c __ BEQ $2f16 ; (mul16 + 38)
2efa : 38 __ __ SEC
2efb : 6a __ __ ROR
2efc : 90 0d __ BCC $2f0b ; (mul16 + 27)
2efe : aa __ __ TAX
2eff : 18 __ __ CLC
2f00 : 98 __ __ TYA
2f01 : 65 1b __ ADC ACCU + 0 
2f03 : a8 __ __ TAY
2f04 : a5 06 __ LDA WORK + 3 
2f06 : 65 1c __ ADC ACCU + 1 
2f08 : 85 06 __ STA WORK + 3 
2f0a : 8a __ __ TXA
2f0b : 06 1b __ ASL ACCU + 0 
2f0d : 26 1c __ ROL ACCU + 1 
2f0f : 4a __ __ LSR
2f10 : 90 f9 __ BCC $2f0b ; (mul16 + 27)
2f12 : d0 ea __ BNE $2efe ; (mul16 + 14)
2f14 : a5 04 __ LDA WORK + 1 
2f16 : 4a __ __ LSR
2f17 : 90 0d __ BCC $2f26 ; (mul16 + 54)
2f19 : aa __ __ TAX
2f1a : 18 __ __ CLC
2f1b : 98 __ __ TYA
2f1c : 65 1b __ ADC ACCU + 0 
2f1e : a8 __ __ TAY
2f1f : a5 06 __ LDA WORK + 3 
2f21 : 65 1c __ ADC ACCU + 1 
2f23 : 85 06 __ STA WORK + 3 
2f25 : 8a __ __ TXA
2f26 : 06 1b __ ASL ACCU + 0 
2f28 : 26 1c __ ROL ACCU + 1 
2f2a : 4a __ __ LSR
2f2b : b0 ec __ BCS $2f19 ; (mul16 + 41)
2f2d : d0 f7 __ BNE $2f26 ; (mul16 + 54)
2f2f : 84 05 __ STY WORK + 2 
2f31 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2f32 : a5 1c __ LDA ACCU + 1 
2f34 : d0 31 __ BNE $2f67 ; (divmod + 53)
2f36 : a5 04 __ LDA WORK + 1 
2f38 : d0 1e __ BNE $2f58 ; (divmod + 38)
2f3a : 85 06 __ STA WORK + 3 
2f3c : a2 04 __ LDX #$04
2f3e : 06 1b __ ASL ACCU + 0 
2f40 : 2a __ __ ROL
2f41 : c5 03 __ CMP WORK + 0 
2f43 : 90 02 __ BCC $2f47 ; (divmod + 21)
2f45 : e5 03 __ SBC WORK + 0 
2f47 : 26 1b __ ROL ACCU + 0 
2f49 : 2a __ __ ROL
2f4a : c5 03 __ CMP WORK + 0 
2f4c : 90 02 __ BCC $2f50 ; (divmod + 30)
2f4e : e5 03 __ SBC WORK + 0 
2f50 : 26 1b __ ROL ACCU + 0 
2f52 : ca __ __ DEX
2f53 : d0 eb __ BNE $2f40 ; (divmod + 14)
2f55 : 85 05 __ STA WORK + 2 
2f57 : 60 __ __ RTS
2f58 : a5 1b __ LDA ACCU + 0 
2f5a : 85 05 __ STA WORK + 2 
2f5c : a5 1c __ LDA ACCU + 1 
2f5e : 85 06 __ STA WORK + 3 
2f60 : a9 00 __ LDA #$00
2f62 : 85 1b __ STA ACCU + 0 
2f64 : 85 1c __ STA ACCU + 1 
2f66 : 60 __ __ RTS
2f67 : a5 04 __ LDA WORK + 1 
2f69 : d0 1f __ BNE $2f8a ; (divmod + 88)
2f6b : a5 03 __ LDA WORK + 0 
2f6d : 30 1b __ BMI $2f8a ; (divmod + 88)
2f6f : a9 00 __ LDA #$00
2f71 : 85 06 __ STA WORK + 3 
2f73 : a2 10 __ LDX #$10
2f75 : 06 1b __ ASL ACCU + 0 
2f77 : 26 1c __ ROL ACCU + 1 
2f79 : 2a __ __ ROL
2f7a : c5 03 __ CMP WORK + 0 
2f7c : 90 02 __ BCC $2f80 ; (divmod + 78)
2f7e : e5 03 __ SBC WORK + 0 
2f80 : 26 1b __ ROL ACCU + 0 
2f82 : 26 1c __ ROL ACCU + 1 
2f84 : ca __ __ DEX
2f85 : d0 f2 __ BNE $2f79 ; (divmod + 71)
2f87 : 85 05 __ STA WORK + 2 
2f89 : 60 __ __ RTS
2f8a : a9 00 __ LDA #$00
2f8c : 85 05 __ STA WORK + 2 
2f8e : 85 06 __ STA WORK + 3 
2f90 : 84 02 __ STY $02 
2f92 : a0 10 __ LDY #$10
2f94 : 18 __ __ CLC
2f95 : 26 1b __ ROL ACCU + 0 
2f97 : 26 1c __ ROL ACCU + 1 
2f99 : 26 05 __ ROL WORK + 2 
2f9b : 26 06 __ ROL WORK + 3 
2f9d : 38 __ __ SEC
2f9e : a5 05 __ LDA WORK + 2 
2fa0 : e5 03 __ SBC WORK + 0 
2fa2 : aa __ __ TAX
2fa3 : a5 06 __ LDA WORK + 3 
2fa5 : e5 04 __ SBC WORK + 1 
2fa7 : 90 04 __ BCC $2fad ; (divmod + 123)
2fa9 : 86 05 __ STX WORK + 2 
2fab : 85 06 __ STA WORK + 3 
2fad : 88 __ __ DEY
2fae : d0 e5 __ BNE $2f95 ; (divmod + 99)
2fb0 : 26 1b __ ROL ACCU + 0 
2fb2 : 26 1c __ ROL ACCU + 1 
2fb4 : a4 02 __ LDY $02 
2fb6 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2fb7 : 84 02 __ STY $02 
2fb9 : a0 20 __ LDY #$20
2fbb : a9 00 __ LDA #$00
2fbd : 85 07 __ STA WORK + 4 
2fbf : 85 08 __ STA WORK + 5 
2fc1 : 85 09 __ STA WORK + 6 
2fc3 : 85 0a __ STA WORK + 7 
2fc5 : a5 05 __ LDA WORK + 2 
2fc7 : 05 06 __ ORA WORK + 3 
2fc9 : d0 78 __ BNE $3043 ; (divmod32 + 140)
2fcb : a5 04 __ LDA WORK + 1 
2fcd : d0 27 __ BNE $2ff6 ; (divmod32 + 63)
2fcf : 18 __ __ CLC
2fd0 : 26 1b __ ROL ACCU + 0 
2fd2 : 26 1c __ ROL ACCU + 1 
2fd4 : 26 1d __ ROL ACCU + 2 
2fd6 : 26 1e __ ROL ACCU + 3 
2fd8 : 2a __ __ ROL
2fd9 : 90 05 __ BCC $2fe0 ; (divmod32 + 41)
2fdb : e5 03 __ SBC WORK + 0 
2fdd : 38 __ __ SEC
2fde : b0 06 __ BCS $2fe6 ; (divmod32 + 47)
2fe0 : c5 03 __ CMP WORK + 0 
2fe2 : 90 02 __ BCC $2fe6 ; (divmod32 + 47)
2fe4 : e5 03 __ SBC WORK + 0 
2fe6 : 88 __ __ DEY
2fe7 : d0 e7 __ BNE $2fd0 ; (divmod32 + 25)
2fe9 : 85 07 __ STA WORK + 4 
2feb : 26 1b __ ROL ACCU + 0 
2fed : 26 1c __ ROL ACCU + 1 
2fef : 26 1d __ ROL ACCU + 2 
2ff1 : 26 1e __ ROL ACCU + 3 
2ff3 : a4 02 __ LDY $02 
2ff5 : 60 __ __ RTS
2ff6 : a5 1e __ LDA ACCU + 3 
2ff8 : d0 10 __ BNE $300a ; (divmod32 + 83)
2ffa : a6 1d __ LDX ACCU + 2 
2ffc : 86 1e __ STX ACCU + 3 
2ffe : a6 1c __ LDX ACCU + 1 
3000 : 86 1d __ STX ACCU + 2 
3002 : a6 1b __ LDX ACCU + 0 
3004 : 86 1c __ STX ACCU + 1 
3006 : 85 1b __ STA ACCU + 0 
3008 : a0 18 __ LDY #$18
300a : 18 __ __ CLC
300b : 26 1b __ ROL ACCU + 0 
300d : 26 1c __ ROL ACCU + 1 
300f : 26 1d __ ROL ACCU + 2 
3011 : 26 1e __ ROL ACCU + 3 
3013 : 26 07 __ ROL WORK + 4 
3015 : 26 08 __ ROL WORK + 5 
3017 : 90 0c __ BCC $3025 ; (divmod32 + 110)
3019 : a5 07 __ LDA WORK + 4 
301b : e5 03 __ SBC WORK + 0 
301d : aa __ __ TAX
301e : a5 08 __ LDA WORK + 5 
3020 : e5 04 __ SBC WORK + 1 
3022 : 38 __ __ SEC
3023 : b0 0c __ BCS $3031 ; (divmod32 + 122)
3025 : 38 __ __ SEC
3026 : a5 07 __ LDA WORK + 4 
3028 : e5 03 __ SBC WORK + 0 
302a : aa __ __ TAX
302b : a5 08 __ LDA WORK + 5 
302d : e5 04 __ SBC WORK + 1 
302f : 90 04 __ BCC $3035 ; (divmod32 + 126)
3031 : 86 07 __ STX WORK + 4 
3033 : 85 08 __ STA WORK + 5 
3035 : 88 __ __ DEY
3036 : d0 d3 __ BNE $300b ; (divmod32 + 84)
3038 : 26 1b __ ROL ACCU + 0 
303a : 26 1c __ ROL ACCU + 1 
303c : 26 1d __ ROL ACCU + 2 
303e : 26 1e __ ROL ACCU + 3 
3040 : a4 02 __ LDY $02 
3042 : 60 __ __ RTS
3043 : a0 10 __ LDY #$10
3045 : a5 1e __ LDA ACCU + 3 
3047 : 85 08 __ STA WORK + 5 
3049 : a5 1d __ LDA ACCU + 2 
304b : 85 07 __ STA WORK + 4 
304d : a9 00 __ LDA #$00
304f : 85 1d __ STA ACCU + 2 
3051 : 85 1e __ STA ACCU + 3 
3053 : 18 __ __ CLC
3054 : 26 1b __ ROL ACCU + 0 
3056 : 26 1c __ ROL ACCU + 1 
3058 : 26 07 __ ROL WORK + 4 
305a : 26 08 __ ROL WORK + 5 
305c : 26 09 __ ROL WORK + 6 
305e : 26 0a __ ROL WORK + 7 
3060 : a5 07 __ LDA WORK + 4 
3062 : c5 03 __ CMP WORK + 0 
3064 : a5 08 __ LDA WORK + 5 
3066 : e5 04 __ SBC WORK + 1 
3068 : a5 09 __ LDA WORK + 6 
306a : e5 05 __ SBC WORK + 2 
306c : a5 0a __ LDA WORK + 7 
306e : e5 06 __ SBC WORK + 3 
3070 : 90 18 __ BCC $308a ; (divmod32 + 211)
3072 : a5 07 __ LDA WORK + 4 
3074 : e5 03 __ SBC WORK + 0 
3076 : 85 07 __ STA WORK + 4 
3078 : a5 08 __ LDA WORK + 5 
307a : e5 04 __ SBC WORK + 1 
307c : 85 08 __ STA WORK + 5 
307e : a5 09 __ LDA WORK + 6 
3080 : e5 05 __ SBC WORK + 2 
3082 : 85 09 __ STA WORK + 6 
3084 : a5 0a __ LDA WORK + 7 
3086 : e5 06 __ SBC WORK + 3 
3088 : 85 0a __ STA WORK + 7 
308a : 88 __ __ DEY
308b : d0 c7 __ BNE $3054 ; (divmod32 + 157)
308d : 26 1b __ ROL ACCU + 0 
308f : 26 1c __ ROL ACCU + 1 
3091 : a4 02 __ LDY $02 
3093 : 60 __ __ RTS
--------------------------------------------------------------------
__multab38L:
3094 : __ __ __ BYT 00 26 4c 72 98 be e4                            : .&Lr...
--------------------------------------------------------------------
spentry:
309b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
309c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
vdc_modes:
309e : __ __ __ BYT 50 00 19 00 00 08 00 00 00 00 08 00 10 00 18 00 : P...............
30ae : __ __ __ BYT 20 00 30 00 40 00 7f 04 26 05 e0 06 19 07 20 08 :  .0.@...&..... .
30be : __ __ __ BYT fc 09 e7 24 7e ff 50 00 32 00 00 08 00 00 00 00 : ...$~.P.2.......
30ce : __ __ __ BYT 10 00 40 00 50 00 20 00 30 00 60 00 7f 04 4d 05 : ..@.P. .0.`...M.
30de : __ __ __ BYT 00 06 32 07 40 08 03 09 07 24 00 ff 50 00 46 00 : ..2.@....$..P.F.
30ee : __ __ __ BYT 00 08 01 00 00 00 18 00 60 00 78 00 40 00 50 00 : ........`.x.@.P.
30fe : __ __ __ BYT 90 00 7f 04 4d 05 00 06 46 07 48 08 03 09 07 24 : ....M...F.H....$
310e : __ __ __ BYT 00 ff 50 00 19 00 00 08 00 00 00 00 08 00 10 00 : ..P.............
311e : __ __ __ BYT 18 00 20 00 30 00 40 00 7e 04 20 05 e0 06 19 07 : .. .0.@.~. .....
312e : __ __ __ BYT 1d 08 fc 09 e7 24 f5 ff 50 00 32 00 00 08 00 00 : .....$..P.2.....
313e : __ __ __ BYT 00 00 10 00 40 00 50 00 20 00 30 00 60 00 7e 04 : ....@.P. .0.`.~.
314e : __ __ __ BYT 41 05 00 06 32 07 3b 08 03 09 07 24 00 ff 50 00 : A...2.;....$..P.
315e : __ __ __ BYT 3c 00 00 08 01 00 00 00 18 00 60 00 78 00 40 00 : <.........`.x.@.
316e : __ __ __ BYT 50 00 90 00 7e 04 41 05 00 06 3c 07 3d 08 03 09 : P...~.A...<.=...
317e : __ __ __ BYT 07 24 00 ff 80 02 c8 00 01 08 01 00 00 00 40 00 : .$............@.
318e : __ __ __ BYT 48 00 88 00 90 00 a0 00 b0 00 7f 04 26 05 e0 06 : H...........&...
319e : __ __ __ BYT 19 07 20 08 fc 09 e7 24 7e ff                   : .. ....$~.
--------------------------------------------------------------------
colors:
31a8 : __ __ __ BYT 00 10 11 e1 ee fe ff 6f 66 63 33 32 22 20 00 00 : .......ofc32" ..
31b8 : __ __ __ BYT 00 80 88 c8 cc dc dd 6d 66 65 55 54 44 40 00 00 : .......mfeUTD@..
--------------------------------------------------------------------
krnio_pstatus:
31c8 : __ __ __ BSS	16
--------------------------------------------------------------------
vdc_state:
31d8 : __ __ __ BSS	27
--------------------------------------------------------------------
multab:
3200 : __ __ __ BSS	144
--------------------------------------------------------------------
Screen:
3290 : __ __ __ BSS	2000
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
01:1312 : 20 f5 29 JSR $29f5 ; (vdc_mem_addr.s0 + 0)
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
