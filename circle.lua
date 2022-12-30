--[[
  Circle sort is a simple algorithm that works by switching the first element with the last element,
  then the second with the second last element and so on until he reaches the middle.
  Then, it performs an insertion sort
]]
circle = {}

function inner(t, lo, hi, swaps)
  if lo == hi then return swaps end
  local high, low, mid = hi, lo, math.floor((hi - lo) / 2)
  while lo < hi do
    if t[lo] > t[hi] then
      t[lo], t[hi] = t[hi], t[lo]
      swaps = swaps + 1
    end
    lo = lo + 1
    hi = hi - 1
  end
  if lo == hi then
    if t[lo] > t[hi + 1] then
      t[lo], t[hi + 1] = t[hi + 1], t[lo]
      swaps = swaps + 1
    end
  end
  swaps = inner(t, low, low + mid, swaps)
  swaps = inner(t, low + mid + 1, high, swaps)
  return swaps
end

-- Keep sorting the table until an iteration makes no swaps
function circle.sort(t)
  while inner(t, 1, #t, 0) > 0 do end
  return t
end

return circle