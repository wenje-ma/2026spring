# 6

## 1

已知数据表如下：

|$x_i$|1.36|1.49|1.73|1.81|1.95|2.16|2.28|2.48|
|:----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|:-----:|
|$y_i$|14.094|15.069|16.844|17.378|18.435|19.949|20.963|22.495|

试求其最小二乘一次拟合多项式。

### 解答

由(6.5)式：

$\begin{cases}a_0+a_1\sum x_i=\sum y_i\\a_0\sum x_i+a_1\sum x_i^2=\sum x_iy_i\end{cases}$，

由数据计算：

$\sum x_i=15.26,\sum x_i^2=30.1556$，

$\sum y_i=145.227,\sum x_iy_i=284.83628$，

联立方程组解得：

$\begin{cases}a_0=3.916\\a_1=7.464\end{cases}$，

则$y=7.464x+3.916$。

## 3

某平炉的生产记录见下表：

|$i$|1|2|3|4|5|
|:----:|:---:|:---:|:---:|:---:|:---:|
|$x_i$|165|123|150|121|141|
|$y_i$|187|126|172|125|148|

表中$i$为实验次数，$x_i$为全部炉料熔化完毕时钢液的含碳量（单位略），$y_i$为熔毕至出钢所需的冶炼时间（单位略），求钢液含碳量与冶炼时间的函数关系。

### 解答

实验发现$y=ax^b$拟合效果最佳，取对数：$\ln y=\ln a+b\ln x$。

令$Y=\ln y,A=\ln a,B=b,X=\ln x$，由(6.5)式：

$\begin{cases}A+B\sum X_i=\sum Y_i\\A\sum X_i+B\sum X_i^2=\sum X_iY_i\end{cases}$，

由数据计算：

$\sum X_i=24.673,\sum X_i^2=121.624$，

$\sum Y_i=25.240,\sum X_iY_i=123.661$，

联立方程组解得：

$\begin{cases}A=1.360\\B=1.703\end{cases}$，

即$\ln y=1.703\ln x+1.360$，故$y=3.896x^{1.703}$。

## 4

用最小二乘法求一形如$y=a+bx^2$（$a,b$为常数）的经验公式拟合下列数据：

|$x_i$|19|25|31|38|44|
|:----:|:---:|:---:|:---:|:---:|:---:|
|$y_i$|19.0|32.3|49.0|73.3|97.8|

### 解答

令$t=x^2$，由(6.5)式：

$\begin{cases}a_0+a_1\sum t_i=\sum y_i\\a_0\sum t_i+a_1\sum t_i^2=\sum t_iy_i\end{cases}$，

由数据计算：

$\sum t_i=5327,\sum t_i^2=7277699$，

$\sum y_i=271.4,\sum t_iy_i=369321.5$，

联立方程组解得：

$\begin{cases}a_0=0.973\\a_1=0.050\end{cases}$，

则$y=0.05x^2+0.973$。

## 6

用最小二乘法求一形如$y=ae^{bx}$（$a,b$为常数）的经验公式拟合下列数据：

|$x_i$|1|2|3|4|5|6|7|8|
|:----:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:----:|
|$y_i$|15.3|20.5|27.4|36.6|49.1|65.6|87.87|117.6|

### 解答

两边取对数：$\ln y=\ln a+bx$。

令$Y=\ln y,A=\ln a,B=b$，则由(6.5)式：

$\begin{cases}B+A\sum x_i=\sum Y_i\\B\sum x_i+A\sum x_i^2=\sum x_iY_i\end{cases}$，

由数据计算：

$\sum x_i=36,\sum x_i^2=204$，

$\sum Y_i=29.979,\sum x_iY_i=148.07$，

联立方程组解得：

$\begin{cases}B=2.437\\A=0.291\end{cases}$，

即$\ln y=0.291x+2.437$，故$y=11.439e^{0.291x}$。

## 7

某化学反应中，测得生成物的质量浓度$y$与时间$t$的关系见下表（单位略）：

|$t_i$|1|2|3|4|6|8|10|12|14|16|
|:----:|:---:|:---:|:---:|:---:|:---:|:----:|:----:|:----:|:----:|:----:|
|$y_i$|4.00|6.41|8.01|8.79|9.53|9.86|10.33|10.42|10.53|10.61|

试用最小二乘法求一形如$y=\frac{t}{at+b}$（$a,b$为常数）的经验公式拟合以上数据。

### 解答

取倒数：$\frac{1}{y}=a+b\frac{1}{t}$。

令$Y=\frac{1}{y},T=\frac{1}{t}$，由(6.5)式：

$\begin{cases}a+b\sum T_i=\sum Y_i\\a\sum T_i+b\sum T_i^2=\sum T_iY_i\end{cases}$，

由数据计算：

$\sum T_i=2.692,\sum T_i^2=1.493$，

$\sum Y_i=1.233,\sum T_iY_i=0.459$，

联立方程组解得：

$\begin{cases}a=0.079\\b=0.165\end{cases}$，

则$\frac{1}{y}=0.165\frac{1}{t}+0.079$，即$y=\frac{t}{0.079t+0.165}$。

## 10

证明函数系$\{\varphi_0,\varphi_1,\dots,\varphi_n\}$线性无关的充要条件是Gram行列式$G(\varphi_0,\varphi_1,\dots,\varphi_n)\ne0$。

### 解答

Gram矩阵为：

$G=\begin{pmatrix}(\varphi_0,\varphi_0)&(\varphi_0,\varphi_1)&\dots&(\varphi_0,\varphi_n)\\(\varphi_1,\varphi_0)&(\varphi_1,\varphi_1)&\dots&(\varphi_1,\varphi_n)\\\vdots&\vdots&&\vdots\\(\varphi_n,\varphi_0)&(\varphi_n,\varphi_1)&\dots&(\varphi_n,\varphi_n)\end{pmatrix}$，

Gram行列式$G(\varphi_0,\dots,\varphi_n)=\det G$。

必要性：若线性无关⇒$\det G\ne0$

考虑线性组合：

$c_0\varphi_0+c_1\varphi_1+\dots+c_n\varphi_n=0$，

两边分别与$\varphi_j(j=0,1,\dots,n)$作内积：

$\begin{cases}c_0(\varphi_0,\varphi_0)+c_1(\varphi_1,\varphi_0)+\dots+c_n(\varphi_n,\varphi_0)=0\\c_0(\varphi_0,\varphi_1)+c_1(\varphi_1,\varphi_1)+\dots+c_n(\varphi_n,\varphi_1)=0\\\vdots\\c_0(\varphi_0,\varphi_n)+c_1(\varphi_1,\varphi_n)+\dots+c_n(\varphi_n,\varphi_n)=0\end{cases}$，

由于线性无关，此方程组只有零解$c_0=c_1=\dots=c_n=0$，因此$\det G=\det G^T\ne0$。

充分性：若$\det G\ne0$⇒线性无关

反证法：若$\varphi_0,\varphi_1,\dots,\varphi_n$线性相关，则存在不全为0的$c_0,c_1,\dots,c_n$，使得：

$c_0\varphi_0+c_1\varphi_1+\dots+c_n\varphi_n=0$，

与$\varphi_j$作内积，得方程组有非零解，与$\det G^T=\det G\ne0$矛盾。

## 13

求下列函数在指定区间上关于$f(x)$的一次最佳平方逼近多项式：

(2)

$f(x)=e^x,[0,1]$

### 解答

由(6.5)的连续版本：

$\begin{cases}a_0\int_0^1dx+a_1\int_0^1xdx=\int_0^1e^xdx\\a_0\int_0^1xdx+a_1\int_0^1x^2dx=\int_0^1xe^xdx\end{cases}$，

本题中，区间$[0, 1]$，$f(x)=e^x$，则：

$\begin{cases}a_0+\frac{a_1}{2}=e-1\\\frac{a_0}{2}+\frac{a_1}{3}=1\end{cases}$，

解得：

$\begin{cases}a_0=0.873\\a_1=1.690\end{cases}$，

即$y=1.69x+0.873$。

## 15

利用Legendre多项式，求$f(x)=\sin x$在$[-\frac{\pi}{2},\frac{\pi}{2}]$上的三次最佳平方逼近多项式$P_3(x)$，并计算均方误差$\int_{-\frac{\pi}{2}}^{\frac{\pi}{2}}(\sin x-P_3(x))^2dx$。

### 解答

令$x=\frac{\pi}{2}t$，则$t\in[-1, 1],x\in[-\frac{\pi}{2},\frac{\pi}{2}]$，

$f(x)=\sin x=\sin(\frac{\pi}{2}t)=F(t)$，

Legendre多项式：

$P_n(x)=\frac{1}{2^nn!}\frac{d^n}{dx^n}(x^2-1)^n$，

$P_0(x)=1,P_1(x)=x,P_2(x)=\frac{1}{2}(3x^2-1),P_3(x)=\frac{1}{2}(5x^3-3x)$。

系数：

$a_k=\frac{(f,P_k)}{(P_k,P_k)}=\frac{\int_{-1}^1F(t)P_k(t)dt}{\int_{-1}^1P_k^2(t)dt}=\frac{2k+1}{2}\int_{-1}^1F(t)P_k(t)dt$，

代入得：

- $a_0=\frac{1}{2}\int_{-1}^1\sin(\frac{\pi}{2}t)dt=0$，

- $a_1=\frac{3}{2}\int_{-1}^1\sin(\frac{\pi}{2}t)tdt=0.027$，

- $a_2=\frac{5}{2}\int_{-1}^1\sin(\frac{\pi}{2}t)\frac{1}{2}(3t^2-1)dt=0$，

- $a_3=\frac{7}{2}\int_{-1}^1\sin(\frac{\pi}{2}t)\frac{1}{2}(5t^3-3t)dt\approx-1.374\times10^{-6}$，

即：

$P_3(x)=0.027\cdot\frac{2x}{\pi}-1.374\times10^{-6}\cdot\frac{1}{2}(5(\frac{2x}{\pi})^3-3(\frac{2x}{\pi}))=-2.167\times10^{-6}x^3+0.017x$。

均方误差：

$\int_{-\frac{\pi}{2}}^{\frac{\pi}{2}}(\sin x-P_3(x))^2dx=5.33\times 10^{-7}$。
