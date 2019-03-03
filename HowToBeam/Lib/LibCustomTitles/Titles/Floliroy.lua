local MY_MODULE_NAME = "Floliroy"
local MY_MODULE_VERSION = 5

local LCC = LibStub('LibCustomTitlesRN')
if not LCC then return end

local MY_MODULE = LCC:RegisterModule(MY_MODULE_NAME, MY_MODULE_VERSION)
if not MY_MODULE then return end


MY_MODULE:RegisterTitle("@Floliroy", nil, 2075, {en = "Godplar"}, {color={"#F9E259", "#FE2008"}})


