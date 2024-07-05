   10 ifrgr(0)<>5thenprint"{clr}{swlc}Please switch to 80-column mode":print"Press any key":printchr$(27)"x";:getkeya$
   20 fast:bank15:dn=peek(186):sysdec("e179"):sysdec("ff62"):w=dec("cdcc")
   30 fori=4864to4910:reada$:pokei,dec(a$):next:fori=4992to5076:reada$:pokei,dec(a$):next
   40 data78,a2,09,a9,20,a0,e0,2c,00,d6,d0,fb,8e,00,d6,8c,01,d6,a0,e7,2c,00,d6,f0,fb,8c,01,d6,a9,00,8d,00,dc,ad,01,dc,49,ff,f0,db,a9,7f,8d,00,dc,58,60
   50 dataa6,fc,f0,02,e6,fd,a0,00,84,fe,a9,50,85,ff,a9,3e,8d,00,ff,a9,1f,8d,00,d6,b1,fe,c8,d0,02,e6,ff,2c,00,d6,10,fb,8d,01,d6,ca,d0,ee,c6,fd,d0,ea,60
   51 dataa9,00,a8,8d,00,ff,a2,12,20,cc,cd,a2,13,20,cc,cd,a2,1f,20,cc,cd,a2,1e,8e,00,d6,2c,00,d6,10,fb,8d,01,d6,c8,d0,f5,60
   60 print"{home}{home}{clr}{swlc}{cyn}**** VDC Mode Mania - by tokra of Akronyme Analogiker ****                  V1.2"
   61 print"Slideshows for the 64K VDC and capable monitors{down}"
   70 print"(1) VDC-IHFLI (640x480 Interlace, 8x2 Color Blocks, near NTSC)"
   80 print"(2) VDC-ITFLI (640x576 Interlace, 8x3 Color Blocks, near PAL)"
   90 print"(3) VDC-FLI   (480x252 Non{$a0}Interlace, 8x1 Color Blocks)"
  100 print"(4) VDC-HFLI  (640x400 Non{$a0}Interlace, 8x2 Color Blocks)"
  110 print"(5) VDC-IMONO (720x700 Interlace, Monochrome)"
  115 print"(6) VDC-IM800 (800x600 Interlace, Monochrome)"
  116 print"(7) VDC-IM960 (960x540 Interlace, Monochrome){down}"
  120 print"(8) Big text mode PAL (9x11 chars)"
  130 print"(9) Big text mode NTSC (9x9 chars){down}"
  140 print"(0) Quit"
  141 print"{down}CRSR UP/DOWN adjusts vertical screen position"
  150 print"{down}Please choose (1-0){down}"
  155 c$="":sysdec("cdda"),,7:rregc
  160 getkeya$:if(a$<"0"ora$>"9")anda$<>"{down}"anda$<>"{up}"then160
  170 ifa$="{up}"thenc=c+1:ifc=256thenc=0
  171 ifa$="{down}"thenc=c-1:ifc=-1thenc=0
  172 sysw,c,7
  173 onval(a$)gosub1000,2000,3000,4000,5000,8000,8200,6000,7000
  180 ifa$="0"thenend:elseifa$>="1"anda$<="7"thensysdec("e179"):sysdec("ff62"):goto60:rem ionit, dlchr
  190 goto160
 1000 gosub1100:sysdec("e179"):d$="Disc 1":restore1030:readf$:gosub10000:restore1020:gosub9000:se$="settings.ihf":gosub9100
 1001 readf$:iff$="-1"thenreturn
 1002 iff$="*"thenreadf$:d$="Disc 1":sysdec("e179"):sysdec("ff62"):scnclr:gosub10000:restore1020:gosub9000:sysw,c,7:restore1040:goto1001
 1003 a=dec("5000"):l=80*120:v=dec("2b70"):n$=f$+".ct":gosub9999
 1004 a=dec("5000"):l=80*120:v=dec("0230"):n$=f$+".cb":gosub9999
 1005 a=dec("5000"):l=80*240:v=dec("aa00"):n$=f$+".bt":gosub9999
 1006 a=dec("5000"):l=80*240:v=dec("5780"):n$=f$+".bb":gosub9999
 1007 getkeyb$:ifb$=" "then1018
 1008 ifb$="{up}"thenc=c+1:ifc=133thenc=0
 1009 ifb$="{down}"thenc=c-1:ifc=-1thenc=132
 1010 ifb$=chr$(27)thenrun:elsesysw,c,7:goto1007
 1018 ifc<>othenscratch(se$),u(dn):dopen#1,(se$),u(dn),w:print#1,c:dclose#1:o=c
 1019 gosub9010:goto1001
 1020 data0,126,3,137,4,132,5,3,6,132,8,3,9,3,12,82,13,128,20,0,21,0,25,199,28,255,36,2,-1,-1:rem vdc 640x480 ntsc 8x2 col cells
 1030 dataterminator,lochness,*
 1040 datalooney,badnews,-1
 1100 print"{clr}{rvon}VDC-IHFLI{rvof}{down}":print"The specs of this mode are:":print"{down}- 640x480 pixels (interlace)":print"- color resolution of 8x2":print"- screen refresh rate of about 30 Hz"
 1110 print"{down}This mode improves upon the 2011 release of VDC-IHFLI:":print"{down}- you can adjust the vertical screen position with CRSR UP/DOWN."
 1120 print"  This is because different monitors show the screen at different vertical        positions. The setting is saved to disk."
 1130 print"- the register settings should be compatible with most monitors, and are as       close to NTSC as possible."
 1140 print"{down}This mode was successfully tested on a Commodore 1901, 1084 and the GBS-8220    CGA-to-VGA converter with added VIDEO-DAC board":print
 1199 return
 2000 gosub2100:sysdec("e179"):d$="Disc 1":restore2030:readf$:gosub10000:restore2020:gosub9000:se$="settings.itf":gosub9100
 2001 readf$:iff$="-1"thenreturn
 2002 iff$="*"thenreadf$:d$="Disc 1":sysdec("e179"):sysdec("ff62"):scnclr:gosub10000:restore2020:gosub9000:sysw,c,7:restore2040:goto2001
 2003 a=dec("5000"):l=80*96:v=dec("2080"):n$=f$+".ct":gosub9999
 2004 a=dec("5000"):l=80*96:v=dec("0000"):n$=f$+".cb":gosub9999
 2005 a=dec("5000"):l=80*288:v=dec("a280"):n$=f$+".bt":gosub9999
 2006 a=dec("5000"):l=80*288:v=dec("4100"):n$=f$+".bb":gosub9999
 2007 getkeyb$:ifb$=" "then2018
 2008 ifb$="{up}"thenc=c+1:ifc=105thenc=0
 2009 ifb$="{down}"thenc=c-1:ifc=-1thenc=104
 2010 ifb$=chr$(27)thenrun:elsesysw,c,7:goto2007
 2018 ifc<>othenscratch(se$),u(dn):dopen#1,(se$),u(dn),w:print#1,c:dclose#1:o=c
 2019 gosub9010:goto2001
 2020 data0,127,2,104,3,137,4,104,5,5,6,104,8,3,9,5,12,64,13,16,20,0,21,0,25,199,28,255,36,2,-1,-1:rem vdc 640x576 pal 8x3 col cells
 2030 datacastle,flowers,*
 2040 dataironman,jacobite,-1
 2100 print"{clr}{rvon}VDC-ITFLI{rvof}{down}":print"The specs of this mode are:":print"{down}- 640x576 pixels (interlace)":print"- color resolution of 8x3":print"- screen refresh rate of about 25 Hz"
 2110 print"{down}This mode should display on most devices:":print"{down}- you can adjust the vertical screen position with CRSR UP/DOWN."
 2120 print"  This is because different monitors show the screen at different vertical        positions. The setting is saved to disk."
 2130 print"- the register settings should be as close to PAL-standard as possible."
 2140 print"{down}This mode was successfully tested on a Commodore 1901, 1084 and the GBS-8220    CGA-to-VGA converter with added VIDEO-DAC board":print
 2199 return
 3000 gosub3100:sysdec("e179"):d$="Disc 1":restore3030:readf$:gosub10000:restore3020:gosub9000
 3001 readf$:iff$="-1"thenreturn
 3002 a=dec("5000"):l=60*252:v=dec("0000"):n$=f$+".bit":gosub9999
 3003 a=dec("5000"):l=60*252:v=dec("4000"):n$=f$+".col":gosub9999
 3004 sys4864:geta$:ifa$=chr$(27)thenrun:elsegosub9010:goto3001
 3020 data0,126,1,60,2,92,4,255,6,254,7,2,12,248,13,8,20,63,21,196,25,199,28,255,36,0,-1,-1:rem 480x252 8x1 col cells - register 9 set by assembler loop
 3030 dataaldrin,merida,parrot2,snow,stillife,-1
 3100 print"{clr}{rvon}VDC-FLI{rvof}{down}":print"The specs of this mode are:":print"{down}- 480x252 pixels":print"- color resolution of 8x1"
 3110 print"{down}This mode improves upon the 2011 release of VDC-FLI:":print"{down}- the converter was adjusted to 2D Floyd-Steinberg dithering."
 3140 print"{down}This mode was successfully tested on a Commodore 1901 and 1084 - it may not workon all monitors, try adjusting vertical hold.":print
 3199 return
 4000 gosub4100:sysdec("e179"):d$="Disc 1":restore4030:readf$:gosub10000:restore4020:gosub9000
 4001 readf$:iff$="-1"thenreturn
 4002 a=dec("5000"):l=80*200:v=dec("8000"):n$=f$+".col":gosub9999
 4003 a=dec("5000"):l=80*400:v=dec("0000"):n$=f$+".bit":gosub9999
 4004 getkeyb$:ifb$=chr$(27)thenrun:elsegosub9010:goto4001
 4020 data0,126,4,212,6,201,7,201,9,1,20,128,25,199,28,255,36,0,-1,-1:rem vdc 640x400 8x2 col cells
 4030 datahartverdraht,kingtut,tron,-1
 4100 print"{clr}{rvon}VDC-HFLI{rvof}{down}":print"The specs of this mode are:":print"{down}- 640x400 pixels":print"- color resolution of 8x2"
 4110 print"{down}This is a non-interlace mode, although refresh rate is about 37 Hz because of   the high number of vertical lines."
 4130 print"{down}This mode was successfully tested on a Commodore 1901 - it will probably not    work on most monitors unless you can adjust vertical hold";
 4131 print" and vertical size     enough.":print
 4199 return
 5000 gosub5100:sysdec("e179"):d$="Disc 2":restore5030:readf$:gosub10000:restore5020:gosub9000
 5001 readf$:iff$="-1"thenreturn
 5002 iff$="*"thenreadf$:d$="Disc 2":sysdec("e179"):sysdec("ff62"):scnclr:gosub10000:restore5020:gosub9000:restore5040:goto5001
 5003 a=dec("5000"):l=90*350:v=dec("0000"):n$=f$+".bt":gosub9999
 5004 a=dec("5000"):l=90*350:v=dec("82c8"):n$=f$+".bb":gosub9999
 5005 sysdec("cdda"),,26:rrega:fg=int(a/16):bg=a-fg*16
 5007 getkeyb$:ifb$=" "then5018
 5008 ifb$="{up}"thenfg=fg-1and15
 5009 ifb$="{down}"thenfg=fg+1and15
 5010 ifb$="{left}"thenbg=bg-1and15
 5011 ifb$="{rght}"thenbg=bg+1and15
 5012 ifb$=chr$(27)thenrun
 5013 sysw,fg*16+bg:goto5007
 5018 gosub9010:goto5001
 5020 data0,127,1,90,2,107,3,137,4,106,5,6,6,106,7,101,8,3,9,6,25,135,26,32,28,255,-1,-1:rem vdc 720x700 mono
 5030 dataavril,jacobitem,*
 5040 dataflammarion,churchill,-1
 5100 print"{clr}{rvon}VDC-IMONO{rvof}{down}":print"The specs of this mode are:":print"{down}- 720x700 pixels (interlace)":print"- monochrome"
 5105 print"{down}You can adjust the colors with CRSR UP/DOWN and CRSR LEFT/RIGHT to find a color combination that doesn't flicker too much."
 5110 print"{down}This is about the highest interlace resolution possible on the VDC. Screen      refresh rate is at about 21 Hz because of the high ";
 5111 print"number of vertical lines."
 5130 print"{down}This mode was successfully tested on a Commodore 1901 - it will probably not    work on most monitors unless you can adjust vertical hold";
 5131 print" and vertical size     enough.":print
 5199 return
 6000 sysw,234,9:rem character total vertical (v) = 11 lines (bit 0-4 = 10)
 6010 sysw,28,4:rem vertical total = (28+1)*11 (from reg 9) = 319 lines
 6020 sysw,225,5:rem vertical total adjust = 1 so 319+1=320 lines total
 6030 sysw,27,7:rem vertical sync posititon adjust
 6040 sysw,137,22:rem character total and displayed 9 lines (h)
 6050 sysw,112,0:rem horizontal total = (112+1)*9 (from reg 22) = 1017
 6060 sysw,111,34:rem display enable begin = horiz blank end (125*8/9)
 6070 sysw,89,35:rem display enable end = horiz blank begin (100*8/9)
 6080 sysw,95,2:rem horizontal sync position adjust
 6090 sysw,72,25:rem adjust horizontal scroll position
 6100 sysw,234,11:rem cursor end scan line = 11
 6110 c=27:gosub9020:return
 7000 sysw,232,9:rem character total vertical (v) = 9 lines (bit 0-4 = 8)
 7010 sysw,28,4:rem vertical total = (28+1)*9 (from reg 9) = 261 lines
 7020 sysw,227,5:rem vertical total adjust = 3 so 261+3=264 lines total
 7030 sysw,26,7:rem vertical sync posititon adjust
 7040 sysw,137,22:rem character total and displayed 9 lines (h)
 7050 sysw,112,0:rem horizontal total = (112+1)*9 (from reg 22) = 1017
 7060 sysw,111,34:rem display enable begin = horiz blank end (125*8/9)
 7070 sysw,89,35:rem display enable end = horiz blank begin (100*8/9)
 7080 sysw,95,2:rem horizontal sync position adjust
 7090 sysw,72,25:rem adjust horizontal scroll position
 7100 sysw,232,11:rem cursor end scan line = 9
 7110 c=26:gosub9020:return
 8000 gosub8100:sysdec("e179"):d$="Disc 2":restore8030:readf$:gosub10000:restore8020:gosub9000
 8001 readf$:iff$="-1"thenreturn
 8002 iff$="*"thenreadf$:d$="Disc 2":sysdec("e179"):sysdec("ff62"):scnclr:gosub10000:restore8020:gosub9000:restore8040:goto8001
 8003 a=dec("5000"):l=100*300:v=dec("0000"):n$=f$+".bt":gosub9999
 8004 a=dec("5000"):l=100*300:v=dec("7e2c"):n$=f$+".bb":gosub9999
 8005 sysdec("cdda"),,26:rrega:fg=int(a/16):bg=a-fg*16
 8007 getkeyb$:ifb$=" "then8018
 8008 ifb$="{up}"thenfg=fg-1and15
 8009 ifb$="{down}"thenfg=fg+1and15
 8010 ifb$="{left}"thenbg=bg-1and15
 8011 ifb$="{rght}"thenbg=bg+1and15
 8012 ifb$=chr$(27)thenrun
 8013 sysw,fg*16+bg:goto8007
 8018 gosub9010:goto8001
 8020 data0,127,1,100,2,112,3,137,4,92,5,6,6,92,7,87,8,3,9,6,25,135,26,32,28,255,35,106,-1,-1:rem vdc 800x600 mono
 8030 datamel,nemo,*
 8040 datakoala,neuschwanstei,-1
 8100 print"{clr}{rvon}VDC-IM800{rvof}{down}":print"The specs of this mode are:":print"{down}- 800x600 pixels (interlace)":print"- monochrome"
 8105 print"{down}You can adjust the colors with CRSR UP/DOWN and CRSR LEFT/RIGHT to find a color combination that doesn't flicker too much."
 8110 print"{down}Another high resolution interlace mode possible on the VDC. Screen refresh rate is at about 24 Hz."
 8130 print"{down}This mode was successfully tested on a Commodore 1084 - you will need a monitor being able to squeeze the image vertically as well as horizontally";
 8131 print" in order to  be able to view the full picture.{down}":print"The Commodore 1901 cannot squeeze horizontally, so you will miss the left and   right edges."
 8199 print:return
 8200 gosub8300:sysdec("e179"):d$="Disc 6 Side A":restore8230:readf$:gosub10000:restore8220:gosub9000
 8201 readf$:iff$="-1"thenreturn
 8202 iff$="*"thenreadf$:d$="Disc 2":sysdec("e179"):sysdec("ff62"):scnclr:gosub10000:restore8220:gosub9000:restore8240:goto8201
 8203 a=dec("5000"):l=120*270:v=dec("8160"):n$=f$+".bt":gosub9999
 8204 a=dec("5000"):l=120*270:v=dec("0000"):n$=f$+".bb":gosub9999
 8205 sysdec("cdda"),,26:rrega:fg=int(a/16):bg=a-fg*16
 8207 getkeyb$:ifb$=" "then8218
 8208 ifb$="{up}"thenfg=fg-1and15
 8209 ifb$="{down}"thenfg=fg+1and15
 8210 ifb$="{left}"thenbg=bg-1and15
 8211 ifb$="{rght}"thenbg=bg+1and15
 8212 ifb$=chr$(27)thenrun
 8213 sysw,fg*16+bg:goto8207
 8218 gosub9010:goto8201
 8220 data0,127,1,120,2,123,3,137,4,184,5,226,6,184,7,181,8,3,9,226,25,135,26,240,28,63,34,6,35,126,-1,-1:rem vdc 960x540 mono
 8230 datacat,lastnightsoho,*
 8240 databreakingbad,startrektas,-1
 8300 print"{clr}{rvon}VDC-IM960{rvof}{down}":print"The specs of this mode are:":print"{down}- 960x540 pixels (interlace)":print"- monochrome"
 8305 print"{down}You can adjust the colors with CRSR UP/DOWN and CRSR LEFT/RIGHT to find a color combination to your liking."
 8310 print"{down}The highest resolution interlace mode possible on the VDC yet. Screen refresh   rate is at about 28 Hz."
 8330 print"{down}This mode was specifically designed for the RGBtoHDMI-device. It will probably  not work otherwise."
 8331 print"{down}A profile for the RGBtoHDMI has been created specifically for this mode.        Make sure you have installed the latest version on your device."
 8399 print:return
 9000 reada,b:ifa=-1then9010:elsesysw,b,a:goto9000
 9010 sys5039
 9020 if(peek(dec("d600"))and7)=0thensysdec("cdda"),,25:rrega:sysw,aand248,25:rem fix for old vdc-revision
 9030 return
 9100 dopen#1,(se$),u(dn):input#1,c:dclose#1:sysw,c,7:o=c:return
 9999 bload(n$),p(a),b0,u(dn):poke252,land255:poke253,l/256:sysw,v/256,18:sysw,(v-32768)and255,19:sys4992:return
10000 print
10001 dopen#1,(f$+"*"),u(dn):dclose#1
10002 ifds<>0thenprint"{up}{CTRL-G}Insert {rvon}"d$"{rvof} and press any key":getkeyc$:goto10001:elseifc$=""thenprint"{up}{rvon}Press any key{rvof}":getkeyc$
10003 return
