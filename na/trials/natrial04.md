# 4

---

> 函数文件统一放置文末。

---

## 1

设$\boldsymbol{A}=\begin{bmatrix}6&-4&18\\20&-6&-6\\22&-22&11\end{bmatrix}$，取$\boldsymbol{x}^{(0)}=(1,1,1)^{\mathrm{T}}$，求$\boldsymbol{A}$的按模最大的特征值和特征向量，要求误差小于$10^{-6}$。

（1）直接用幂法计算，出现什么现象，说明原因；

（2）用归一化的幂法计算。

### 解答

#### （1）

直接用幂法的结果是`NaN`，因为迭代向量的分量会指数级爆炸，超出计算机浮点数范围，最终溢出为无穷大，运算后得到`NaN`；归一化幂法通过每步缩放向量，避免了数值溢出，能正常收敛。

```matlab
A=[ 6, -4,18;
   20, -6,-6;
   22,-22,11];
x0=[1;1;1];
tol=1e-6;
maxiter=1e3;
[lambda,x]=napwr(A,x0,tol,maxiter);
disp(lambda);
```

```
NaN
```

#### （2）

```matlab
A=[ 6, -4,18;
   20, -6,-6;
   22,-22,11];
x0=[1;1;1];
tol=1e-6;
maxiter=1e3;
tol=1e-6;
maxiter=1e3;
[l,v]=napwr1(A,x0,tol,maxiter);
disp(l);
```

```
25.1429
```

可是，倘若取`maxiter=1+1e3`，输出结果是

```
19.2500
```

这说明矩阵$\boldsymbol{A}$不收敛。

---

## 2

设$\boldsymbol{A}=\begin{bmatrix}12&6&-6\\6&16&2\\-6&2&16\end{bmatrix}$，取$\boldsymbol{x}^{(0)}=(1,1,1)^{\mathrm{T}}$，先用幂法迭代3次，得到$\boldsymbol{A}$的按模最大特征值的近似值，取$\lambda^*$为其整数部分，再用反幂法计算$\boldsymbol{A}$的按模最大特征值的更精确的近似值，要求误差小于$10^{-10}$​。

### 解答

先用幂法迭代三次：

```matlab
A=[12, 6,-6;
    6,16, 2;
   -6, 2,16];
x0=[1;1;1];
tol=1e-10;
maxiter=3;
[l,v]=napwr1(A,x0,tol,maxiter);
disp(l);
```

```
19.4000
```

因此取$\lambda^*=19$。此时令$B=A-\lambda^*I$，利用反幂法求$B$的最小特征值$\mu=\lambda-\lambda^*$，由于$\lambda$与$\lambda^*$非常接近，因此$\mu$接近$0$，此时取最小的$|\mu|$，恰是取最大的$\lambda$。

```matlab
A=[12, 6,-6;
    6,16, 2;
   -6, 2,16];
x0=[1;1;1];
tol=1e-10;
maxiter=3;
lambda=19;
B=A-lambda*eye(3);
[l,v]=nainvpwr(B,x0,tol,maxiter);
disp(l);
```

```
-0.9971
```

因此$\lambda=\mu+\lambda^*=18.0029$。

---

## 3

根据习题7介绍的Rayleigh商方法，对于数值实验题2中的矩阵$\boldsymbol{A}$，用归一化的幂法所得向量$\{\boldsymbol{x}^{(k)}\}$的Rayleigh商作为$\boldsymbol{A}$​的按模最大特征值的近似，将计算结果与归一化的幂法得到的结果进行比较，并说明原因。

### 解答

Rayleigh商：用公式$\mu_k=\frac{x(k)^TAX(k)}{x(k)^Tx(k)}$作为特征值近似。由于`v`已经归一化，因此`v'*v=1`。

```matlab
A=[12, 6,-6;
    6,16, 2;
   -6, 2,16];
x0=[1;1;1];
tol=1e-10;
maxiter=45;
[l,v,mu]=napwr1r(A,x0,tol,maxiter);
disp(l);disp(mu);eig(A)
```

```
14.3147

21.5440


ans =

    4.4560
   18.0000
   21.5440
```

对比真实的特征值发现，在仅迭代45次时，`mu`已经接近真实特征值，而`l`仍差距较远，说明使用Rayleigh商的趋近精度优于仅用归一化的幂法。

---

## 4

已知矩阵

$\begin{bmatrix}190&66&-84&30\\66&303&42&-36\\336&-168&147&-112\\30&-36&28&291\end{bmatrix}$

（1）用幂法求矩阵的按模最大的特征值与特征向量；

（2）用反幂法求矩阵的按模最小的特征值与特征向量；

（3）用QR方法求矩阵的所有特征值与特征向量，并用函数`[V,D]=eig(A)`检验你的结果。

### 解答

#### （1）

```matlab
A=[190,  66,-84,  30;
    66, 303, 42, -36;
   336,-168,147,-112;
    30, -36, 28, 291];
x0=[1;0;0;0];
tol=1e-6;
maxiter=1000;
[l,v]=napwr1(A,x0,tol,maxiter);
disp(l);
```

```
342.9999
```

#### （2）

```matlab
A=[190,  66,-84,  30;
    66, 303, 42, -36;
   336,-168,147,-112;
    30, -36, 28, 291];
x0=[1;0;0;0];
tol=1e-6;
maxiter=1000;
[l,v]=nainvpwr(A,x0,tol,maxiter);
disp(l);
```

```
1.5946
```

#### （3）

```matlab
A=[190,  66,-84,  30;
    66, 303, 42, -36;
   336,-168,147,-112;
    30, -36, 28, 291];
[v,d]=naqr(A)
[V,D]=eig(A)
```

```
d =

   1.0e+02 *

   3.4300 + 0.0000i
   2.9400 + 0.0000i
   1.4700 + 1.9600i
   1.4700 - 1.9600i


V =

    0.2857   -0.4286    0.2386    0.8233
    0.8571   -0.2857   -0.1193   -0.4116
   -0.0000    0.0000   -0.9605    0.2784
   -0.4286   -0.8571   -0.0795   -0.2744


V =

  列 1 至 2

   0.0000 - 0.3833i   0.0000 + 0.3833i
  -0.0000 + 0.1917i  -0.0000 - 0.1917i
  -0.8944 + 0.0000i  -0.8944 + 0.0000i
  -0.0000 + 0.1278i  -0.0000 - 0.1278i

  列 3 至 4

  -0.4286 + 0.0000i  -0.2857 + 0.0000i
  -0.2857 + 0.0000i  -0.8571 + 0.0000i
  -0.0000 + 0.0000i  -0.0000 + 0.0000i
  -0.8571 + 0.0000i   0.4286 + 0.0000i


D =

   1.0e+02 *

  列 1 至 2

   1.4700 + 1.9600i   0.0000 + 0.0000i
   0.0000 + 0.0000i   1.4700 - 1.9600i
   0.0000 + 0.0000i   0.0000 + 0.0000i
   0.0000 + 0.0000i   0.0000 + 0.0000i

  列 3 至 4

   0.0000 + 0.0000i   0.0000 + 0.0000i
   0.0000 + 0.0000i   0.0000 + 0.0000i
   2.9400 + 0.0000i   0.0000 + 0.0000i
   0.0000 + 0.0000i   3.4300 + 0.0000i
```

---

## 增补作业

已知$N$为一正整数，三对角矩阵$A_{N-1,N-1}$对角线元素均为$2$，上下次对角线为$-1$，即形如：

$A_{N-1,N-1}=\begin{bmatrix}2&-1&0&\cdots&0&0\\-1&2&-1&\cdots&0&0\\0&-1&2&\cdots&0&0\\\vdots&\vdots&\vdots&\ddots&\vdots&\vdots\\0&0&0&\cdots&2&-1\\0&0&0&\cdots&-1&2\end{bmatrix}$，

分别选取$N=10,100,1000,10000$做数值实验：

（1）

对矩阵$A$求最大特征值和最小特征值，并计算条件数。

（2）

对矩阵$A$求全部特征值及相应特征向量。

（3）

试着分析矩阵$A$的准确特征值，分析上面结果的计算精度。

### 解答

本题的关键在于$n=1000,10000$阶数太大，直接存储内存会爆，因此不能直接生成完整矩阵。观察$a_{ij}$发现其是稀疏矩阵，因此要使用`sqarse()`函数生成$A$。

`sqars(I,J,V,n,n)`函数只需存储行号$I$,列号$J$,对应的数值$V$，即可生成$n\times n$的稀疏矩阵，这大大节省了存储空间.

#### （1）

##### 最大特征值

依次使用幂法、幂法（归一法）、幂法（归一法）（Rayleigh）计算最大特征值。

```matlab
for N=[10,100,1000,10000]
fprintf('N=%d\n',N);
n=N-1;
I=[1:n,1:n-1,2:n];
J=[1:n,2:n,1:n-1];
V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
A=sparse(I,J,V,n,n);
x0=zeros(n,1);x0(1)=1;
tol=1e-10;maxiter=10000;
disp('幂法：');
[l,x]=napwr(A,x0,tol,maxiter);
disp(l);
disp('幂法（归一法）：');
[l,v]=napwr1(A,x0,tol,maxiter);
disp(l);
disp('幂法（归一法）（Rayleigh）：');
[l,v,mu]=napwr1r(A,x0,tol,maxiter);
disp(mu);
end
```

```
N=10
幂法：
   NaN

幂法（归一法）：
    3.9021

幂法（归一法）（Rayleigh）：
    3.9021

N=100
幂法：
   NaN

幂法（归一法）：
    3.9990

幂法（归一法）（Rayleigh）：
    3.9990

N=1000
幂法：
   NaN

幂法（归一法）：
    3.9996

幂法（归一法）（Rayleigh）：
    3.9997

N=10000
幂法：
   NaN

幂法（归一法）：
    3.9996

幂法（归一法）（Rayleigh）：
    3.9997
```

看得出来，若不使用归一的幂法，则计算机很容易溢出；带有Rayleigh的幂法实际上会比不带的幂法更快地收敛。

##### 最小特征值

使用反幂法计算最小特征值。

```matlab
for N=[10,100,1000,10000]
fprintf('N=%d\n',N);
n=N-1;
I=[1:n,1:n-1,2:n];
J=[1:n,2:n,1:n-1];
V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
A=sparse(I,J,V,n,n);
x0=zeros(n,1);x0(1)=1;
tol=1e-10;maxiter=10000;
disp('反幂法：');
[l,v]=nainvpwr(A,x0,tol,maxiter);
disp(l);
end
```

```
N=10
反幂法：
    0.0979

N=100
反幂法：
   9.8688e-04

N=1000
反幂法：
   9.8696e-06

N=10000
反幂法：
   9.8697e-08
```

#### （2）

对于Jacobi方法，对稀疏矩阵旋转1次便会立刻变成满矩阵，使得稀疏特性直接消失，内存崩盘，因此只能使用改进后适用于系数矩阵的QR方法计算。

由于计算全部行列式计算量巨大，因此本题目中仅实验$n=10,n=100$两种情形。实际上，当$n=10000$时，二者均无法计算；而$n=1000$时，输出量过于庞大导致无法从命令行窗口看到完整的输出信息。

##### QR方法（稀疏矩阵）

```matlab
for N=[10,100,1000,10000]
fprintf('N=%d\n',N);
n=N-1;
I=[1:n,1:n-1,2:n];
J=[1:n,2:n,1:n-1];
V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
A=sparse(I,J,V,n,n);
disp('QR方法：');
[v,d]=naqr(A);
disp('d：');
disp(d);
disp('v：');
disp(v);
end
```

```
N=10
QR方法：
d：
    3.9021
    3.6180
    ...
    0.0979

v：

  列 1 至 4
  
   -0.1382   -0.2629   -0.3618   -0.4253
    0.2629    0.4253    0.4253    0.2629
   ...
   
  列 9
  
   ...
    0.1382
    
N=100
QR方法：
d：

    3.9970
    3.9930
    ...
    0.0010

v：

  列 1 至 4

    0.0142    0.0173    0.0193    0.0210
   -0.0283   -0.0344   -0.0383   -0.0414
   ...
   
   列 99
   
   ...
   -0.0133   -0.0089    0.0044
```

#### （3）

有趣的是，使用`[v,d]=eigs(A);`进行计算，$n=10000$也是能正常计算的，且计算速度极快！但显示的特征值为`NaN`，这是因为特征值过大已经溢出，而MATLAB的特征值输出按照从大到小的顺序排列，仅取前6位所致。

我们仅仅比较$n=10,100$的输出情况：

```matlab
for N=[10,100]
fprintf('N=%d\n',N);
n=N-1;
I=[1:n,1:n-1,2:n];
J=[1:n,2:n,1:n-1];
V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
A=sparse(I,J,V,n,n);
[v,d]=eigs(A);
disp('d：');
disp(d);
disp('v：');
disp(v);
end
```

```
N=10
d：
  列 1 至 4

    3.9021         0         0         0
         0    3.6180         0         0
    ...
  列 5 至 6

    ...
         0    1.3820

v：
  列 1 至 4

    0.1382   -0.2629    0.3618   -0.4253
   -0.2629    0.4253   -0.4253    0.2629
    ...

  列 5 至 6

    ...
   -0.4472   -0.4253

N=100
d：
  列 1 至 4

    3.9990         0         0         0
         0    3.9961         0         0
    ...

  列 5 至 6

    ...
         0    3.9646

v：
  列 1 至 4

   -0.0044    0.0089   -0.0133   -0.0177
    0.0089   -0.0177    0.0265    0.0352
    ...
   
  列 5 至 6

    ...
    0.0221    0.0265
```

##### 计算精度

- 幂法、归一化、Rayleigh商、反幂法、QR方法：小矩阵和`eigs`完全一致，大矩阵精度远优于`eigs`；
- `eigs`：小矩阵精度不错，大矩阵精度严重退化，只能算前少数特征值。

---

## 函数代码

### 幂法

```matlab
function[l,x]=napwr(A,x0,tol,maxiter)
x=x0;
for k=1:maxiter
y=A*x;
l=dot(y,x)/dot(x,x);
if norm(y-l*x)<tol,break;end
x=y;
end
end
```

### 幂法（归一法）

```matlab
function [l,v]=napwr1(A,x,tol,maxiter)
for k=1:maxiter
y=A*x;
[m,i]=max(abs(y));
l=y(i);
v=y/l;
if norm(v-x)<tol,break;end
x=v;
end
end
```

### 幂法（归一法）（Rayleigh）

```matlab
function [l,v,mu]=napwr1r(A,x0,tol,maxiter)
x=x0/norm(x0);
for k=1:maxiter
y=A*x;
l=max(abs(y));
mu=(x'*y)/(x'*x);
v=y/norm(y);
if norm(v-x)<tol
break;
end
x=v;
end
end
```

### 反幂法

```matlab
function[l,v]=nainvpwr(A,x0,tol,maxiter)
n=size(A,1);
v=x0/norm(x0);
[L,U]=lu(A);
l_old=0;
for k=1:maxiter
y=U\(L\v);
v=y/norm(y);
l=v'*A*v;
if abs(l-l_old)<tol
break;
end
l_old=l;
end
end
```

### Jacobi方法

```matlab
function e=najacobidet(A)
n=size(A,1);
tol=1e-10;
rot_count=0;
while max(max(abs(A-diag(diag(A)))))>tol
max_val=0;p=1;q=1;
for i=1:n
for j=i+1:n
if abs(A(i,j))>max_val
max_val=abs(A(i,j));p=i;q=j;
end
end
end
a=A(p,p);b=A(q,q);c=A(p,q);
t=2*c/((b-a)+sqrt((a-b)^2+4*c^2));
co=1/sqrt(1+t^2);
si=t*co;
A([p,q],:)=[co,si;-si,co]*A([p,q],:);
A(:,[p,q])=A(:,[p,q])*[co,-si;si,co];
rot_count=rot_count+1;
end
e=diag(A);
disp(e);
end
```

### Jacobi方法（旋转过程）

```matlab
function e=najacobidetr(A)
n=size(A,1);
tol=1e-10;
rot_count=0;
while max(max(abs(A-diag(diag(A)))))>tol
max_val=0;p=1;q=1;
for i=1:n
for j=i+1:n
if abs(A(i,j))>max_val
max_val=abs(A(i,j));p=i;q=j;
end
end
end
a=A(p,p);b=A(q,q);c=A(p,q);
t=2*c/((b-a)+sqrt((a-b)^2+4*c^2));
co=1/sqrt(1+t^2);
si=t*co;
A([p,q],:)=[co,si;-si,co]*A([p,q],:);
A(:,[p,q])=A(:,[p,q])*[co,-si;si,co];
rot_count=rot_count+1;
fprintf('第%d次旋转：\n',rot_count);
disp(A);
end
e=diag(A);
fprintf('\n最终特征值：\n');
disp(e);
end
```

### QR法

```matlab
function[v,d]=naqr(A)
n=size(A,1);Ak=A;Q=eye(n);
for i=1:1000
[Qk,R]=qr(Ak);Ak=R*Qk;Q=Q*Qk;if norm(diag(Ak,1))<1e-10,break;end
end
d=eig(Ak);v=Q;
end
```

### QR法（稀疏矩阵）

```matlab
function[v,d]=naqrs(A)
n=size(A,1);
Ak=full(A);
Q=eye(n);
for i=1:1000
[Qk,R]=qr(Ak);
Ak=R*Qk;
Q=Q*Qk;
if norm(diag(Ak,1))<1e-10
break;
end
end
d=diag(Ak);
v=Q;
end
```