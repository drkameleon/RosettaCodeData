import "/fmt" for Fmt
import "/seq" for Lst

var sos = Fn.new { |n|
    if (n < 3) return []
    var primes = []
    var k = ((n-3)/2).floor + 1
    var marked = List.filled(k, true)
    var limit = ((n.sqrt.floor - 3)/2).floor + 1
    limit = limit.max(0)
    for (i in 0...limit) {
        var p = 2*i + 3
        var s = ((p*p - 3)/2).floor
        var j = s
        while (j < k) {
            marked[j] = false
            j = j + p
        }
    }
    for (i in 0...k) {
        if (marked[i]) primes.add(2*i + 3)
    }
    return primes
}

// odds only
var soe = Fn.new { |n|
    if (n < 3) return []
    var primes = []
    var k = ((n-3)/2).floor + 1
    var marked = List.filled(k, true)
    var limit = ((n.sqrt.floor - 3)/2).floor + 1
    limit = limit.max(0)
    for (i in 0...limit) {
        if (marked[i]) {
            var p = 2*i + 3
            var s = ((p*p - 3)/2).floor
            var j = s
            while (j < k) {
                marked[j] = false
                j = j + p
            }
        }
    }
    for (i in 0...k) {
        if (marked[i]) primes.add(2*i + 3)
    }
    return primes
}

var limit = 16e6 // say
var start = System.clock
var primes = sos.call(limit)
var elapsed = ((System.clock - start) * 1000).round
Fmt.print("Using the Sieve of Sundaram generated primes up to $,d in $,d ms.\n", limit, elapsed)
System.print("First 100 odd primes generated by the Sieve of Sundaram:")
for (chunk in Lst.chunks(primes[0..99], 10)) Fmt.print("$3d", chunk)
Fmt.print("\nThe $,d Sundaram prime is $,d", 1e6, primes[1e6-1])

start = System.clock
primes = soe.call(limit)
elapsed = ((System.clock - start) * 1000).round
Fmt.print("\nUsing the Sieve of Eratosthenes would have generated them in $,d ms.", elapsed)
Fmt.print("\nAs a check, the $,d Sundaram prime would again have been $,d", 1e6, primes[1e6-1])
