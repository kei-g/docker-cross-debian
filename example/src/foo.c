#include <stdio.h>

#define ___chkstk_ms()

int main(int argc, char *argv[]) {
  printf("%s: %d arguments\n", argv[0], argc);
  for (int i = 1; i < argc; i++)
    printf("  %d: %s\n", i, argv[i]);
  return 0;
}
