from kyber import Kyber512, Kyber768, Kyber1024
import cProfile
from time import time

def profile_kyber(Kyber):
    pk, sk = Kyber.keygen()
    c, key = Kyber.enc(pk)
    
    gvars = {}
    lvars = {"Kyber": Kyber, "c": c, "pk": pk, "sk": sk}
    
    cProfile.runctx("Kyber.keygen()", globals=gvars, locals=lvars, sort=1)
    cProfile.runctx("Kyber.enc(pk)", globals=gvars, locals=lvars, sort=1)
    cProfile.runctx("Kyber.dec(c, sk)", globals=gvars, locals=lvars, sort=1)
    
def benchmark_kyber(Kyber, name, count):
    # Banner
    # print(f"-"*27)
    # print(f"  {name} | ({count} calls)")
    # print(f"-"*27)
    
    keygen_times = []
    enc_times = []
    dec_times = []
    keygen = 0
    enc = 0
    decap = 0

    given_time = 3  # given time in seconds

    # For Kyber.keygen()
    start_time = time()
    elapsed_time = 0
    while elapsed_time < given_time:
        pk, sk = Kyber.keygen()
        elapsed_time = time() - start_time
        keygen += 1

    # For Kyber.enc()
    start_time = time()
    elapsed_time = 0
    while elapsed_time < given_time:
        c, key = Kyber.enc(pk)
        elapsed_time = time() - start_time
        enc += 1

    # For Kyber.dec()
    start_time = time()
    elapsed_time = 0
    while elapsed_time < given_time:
        dec = Kyber.dec(c, sk)
        elapsed_time = time() - start_time
        decap += 1

    print(keygen,enc,decap, sep=', ', end="" if name == "Kyber1024" else ", ")
    # print(round(sum(keygen_times),3), round(sum(enc_times), 3), round(sum(dec_times),3), sep=', ', end="" if name == "Kyber1024" else ", ")
    
if __name__ == '__main__':
    # profile_kyber(Kyber512)
    # profile_kyber(Kyber768)
    # profile_kyber(Kyber1024)
    
    count = 1000
    benchmark_kyber(Kyber512, "Kyber512", count)
    benchmark_kyber(Kyber768, "Kyber768", count)    
    benchmark_kyber(Kyber1024, "Kyber1024", count)    