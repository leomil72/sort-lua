--[[
  Named after its inventor, Donald Shell, it is similar to Bubble sort in the first
  steps and Insertion sort in the last one, but it differs from them in the way it
  works, since it uses different gaps to compare the elements so that it starts the
  sorting process may comparing values far apart and then decreases the gap until
  adjacent elements are compared, like the Insertion sort. The selected gaps affect
  its performances.
]]
shell = {}

function shell.sort( a )
  local a = a
  local gaps = {}
  local gap = 0
  -- find gaps using Tokuda's algorithm
  -- (1, 4, 9, 20, 46, 103, 233, 525, ... )
  while true do
    local tmp = math.ceil((9 * ((9/4) ^ gap) - 4) / 5)
    if tmp > #a then break end
    -- newer numbers go first
    table.insert(gaps, 1, tmp)
    gap = gap + 1
  end
  -- sort
  for _, inc in ipairs(gaps) do
    for i = inc, #a do
      local tmp = a[i]
      local j = i
      while j > inc and a[j - inc] > tmp do
        a[j] = a[j-inc]
        j = j - inc
      end
      a[j] = tmp
    end
  end 
  return a
end

return shell