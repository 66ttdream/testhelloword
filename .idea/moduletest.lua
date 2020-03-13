--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/4
-- Time: 13:53
-- To change this template use File | Settings | File Templates.
--
moduletest = {}
moduletest.name = moduletest
function moduletest.function1()
    io.write('这是一个测试共有函数')
end
local function function2()
    print('这是一个测试私有函数')
end

function moduletest.function3()
    function2()
end
return moduletest
