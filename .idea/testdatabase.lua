--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/4
-- Time: 11:30
-- To change this template use File | Settings | File Templates.
--
require "luasql.mysql"

--创建环境对象
env = luasql.mysql()

--连接数据库
conn = env:connect("data","root","*u!-w;j*#2&J","192.167.1.250",3306)

--设置数据库的编码格式
conn:execute"SET NAMES UTF8"

--执行数据库操作
cur = conn:execute("select * from role")

row = cur:fetch({},"a")

--文件对象的创建
file = io.open("role.txt","w+");

while row do
    var = string.format("%d %s\n", row.id, row.name)

    print(var)

    file:write(var)

    row = cur:fetch(row,"a")
end


file:close()  --关闭文件对象
conn:close()  --关闭数据库连接
env:close()   --关闭数据库环境