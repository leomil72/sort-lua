--[[
  Bubble sort is one of the simplest and most known sorting algorithms.
  It is named for the way the larger elements "bubble" up to the top of the list.
  It is an inefficient sorting algorithm for big lists of data: it still continue
  to be utilized becauses it used in the schools to introduce new programmers to
  the sorting algorithms.
]]
bubble = {}

function bubble.sort(tb)
  local tb = tb
  local itemCount = #tb
  local hasChanged
  repeat
    hasChanged = false
    itemCount = itemCount - 1
    for i = 1, itemCount do
      if tb[i] > tb[i + 1] then
        tb[i], tb[i + 1] = tb[i + 1], tb[i]
        hasChanged = true
      end
    end
  until hasChanged == false
  return tb
end

return bubble