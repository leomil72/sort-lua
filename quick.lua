--[[
  One of the oldest and most used sorting algorithms. It starts by choosing a "pivot",
  an arbitrary value, used to divide the initial list into two sub-list, one with the
  elements lesser than the pivot, and the other one with the elements bigger than it.
  Then, it recursively the sub-list by repeating the process.
]]
quick = {}

-- in-place quicksort
function quick.inplace(tb, start, endi)
  start, endi = start or 1, endi or #tb
  if(endi - start < 1) then return tb end
  local pivot = start
  for i = start + 1, endi do
    if tb[i] <= tb[pivot] then
      if i == pivot + 1 then
        tb[pivot], tb[pivot + 1] = tb[pivot + 1], tb[pivot]
      else
        tb[pivot], tb[pivot + 1], tb[i] = tb[i], tb[pivot], tb[pivot + 1]
      end
      pivot = pivot + 1
    end
  end
  tb = quick.inplace(tb, start, pivot - 1)
  return quick.inplace(tb, pivot + 1, endi)
end

-- optimized quicksort
function quick.ssup(tb, n)
  -- Sedgewick-Incerpi sequence
  local gaps = {
    1391376, 463792, 198768, 86961, 33936, 13776,
    4592, 1968, 861, 336, 112, 48, 21, 7, 3, 1
  }
  local tb = tb
  local n = #tb
  for _, gap in ipairs(gaps) do
    for i = gap + 1, n do
      local v = tb[i]
      for j = i - gap, 1, -gap do
        local test = tb[j]
        if not (v < test) then break end
        tb[i], i = test, j
      end
      tb[i] = v
    end 
  end
  return tb
end

return quick