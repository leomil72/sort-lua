--[[
  Insertion sort is a sorting algorithm that build the sorted array by
  moving each element one item at a time. The comparison is done between
  the last element of the sorted area and the first element of the unsorted area
]]
insertion = {}

function insertion.sort(tb)
  local len = #tb
  local j
  for j = 2, len do
    local key = tb[j]
    local i = j - 1
    while i > 0 and tb[i] > key do
      tb[i + 1] = tb[i]
      i = i - 1
    end
    tb[i + 1] = key
  end
  return tb
end

return insertion