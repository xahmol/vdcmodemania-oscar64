/*
 *  i3vdc_quant.c - written 2011-07-26 by Michael Kircher
 *
 *  Quantizes a 640x576 *.ppm picture to a interlaced VDC bitmap with 8x3 attributes
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.h"

#define R_WEIGHT 299
#define G_WEIGHT 587
#define B_WEIGHT 114

#define X_SIZE 640
#define Y_SIZE 576

#define DITHER

typedef enum {false,true} boolean;

typedef struct {int r,g,b;} ERROR;

typedef struct
{
  BYTE bitmap[Y_SIZE];
  BYTE colour[Y_SIZE/3];
} VDC_COLUMN;

RGB vdc_palette[16]=
{
  {  0,   0,   0},  /* Black         */
  { 85,  85,  85},  /* Gray          */
  {  0,   0, 170},  /* Blue          */
  { 85,  85, 255},  /* Light Blue    */
  {  0, 170,   0},  /* Green         */
  { 85, 255,  85},  /* Light Green   */
  {  0, 170, 170},  /* Cyan          */
  { 85, 255, 255},  /* Light Cyan    */
  {170,   0,   0},  /* Red           */
  {255,  85,  85},  /* Light Red     */
  {170,   0, 170},  /* Magenta       */
  {255,  85, 255},  /* Light Magenta */
  {170,  85,   0},  /* Brown         */
  {255, 255,  85},  /* Yellow        */
  {170, 170, 170},  /* Light Gray    */
  {255, 255, 255},  /* White         */
};

int saturate_add(int base, int offset)
{
  int result=base+offset;
  if(result<0)   result=0;
  if(result>255) result=255;
  return(result);
}

double rgb_dist(RGB col1, RGB col2)
{
  double dr=(int)col1.r-(int)col2.r;
  double dg=(int)col1.g-(int)col2.g;
  double db=(int)col1.b-(int)col2.b;
  return(R_WEIGHT*dr*dr + G_WEIGHT*dg*dg + B_WEIGHT*db*db);
}

double quant_half_char(VDC_COLUMN *screen,
                       IMAGE *dst, IMAGE *src,
                       SIZE x, SIZE y, SIZE z,
                       ERROR error2[8],
                       boolean trial,
                       int back[2], int fore[2])
{
  RGB colour;
  ERROR error[8];
  double result=0.0;
  double try_dist,min_dist;
  int logical[2][2];
  SIZE x2,y2;
  int i,min_index,try_index;
  BYTE bitmap;

  for(i=0; i<8; i++) error[i]=error2[i];

  logical[0][0]=back[0];
  logical[0][1]=back[1];
  logical[1][0]=fore[0];
  logical[1][1]=fore[1];

  for(y2=0; y2<z; y2++)
  {
    bitmap=0;
    for(x2=0; x2<8; x2++)
    {
      colour=image_rgb(saturate_add(rgb_pixel(src,x+x2,y+y2).r,error[x2].r),
                       saturate_add(rgb_pixel(src,x+x2,y+y2).g,error[x2].g),
                       saturate_add(rgb_pixel(src,x+x2,y+y2).b,error[x2].b));
      min_dist=256.0*256.0*(R_WEIGHT+G_WEIGHT+B_WEIGHT);
      min_index=-1;
      for(try_index=0; try_index<2; try_index++)
      {
        try_dist=rgb_dist(colour,vdc_palette[logical[try_index][y2&1]]);
        if(min_dist > try_dist)
        {
          min_dist =try_dist;
          min_index=try_index;
        }
      }
      rgb_pixel(dst,x+x2,y+y2)=vdc_palette[logical[min_index][y2&1]];
      bitmap=(bitmap << 1)+min_index;
      result += min_dist;
    }
    screen[x>>3].bitmap[y+y2]=bitmap; /* fan out bitmap byte */

#ifdef DITHER
    for(x2=0; x2<8; x2++)
    {
      error[x2].r=saturate_add(rgb_pixel(src,x+x2,y+y2).r,error[x2].r)-(int)rgb_pixel(dst,x+x2,y+y2).r;
      error[x2].g=saturate_add(rgb_pixel(src,x+x2,y+y2).g,error[x2].g)-(int)rgb_pixel(dst,x+x2,y+y2).g;
      error[x2].b=saturate_add(rgb_pixel(src,x+x2,y+y2).b,error[x2].b)-(int)rgb_pixel(dst,x+x2,y+y2).b;
    }
#endif
  }
 
  if(!trial) for(i=0; i<8; i++) error2[i]=error[i];
  return(result);
}

void quant_column(VDC_COLUMN *screen, IMAGE *dst, IMAGE *src, SIZE x)
{
  ERROR error[8];
  double try_dist,min_dist;
  SIZE y;
  int i,row=0,z=0;
  int try_back[2],try_fore[2],min_back[2],min_fore[2];

  for(i=0; i<8; i++) error[i].r=error[i].g=error[i].b=0;
  for(y=0; y<src->rows; y+=z)
  {
    fprintf(stderr,"column %d, cell %d ...\n",x>>3,row>>1);
    z=6;
    min_dist=256.0*256.0*(R_WEIGHT+G_WEIGHT+B_WEIGHT)*8*z;
    min_fore[1]=min_fore[0]=-1;
    min_back[1]=min_back[0]=-1;
    for(try_back[0]=0; try_back[0]<15; try_back[0]++)
      for(try_fore[0]=try_back[0]+1; try_fore[0]<16; try_fore[0]++)
        for(try_back[1]=0; try_back[1]<15; try_back[1]++)
          for(try_fore[1]=try_back[1]+1; try_fore[1]<16; try_fore[1]++)
          {
            try_dist=quant_half_char(screen,dst,src,x,y,z,error,true,try_back,try_fore);
            if(min_dist > try_dist)
            {
              min_dist = try_dist;
              min_back[0] = try_back[0];
              min_back[1] = try_back[1];
              min_fore[0] = try_fore[0];
              min_fore[1] = try_fore[1];
            }
          }
    quant_half_char(screen,dst,src,x,y,z,error,false,min_back,min_fore);
    /* fan out attribute bytes */
    screen[x>>3].colour[row++]=(min_back[0]<<4)+min_fore[0];
    screen[x>>3].colour[row++]=(min_back[1]<<4)+min_fore[1];
  }
}

int main(int argc, char *argv[])
{
  IMAGE *src,*dst;
  VDC_COLUMN *screen;
  FILE *stream;
  SIZE x,y;

  if(      NULL == (src=image_load("input"))
     ||  X_SIZE != src->cols
     ||  Y_SIZE != src->rows
     || RGB_IMG != src->type
     ||    NULL == (dst=image_alloc(X_SIZE,Y_SIZE,RGB_IMG))
     ||    NULL == (screen=(VDC_COLUMN *)malloc((X_SIZE >> 3)*sizeof(VDC_COLUMN)))) exit(EXIT_FAILURE);

  for(x=0; x<src->cols; x+=8) quant_column(screen,dst,src,x);

  image_save(dst,"result");
  image_free(dst);
  image_free(src);

  /* write out VDC data */
  if(NULL == (stream=fopen("bitmap_top.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream); fputc(0x80,stream);
  for(y=0; y<Y_SIZE; y+=2)
    for(x=0; x<X_SIZE/8; x++)
      fputc(screen[x].bitmap[y],stream);
  fclose(stream);

  if(NULL == (stream=fopen("bitmap_bot.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream); fputc(0x80,stream);
  for(y=0; y<Y_SIZE; y+=2)
    for(x=0; x<X_SIZE/8; x++)
      fputc(screen[x].bitmap[y+1],stream);
  fclose(stream);

  if(NULL == (stream=fopen("colour_top.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream); fputc(0x80,stream);
  for(y=0; y<Y_SIZE/3; y+=2)
    for(x=0; x<X_SIZE/8; x++)
      fputc(screen[x].colour[y],stream);
  fclose(stream);

  if(NULL == (stream=fopen("colour_bot.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream); fputc(0x80,stream);
  for(y=0; y<Y_SIZE/3; y+=2)
    for(x=0; x<X_SIZE/8; x++)
      fputc(screen[x].colour[y+1],stream);
  fclose(stream);

  free(screen);
  exit(EXIT_SUCCESS);
}
