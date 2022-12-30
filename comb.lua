--[[
  The Comb sort is another variant of the Bubble sort where, like the Shell sort,
  the gap is changed at each iteration. The Comb sort starts by comparing far apart
  elements and then by reducing the gap, gradually closer elements.
]]
comb = {}

function comb.sort(t)
  local gapd, gap, swaps = 1.247309501, #t, 0
  while gap + swaps > 1 do
    local k = 0
    swaps = 0
    if gap > 1 then gap = math.floor(gap / gapd) end
    for k = 1, #t - gap do
      if t[k] > t[k + gap] then
        t[k], t[k + gap], swaps = t[k + gap], t[k], swaps + 1
      end
    end
  end
  return t
end

return comb