---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/6 17:11
---
local BasePlugin = require "kong.plugins.base_plugin"
local json = require("cjson")
local RewriteHandler = BasePlugin:extend()
local ngx = ngx

RewriteHandler.PRIORITY = 2000
RewriteHandler.VERSION = "0.1.0"

-- 传入参数conf是这个插件存放在数据库中配置
function RewriteHandler:access(conf)
    RewriteHandler.super.access(self)

    local host = ngx.var.host
    ngx.log(ngx.DEBUG, "http-rewrite plugin, host is: ", host, " ,uri is: ",
            ngx.var.request_uri, " ,config is: ", json.encode(conf))

    local replace,n,err  = ngx.re.sub(ngx.var.request_uri, conf.regex, conf.replacement)
    if replace and n == 0 then
        return
    end

    if err then
        ngx.log(ngx.ERR, "http-rewrite plugin, ngx.re.sub err: ",err, " ,host is: ", host, " ,uri is: ",
                ngx.var.request_uri, " ,config is: ", json.encode(conf))
        return
    end

    ngx.log(ngx.DEBUG, "http-rewrite plugin, replace is: ",replace)
    if conf.flag == "redirect" then
        ngx.redirect(replace,302)
    elseif conf.flag == "permanent" then
        ngx.redirect(replace,301)
    end
end

function RewriteHandler:new()
    RewriteHandler.super.new(self, "http-rewrite")
end

return RewriteHandler