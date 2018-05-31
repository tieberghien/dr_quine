#include <stdio.h>
/*
   Ciel, mon commentaire !
*/
#define OPEN_A fopen("Grace_kid.c", "ab+")
#define OPEN_B fopen("Grace_kid.c", "w")
#define FT(x)int main(){FILE *a;a = OPEN_A;FILE *b;b = OPEN_B;char *c="#include <stdio.h>%c/*%c   Ciel, mon commentaire !%c*/%c#define OPEN_A fopen(%cGrace_kid.c%c, %cab+%c)%c#define OPEN_B fopen(%cGrace_kid.c%c, %cw%c)%c#define FT(x)int main(){FILE *a;a = OPEN_A;FILE *b;b = OPEN_B;char *c=%c%s%c;fprintf(b,c,10,10,10,10,34,34,34,34,10,34,34,34,34,10,34,c,34,10,10);fclose(b);}%cFT(xxxxxxxx)%c";fprintf(b,c,10,10,10,10,34,34,34,34,10,34,34,34,34,10,34,c,34,10,10);fclose(b);}
FT(xxxxxxxx)
