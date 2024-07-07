--[[
  Name: Helpers.lua
  Author: ByteXenon [Luna Gilbert]
  Date: 2024-07-07
--]]

local Helpers = {}

function Helpers.stringToTable(inputString)
  local charArray, charArrayIndex = {}, 1
  for char in inputString:gmatch(".") do
    charArray[charArrayIndex] = char
    charArrayIndex = charArrayIndex + 1
  end
  return charArray
end

function Helpers.convertToLookupTable(array)
  local lookupTable = {}
  for _, value in ipairs(array) do
    lookupTable[value] = true
  end
  return lookupTable
end

function Helpers.convertToTrie(array)
  -- Initialize the trie
  local trie = {}
  for _, op in ipairs(array) do
    local node = trie
    -- Split the operator into individual characters
    for char in op:gmatch(".") do
      node[char] = node[char] or {}
      node = node[char]
    end
    node.Value = op
  end
  return trie
end

return Helpers