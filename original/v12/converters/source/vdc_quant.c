/*
 *  vdc_quant.c
 *
 *  Date of creation: 2011-06-27  Michael Kircher
 *
 *  Quantize a 480x252 *.ppm file to VDC-FLI on C128 using Floyd-Steinberg dithering
 */

#include <stdio.h>
#include <stdlib.h>
#include "image.h"

#define R_WEIGHT 299
#define G_WEIGHT 587
#define B_WEIGHT 114

#define X_SIZE 480
#define Y_SIZE 252

typedef enum {false,true} boolean;

typedef struct {int r,g,b;} ERROR;

typedef struct
{
  BYTE bitmap[X_SIZE/8];
  BYTE colour[X_SIZE/8];
} VDC_LINE;

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

int saturate_add(int a, int b)
{
  int c=a+b;
  if(c<0)   c=0;
  if(c>255) c=255;
  return(c);
}

double rgb_dist(RGB col1, RGB col2)
{
  double dr=(int)col1.r-(int)col2.r;
  double dg=(int)col1.g-(int)col2.g;
  double db=(int)col1.b-(int)col2.b;
  return(R_WEIGHT*dr*dr + G_WEIGHT*dg*dg + B_WEIGHT*db*db);
}

double quant_char(VDC_LINE *screen, IMAGE *dst, IMAGE *src,
                  int x0, int y0, int dx,
                  ERROR *error2_curr, ERROR *error2_next, boolean trial,
                  int back, int fore)
{
  double result=0.0;
  int x,x1,x2;
  ERROR error_curr[10],error_next[10];
  int logical[2];
  RGB col;
  int try_index,min_index;
  double try_dist,min_dist;
  int dr,dg,db;
  unsigned char byte=0;

  for(x=0; x<10; x++)
  {
    error_curr[x]=error2_curr[x0+x];
    error_next[x]=error2_next[x0+x];
  }

  logical[0]=back;
  logical[1]=fore;

  if(1 == dx) {x1=0; x2=8;} else {x1=7; x2=-1;}

  for(x=x1; x!=x2; x+=dx)
  {
    col=image_rgb(saturate_add(rgb_pixel(src,x0+x,y0).r,(error_curr[x+1].r+8)>>4),
                  saturate_add(rgb_pixel(src,x0+x,y0).g,(error_curr[x+1].g+8)>>4),
                  saturate_add(rgb_pixel(src,x0+x,y0).b,(error_curr[x+1].b+8)>>4));
    min_dist=256.0*256.0*(R_WEIGHT+G_WEIGHT+B_WEIGHT);
    min_index=-1;
    for(try_index=0; try_index<2; try_index++)
    {
      try_dist=rgb_dist(col,vdc_palette[logical[try_index]]);
      if(min_dist > try_dist)
      {
        min_dist  = try_dist;
        min_index = try_index;
      }
    }
    result+=min_dist;
    byte |= min_index << (7-x);
    rgb_pixel(dst,x0+x,y0)=vdc_palette[logical[min_index]];

    dr=(int)col.r-(int)vdc_palette[logical[min_index]].r;
    dg=(int)col.g-(int)vdc_palette[logical[min_index]].g;
    db=(int)col.b-(int)vdc_palette[logical[min_index]].b;
    /* apply Floyd-Steinberg dither-matrix */
    error_curr[x+1+dx].r += 7*dr;
    error_curr[x+1+dx].g += 7*dg;
    error_curr[x+1+dx].b += 7*db;
    error_next[x+1+dx].r +=   dr;
    error_next[x+1+dx].g +=   dg;
    error_next[x+1+dx].b +=   db;
    error_next[x+1   ].r += 5*dr;
    error_next[x+1   ].g += 5*dg;
    error_next[x+1   ].b += 5*db;
    error_next[x+1-dx].r += 3*dr;
    error_next[x+1-dx].g += 3*dg;
    error_next[x+1-dx].b += 3*db;
  }
  screen[y0].bitmap[x0 >> 3] = byte; /* fan out bitmap byte */
 
  if(!trial)
    for(x=0; x<10; x++)
    {
      error2_curr[x0+x]=error_curr[x];
      error2_next[x0+x]=error_next[x];
    }

  return(result);
}

void quant_line(VDC_LINE *screen, IMAGE *dst, IMAGE *src,
                int y0, 
                ERROR *error_curr, ERROR *error_next)
{
  double try_dist,min_dist;
  int try_fore,min_fore;
  int try_back,min_back;
  int x,x1,x2,dx;

  if(y0&1) {x1=0; x2=X_SIZE; dx=1;} else {x1=X_SIZE-8; x2=-8; dx=-1;}

  for(x=x1; x!=x2; x+=8*dx)
  {
    min_dist=256.0*256.0*(R_WEIGHT+G_WEIGHT+B_WEIGHT)*8;
    min_fore=-1;
    for(try_back=0; try_back<15; try_back++)
      for(try_fore=try_back+1; try_fore<16; try_fore++)
      {
        try_dist=quant_char(screen,dst,src,x,y0,dx,error_curr,error_next,true,try_back,try_fore);
        if(min_dist > try_dist)
        {
          min_dist = try_dist;
          min_fore = try_fore;
          min_back = try_back;
        }
      }
    quant_char(screen,dst,src,x,y0,dx,error_curr,error_next,false,min_back,min_fore);
    screen[y0].colour[x >> 3] = (min_back << 4)+min_fore; /* fan out colour byte */
  }
}


int main(int argc, char *argv[])
{
  IMAGE *src,*dst;
  VDC_LINE *screen;
  FILE *stream;
  ERROR error_curr[X_SIZE+2],error_next[X_SIZE+2];
  SIZE x,y,y2;

  if(      NULL == (src=image_load("input"))
     ||  X_SIZE != src->cols
     ||  Y_SIZE != src->rows
     || RGB_IMG != src->type
     ||    NULL == (dst=image_alloc(X_SIZE,Y_SIZE,RGB_IMG))
     ||    NULL == (screen=(VDC_LINE *)malloc(Y_SIZE*sizeof(VDC_LINE)))) exit(EXIT_FAILURE);

  for(x=0; x<X_SIZE+2; x++)
  {
    error_curr[x].r=error_curr[x].g=error_curr[x].b=0;
    error_next[x].r=error_next[x].g=error_next[x].b=0;
  }

  for(y=0; y<src->rows; y++)
  {
    fprintf(stderr,"Line %d ...\n",y);
    quant_line(screen,dst,src,y,error_curr,error_next);
    for(x=0; x<X_SIZE+2; x++)
    {
      error_curr[x]=error_next[x];
      error_next[x].r=error_next[x].g=error_next[x].b=0;
    }
  }

  image_save(dst,"result");
  image_free(dst);
  image_free(src);

  /* write out VDC data */
  if(NULL == (stream=fopen("bitmap.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream);
  fputc(0x80,stream);
  for(y=0; y<Y_SIZE; y++)
    for(x=0; x<X_SIZE >> 3; x++)
      fputc(screen[y].bitmap[x],stream);
  fclose(stream);

  if(NULL == (stream=fopen("colour.prg","wb"))) exit(EXIT_FAILURE);
  fputc(0x00,stream);
  fputc(0x80,stream);
  for(y=0; y<Y_SIZE; y++)
    for(x=0; x<X_SIZE >> 3; x++)
      fputc(screen[y].colour[x],stream);
  fclose(stream);

  free(screen);
  exit(EXIT_SUCCESS);
}
