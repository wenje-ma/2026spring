# 3

---

为节省空间,函数代码统一放置文末.

---

**1**

试分别用Jacobi迭代法,Gauss-Seidel迭代法和共轭梯度法解线性方程组

$\begin{bmatrix}10&1&2&3&4\\1&9&-1&2&-3\\2&-1&7&3&-5\\3&2&3&12&-1\\4&-3&-5&-1&15
\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\\x_4\\x_5
\end{bmatrix}=\begin{bmatrix}12\\-27\\14\\-17\\12\end{bmatrix}$

迭代初始向量取$\boldsymbol{x}^{(0)}=(0,0,0,0,0)^\mathrm{T}$.

**解答**

- **Jacobi迭代法**

```matlab
A=[10,1,2,3,4;
   1,9,-1,2,-3;
   2,-1,7,3,-5;
   3,2,3,12,-1;
   4,-3,-5,-1,15];
b=[12;-27;14;-17;12];
n=5;
x0=[0;0;0;0;0];
epsilon=1e-9;
N=1e9;
najacobi(A,b,n,x0,epsilon,N);
```

```
    1.0000
   -2.0000
    3.0000
   -2.0000
    1.0000
```

- **Gauss-Seidel迭代法**

```matlab
A=[10,1,2,3,4;
   1,9,-1,2,-3;
   2,-1,7,3,-5;
   3,2,3,12,-1;
   4,-3,-5,-1,15];
b=[12;-27;14;-17;12];
x0=[0;0;0;0;0];
epsilon=1e-9;
N=1e9;
x=naseidel(A,b,x0,eps,N);
```

```
x = 

    1.0000
   -2.0000
    3.0000
   -2.0000
    1.0000
```

- **共轭梯度法**

```matlab
A=[10,1,2,3,4;
   1,9,-1,2,-3;
   2,-1,7,3,-5;
   3,2,3,12,-1;
   4,-3,-5,-1,15];
b=[12;-27;14;-17;12];
x0=[0;0;0;0;0];
epsilon=1e-9;
x=naconj(A,b,x0,eps);
```

```
x = 

   1
  -2
   3
  -2
   1
```

---

**2**

若仅保存系数矩阵$\boldsymbol{A}=(a_{ij})_{n\times n}$的非零元,用共轭梯度法求解$n=10^5$阶的方程组$\boldsymbol{A}\boldsymbol{x}=\boldsymbol{b}$,其中

$a_{ij}=\begin{cases}3,&i=j\\-1,&|i-j|=1\\\frac{1}{2},&i+j=n+1,i\ne \frac{n}{2},\frac{n}{2}+1\\0,&\text{Others}\end{cases}
$,

$(i,j=1,2,\cdots,n)$,

$\boldsymbol{b}=(2.5,\underbrace{1.5,\cdots,1.5}_{(\frac{n}{2}-2)\text{terms}},1.0,1.0,\underbrace{1.5,\cdots,1.5}_{(\frac{n}{2}-2)\text{terms}},2.5)^\mathrm{T}$.

**解答**

本题的关键在于$n=10^5$阶数太大,直接存储内存会爆,因此不能直接生成完整矩阵.观察$a_{ij}$发现其是稀疏矩阵,因此要使用`sqarse()`函数生成$A$.`sqars(I,J,V,n,n)`函数只需存储行号$I$,列号$J$,对应的数值$V$,即可生成$n\times n$的稀疏矩阵,这大大节省了存储空间.

```matlab
n=1e5;
m=n/2;
I=[];J=[];V=[];
i=1:n;I=[I,i];J=[J,i];V=[V,3*ones(1,n)];
i=1:n-1;I=[I,i];J=[J,i+1];V=[V,-ones(1,n-1)];
i=2:n;I=[I,i];J=[J,i-1];V=[V,-ones(1,n-1)];
i=1:m-1;I=[I,i];J=[J,n+1-i];V=[V,0.5*ones(1,m-1)];
i=m+2:n;I=[I,i];J=[J,n+1-i];V=[V,0.5*ones(1,m-1)];
A=sparse(I,J,V,n,n);
b=1.5*ones(n,1);b(1)=2.5;b(n)=2.5;b(m)=1;b(m+1)=1;
x=nacg(A,b,zeros(n,1),1e-6,1e6);
disp(x);
```

```
	1.0e+00 *
	
    1.0000
    1.0000
    ...
    1.0000
```

---

**增补题目**

已知$N$为一正整数,三对角矩阵$A_{N-1,N-1}$对角线元素均为$2$,上下次对角线为$-1$,即形如：

$A_{N-1,N-1}=\begin{bmatrix}2&-1&0&\cdots&0&0\\-1&2&-1&\cdots&0&0\\0&-1&2&\cdots&0&0\\\vdots&\vdots&\vdots&\ddots&\vdots&\vdots\\0&0&0&\cdots&2&-1\\0&0&0&\cdots&-1&2\end{bmatrix}$,

向量$\boldsymbol{b}$为

$\boldsymbol{b}_{N-1,1}=\frac{1}{N^2}\{2,2,\dots,2\}^T$.

分别选取$N=10,100,1000,10000$做数值实验,采用下面方法求线性方程组$Ax=b$的解

（1）

Gauss消去法

（2）

三角(LU)分解法

（3）

平方根法

（4）

改进的平方根法

（5）

Jacobi迭代法

（6）

Gauss-seidel迭代法

（7）

SOR迭代法

（8）

最速下降法

（9）

共轭梯度法

**解答**

本题的关键在于$n=1000,10000$阶数太大,直接存储内存会爆,因此不能直接生成完整矩阵.观察$a_{ij}$发现其是稀疏矩阵,因此要使用`sqarse()`函数生成$A$.`sqars(I,J,V,n,n)`函数只需存储行号$I$,列号$J$,对应的数值$V$,即可生成$n\times n$的稀疏矩阵,这大大节省了存储空间.

下面是各个方法在有限时间内能计算的$n$的位数对照表:

$\begin{array}{c|l}&\text{Digits}\\\hline \text{Gauss}&n=100\\\text{LU}&n=100\\\text{Cholesky}&n=100\\LDL^T&n=100\\\text{Jacobi}&n=10\\\text{Seidel}&n=10\\\text{SOR}&n=100\\\text{Steep}&n=10000\\\text{Cg}&n=1000\\\end{array}$.

- 效率:**最速下降法在有限时间内最快!**

- 精度:**各个方法不相上下,在有限位数($4$位)下无差别.**

---

以下是具体的运行代码与输出结果:

- **Gauss消去法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=nagauss(A,b);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0099
    0.0196
    ...
    0.0099

N=1000

执行被中断，回到交互模式。
```

当$N=1000,10000$时,计算机内存爆炸,无法得出结果.

- **三角(LU)分解法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=nalu(A,b);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0099
    0.0196
    ...
    0.0099

N=1000

执行被中断，回到交互模式。
```

当$N=1000,10000$时,计算机内存爆炸,无法得出结果.


- **平方根法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=nacholesky(A,b);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0099
    0.0196
    ...
    0.0099

N=1000

执行被中断，回到交互模式。
```

当$N=1000,10000$时,计算机内存爆炸,无法得出结果.


- **改进的平方根法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=naldl(A,b);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0099
    0.0196
    ...
    0.0099

N=1000

执行被中断，回到交互模式。
```

当$N=1000$时,计算机内存爆炸,无法得出结果.


- **Jacobi迭代法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=najacobi(A,b,zeros(n,1),1e-6,1000);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    0.2100
    0.2400
    0.2500
    0.2400
    0.2100
    0.1600
    0.0900

N=100

执行被中断，回到交互模式。
```

当$N=100$时,等待时间过长,故终止.


- **Gauss-seidel迭代法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=naseidel(A,b,zeros(n,1),1e-6,1000);
    disp(x);
end
```

```
N=10

    0.0900
    ...
    0.0900

N=100

执行被中断，回到交互模式。
```

当$N=10$时,等待时间过长,故终止.


- **SOR迭代法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    omega=2/(1+sin(pi/N));
    x=nasor(A,b,zeros(n,1),omega,1e-6,1000);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0052
    0.0102
    ...
    0.0052

N=1000

执行被中断，回到交互模式。
```

当$N=1000$时,等待时间过长,故终止.


- **最速下降法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=nasteep(A,b,zeros(n,1),1e-6,1000);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0052
    0.0102
    ...
    0.0052

N=1000

    0.0001
    0.0001
    ...
    0.0001

N=10000

  1.0e-03 *

    0.0030
    0.0060
    ...
    0.0030
```

这是唯一一个可以完整计算出结果的方法!


- **共轭梯度法**

```matlab
for N=[10,100,1000,10000]
    fprintf('N=%d\n',N);
    n=N-1;
    I=[1:n,1:n-1,2:n];
    J=[1:n,2:n,1:n-1];
    V=[2*ones(n,1);-ones(n-1,1);-ones(n-1,1)];
    A=sparse(I,J,V,n,n);
    b=2/N^2*ones(n,1);
    x=nacg(A,b,zeros(n,1),1e-6,1000);
    disp(x);
end
```

```
N=10

    0.0900
    0.1600
    ...
    0.0900

N=100

    0.0052
    0.0102
    ...
    0.0052

N=1000

    0.0001
    0.0001
    ...
    0.0001

N=10000

执行被中断，回到交互模式。
```

当$N=10000$时,等待时间过长,故终止.

---

## 算法汇总

### Jacobi迭代法

```matlab
function x=najacobi(A,b,x0,tol,maxiter)
    n=size(A,1);x=x0;
    for k=1:maxiter
        x_new=zeros(n,1);
        for i=1:n
            x_new(i)=(b(i)-A(i,[1:i-1,i+1:n])*x([1:i-1,i+1:n]))/A(i,i);
        end
        if norm(x_new-x)<tol
            x=x_new;return
        end
        x=x_new;
    end
end
```

### Gauss-Seidel迭代法

```matlab
function x=naseidel(A,b,x0,tol,maxiter)
    n=size(A,1);x=x0;
    for k=1:maxiter
        x_new=x;
        for i=1:n
            x_new(i)=(b(i)-A(i,1:i-1)*x_new(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
        end
        if norm(x_new-x)<tol
            x=x_new;return
        end
        x=x_new;
    end
end
```

### 松弛(SOR)迭代法

```matlab
function x=nasor(A,b,x0,omega,tol,maxiter)
    n=size(A,1);x=x0;
    for k=1:maxiter
        x_new=x;
        for i=1:n
            temp=(b(i)-A(i,1:i-1)*x_new(1:i-1)-A(i,i+1:n)*x(i+1:n))/A(i,i);
            x_new(i)=x(i)+omega*(temp-x(i));
        end
        if norm(x_new-x)<tol
            x=x_new;return
        end
        x=x_new;
    end
end
```

### 最速下降法

```matlab
function x=nasteep(A,b,x0,tol,maxiter)
    n=size(A,1);x=x0;
    for k=1:maxiter
        r=b-A*x;
        if norm(r)<tol
            return
        end
        alpha=(r'*r)/(r'*A*r);
        x=x+alpha*r;
    end
end
```

### 共轭梯度法

```matlab
function x=nacg(A,b,x0,tol,maxiter)
    n=size(A,1);x=x0;r=b-A*x;p=r;
    for k=1:maxiter
        if norm(r)<tol,return,end
        alpha=(r'*r)/(p'*A*p);
        x=x+alpha*p;
        r_new=r-alpha*A*p;
        beta=(r_new'*r_new)/(r'*r);
        p=r_new+beta*p;
        r=r_new;
    end
end
```

