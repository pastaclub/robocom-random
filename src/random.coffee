module.exports = class Random
  a: 16807
  m: 2147483647
  q: 127773     # m / a
  r: 2836       # m % a
  
  constructor: (@seed) ->
    if not @seed?
      loop
        @seed = new Date().getTime() % @m
        break if @seed > 0 and @seed < @m
        
  random: ->
    hi = Math.floor(@seed / @q)
    lo = @seed % @q
    test = @a * lo - @r * hi
    @seed = if test > 0 then test else test + @m
    return @seed

  int: (max) ->
    maxAllowed = Math.floor(@m / max) * max;
    loop
      rnd = @random()
      break if rnd < maxAllowed
    return rnd % max
