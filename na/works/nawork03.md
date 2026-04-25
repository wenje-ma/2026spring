# 3

---

**3**

用Jacobi迭代法和Gauss-Seidel迭代法求解方程组

$\begin{cases}x_1+2x_2-2x_3=1\\x_1+x_2+x_3=1\\2x_1+2x_2+x_3=1\end{cases}$

取初值$\boldsymbol{x}^{(0)}=(0,0,0)^\mathrm{T}$,迭代4次,并比较它们的计算结果.

**解答**

- Jacobi

$\begin{cases}x_1^{(k+1)}=1-2x_2^{(k)}+2x_3^{(k)}\\x_2^{(k+1)}=1-x_1^{(k)}-x_3^{(k)}\\x_3^{(k+1)}=1-2x_1^{(k)}-2x_2^{(k)}\end{cases}$,

取$\boldsymbol{x}^{(0)}=(0,0,0)^T$,则

$\begin{cases}x_1^{(1)}=1\\x_2^{(1)}=1\\x_3^{(1)}=1\end{cases}$,

即$\boldsymbol{x}^{(1)}=(1,1,1)^T$.

$\begin{cases}x_1^{(2)}=1-2\times1+2\times1=1\\x_2^{(2)}=1-1-1=-1\\x_3^{(2)}=1-2\times1-2\times1=-3\end{cases}$,

即$\boldsymbol{x}^{(2)}=(1,-1,-3)^T$.

$\begin{cases}x_1^{(3)}=1-2\times(-1)+2\times(-3)=-3\\x_2^{(3)}=1-1-(-3)=3\\x_3^{(3)}=1-2\times1-2\times(-1)=1\end{cases}$,

即$\boldsymbol{x}^{(3)}=(-3,3,1)^T$.

$\begin{cases}x_1^{(4)}=1-2\times3+2\times1=-3\\x_2^{(4)}=1-(-3)-1=3\\x_3^{(4)}=1-2\times(-3)-2\times3=1\end{cases}$,

即$\boldsymbol{x}^{(4)}=(-3,3,1)^T$.

发现迭代第$4$次时,解已稳定,说明$(-3,3,1)^T$为精确解.

- Gauss-Seidel

$\begin{cases}x_1^{(k+1)}=1-2x_2^{(k)}+2x_3^{(k)}\\x_2^{(k+1)}=1-x_1^{(k+1)}-x_3^{(k)}\\x_3^{(k+1)}=1-2x_1^{(k+1)}-2x_2^{(k+1)}\end{cases}$

由$\boldsymbol{x}^{(0)}=(0,0,0)^T$,则

$\begin{cases}x_1^{(1)}=1\\x_2^{(1)}=0\\x_3^{(1)}=-1\end{cases}$,

即$\boldsymbol{x}^{(1)}=(1,0,-1)^T$.

$\begin{cases}x_1^{(2)}=1-2\times0+2\times(-1)=-1\\x_2^{(2)}=1-(-1)-(-1)=3\\x_3^{(2)}=1-2\times(-1)-2\times3=-3\end{cases}$,

即$\boldsymbol{x}^{(2)}=(-1,3,-3)^T$.

$\begin{cases}x_1^{(3)}=1-2\times3+2\times(-3)=-11\\x_2^{(3)}=1-(-11)-(-3)=15\\x_3^{(3)}=1-2\times(-11)-2\times15=-7\end{cases}$,

即$\boldsymbol{x}^{(3)}=(-11,15,-7)^T$.

$\begin{cases}x_1^{(4)}=1-2\times15+2\times(-7)=-43\\x_2^{(4)}=1-(-43)-(-7)=51\\x_3^{(4)}=1-2\times(-43)-2\times51=-15\end{cases}$

即$\boldsymbol{x}^{(4)}=(-43,51,-15)^T$.

发现较精确解偏离得较大.

---

**5**

若用Jacobi迭代法求解方程组

$\begin{bmatrix}a&-1&-3\\-1&a&-2\\3&-2&a\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\end{bmatrix}=\begin{bmatrix}b_1\\b_2\\b_3\end{bmatrix}$

讨论实数$a$​与收敛性的关系.

**解答**

Jacobi迭代矩阵:

$\boldsymbol{B}=\boldsymbol{I}-\boldsymbol{D}^{-1}\boldsymbol{A}=\begin{bmatrix}0&1/a&3/a\\1/a&0&1/a\\3/a&1/a&0\end{bmatrix}$

求解$\det(\lambda\boldsymbol{I}-\boldsymbol{B})=0$,

则$\lambda ^3+\frac{4}{a^2}\lambda=0$,$\lambda =0$或$\pm i\frac{2}{|a|}$.

$\rho(B)=\frac{1}{\sqrt{2}}$,

因此$\rho(B)<1\Rightarrow|a|>2$时,Jacobi迭代收敛;

$0<|a|\leq2$时发散.

---

**7**

设有方程组

$\begin{cases}10x_1+4x_2+4x_3=13\\4x_1+10x_2+8x_3=11\\4x_1+8x_2+10x_3=25\end{cases}$

(1)分别写出Jacobi迭代法、Gauss-Seidel迭代法及SOR法($\omega=1.35$)的计算公式及迭代矩阵;

(2)对任意初值,各迭代法是否收敛？说明理由.

**解答**

(1)

- Jacobi

$\begin{cases}x_1^{(k+1)}=\frac{1}{10}(13-4x_2^{(k)}-4x_3^{(k)})\\x_2^{(k+1)}=\frac{1}{10}(11-4x_1^{(k)}-8x_3^{(k)})\\x_3^{(k+1)}=\frac{1}{10}(25-4x_1^{(k)}-8x_2^{(k)})\end{cases}$,

迭代矩阵

$\boldsymbol{B}=\boldsymbol{I}-\boldsymbol{D}^{-1}\boldsymbol{A}=\begin{bmatrix}0&-2/5&-2/5\\-2/5&0&-4/5\\-2/5&-4/5&0\end{bmatrix}=\begin{bmatrix}0&-0.4&-0.4\\-0.4&0&-0.8\\-0.4&-0.8&0\end{bmatrix}$.

- Gauss-Seidel

$\begin{cases}x_1^{(k+1)}=\frac{1}{10}(13-4x_2^{(k)}-4x_3^{(k)})\\x_2^{(k+1)}=\frac{1}{10}(11-4x_1^{(k+1)}-8x_3^{(k)})\\x_3^{(k+1)}=\frac{1}{10}(25-4x_1^{(k+1)}-8x_2^{(k+1)})\end{cases}$,

迭代矩阵

$\boldsymbol{M}=(\boldsymbol{D}-\boldsymbol{L})^{-1}\boldsymbol{U}=\begin{bmatrix}0&2/5&2/5\\0&4/25&24/25\\0&36/125&116/125\end{bmatrix}=\begin{bmatrix}0&0.4&0.4\\0&0.16&0.96\\0&0.288&0.928\end{bmatrix}$.

- SOR($\omega =1.35$)

$\boldsymbol{x}^{(k+1)}=(\boldsymbol{D}-\omega\boldsymbol{L})^{-1}(\omega\boldsymbol{U}+(1-\omega)\boldsymbol{D})\boldsymbol{x}^{(k)}+\omega(\boldsymbol{D}-\omega\boldsymbol{L})^{-1}\boldsymbol{b}$,

迭代矩阵

$\boldsymbol{M}=(\boldsymbol{D}-\omega\boldsymbol{L})^{-1}((1-\omega)\boldsymbol{D}+\omega\boldsymbol{U})$

$=\begin{bmatrix}-7/20&27/50&27/50\\-189/1000&-73/1250&3429/2500\\-2457/1250&902/3947&1837/1291\end{bmatrix}$

$=\begin{bmatrix}-0.35&0.54&0.54\\-0.189&-0.0584&1.3716\\-0.3931&0.2285&1.4229\end{bmatrix}$.

(2)

$\boldsymbol{A}$为对称正定矩阵.

- Jacobi:$\rho(B)\approx1.0928>1$,发散.
- Gauss-Seidel:$\rho(M)\approx0.6283<1$,收敛.
- SOR:由于$\omega=1.35\in(0,2)$,则SOR收敛.

---

**8**

设有方程组

$\begin{bmatrix}1.2&-3.6&-12\\-10&9&0.5\\1&-4&2\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\end{bmatrix}=\begin{bmatrix}1\\2\\3\end{bmatrix}$

试写出收敛的迭代式,并说明理由.

**解答**

交换行/列构造严格对角占优矩阵:

$\overline{\boldsymbol{A}}=\begin{bmatrix}-10&9&0.5\\1&-4&2\\1.2&-3.6&-12\end{bmatrix},\quad\boldsymbol{b}=\begin{bmatrix}2\\3\\1\end{bmatrix}$

其满足$|a_{ii}|>\sum_{\substack{j=1\\j\ne i}}^n|a_{ij}|$,$i=1,2,3$.

因此使用Jacobi与Gauss-Seidel均收敛.

使用Gauss-Seidel,则其收敛的迭代公式为:

$\begin{cases}x_1^{(k+1)}=-\frac{1}{10}(2-9x_2^{(k)}-0.5x_3^{(k)})\\x_2^{(k+1)}=-\frac{1}{4}(3-x_1^{(k+1)}-2x_3^{(k)})\\x_3^{(k+1)}=-\frac{1}{12}(1-1.2x_1^{(k+1)}+3.6x_2^{(k+1)})\end{cases}$.
