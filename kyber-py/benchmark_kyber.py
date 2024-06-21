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
    # 
    
    keygen_times = []
    enc_times = []
    dec_times = []
    
    for _ in range(count):
        t0 = time()
        pk, sk = Kyber.keygen()
        keygen_times.append(time() - t0)
        
        t1 = time()
        c, key = Kyber.enc(pk)
        enc_times.append(time() - t1)
        
        t2 = time()
        dec = Kyber.dec(c, sk)
        dec_times.append(time() - t2)
            
    print(f"{round(sum(keygen_times), 5)}, {round(sum(enc_times), 5)}, {round(sum(dec_times), 5)}", end="" if name == "Kyber1024" else ", ")
    
if __name__ == '__main__':
    # profile_kyber(Kyber512)
    # profile_kyber(Kyber768)
    # profile_kyber(Kyber1024)

    kyberLevels = ["Kyber512", "Kyber768", "Kyber1024"]
    
    count = 1000
    
    benchmark_kyber(Kyber512, "Kyber512", count)
    benchmark_kyber(Kyber768, "Kyber768", count)    
    benchmark_kyber(Kyber1024, "Kyber1024", count)    