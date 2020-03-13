--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/4
-- Time: 16:48
-- To change this template use File | Settings | File Templates.
--

---文件名为 module.lua
-- 定义一个名为 module 的模块
module={}

-- 定义一个常量
module.constant = "这是一个常量"
module.shijian = '12:00:00'

-- 定义一个函数
function module.func1()
    io.write("这是一个公有函数！\n")
end

local function func2()
    print("这是一个私有函数！")
end

function module.func3()
    func2()
end


return module