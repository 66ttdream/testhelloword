---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/13 17:31
---
local http = require "resty.http"
local httpc = http.new()
local url = "http://ip：端口/......"
local resStr --响应结果
local res, err = httpc:request_uri(url, {
    method = "POST",
    --args = str,
    body = str,
    headers = {
        ["Content-Type"] = "application/json",
    }
})

if not res then
    ngx.log(ngx.WARN,"failed to request: ", err)
    return resStr
end
--请求之后，状态码
ngx.status = res.status
if ngx.status ~= 200 then
    ngx.log(ngx.WARN,"非200状态，ngx.status:"..ngx.status)
    return resStr
end
--header中的信息遍历，只是为了方便看头部信息打的日志，用不到的话，可以不写的
for key, val in pairs(res.headers) do
    if type(val) == "table" then
        ngx.log(ngx.WARN,"table:"..key, ": ", table.concat(val, ", "))
    else
        ngx.log(ngx.WARN,"one:"..key, ": ", val)
    end
end
--响应的内容
resStr = res.body