#define TEMPLATE_MATRIX(prefix,type)                                   \
                                                                       \
void prefix##_free_matrix(type **obj)                                  \
{                                                                      \
  unsigned int i;                                                      \
  if(NULL != obj) for(i=0; NULL != obj[i]; i++) free(obj[i]);          \
  free(obj);                                                           \
}                                                                      \
                                                                       \
type **prefix##_alloc_matrix(unsigned int m, unsigned int n)           \
{                                                                      \
  type **obj;                                                          \
  unsigned int i;                                                      \
  if(NULL == (obj=(type **)malloc((m+1)*sizeof(type *)))) return(NULL);\
  for(i=0; i<m; i++)                                                   \
    if(NULL == (obj[i]=(type *)malloc(n*sizeof(type))))                \
    {                                                                  \
      prefix##_free_matrix(obj);                                       \
      return(NULL);                                                    \
    }                                                                  \
  obj[m]=NULL;                                                         \
  return(obj);                                                         \
}                                                                      \

