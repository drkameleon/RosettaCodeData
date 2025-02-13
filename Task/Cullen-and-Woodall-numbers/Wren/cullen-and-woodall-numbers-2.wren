/* cullen_and_woodall_numbers2.wren */

import "./gmp" for Mpz

var cullen = Fn.new { |n| (Mpz.one << n) * n + 1 }

var woodall = Fn.new { |n| cullen.call(n) - 2 }

System.print("First 20 Cullen numbers (n * 2^n + 1):")
for (n in 1..20) System.write("%(cullen.call(n)) ")

System.print("\n\nFirst 20 Woodall numbers (n * 2^n - 1):")
for (n in 1..20) System.write("%(woodall.call(n)) ")

System.print("\n\nFirst 5 Cullen primes (in terms of n):")
var count = 0
var n = 1
while (count < 5) {
    var cn = cullen.call(n)
    if (cn.probPrime(15) > 0){
        System.write("%(n) ")
        count = count + 1
    }
    n = n + 1
}

System.print("\n\nFirst 12 Woodall primes (in terms of n):")
count = 0
n = 1
while (count < 12) {
    var wn = woodall.call(n)
    if (wn.probPrime(15) > 0){
        System.write("%(n) ")
        count = count + 1
    }
    n = n + 1
}
System.print()
