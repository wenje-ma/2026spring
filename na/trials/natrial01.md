# 1

---

**1**

利用循环语句,计算数列$\sqrt{5},\sqrt{\sqrt{5}},\sqrt{\sqrt{\sqrt{5}}},\dots$的极限,要求误差小于$10^{-8}$.

**解答**

由于数列收敛,故只需计算相邻两项的差,其必是逐渐趋于$0$的.误差小于$10^{-8}$意味着相邻两项之差小于$10^{-8}$.

代码如下:

```matlab
%natrial0101.m
%先前的数
x_prev=sqrt(5);
%现在的数
x_curr=sqrt(x_prev);
%误差
error=abs(x_curr-x_prev);
%阈值
tol=1e-8;
%迭代次数
iter=1;
while error>=tol
    x_prev=x_curr;
    x_curr=sqrt(x_prev);
    error=abs(x_curr-x_prev);
    iter=iter+1;
end
fprintf('%.15f\n',x_curr);
```

输出结果如下:

```
>>notes0101
1.000000005995623
```

---

**2**

利用级数

$\frac{\pi}{4} = 1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \cdots$

计算无理数$\pi$的近似值.由于交错级数的部分和数列$S_N$围绕级数的和上下摆动,截断误差将小于第一个被舍弃的项$a_{n+1}$的绝对值.试分析：若要使截断误差小于$10^{-4}$或$10^{-8}$,应取多少项求和?并分别计算$\pi$的近似值.

**解答**

已知$|a_{n+1}|=1/(2n-1)< \epsilon$,即$n> (1/\epsilon+1)/2$.

代码如下:

```matlab
%natrial0102.m
%误差
tol=input('');
%求和项数
n=ceil((1/tol+1)/2);
fprintf('n=%d\n',n);
%求和
k=1:n;
terms=(-1).^(k-1)./(2*k-1);
sum_result=sum(terms);
fprintf('pi=%.15f',4*sum_result);
```

输出结果如下:

```
>>notes0102
1e-4
n=5001
pi=3.141792613595791
>>notes0102
1e-8
n=50000001
pi=3.141592673590250
```

> [!NOTE]
>
> 应当充分发挥北太天元处理矩阵的优势:先把每一项算出来再加和,而不是利用迭代算一项加一项,否则对于`n=50000001`时软件会崩溃.
>

---

**3**

在同一坐标系下,利用plot函数画出函数

$y = \sin x,\quad y_n = \sum_{i=0}^{n} (-1)^i \frac{x^{2i+1}}{(2i+1)!}\quad (n = 2, 5, 10)$

的图形,并加标注说明各条曲线的含义.

**解答**

代码如下:

```matlab
%natrial01sin_taylor.m
function y_taylor=sin_taylor(x,n)
    iter=(0:n)';
    term=(-1).^iter.*(x.^(2*iter+1)./factorial(2*iter+1));
    y_taylor=sum(term,1);
end
```

```matlab
%natrial0103.m
x=-4*pi:0.01:4*pi;
%函数sin(x)
y_sin=sin(x);
%自定义函数sin_taylor,详见sin_taylor.m
%3个Taylor部分和
y_2=sin_taylor(x,2);
y_5=sin_taylor(x,5);
y_10=sin_taylor(x,10);
%绘制图像
figure;
hold on;
plot(x,y_sin,'b');
plot(x,y_2,'r');
plot(x,y_5,'g');
plot(x,y_10,'m');
%限制y的显示范围
ylim([-2, 2]);
%注释
legend('sin(x)','n=2 Tayor','n=2 Tayor','n=2 Tayor','Location','best');
xlabel('x');
ylabel('y');
```

输出结果如下:

![notes0103](C:\baltamatica\examples\2026spring\notes0103.png)

---

**4**

分别将区间$[-10,10]$分为100,200,400等份,利用`mesh`或`surf`命令画出二元函数

$z = e^{-|x|} + \cos(x + y) + \frac{1}{x^2 + y^2 + 1}$

的三维图形.

**解答**

代码如下:

```matlab
%natrial01mesh_3d.m
function mesh_3d(n)
    x=-10:20/n:10;
    y=-10:20/n:10;
    [X,Y]=meshgrid(x,y);
    Z=exp(-abs(X))+cos(X+Y)+1./(X.^2+Y.^2+1);
    figure();
    mesh(X,Y,Z);
    xlabel('x');
    ylabel('y');
    zlabel('z');
end
```

```matlab
%natrial0104.m
mesh_3d(100);
title('n=100');
mesh_3d(200);
title('n=200');
mesh_3d(400);
title('n=400');
```

输出结果如下:

![notes010401](C:\baltamatica\examples\2026spring\notes010401.png)

![notes010402](C:\baltamatica\examples\2026spring\notes010402.png)

![notes010403](C:\baltamatica\examples\2026spring\notes010403.png)