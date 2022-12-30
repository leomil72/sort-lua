--[[
  Cycle sort is an in-place sorting algorithm that is best known to perform
  the least number of swaps (better then selection sort). It doesn't perfom well:
  it is best suitable where memory writes are critical (i.e. in EEPROM memories)
  like in embedded devices.
]]
cycle = {}

function cycle.sort(tb)
  local writes = 0

  local cycle_start = 0
  while cycle_start < #tb - 1 do
    local val = tb[cycle_start + 1]

    -- count the number of values that are smaller than val since cycle_start
    local pos = cycle_start
    local i = cycle_start + 1
    while i < #tb do
        if tb[i + 1] < val then
            pos = pos + 1
        end
        i = i + 1
    end

    -- there aren't any
    if pos ~= cycle_start then
      -- skip duplicates
      while val == tb[pos + 1] do
          pos = pos + 1
      end

      -- put val in final position
      tb[pos + 1], val = val, tb[pos + 1]
      writes = writes + 1

      -- repeat as long as we can find values to swap
      -- otherwise start new cycle
      while pos ~= cycle_start do
        pos = cycle_start
        local i = cycle_start + 1
        while i < #tb do
            if tb[i + 1] < val then
                pos = pos + 1
            end
            i = i + 1
        end

        while val == tb[pos + 1] do
            pos = pos + 1
        end

        tb[pos + 1], val = val, tb[pos + 1]
        writes = writes + 1
      end
    end
    cycle_start = cycle_start + 1
  end

  return tb
end

return cycle