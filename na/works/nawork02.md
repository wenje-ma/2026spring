# 2

---

**1**

分别用Gauss消去法,列主元素法和全主元素法解下列方程组,计算过程保留3位小数:
(1)

$\begin{cases}2x_1+6x_2-4x_3=4\\x_1+4x_2-5x_3=3\\6x_1-x_2+18x_3=2\end{cases}$.

**解答**

- Gauss消去法

$\begin{bmatrix}1&3&-2&2\\1&4&-5&3\\6&-1&18&2\\\end{bmatrix}\xrightarrow{\substack{②-①\\③-①\times6}}$

$\begin{bmatrix}1&3&-2&2\\0&1&-3&1\\0&-19&30&-10\\\end{bmatrix}\xrightarrow{③-②\times19}$

$\begin{bmatrix}1&3&-2&2\\0&1&-3&1\\0&0&-27&9\\\end{bmatrix}$

$\Rightarrow\begin{cases}x_1=1.331\\x_2=0.001\\x_3=-0.333\\\end{cases}$.

- 列主元素法

$\begin{bmatrix}1&3&-2&2\\1&4&-5&3\\6&-1&18&2\\\end{bmatrix}\xrightarrow{①\leftrightarrow③}$

$\begin{bmatrix}6&-1&18&2\\1&4&-5&3\\1&3&-2&2\\\end{bmatrix}\xrightarrow{\substack{②-①\times1/6\\③-①\times1/6}}$

$\begin{bmatrix}6&-1&18&2\\0&4.167&-8&2.667\\0&3.167&-5&1.667\\\end{bmatrix}\xrightarrow{③-②\times3.167/4.167}$

$\begin{bmatrix}6&-1&18&2\\0&4.167&-8&2.667\\0&0&1.080&-0.360\\\end{bmatrix}$

$\Rightarrow\begin{cases}x_1=1.333\\x_2=0.001\\x_3=-0.333\\\end{cases}$.

- 全主元素法

$\begin{bmatrix}1&3&-2&2\\1&4&-5&3\\6&-1&18&2\\\end{bmatrix}\xrightarrow[{①\leftrightarrow③}]{①\leftrightarrow③}$

$\begin{bmatrix}18&-1&6&2\\-5&4&1&3\\-2&3&1&2\\\end{bmatrix}\xrightarrow{\substack{②+①\times5/18\\③+①\times1/9}}$

$\begin{bmatrix}18&-1&6&2\\0&3.722&2.667&3.556\\0&2.889&1.667&2.222\\\end{bmatrix}\xrightarrow{③-②\times2.889/3.722}$

$\begin{bmatrix}18&-1&6&2\\0&3.722&2.667&3.556\\
0&0&-0.403&-0.538\\\end{bmatrix}$

$\Rightarrow\begin{cases}x_1=1.335\\x_2=-0.001\\x_3=-0.334\\\end{cases}$.

---

**2**

用三角分解法求下列方程组

$\begin{cases}2x_1+6x_2-4x_3=4\\x_1+4x_2-5x_3=3\\6x_1-x_2+18x_3=2\end{cases}$.

**解答**

- 紧凑格式法

$\begin{array}{rlrlrlrl}(2)&2&(6)&6&(-4)&4&(4)&4\\(1)&1/2&(4)&1&(-5)&-3&(3)&1\\(6)&3&(-1)&-19&(18)&-27&(2)&9\end{array}$,

则$\begin{bmatrix}2&6&-4\\0&1&-3\\0&0&-27\\\end{bmatrix}X=\begin{bmatrix}4\\0\\-12\\\end{bmatrix}$,

$\Rightarrow\begin{cases}x_1=1.331\\x_2=0.001\\x_3=-0.333\\\end{cases}$.

---

**3**

用紧凑格式解下列方程组,并写出$L,U$矩阵:

$\begin{bmatrix}1&2&3&4\\1&4&9&16\\1&8&27&64\\1&16&81&256\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\\x_4\end{bmatrix}=\begin{bmatrix}2\\10\\44\\190\end{bmatrix}$.

**解答**

- 紧凑格式法

$\begin{array}{rlrlrlrlrl}(1)&1&(2)&2&(3)&3&(4)&4&(2)&2\\(1)&1&(4)&2&(9)&6&(16)&12&(10)&8\\(1)&1&(8)&3&(27)&6&(64)&24&(44)&18\\(1)&1&(16)&7&(81)&6&(256)&24&(190)&24\end{array}$,

则$L=\begin{bmatrix}1\\1&1\\1&3&1\\1&4&6&1\\\end{bmatrix},U=\begin{bmatrix}1&2&3&4\\&2&6&12\\&&6&24\\&&&24\\\end{bmatrix}$,

$\begin{bmatrix}1&2&3&4\\&2&6&12\\&&6&24\\&&&24\\\end{bmatrix}X=\begin{bmatrix}2\\8\\18\\24\\\end{bmatrix}$,

$\Rightarrow\begin{cases}x_1=-1\\x_2=1\\x_3=-1\\x_4=1\\\end{cases}$.

---

**6**

分别用平方根法和改进平方根法求解方程组:

$\begin{bmatrix}1&2&1&-3\\2&5&0&-5\\1&0&14&1\\-3&-5&1&15\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\\x_4\end{bmatrix}=\begin{bmatrix}1\\2\\16\\8\end{bmatrix}$.

**解答**

- 平方根法

$\begin{array}{rlrlrlrl}(1)&1\\(2)&2&(5)&1\\(1)&1&(0)&-2&(14)&3\\(-3)&3&(-5)&1&(1)&2&(15)&1\end{array}$,

$Ly=b,$则$y=\begin{bmatrix}1\\0\\5\\1\\\end{bmatrix}$,

$L^Tx=y,$则$\begin{cases}x_1=1\\x_2=1\\x_3=1\\x_4=1\\\end{cases}$.

- $LDL^T$法

$\begin{array}{rlrlrlrl}(1)&1\\(2)&2&(5)&1\\(1)&1&(0)&-2&(-14)&9\\(-3)&-3&(-5)&1&(-1)&2/3&(-15)&1\end{array}$,

则$L^Tx=D^{-1}y$,

$\Rightarrow\begin{cases}x_1=1\\x_2=1\\x_3=1\\x_4=1\\\end{cases}$.

---

**8**

用追赶法解下列方程组:

(1)

$\begin{bmatrix}2&-1&0&0\\-1&2&-1&0\\0&-1&2&-1\\0&0&-1&2\end{bmatrix}\begin{bmatrix}x_1\\x_2\\x_3\\x_4\end{bmatrix}=\begin{bmatrix}0\\1\\0\\2.5\end{bmatrix}$.

**解答**

- 追赶法

$\begin{array}{rlrlrlrlrl}(2)&2&(-1)&1&&&&&(0)&0\\(-1)&-1/2&(2)&3/2&(-1)&1&&&(1)&1\\&&(-1)&-2/3&(-2)&4/3&(-1)&-1&(0)&2/3\\&&&&(-1)&3/4&(2)&5/4&(2.5)&3\end{array}$,

则$L=\begin{bmatrix}1\\-1/2&1\\&-2/3&1\\&&-3/4&1\\\end{bmatrix},U=\begin{bmatrix}2&-1\\&3/2&-1\\&&4/3&-1\\&&&5/4\\
\end{bmatrix}$,

$\Rightarrow\begin{cases}x_1=1.1\\x_2=2.2\\x_3=2.3\\x_4=2.4\\\end{cases}$.

---

**10**

已知

$\boldsymbol{A}=\begin{bmatrix}6&13&-17\\13&29&-38\\-17&-38&50\end{bmatrix}$

求$\text{cond}(\boldsymbol{A})_1$及$\text{cond}(\boldsymbol{A})_\infty$,并说明方程组$Ax=b$是否病态.

**解答**

- 初等变换法求逆矩阵

$\begin{bmatrix}6&13&-17&1\\13&29&-38&&1\\-17&-38&50&&&1\end{bmatrix}\xrightarrow{\substack{②-①\times13/6\\③+①\times17/6}}$

$\begin{bmatrix}6&13&-17&1\\0&5/6&-7/6&-13/6&1\\0&-7/6&11/6&17/6&&1\end{bmatrix}\xrightarrow{\substack{②\times6\\③\times6}}$

$\begin{bmatrix}6&13&-17&1\\0&5&-7&-13&6\\0&-7&11&17&&6\end{bmatrix}\xrightarrow{\substack{③+②\times7/5\\③\times5/6}}$

$\begin{bmatrix}6&13&-17&1\\0&5&-7&-13&6\\0&0&1&1&7&5\end{bmatrix}\xrightarrow{\substack{①+③\times17\\②+③\times7\\②\times1/5}}$

$\begin{bmatrix}6&13&0&-16&119&85\\0&1&0&-4&11&7\\0&0&1&-1&7&5\end{bmatrix}\xrightarrow{\substack{①-②\times13\\①\times1/6}}$

$\begin{bmatrix}1&0&0&6&-4&-1\\0&1&0&-4&11&7\\0&0&1&-1&7&5\end{bmatrix}$,

即$A^{-1}=\begin{bmatrix}6&-4&-1\\-4&11&7\\-1&7&5\\\end{bmatrix}$.

$\text{cond}(A)_1=\|A\|_1\|A^{-1}\|_1=105\times22=2310\gg100$,

$\text{cond}(A)_\infty=\|A\|_\infty\|A^{-1}\|_\infty=105\times22=2310\gg100$,

因此$Ax=b$为病态.