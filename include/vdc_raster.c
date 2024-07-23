#include <stdlib.h>
#include <petscii.h>
#include <c64/cia.h>
#include <c128/vdc.h>
#include "vdc_core.h"
#include "vdc_raster.h"

void raster_waitline(char rasterline)
{
    __asm
    {
        lda rasterline

    rw_wait1:
        cmp $dd06
        bne rw_wait1

        lsr
        lsr
        lsr
        lsr
        sta rw_waitjump+1

    rw_waitjump:
        bne rw_lineend
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
    rw_lineend:

    };
}

void raster_synch()
{
    __asm 
    {
        sei
        ldx #$7F
        stx $dd0d
        ldx #63
        stx $dd04
        ldx #$FF
        stx $dd06
        lda #$00
        sta $dd05
        sta $dd07
        lda #$20
    rs_wait1:
        bit $d600
        bne rs_wait1
        ldx #7
        nop
    rs_wait2:
        dex
        bne rs_wait2
        lda #$11
        sta $dd0e
        lda #$51
        sta $dd0f
    };
}