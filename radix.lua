--[[
  This is another sorting algorithm that doesn't compare the elements to
  order the given list. Instead, it applies a lexicographically sort, so it
  can be used to sort several types of items, like strings, numbers, objects
  and so. It starts ordering the elements by their first character, then by
  their second one and so over. I.e., 23, 10, 2, 71 -> 1[0], 7[1], [2], 2[3]
  -> []2, [1]0, [2]3, [7]1.
  The algorithm works with numbers converted to strings, and returns strings
  converted back to numbers, so keep this in mind if you think to adapt it
  to different values.
]]

radix = {}

function radix.sort(tb)
  local tb = tb
  local ps, max = 0, 0 
  local bucket = {}
  for n = 1, #tb do
    bucket[n] = tostring(tb[n])
    k_ln = string.len(bucket[n])
    if k_ln > max then
      max = k_ln
    end
  end
  local q
  while ps <= max do
    ps = ps + 1
    q = {}
    for n = 1, 10 do
      q[n] = {}
    end
    for n = 1, #bucket do
      k_ln = string.len(bucket[n])
      k = bucket[n]
      local pl
      if k_ln >= ps then
        pl = tonumber(string.sub(k, ps * -1, ps * -1))
      else
        pl = 0
      end
      table.insert(q[pl + 1], k)
    end
    bucket = {}
    for k, v in ipairs(q) do
      for n = 1, #v do
        table.insert(bucket, tonumber(v[n]))
      end            
    end
  end
  return bucket
end

 return radix