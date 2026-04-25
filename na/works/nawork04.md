# 4

**1**

用幂法计算下列矩阵的按模最大的特征值及相应的特征向量，取$\boldsymbol{x}^{(0)}=(1,0,0)^{\mathrm{T}}$：

（2）

$\begin{bmatrix}4&-1&1\\-1&3&-2\\1&-2&3\end{bmatrix}$。

**解答**

已知矩阵$A=\begin{bmatrix}4&-1&1\\-1&3&-2\\1&-2&3\end{bmatrix}$，初始向量$x^{(0)}=\begin{bmatrix}0\\0\\0\end{bmatrix}$，

$y^{(0)}=x^{(0)}=\begin{bmatrix}0\\0\\0\end{bmatrix}$，

$x^{(1)}=Ay^{(0)}=\begin{bmatrix}-4\\-1\\1\end{bmatrix}\Rightarrow\lambda^{(1)}=4$。

$y^{(1)}=\frac{x^{(1)}}{\lambda^{(1)}}=\begin{bmatrix}-1\\-1/4\\1/4\end{bmatrix}$，

$x^{(2)}=Ay^{(1)}=\begin{bmatrix}9/2\\-1\\1/4\end{bmatrix}\Rightarrow\lambda^{(2)}=9/2=4.5$。

---

**2**

用带Aitken加速的幂法计算第1题中矩阵的最大模特征值及相应的特征向量，要求结果有4位有效数字。

**解答**

续1：$y^{(2)}=\frac{x^{(2)}}{\lambda^{(2)}}=\begin{bmatrix}-1/18\\-1/18\\1/18\end{bmatrix}$，

$x^{(3)}=Ay^{(2)}=\begin{bmatrix}-35/18\\-23/18\\23/18\end{bmatrix}\Rightarrow\lambda^{(3)}=35/18\approx3.8889$。

$y^{(3)}=\frac{x^{(3)}}{\lambda^{(3)}}=\begin{bmatrix}-23/170\\-19/170\\23/170\end{bmatrix}$，

$x^{(4)}=Ay^{(3)}=\begin{bmatrix}163/35\\-19/14\\9/14\end{bmatrix}\Rightarrow\lambda^{(4)}=163/35\approx4.6571$。

使用Aitken加速：

$\hat{\lambda}^{(3)}=\lambda^{(1)}-\frac{(\lambda^{(2)}-\lambda^{(1)})^2}{\lambda^{(3)}-2\lambda^{(2)}+\lambda^{(1)}}=169/40=4.225$，

$\hat{\lambda}^{(4)}=\lambda^{(2)}-\frac{(\lambda^{(3)}-\lambda^{(2)})^2}{\lambda^{(4)}-2\lambda^{(3)}+\lambda^{(2)}}=3007/711\approx4.2293$。

---

**4**

用反幂法计算矩阵

$\boldsymbol{A}=\begin{bmatrix}2&1&0\\1&3&1\\0&1&4\end{bmatrix}$

相应于特征值1.2679的特征向量。

**解答**

令$\mu=1.2679$。

$A-\mu I=\begin{bmatrix}0.7321&1&0\\1&0.7321&1\\0&1&0.7321\end{bmatrix}$，

取$x^{(0)}=\begin{bmatrix}0\\0\\0\end{bmatrix},y^{(0)}=x^{(0)}=\begin{bmatrix}0\\0\\0\end{bmatrix}$，

$(A-\mu I)x^{(1)}=y^{(0)}\Rightarrow x^{(1)}=\begin{bmatrix}126.45\\-92.56\\33.86\end{bmatrix}\Rightarrow\lambda^{(1)}=7.9083\times10^5$。

$(A-\mu I)x^{(2)}=y^{(1)}\Rightarrow x^{(2)}=\begin{bmatrix}2032.7\\-1488.1\\544.7\end{bmatrix}\Rightarrow\lambda^{(2)}=4.9196\times10^5$。

---

**7**

设$\boldsymbol{A}$为$n$阶实对称矩阵。对任意非零向量$\boldsymbol{x}\in\mathbf{R}^n$，称$\frac{\langle A\boldsymbol{x},\boldsymbol{x}\rangle}{\langle\boldsymbol{x},\boldsymbol{x}\rangle}=\frac{\boldsymbol{x}^{\mathrm{T}}A\boldsymbol{x}}{\boldsymbol{x}^{\mathrm{T}}\boldsymbol{x}}$为$\boldsymbol{A}$的Rayleigh商，求证：

$\min_{\boldsymbol{x}\neq\boldsymbol{0}}\frac{\langle \boldsymbol{Ax},\boldsymbol{x}\rangle}{\langle\boldsymbol{x},\boldsymbol{x}\rangle}=\min\lambda(\boldsymbol{A}),\quad\max_{\boldsymbol{x}\neq\boldsymbol{0}}\frac{\langle \boldsymbol{Ax},\boldsymbol{x}\rangle}{\langle\boldsymbol{x},\boldsymbol{x}\rangle}=\max\lambda(\boldsymbol{A})$。

**解答**

设$A$有$n$个特征值：$\lambda_1\geq\lambda_2\geq\cdots\geq\lambda_n$。

取$\mathbb{R}^n$中一组标准正交基$u_1,u_2,\dots,u_n$，

则$\forall x$，都有$x=c_1u_1+c_2u_2+\dots+c_nu_n$。

因此$x^TAx=(\sum c_iu_i^T)A(\sum c_ju_j)=\sum_{i,j}c_ic_ju_i^TAu_j$。

由于$Au_j=\lambda_ju_j$，且$u_i^Tu_j=\delta_{ij}$，

因此$\pi^TAx=\sum c_i^2\lambda_i$，同理$\pi^Tx=\sum c_i^2$。

令$R(x)=\frac{\pi^TAx}{\pi^Tx}$，则$R(x)=\frac{\sum c_i^2\lambda_i}{\sum c_i^2}$。

下证最小值相等：

$\lambda_i\geq\lambda_j$，则$\sum c_i^2\lambda_i\geq\sum c_i^2\lambda_j=\lambda_j\sum c_i^2$。

因此$\min_{x\neq0}R(x)=\lambda_1=\min(A)$。

最大值同理。

---

**8**

用Jacobi方法求下列矩阵的全部特征值：

（2）

$\begin{bmatrix}2&-1&0\\-1&-2&-1\\0&-1&2\end{bmatrix}$。

**解答**

先消$a_{23}$与$a_{32}$：

$\tan2\varphi_1=\frac{2a_{12}}{a_{11}-a_{22}}=-\frac{1}{2}$，

则$A_1=J_{\varphi}^TAJ_{\varphi}=\begin{bmatrix}2.2361&0&0.2298\\0&-2.2361&-0.9732\\0.2298&-0.9732&2\end{bmatrix}$。

再消$a_{23}$与$a_{32}$：

$\tan2\varphi_2=\frac{2a_{23}}{a_{22}-a_{33}}=0.4595$，

则$A_2=J_{\varphi}^TA_1J_{\varphi}=\begin{bmatrix}2.2361&-0.2244&0.0491\\-0.2244&2.2129&0\\0.0491&0&-2.4490\end{bmatrix}$。