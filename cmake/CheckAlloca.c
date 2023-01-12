#include <stdlib.h>
#include <stddef.h>
#ifndef alloca
#   ifdef __GNUC__
#       define alloca __builtin_alloca
#   elif defined _MSC_VER
#       include <malloc.h>
#       define alloca _alloca
#   else
#       ifdef  __cplusplus
extern "C"
#       endif
void *alloca (size_t);
#   endif
#endif

int main()
{
    char *p = (char *) alloca (1);
    if (p) return 0;
}
