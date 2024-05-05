#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "kem.h"
#include "kex.h"
#include "params.h"
#include "indcpa.h"
#include "polyvec.h"
#include "poly.h"
#include "cpucycles.h"
#include "speed_print.h"
#include "time.h"

#define NTESTS 1000000

uint64_t t1[NTESTS];
uint64_t t2[NTESTS];
uint64_t t3[NTESTS];
uint8_t seed[KYBER_SYMBYTES] = {0};

int main()
{
  uint8_t pk[CRYPTO_PUBLICKEYBYTES];
  uint8_t sk[CRYPTO_SECRETKEYBYTES];
  uint8_t ct[CRYPTO_CIPHERTEXTBYTES];
  uint8_t key[CRYPTO_BYTES];
  uint8_t kexsenda[KEX_AKE_SENDABYTES];
  uint8_t kexsendb[KEX_AKE_SENDBBYTES];
  uint8_t kexkey[KEX_SSBYTES];
  polyvec matrix[KYBER_K];
  poly ap;
  clock_t start_kp, start_enc, start_dec;
  unsigned int i = 0, j = 0, k = 0;

  start_kp = clock();
  while (((double)(clock() - start_kp)) / CLOCKS_PER_SEC < 3.0)
  {
    t1[i] = cpucycles();
    crypto_kem_keypair(pk, sk);
    i++;
  }
  printf("%d, ", i);
  // print_results("kyber_keypair: ", t1, i);

  start_enc = clock();
  while (((double)(clock() - start_enc)) / CLOCKS_PER_SEC < 3.0)
  {
    t2[j] = cpucycles();
    crypto_kem_enc(ct, key, pk);
    j++;
  }
  printf("%d, ", j);
  // print_results("kyber_encaps: ", t2, j);

  start_dec = clock();
  while (((double)(clock() - start_dec)) / CLOCKS_PER_SEC < 3.0)
  {
    t3[k] = cpucycles();
    crypto_kem_dec(key, ct, sk);
    k++;
  }
  printf("%d, ", k);
  // print_results("kyber_decaps: ", t3, k);
}
