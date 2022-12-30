--[[
  Sorting algorithms in pure Lua code. They are compared with the integrated
  sorting algorithm found in table library, that is the Quicksort. For
  commodity and easy of re-usage of the code, each algorithm is provided 
  as a single module that can be copied in your projects.

  Released in the public domain.

  Leonardo Miliani (2022)
]]

-- include modules
require "bubble"
require "circle"
require "cocktail"
require "comb"
require "counting"
require "cycle"
require "heap"
require "insertion"
require "merge"
require "quick"
require "radix"
require "selection"
require "shell"

-- main functions --

-- create a new table with n random elements
function newTable(n)
  local n = n or 100
  local tb = {}
  for i = 1, n do
    local x = math.random(n)
    table.insert(tb, x)
  end
  return tb
end

-- check if the array is sorted
-- if prt is true, it also prints the elements
function verifyArray(tb, prt)
  local prt = prt or false
  local tb = tb
  if tb == nil then return 'NO' end
  if prt then
    io.write('[ ')
    for i, v in ipairs(tb) do
      io.write(v .. ', ')
    end
    io.write('\b\b ]\n')
  end
  if #tb == 1 then return 'Yes' end
  for i = 1, #tb - 1 do
    if tb[i] > tb[i + 1] then return 'NO' end
  end
  return 'Yes'
end

-- execute the sorting algorithm
-- if sortAlg is nil, it calls table.sort instead
function launchSort(sortAlg, sortName, tb)
  io.write('Sort with ' .. sortName .. '... \t')
  -- create a new copy of the table
  local tb = table.pack(table.unpack(tb))
  local a, t1, t2
  local sortAlg = sortAlg
  -- measures the running time
  if sortAlg == nil then
    t1 = os.clock()
    table.sort(tb)
    t2 = os.clock()
    a = tb
  else
    t1 = os.clock()
    a = sortAlg(tb)
    t2 = os.clock()
  end
  io.write('Time: ' .. (t2 - t1) .. '\t' )
  print('Ordered: ' .. verifyArray(a))
end

-- main program
local tbl = newTable(1000)
launchSort(bubble.sort, "Bubble sort", tbl)
launchSort(circle.sort, "Circle sort", tbl)
launchSort(comb.sort, "Comb sort", tbl)
launchSort(cocktail.sort, "Cocktail sort", tbl)
launchSort(counting.sort, "Counting sort", tbl)
launchSort(cycle.sort, "Cycle sort", tbl)
launchSort(nil, "Embedded sort", tbl)
launchSort(heap.sort, "Heap sort", tbl)
launchSort(insertion.classic, "Insertion sort", tbl)
launchSort(merge.sort, "Merge sort", tbl)
launchSort(quick.inplace, "(in-place) Quick sort", tbl)
launchSort(quick.ssup, "(optimized) Quick sort", tbl)
launchSort(radix.sort, "Radix sort", tbl)
launchSort(selection.sort, "Selection sort", tbl)
launchSort(shell.sort, "Shell sort", tbl)
