    0 fast:input"pgm file";pf$:input"target";tf$
    1 dn=peek(186):lf$=chr$(10):nu$=chr$(0):open2,dn,2,pf$+",s,r"
    2 open3,dn,3,tf$+".top,p,w":open4,dn,4,tf$+".bot,p,w"
    3 print#3,chr$(0)chr$(128);:print#4,chr$(0)chr$(128);
    4 gosub14:printli$:ifli$<>"p5"thenclose2:stop
    5 gosub14:printli$:ifli$<>"960 540"thenclose2:stop
    6 gosub14:printli$:ifli$<>"255"thenclose2:stop
    7 print"header ok. press key.{down}{down}":getkeya$
    8 fory=0to539:print"{up}"y+1"{left}/540":forx=0to119
    9 forz=0to7:get#2,a$:w%(z)=-(asc(a$+nu$)>=128):nextz
   10 w=128*w%(0)+64*w%(1)+32*w%(2)+16*w%(3)+8*w%(4)+4*w%(5)+w%(6)+w%(6)+w%(7)
   11 ify/2=int(y/2)thenprint#3,chr$(w);:elseprint#4,chr$(w);
   12 nextx,y:close2:close3:close4:end
   13 :
   14 li$=""
   15 get#2,a$:ifa$<>lf$thenli$=li$+a$:goto15
   16 ifleft$(li$,1)="#"then14:rem ignore comment lines
   17 return
   18 :
   19 rem ** pgm import mono written 2010-08-07 by michael kircher
   20 rem ** adapted for vdc 800x600 2023-05-30 by torsten kracke
