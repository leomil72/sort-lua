--[[
  An inefficient sorting algorithm, primary used in applications where, like
  the Cycle sort, the number of writes matter (i.e. when using EEPROM memories).
  It start by choosing the smallest element of the list and placing it at the first
  place, then getting the secon smallest element and placing it at the second place, 
  and so on.
]]
selection = {}

function selection.sort(tb)
  for k = 1, #tb - 1 do    
    local ix = k    
    for i = k + 1, #tb do
      if tb[i] < tb[ix] then 
        ix = i
      end    
    end
    tb[k], tb[ix] = tb[ix], tb[k]
  end
  return tb
end

return selection