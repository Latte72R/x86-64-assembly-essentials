int main(void) {
  int arr[5] = {5, 2, 4, 3, 7};
  int multi = 1;
  int i;
  for (i = 0; i < 5; i++) {
    multi *= arr[i];
  }
  return multi % 17;
}
