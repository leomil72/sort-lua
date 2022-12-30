--[[
  The Merge sort works by dividing the initial list by halving it
  more and more until each sublist contains only one (or zero) element:
  such sublist is considered ordered, so the algorithm start to
  sort and repack the the sublists by merging them to get a final
  stage where there is only a list.
]]
merge = {}

function getLower(a, b)
  local i, j = 1, 1
  return function()
    if not b[j] or a[i] and a[i] < b[j] then
      i = i + 1
      return a[i - 1]
    else
      j = j + 1
      return b[j - 1]
    end
  end  
end


function mrg(a, b)
  local res = {}
  for v in getLower(a, b) do
    res[#res + 1] = v
  end
  return res
end

function merge.sort(tb)
  if #tb <= 1 then return tb end
  local s = math.floor(#tb / 2)
  return mrg(merge.sort{table.unpack(tb, 1, s)}, merge.sort{table.unpack(tb, s + 1)})
end

return merge