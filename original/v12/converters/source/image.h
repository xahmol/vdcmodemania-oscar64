typedef unsigned int SIZE;

typedef enum {NONE=0, BYTE_IMG=4, FLOAT_IMG=6, RGB_IMG=17} TYPE;

typedef unsigned char BYTE;

typedef struct
{
  BYTE r;
  BYTE g;
  BYTE b;
} RGB;

typedef float FLOAT;

typedef struct
{
  SIZE cols;
  SIZE rows;
  TYPE type;
  union
  {
    BYTE **b;
    RGB **rgb;
    FLOAT **f;
  } u;
} IMAGE;

#define b_pixel(P,X,Y) ((P)->u.b[Y][X])
#define rgb_pixel(P,X,Y) ((P)->u.rgb[Y][X])
#define f_pixel(P,X,Y) ((P)->u.f[Y][X])

IMAGE *image_alloc(SIZE cols, SIZE rows, TYPE type);
void image_free(IMAGE *image);
IMAGE *image_load(const char *name);
void image_save(IMAGE *image, const char *name);
RGB image_rgb(BYTE r, BYTE g, BYTE b);
void image_init(IMAGE *image, ...);
