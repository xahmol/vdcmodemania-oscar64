#include <c64/memmap.h>
#include <stdlib.h>
#include <string.h>
#include <petscii.h>
#include <conio.h>
#include <c128/vdc.h>
#include <c128/mmu.h>
#include "defines.h"
#include "banking.h"
#include "vdc_core.h"
#include "vdc_win.h"

char Screen[2000];

void init(char mode)
{
	unsigned dp;
	char width;
	char pattern[8] = {0x00, 0xd4, 0xaa, 0xd4, 0xaa, 0xd4, 0xaa, 0xff};
	char y, line;

	vdc_init(mode, 0);
	if (!vdc_state.bitmap)
	{
		return;
	}

	dp = vdc_state.base_text;
	width = vdc_state.width / 8;

	for (y = 0; y < 25; y++)
	{
		for (line = 0; line < 8; line++)
		{
			vdc_block_fill(dp, pattern[line], width);
			dp += width;
		}
	}

	memset(Screen, 0, 2000);
}

void rotup(char x)
{
	char *dp = Screen + x;

#pragma unroll(full)
	for (char i = 0; i < 24; i++)
	{
		dp[0] = dp[80];
		dp += 80;
	}
	dp[0] = 0;
}

void rotdown(char x)
{
	char *dp = Screen + 80 * 24 + x;
#pragma unroll(full)
	for (char i = 0; i < 24; i++)
	{
		dp -= 80;
		dp[80] = dp[0];
	}
	dp[0] = 0;
}

inline void rotleft(char y)
{
	char *dp = Screen + 80 * y;
	for (char i = 0; i < 79; i++)
		dp[i] = dp[i + 1];
	dp[79] = 0;
}

inline void rotright(char y)
{
	char *dp = Screen + 80 * y;
	for (char i = 79; i > 0; i--)
		dp[i] = dp[i - 1];
	dp[0] = 0;
}

char colors[] = {
	VDC_BLACK | 16 * VDC_BLACK,
	VDC_BLACK | 16 * VDC_DGREY,
	VDC_DGREY | 16 * VDC_DGREY,
	VDC_DGREY | 16 * VDC_LGREY,
	VDC_LGREY | 16 * VDC_LGREY,
	VDC_LGREY | 16 * VDC_WHITE,
	VDC_WHITE | 16 * VDC_WHITE,
	VDC_WHITE | 16 * VDC_DCYAN,
	VDC_DCYAN | 16 * VDC_DCYAN,
	VDC_LBLUE | 16 * VDC_DCYAN,
	VDC_LBLUE | 16 * VDC_LBLUE,
	VDC_DBLUE | 16 * VDC_LBLUE,
	VDC_DBLUE | 16 * VDC_DBLUE,
	VDC_BLACK | 16 * VDC_DBLUE,
	VDC_BLACK | 16 * VDC_BLACK,
	VDC_BLACK | 16 * VDC_BLACK,
	VDC_BLACK | 16 * VDC_BLACK,
	VDC_BLACK | 16 * VDC_DRED,
	VDC_DRED | 16 * VDC_DRED,
	VDC_DRED | 16 * VDC_DYELLOW,
	VDC_DYELLOW | 16 * VDC_DYELLOW,
	VDC_DYELLOW | 16 * VDC_LYELLOW,
	VDC_LYELLOW | 16 * VDC_LYELLOW,
	VDC_LYELLOW | 16 * VDC_DCYAN,
	VDC_DCYAN | 16 * VDC_DCYAN,
	VDC_LGREEN | 16 * VDC_DCYAN,
	VDC_LGREEN | 16 * VDC_LGREEN,
	VDC_DGREEN | 16 * VDC_LGREEN,
	VDC_DGREEN | 16 * VDC_DGREEN,
	VDC_BLACK | 16 * VDC_DGREEN,
	VDC_BLACK | 16 * VDC_BLACK,
	VDC_BLACK | 16 * VDC_BLACK,
};

int main(void)
{
	// Init
	bnk_init();
	init(VDC_HIRES_640x200_Color_PAL);

	char cy[40], cx[12];
	for (char i = 0; i < 40; i++)
		cy[i] = 0;
	for (char i = 0; i < 12; i++)
		cx[i] = 0;

	char ch = 0;

	// Ensure no longer keypress is detected
	while (vdcwin_checkch())
	{
		;
	}

	do
	{

		for (char i = 0; i < 40; i++)
		{
			cy[i] += i + 1;
			if (cy[i] >= 24)
			{
				cy[i] -= 24;
				rotdown(39 - i);
				rotup(40 + i);
			}
		}

#pragma unroll(full)
		for (signed char i = 11; i >= 0; i--)
		{
			cx[i] += i + 1;
			if (cx[i] >= 7)
			{
				cx[i] -= 7;
				rotleft(11 - i);
				rotright(13 + i);
			}
		}

		for (char i = 0; i < 40; i++)
			Screen[80 * 12 + i] = colors[((ch + i) >> 2) & 31];
		ch++;

		vdc_mem_addr(vdc_state.base_attr);
		for (int pos = 0; pos < 2000; pos++)
		{
			vdc_write(Screen[pos]);
		}

	} while (!vdcwin_checkch());

	vdc_exit();

	return 0;
}
