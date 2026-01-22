
#include <stdio.h>
int main() {
  int N;
  scanf("%d", &N);
  int prm[30];
  prm[0] = 2;
  int i = 3;
  int n = 1;
  int j;
  while (1) {
    for (j = 0; j < n; j++) {
      if (i % prm[j] == 0)
        break;
      if (j == n - 1) {
        prm[n] = i;
        n++;
        break;
      }
    }
    if (n == N)
      break;
    i++;
  }
  printf("%d\n", prm[N - 1]);
  return 0;
}
