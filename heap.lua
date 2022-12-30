--[[
  Sorting algorithm that is based on the usage of a heap data structure, to divide the array
  into 2 areas: an unsorted and a sorted one. The algorithm repeatedly looks for the bigger
  value in the unsorted area and moves it into the sorted area, rearraning the other elements.
]]
heap = {}

function heap.sort(tb)
	local c = #tb
	heap.heap(tb, c)

	while c > 1 do
    tb[c], tb[1] = tb[1], tb[c]
		c = c - 1
		heap.siftDown(tb, 1, c)
	end
	return tb
end

function heap.heap(tb, c)
	st = math.floor(c/2)
	while st >= 1 do
		heap.siftDown(tb, st, c)
		st = st - 1
	end
end

function heap.siftDown(tb, st, en)
	local rt = st

	while rt * 2 <= en do
		local ch = rt * 2
		if ch + 1 <= en and tb[ch] < tb[ch + 1] then
			ch = ch + 1
		end
		if tb[rt] < tb[ch] then
			tb[rt], tb[ch] = tb[ch], tb[rt]
			rt = ch
		else
			break
		end
	end
end

return heap