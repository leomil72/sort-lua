--[[
  Cocktail sort is an improved version of Bubble Sort. On each iteration, the algorithm makes a bubble
  sort pass once forwards and once backwards. For this reasons sometimes it's also called Cocktail shaker sort
  because it resembles a shaker while shakering a drink moving from one side to the other.
]]
cocktail = {}

function cocktail.sort(tb)
  local swapped
  repeat
    swapped = false
    for i = 1, #tb - 1 do
      if tb[i] > tb[i + 1] then
        tb[i], tb[i + 1] = tb[i + 1] ,tb[i]
        swapped = true
      end
    end
  
    if not swapped then break end

    for i = #tb - 1, 1,-1 do
      if tb[i] > tb[i + 1] then
        tb[i], tb[i + 1] = tb[i + 1] , tb[i]
        swapped = true
        end
      end
  until not swapped
  return tb
end

return cocktail