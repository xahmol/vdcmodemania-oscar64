#include "image.h"
#include "matrix.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>

TEMPLATE_MATRIX(BYTE,BYTE)
TEMPLATE_MATRIX(RGB,RGB)
TEMPLATE_MATRIX(FLOAT,FLOAT)

#define BUFFER_LEN 80

static void getline(char *dest, int n, FILE *stream)
{
  int c;
  int i;
    
  for(i=0;i<n-1;i++)
  {
    c=getc(stream);
    if('\n' == c || EOF == c) break;
    dest[i]=(char)c;
  }
  /* Falls bisher kein \n gelesen wurde, untersuche, ob der nächste */   
  /* char ein \n ist, falls ja, lösche es aus dem stream:           */
  if(i == n-1)
  {
    c=getc(stream);
    if('\n' != c && EOF != c) ungetc(c,stream);
  }
  /* terminieren */
  dest[i]='\0';
}

static char *stradd(const char *string1, const char *string2)
{
  char *result;
  if(NULL != (result=(char *)malloc((strlen(string1)+strlen(string2)+1)*sizeof(char))))
  {
    strcpy(result,string1);
    strcat(result,string2);
  }
  return(result);
}

static FILE *examine(const char *name, const char *extension, const char *header)
{
  FILE *stream;
  char *file;
  char buffer[BUFFER_LEN];
  if(NULL == (file=stradd(name,extension))) return(NULL);
  stream=fopen(file,"rb");
  free(file);
  if(NULL == stream) return(NULL);
  getline(buffer,BUFFER_LEN,stream);
  if(strcmp(header,/* not matching */buffer)) {fclose(stream); return(NULL);}
  return(stream);
}                                                   

IMAGE *image_alloc(SIZE cols, SIZE rows, TYPE type)
{
  IMAGE *image;
  if(NULL != (image=(IMAGE *)malloc(sizeof(IMAGE))))
  {
    image->cols=cols;
    image->rows=rows;
    image->type=type;
    switch(type)
    {
      case BYTE_IMG:  if(NULL == (image->u.b=BYTE_alloc_matrix(rows,cols))) {free(image); image=NULL;}
                      break;
      case RGB_IMG:   if(NULL == (image->u.rgb=RGB_alloc_matrix(rows,cols))) {free(image); image=NULL;}
                      break;
      case FLOAT_IMG: if(NULL == (image->u.f=FLOAT_alloc_matrix(rows,cols))) {free(image); image=NULL;}
                      break;
      default:        free(image); image=NULL;
                      break;
    }
  }
  return(image);
}

void image_free(IMAGE *image)
{
  if(NULL == image) return;
  switch(image->type)
  {
    case BYTE_IMG:  BYTE_free_matrix(image->u.b);
                    break;
    case RGB_IMG:   RGB_free_matrix(image->u.rgb);
                    break;
    case FLOAT_IMG: FLOAT_free_matrix(image->u.f);
                    break;
    default:        break;
  }
  free(image);
}

IMAGE *image_load(const char *name)
{
  FILE *stream;
  IMAGE *image;
  char buffer[BUFFER_LEN];
  SIZE cols,rows;
  TYPE type=NONE;
  unsigned int x,y;
  if(NULL == name) return(NULL);
       if(NULL != (stream=examine(name,".pgm","P5"))) type=BYTE_IMG;
  else if(NULL != (stream=examine(name,".ppm","P6"))) type=RGB_IMG;
  else if(NULL != (stream=examine(name,".pfm","P7"))) type=FLOAT_IMG;
  if(NONE == type) return(NULL);
  do getline(buffer,BUFFER_LEN,stream); while('#' == buffer[0]);
  if(2 != sscanf(buffer,"%u %u",&cols,&rows)) {fclose(stream); return(NULL);}
  do getline(buffer,BUFFER_LEN,stream); while('#' == buffer[0]);
  if(NULL == (image=image_alloc(cols,rows,type))) {fclose(stream); return(NULL);}
  for(y=0; y<image->rows; y++)
    for(x=0; x<image->cols; x++)
      switch(image->type)
      {
        case BYTE_IMG:  b_pixel(image,x,y)=(BYTE)fgetc(stream);
                        break;
        case RGB_IMG:   rgb_pixel(image,x,y).r=(BYTE)fgetc(stream);
                        rgb_pixel(image,x,y).g=(BYTE)fgetc(stream);
                        rgb_pixel(image,x,y).b=(BYTE)fgetc(stream);
                        break;
        case FLOAT_IMG: fread(&f_pixel(image,x,y),sizeof(FLOAT),1,stream);
                        break;
        default:        break;
      }
  fclose(stream);
  return(image);
}

void image_save(IMAGE *image, const char *name)
{
  FILE *stream;
  char *file, *header;
  unsigned int x,y;
  if(NULL == image || NULL == name) return;
  switch(image->type)
  {
    case BYTE_IMG:  file=stradd(name,".pgm"); header="P5";
                    break;
    case RGB_IMG:   file=stradd(name,".ppm"); header="P6";
                    break;
    case FLOAT_IMG: file=stradd(name,".pfm"); header="P7";
                    break;
    default:        return;
  }
  if(NULL == file) return;
  stream=fopen(file,"wb");
  free(file);
  if(NULL == stream) return;
  fprintf(stream,"%s\n%u %u\n255\n",header,image->cols,image->rows);
  for(y=0; y<image->rows; y++)
    for(x=0; x<image->cols; x++)
      switch(image->type)
      {
        case BYTE_IMG:  fputc(b_pixel(image,x,y),stream);
                        break;
        case RGB_IMG:   fputc(rgb_pixel(image,x,y).r,stream);
                        fputc(rgb_pixel(image,x,y).g,stream);
                        fputc(rgb_pixel(image,x,y).b,stream);
                        break;
        case FLOAT_IMG: fwrite(&f_pixel(image,x,y),sizeof(FLOAT),1,stream);
                        break;
        default:        break;
      }
  fclose(stream);
}

RGB image_rgb(BYTE r, BYTE g, BYTE b)
{
  RGB pixel;
  pixel.r=r;
  pixel.g=g;
  pixel.b=b;
  return(pixel);
}

void image_init(IMAGE *image, ...)
{
  va_list ap;
  BYTE b_value;
  RGB rgb_value;
  FLOAT f_value;
  unsigned int x,y;
  va_start(ap,image);
  if(NULL != image)
    switch(image->type)
    {
      case BYTE_IMG:  b_value=(BYTE)va_arg(ap,int);
                      for(y=0; y<image->rows; y++)
                        for(x=0; x<image->cols; x++)
                          b_pixel(image,x,y)=b_value;
                      break;
      case RGB_IMG:   rgb_value=va_arg(ap,RGB);
                      for(y=0; y<image->rows; y++)
                        for(x=0; x<image->cols; x++)
                          rgb_pixel(image,x,y)=rgb_value;
                      break;
      case FLOAT_IMG: f_value=(FLOAT)va_arg(ap,double);
                      for(y=0; y<image->rows; y++)
                        for(x=0; x<image->cols; x++)
                          f_pixel(image,x,y)=f_value;
                      break;
      default:        break;
    }
  va_end(ap);
}
