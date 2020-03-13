--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/4
-- Time: 13:56
-- To change this template use File | Settings | File Templates.
--

--require ("moduletest")

--moduletest.funtion3()
table1 = {}
table.constant = 'nihao'
table.next = 'wohao'

print(table1,table1[name],table1.nconstant)
do
     for
         i=0,10
         do
         print('lianghao')
     end
end
print(#'shijianshiehnme')
arr = {"Google", "Runoob"}
for key,value in ipairs(arr)
do
    print(key,value)
end
m = {hello = 'sds',hhe='xsx',sx=sda }
o = {}
o['hello'] = 'dass'
o[2] = 'shda'
p = {'da','dsa','dsaw'}
for k,v in ipairs(p)
    do
    print(k,v)
end
print(m.hello,type(m))
opd = 'xsxs'

--[[
print(string.len(opd))

require "module"
module.func3()
]]--
tablea = {kong='dads',data='sdsa'}
tableb = {password = 'sdsa',number='sdassss'}
t = setmetatable(tablea,{_index = tableb})
print(t.password)
print(string.len('dasdads'))
TSprite = {
 x = 0,
 y = 0,
 }
 function TSprite.setPosition(x, y)
     TSprite.x = x;
    TSprite.y = y;
   end

TSprite.setPosition(1, 2);
print("TSprite坐标(" .. TSprite.x .. "," .. TSprite.y .. ")");
