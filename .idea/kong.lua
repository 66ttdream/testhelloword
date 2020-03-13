--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/5
-- Time: 16:00
-- To change this template use File | Settings | File Templates.
--
--[[local BasePlugin = require "kong.plugins.base_plugin"
local RewriteHandler = BasePlugin:extend()
RewriteHandler.PRIORITY = 2000
RewriteHandler.VERSION = "0.1.0"

local cache1 = require "vendor.chache"
kong.new().reset_log('ssda')]]
print(string.byte("nihao"))