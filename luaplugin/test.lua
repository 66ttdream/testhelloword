---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/13 17:08
---
local url = require "socket.url"
local http = require "resty.http"
local function send_payload(url,body)
    local getRequestUrl=parse_url(url)

    local host = getRequestUrl.host
    local port = tonumber(getRequestUrl.port)

    local httpc = http.new()
    httpc:set_timeout(60000)

    ok, err = httpc:connect(host, port)
    if not ok then
        return nil, "failed to connect to " .. host .. ":" .. tostring(port) .. ": " .. err
    end

    if getRequestUrl.scheme == "https" then
        local _, err = httpc:ssl_handshake(true, host, false)
        if err then
            return nil, "failed to do SSL handshake with " ..
                    host .. ":" .. tostring(port) .. ": " .. err
        end
    end

    local res, err = httpc:request({
        method = "POST",
        path = getRequestUrl.path,
        query = getRequestUrl.query,
        headers = {
            ["Host"] = getRequestUrl.host,
            ["Content-Type"] = "application/x-www-form-urlencoded",
            ["Authorization"] = getRequestUrl.userinfo and (
                    "Basic " .. ngx_encode_base64(getRequestUrl.userinfo)
            ),
        },
        body = body,
    })
    if not res then
        return nil, "failed request to " .. host .. ":" .. tostring(port) .. ": " .. err
    end

    local response_body = res:read_body()
    local success = res.status == 200
    local err_msg

    if not success then
        err_msg = "request to " .. host .. ":" .. tostring(port) ..
                " returned status code " .. tostring(res.status) .. " and body " ..
                response_body
    end

    ok, err = httpc:set_keepalive(keepalive)
    if not ok then
        kong.log.err("failed keepalive for ", host, ":", tostring(port), ": ", err)
    end

    return response_body,err_msg

end

do
   response_body =  send_payload("https://kong.cdwms.cn/helloword",{helo=null})
    print(tostring(response_body))
end