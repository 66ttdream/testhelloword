--
-- Created by IntelliJ IDEA.
-- User: Administrator
-- Date: 2020/3/3
-- Time: 10:20
-- To change this template use File | Settings | File Templates.
--


print("Hello World！")
print("www.runoob.com")
date = 123
date = nil
print(date)
kak = 'nihao'
print(type(kak))
kka = (type(x)=="nil")
print(kka)
print(type(kka))
tbl1 = {}
a3 = {}
for i = 1, 10 do
    a3[i] = i
end
a3["key"] = "val"
print(a3["key"])
print(a3["none"])
function test()
    a=12
    local b=214
end
test(a,b)
print(a)
print(b)
a = {1,2,3,2,4,4 }
a[1] = nil
print(a[1])
print(a[2])
a=nil
a,b,c,d=1,2,3,4
print(a)
a,d,c,e=1,2
print(e)
function test()
    a=2
    b=3.
    return a,b
end
x,y=test()
print(x)
t,y,u=0
print(t,y,u)
function add1(z)
    while(z<10)
        do
        local z=z+1
        end
end

--print(add1(4))
print(m)
for i=1, 10, 2  do
    print(i)
end
add = function (q,w)
       print(q+w)
end
do
    function foo(...)
        for i = 1, select('#', ...) do  -->获取参数总数
            local arg = select(i, ...); -->读取参数
            print("arg", arg);
        end
    end

    foo(1, 2, 3, 4);
end

array = {1,2,8,5,6,}
for
    i=0,5,2 do
    local a=array[i]
    print(a)
    end