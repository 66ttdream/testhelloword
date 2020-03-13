---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/11 15:52
---
--发送请求
--@parameter method：请求方法POST/GET/...
--@parameter api:发起自请求的地址
--@return 返回请求响应的body(json)
local function send_payload(method,api)
    --local getRequestUrl=parse_url(url)

    local host = kong.request.get_host()
    local port = kong.request.get_port()

    local httpc = http.new()
    httpc:set_timeout(60000)

    ok, err = httpc:connect(host, port)
    if not ok then
        return nil, "failed to connect to " .. host .. ":" .. tostring(port) .. ": " .. err
    end

    if kong.request.get_scheme == "https" then
        local _, err = httpc:ssl_handshake(true, host, false)
        if err then
            return nil, "failed to do SSL handshake with " ..
                    host .. ":" .. tostring(port) .. ": " .. err
        end
    end
    --发起http子请求
    local res, err = httpc:request({
        method = method,
        path = api.path,
        query = kong.request.get_raw_queryy(),
        headers = {
            ["Host"] = api.host,
            ["Content-Type"] = "application/x-www-form-urlencoded",
            --此处需要考虑
            ["Authorization"] = kong.request.ge_header("Authorization"),
        },
        body = kong.request.get_body(),
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

--解析json
--@parameter body:响应解析的body
--@return body内容被解析后以table类型返回
local function get_json(body)

    local cjson = require("cjson")
    local json=cjson.new()
    kong.log("解析json开始")
    local table = json.decode(body)

    if table ~= nil and next(table) ~= nil then
        kong.log("取得json"..tostring(table))
    end

    for k, v in pairs(table["RoleList"]) do
        --print(k .. " : " .. v)
        kong.log("\njson存储的值名为："..k.."\n值为："..tostring(v).."\n")
    end
    return table
end

--合并body内容
--@return 返回多个body合并后的body
--@parameter a:table1
--@parameter ...:table2-tablen
local function overlay_body(a,...)
    local table
    local arg = {...}
    for k,v in ipairs(arg) do
        if k==1 then
            table = kong.table.new(a,v)
        end
        kong.table.new(table,v)
    end
    return table
end


--组装body
--@parameter json:json字符串
--@parameter table：源数据表
--@return 元素被替换后的json（最终响应客户端的body）
local function assemble_body(json，table)
    local jp = require('jsonpath')
    local cjson = require("cjson")
    table_json = cjson.decode(json)
    for k,v in pairs(table_json) do
        if jp.query(table,tostring(k))~=nil then
            table_json[k] = jp.query(table,tostring(k))
        end
        if type(v)==table and v~=nil then
            for x,y in pairs(v) do
                if jp.query(table,tostring(k))~=nil then
                    table_json[k] = jp.query(table,tostring(k))
                end
            end
        end
    end
    json_response = cjson.encode(table_json)
    return json_response
end


--返回响应数据
local function send_response(heders,body)
    kong.request.exit(200,body,headers)
end