---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Administrator.
--- DateTime: 2020/3/9 17:21
---
return {
    name = "response_plugin",
    no_consumer = true, -- 此插件仅适用于服务或路由，
    fields = {
        -- 在此处描述您的插件配置架构。
    },
    self_check = function(schema, plugin_t, dao, is_updating)
        -- 执行任何自定义验证
        return true
    end
}