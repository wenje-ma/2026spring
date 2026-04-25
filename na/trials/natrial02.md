# 2

---

为节省空间,函数代码统一放置文末.

---

**1**

试用北太天元编程实现矩阵的列主元素三角分解,并求Pascal矩阵

$\boldsymbol{A}=\begin{bmatrix}1&1&1&1&1\\1&2&3&4&5\\1&3&6&10&15\\1&4&10&20&35\\1&5&15&35&70\end{bmatrix}$

的逆矩阵$\boldsymbol{A}^{-1}$,用左除命令$\boldsymbol{A}\setminus\boldsymbol{E}$检验你的结果.

**解答**

- **利用LU求$A^{-1}$的原理:**

$AX=E$,则$X=A^{-1}$,这相当于求解方程组

$\begin{cases}Ax_1=e_1,\\Ax_2=e_2,\\\vdots\\Ax_n=e_n.\end{cases}$


- **代码**

```matlab
%natrial0201.m

A=pascal(5);
n=size(A,1);
A_inv=zeros(n);
E=eye(n);
for i=1:n
    b=E(:,i);
    A_inv(:,i)=nalu(A,b);
end
disp(A_inv);
disp(A\E);
```

- **输出结果**

```
>>natrial0201

    5  -10   10   -5    1
  -10   30  -35   19   -4
   10  -35   46  -27    6
   -5   19  -27   17   -4
    1   -4    6   -4    1


    5  -10   10   -5    1
  -10   30  -35   19   -4
   10  -35   46  -27    6
   -5   19  -27   17   -4
    1   -4    6   -4    1
```

---

**2**

试用北太天元编程实现追赶法求解三对角方程组的算法,并考虑如下梯形电路问题,其中电路中的各个电流$\{i_1,i_2,\dots,i_8\}$满足下列线性方程组:

$\begin{cases}\begin{array}{}2i_1&-2i_2&&&&&&&=&V/R\\-2i_1&+5i_2&-2i_3&&&&&&=&0\\&-2i_2&+5i_3&-2i_4&&&&&=&0\\&&-2i_3&+5i_4-&2i_5&&&&=&0\\&&&-2i_4&+5i_5&-2i_6&&&=&0\\&&&&-2i_5&+5i_6&-2i_7&&=&0\\&&&&&-2i_6&+5i_7&-2i_8&=&0\\&&&&&&-2i_7&+5i_8&=&0\end{array}\end{cases}$

设$V=220\text{V},R=27\Omega$,求各段电路的电流.

**解答**

- **代码**

```matlab
%natrial0202.m

a=zeros(7)-2;
b=zeros(8)+5;
b(1)=2;
c=a;
d=zeros(8);
d(1)=220/27;
n=8;

disp(nachase(a,b,c,d,n));
```

- **输出结果**

```
>>natrial0202

    8.1478    4.0737    2.0365    1.0175    0.5073    0.2506    0.1194    0.0477
```

---

**3**

方程组的性态和矩阵条件数的试验.设有线性方程组$\boldsymbol{A}\boldsymbol{x}=\boldsymbol{b}$,其中系数矩阵$\boldsymbol{A}=(a_{ij})_{n\times n}$的元素分别为

$a_{ij}=x_i^{j-1}\quad(x_i=1+0.1i,i,j=1,2,\dots,n)$

或

$a_{ij}=\frac{1}{i+j-1}\quad(i,j=1,2,\dots,n)$,

右端向量

$\boldsymbol{b}=\left(\sum_{j=1}^na_{1j},\sum_{j=1}^na_{2j},\dots,\sum_{j=1}^na_{nj}\right)^\mathrm{T}$.

利用北太天元中的库函数计算.

(1)

取$n=5,10,20$,分别求出系数矩阵的$2$-条件数,判别它们是否是病态矩阵?随着$n$的增大,矩阵性态的变化如何?

(2)

分别取$n=5,10,20$,解上述两个线性方程组$\boldsymbol{A}\boldsymbol{x}=\boldsymbol{b}$,并将求得的解与精确解$x=(1,1,\dots,1)^\mathrm{T}$作比较,说明了什么?

(3)

取$n=10$,对系数矩阵中的$a_{22}$和$a_{nn}$增加一个扰动$10^{-8}$,求解方程组$(\boldsymbol{A}+\delta\boldsymbol{A})\boldsymbol{x}=\boldsymbol{b}$,解的变化如何?

**解答**

已知$a_{ij}=x_i^{j-1}\quad(x_i=1+0.1i,i,j=1,2,\dots,n)$为Vandermonde矩阵;

$a_{ij}=\frac{1}{i+j-1}\quad(i,j=1,2,\dots,n)$为Hilbert矩阵.

(1)

- **代码**

```matlab
%natrial020301.m

%Vandermonde
disp('Vandermonde:');
for n=[5,10,20]
    %给予一个初始向量
    x=1+0.1*(1:n);
    %vandet(x)缺省为降幂,需转置成升幂匹配题目要求
    V=vander(x)';
    disp(cond(V));
end

%Hilbert
disp('Hilbert:');
for n=[5,10,20]
    H=hilb(n);
    disp(cond(H));
end
```

- **输出结果**

```
>>natrial020301
Vandermonde:

  5.3615e+05


  8.6823e+11


  5.6849e+20

Hilbert:

  4.7661e+05


  1.6024e+13


  1.3194e+18
```

这说明Vandermonde矩阵与Hilbert矩阵均是病态矩阵.

(2)

- **代码**

```matlab
%natrial020302.m

%Vandermonde
disp('Vandermonde:');
for n=[5,10,20]
    t=1+0.1*(1:n);
    V=vander(t)';
    b=sum(V,2);
    disp(V\b);
end

%Hilbert
disp('Hilbert:');
for n=[5,10,20]
    H=hilb(n);
    b=sum(H,2);
    disp(H\b);
end
```

- **输出结果**

```
>>natrial020302
Vandermonde:

    1.0000
    1.0000
    1.0000
    1.0000
    1.0000


    1.0000
    1.0000
    1.0000
    1.0001
    0.9999
    1.0001
    0.9999
    1.0000
    1.0000
    1.0000


   -0.0007
    0.0105
   -0.0628
    0.2354
   -0.6086
    1.1486
   -1.6217
    1.7251
   -1.3612
    0.7551
   -0.2433
   -0.0060
    0.0517
   -0.0250
    0.0036
    0.0020
   -0.0011
    0.0004
    0.0001
    0.0001

Hilbert:

    1.0000
    1.0000
    1.0000
    1.0000
    1.0000


    1.0000
    1.0000
    1.0000
    1.0000
    0.9999
    1.0002
    0.9997
    1.0003
    0.9998
    1.0000


    1.0000
    1.0003
    0.9868
    1.2507
   -1.5605
   16.5534
  -57.9086
  140.0323
 -187.1799
   89.5533
  124.7073
 -194.8271
   24.6127
  149.8794
 -144.7800
   91.6669
  -76.8355
   57.8161
  -19.4703
    3.5026
```

与精确解$x=(1,1,\dots,1)^\mathrm{T}$比较后发现$n$越大,偏差就越大.

(3)

- **代码**

```matlab
%natrial020303.m

n=10;

%Vandermonde
disp('Vandermonde:');
t=1+0.1*(1:n);
V=vander(t)';
V(2,2)=V(2,2)+1e-8;
V(n,n)=V(n,n)+1e-8;
b=sum(V,2);
disp(V\b);

%Hilbert
disp('Hilbert:');
H=hilb(n);
H(2,2)=H(2,2)+1e-8;
H(n,n)=H(n,n)+1e-8;
b=sum(H,2);
disp(H\b);
```

- **输出结果**

```
natrial020303
Vandermonde:

    1.0000
    1.0000
    1.0000
    1.0001
    0.9999
    1.0001
    0.9999
    1.0000
    1.0000
    1.0000

Hilbert:

    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
    1.0000
```

此结果能体现出Vandermonde与Hilbert矩阵的病态性,但未因扰动导致解彻底偏离精确解.

---

**4**

已知Wilson矩阵

$\boldsymbol{A}=\begin{bmatrix}10&7&8&7\\7&5&6&5\\8&6&10&9\\7&5&9&10\end{bmatrix}$

右端项$\boldsymbol{b}=(32,23,33,31)^\mathrm{T}$,则方程组$\boldsymbol{A}\boldsymbol{x}=\boldsymbol{b}$有精确解$\boldsymbol{x}=(1,1,\dots,1)^\mathrm{T}$.用北太天元中的库函数计算.

(1)

求$\det(\boldsymbol{A})$,$\text{cond}(\boldsymbol{A})$,及$\boldsymbol{A}$的所有特征值.

(2)

令

$\boldsymbol{A}+\delta\boldsymbol{A}=\begin{bmatrix}10&7.2&8.1&6.9\\7.08&5.07&6.02&5\\8.2&5.89&9.96&9.01\\6.98&5.04&8.97&9.98\end{bmatrix}$

解扰动方程组$(\boldsymbol{A}+\delta\boldsymbol{A})(\boldsymbol{x}+\delta\boldsymbol{x})=b$,并求出向量$\delta\boldsymbol{x}$和$\|\delta\boldsymbol{x}\|_2$,从理论结果式

$\frac{\|\delta\boldsymbol{x}\|}{\|\boldsymbol{x+\delta x}\|}\le\|\boldsymbol{A}\|\|\boldsymbol{A}^{-1}\|\frac{\|\boldsymbol{\delta A}\|}{\|\boldsymbol{A}\|}$

和实际计算结果两方面分析方程组$\boldsymbol{Ax}=\boldsymbol{b}$的解的相对误差$\frac{\|\delta\boldsymbol{x}\|_2}{\|\boldsymbol{x}\|_2}$与$\boldsymbol{A}$的相对误差$\frac{\|\delta\boldsymbol{A}\|_2}{\|\boldsymbol{A}\|_2}$的关系.

(3)

利用函数$\text{rand}(n)$,重新产生扰动矩阵$\delta\boldsymbol{A}$,使其各元素的绝对值不超过$\frac{1}{2}\times10^{-4}$,重复(2).

**解答**

(1)

- **代码**

```matlab
%natrial020401.m

A=[10,7,8,7;7,5,6,5;8,6,10,9;7,5,9,10];
disp('det(A):');
disp(det(A));
disp('cond(A,2):');
disp(cond(A,2));
disp('eig(A):');
disp(eig(A));
```

- **输出结果**

```
>>natrial020401
det(A):

    1.0000

cond(A,2):

  2.9841e+03

eig(A):

    0.0102
    0.8431
    3.8581
   30.2887
```

(2)

- **理论分析**

由于$\frac{\|\delta\boldsymbol{x}\|}{\|\boldsymbol{x+\delta x}\|}\le\|\boldsymbol{A}\|\|\boldsymbol{A}^{-1}\|\frac{\|\boldsymbol{\delta A}\|}{\|\boldsymbol{A}\|}$,则$\frac{\|\delta\boldsymbol{x}\|}{\|\boldsymbol{x}\|}\approx\frac{\|\delta\boldsymbol{x}\|}{\|\boldsymbol{x+\delta x}\|}\le\text{cond}(\boldsymbol{A})\frac{\|\boldsymbol{\delta A}\|}{\|\boldsymbol{A}\|}$.

- **实际计算**

```matlab
%natrial020402.m

A=[10,7,8,7;7,5,6,5;8,6,10,9;7,5,9,10];
A_deltaA=[10,7.2,8.1,6.9;7.08,5.07,6.02,5;8.2,5.89,9.96,9.01;6.98,5.04,8.97,9.98];
b=[32;23;33;31];

x=[1;1;1;1];
x_deltax=A_deltaA\b;
deltax=x_deltax-x;
deltaA=A_deltaA-A;

%x的相对误差
rel_err_x=norm(deltax,2)/norm(x,2);

%扰动x的相对误差
rel_err_x1=norm(deltax,2)/norm(x_deltax,2);

%A的相对误差
rel_err_A=norm(deltaA,2)/norm(A,2);

%验证等式
disp('LHS:');
disp(rel_err_x);
disp('扰动x的相对误差:');
disp(rel_err_x1);
disp('RHS:');
disp(cond(A)*rel_err_A);
```

- **输出结果**

```
>>natrial020402
LHS:

    0.8225

扰动x的相对误差:

    0.6040

RHS:

   28.8964
```

(3)

这一问的关键就是生成各元素的绝对值不超过$\frac{1}{2}\times10^{-4}$的扰动矩阵$\boldsymbol{\delta A}$,其余同(2)便不在代码中赘述.

已知`rand(n)`可生成$n\times n$,每个元素介于$[0,1]$的随机矩阵.因此先$-0.5$把元素范围平移至$[-0.5,0.5]$,再$\times2$把范围标准化为$[-1,1]$,最后$\times0.5e-4$把误差缩至$\frac{1}{2}\times10^{-4}$.

- **代码**

```matlab
%natrial020403.m

A=[10,7,8,7;7,5,6,5;8,6,10,9;7,5,9,10];
max_abs=0.5e-4;
deltaA=(rand(4)-0.5)*2*max_abs;
A_deltaA=A+deltaA;
disp(A_deltaA);
```

- **输出结果**

```
>>natrial020403

   10.0000    7.0000    8.0000    7.0000
    7.0000    5.0000    6.0000    5.0000
    8.0000    6.0000   10.0000    9.0000
    7.0000    5.0000    9.0000   10.0000
```

---

## 算法汇总

### Gauss消去法

```matlab
%nagauss.m
function x=nagauss(A,b)
    n=size(A,1);
    Ab=[A,b];
    for k=1:n-1
        for i=k+1:n
            factor=Ab(i,k)/Ab(k,k);
            Ab(i,k:end)=Ab(i,k:end)-factor*Ab(k,k:end);
        end
    end
    x=zeros(n,1);
    x(n)=Ab(n,end)/Ab(n,n);
    for i=n-1:-1:1
        x(i)=(Ab(i,end)-Ab(i,i+1:n)*x(i+1:n))/Ab(i,i);
    end
end
```

### LU分解法

```matlab
%nalu.m
function x=lu(A)
    n=size(A,1);L=eye(n);U=A;
    for k=1:n-1
        for i=k+1:n
            factor=U(i,k)/U(k,k);
            L(i,k)=factor;
            U(i,k:end)=U(i,k:end)-factor*U(k,k:end);
        end
    end
    x={L,U};
end
```

### 平方根(Cholesky分解)法

```matlab
%nacholesky
function x=nacholesky(A,b)
    n=size(A,1);L=zeros(n);
    for i=1:n
        for j=1:i
            if i==j
                L(i,i)=sqrt(A(i,i)-sum(L(i,1:j-1).^2));
            else
                L(i,j)=(A(i,j)-sum(L(i,1:j-1).*L(j,1:j-1)))/L(j,j);
            end
        end
    end
    y=zeros(n,1);
    for i=1:n
        y(i)=(b(i)-L(i,1:i-1)*y(1:i-1))/L(i,i);
    end
    x=zeros(n,1);
    for i=n:-1:1
        x(i)=(y(i)-L(i+1:n,i)'*x(i+1:n))/L(i,i);
    end
end
```

### 改进的平方根($LDL^T$)法

```matlab
%naldl.m
function x=naldl(A,b)
    n=size(A,1);L=eye(n);d=zeros(n,1);
    for i=1:n
        d(i)=A(i,i)-L(i,1:i-1)*diag(d(1:i-1))*L(i,1:i-1)';
        for j=i+1:n
            L(j,i)=(A(j,i)-L(j,1:i-1)*diag(d(1:i-1))*L(i,1:i-1)')/d(i);
        end
    end
    y=zeros(n,1);
    for i=1:n
        y(i)=b(i)-L(i,1:i-1)*y(1:i-1);
    end
    z=y./d;x=zeros(n,1);
    for i=n:-1:1
        x(i)=z(i)-L(i+1:n,i)'*x(i+1:n);
    end
end
```

