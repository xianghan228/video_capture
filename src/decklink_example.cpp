#include <stdio.h>
#include <stdlib.h>
#include <videocapture/decklink/Decklink.h>

int main() {

  printf("\n\nDecklink Example\n\n");
  ca::Decklink dl;
  dl.listDevices();

  return 0;
}

