Random = require '../src/random'

rng = new Random(1)
MAX = 650
frequency = []
frequency[i] = 0 for i in [0...MAX] by 1

for i in [0...100000]
  r = rng.int MAX
  frequency[r]++
  process.stdout.write "#{r} "
  process.stdout.write "\n" if i % 20 is 0

console.log "\n\nStatistics: \n"

for i in [0...MAX]
  process.stdout.write "#{frequency[i]} "
  process.stdout.write "\n" if i % 20 is 19

# Korrektheitstest lt. Keith Miller
expected = 1043618065
rng.seed = 1
rng.random() for i in [0...10000]
console.log "\n\nz(10001) = #{rng.seed}\nExpected:  #{expected}"

if rng.seed is expected
  console.log "Test passed!"
  process.exit 0
else
  console.log "Test failed!"
  process.exit 1
