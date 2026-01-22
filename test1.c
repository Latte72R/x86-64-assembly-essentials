#include <stdio.h>

int main(void) {
  int num = 2;
  switch (num) {
  case 1:
    int value = 10;
    printf("Case 1: %d\n", value);
    break;
  case 2:
    int value = 20;
    printf("Case 2: %d\n", value);
    break;
  default:
    break;
  }
  return 0;
}
