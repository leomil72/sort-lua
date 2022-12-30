--[[
  Sorting algorithm that works only with positive integer numbers.
  It doesn't work by comparing elements, thus it sorts the array by counting the number
  of times each element compares in the list and then rearranging the elements using
  such values. An improvement is given by selecting the min and max values in order to
  place the initial and final extremes.
]]
counting = {}

function counting.sort(tb)
  local tb = tb
  local min, max = math.min(table.unpack(tb)), math.max(table.unpack(tb))
  local count = {}
  for i = min, max do
    count[i] = 0
  end
  
  for i = 1, #tb do
    count[tb[i]] = count[tb[i]] + 1
  end
  
  local z = 1
  for i = min, max do
    while count[i] > 0 do
      tb[z] = i
      z = z + 1
      count[i] = count[i] - 1
    end
  end
  return tb
end

return counting