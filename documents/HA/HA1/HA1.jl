### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ f4a7ca5a-c45b-11ef-2d6e-8fbb64e89f8a
md"# Homework assignment
Due Date: 02/14 by 11:59 pm

Fill in your solutions in the Pluto notebook provided below. Once completed, execute the notebook and export it as a PDF. Upload the PDF to Gradescope for grading, and assign the pages to the respective exercises. Please ensure that all of your solutions, including the code you wrote, are visible and legible in the exported PDF before submitting it to Gradescope. Keep in mind that adjustments to assignments after the submission deadline will not be accommodated.

"

# ╔═╡ 64b71987-1436-45b2-87c5-eaad577b76f0
md"# Conceptual Problems"

# ╔═╡ 333b6eff-7cca-4b54-88d0-5ef40d2c3373
md" #### Exercise 1:

Prove that the Laplace operator in spherical coordinates is given by 
``
$
\nabla^2 =\frac{\partial^2}{\partial r^2}+\frac{2}{r} \frac{\partial}{\partial r}+\frac{1}{r^2}\left(\frac{\partial^2}{\partial \theta^2}+\frac{1}{\tan \theta} \frac{\partial}{\partial \theta}+\frac{1}{\sin ^2 \theta} \frac{\partial^2}{\partial \phi^2}\right)
$
``
"

# ╔═╡ 00f519a1-4719-404a-989c-0f2fd74faf41
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ 65552674-4a15-4871-ac0d-22339ebc3c98
md" #### Exercise 2:

Prove that the Laplacian is spherically symetric.
"

# ╔═╡ 7ed677c9-2716-48cc-b13c-c3aebecad636
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ 4f059050-4bc5-4eef-99ea-813d878a41e4
md" #### Exercise 3:

Prove that the spin-$\frac{1}{2}$ operator for a single particle satisfies

``
$
S^2 = S_x^2 + S_y^2 + S_z^2 = \frac{3}{4} I_2 
$
``

Use this result to show that $[S^2,S_\alpha] = 0$ for $\alpha = x,y,z$
"

# ╔═╡ e659b738-5fee-4f39-890e-249583b45018
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ 27edf672-bdde-4e6b-948c-e68259278f30
md"# Programming Problems"

# ╔═╡ 27b56b77-3a86-4125-a079-864bf64c90af
md" We will follow the exercises outlined in Section 5.5 in Computational Physics (Second Edition) by Jos Thijssen please see the reference for additional information on the programming assignment."

# ╔═╡ 650e8c59-3fa0-490e-9a97-5cf0f52c0842
md" #### Exercise 4: 
'Combine the integration routine and the root-finding routine into a method for finding the $\ell = 0$ states of a radial potential.

Check: Test your program for the hydrogen atom.' "

# ╔═╡ 16c8af8b-546b-4cc5-9201-74ba2f7cc738
# Your code goes here ...

# ╔═╡ 3528f321-3988-43ed-a10a-e227aeba96d5
md" #### Exercise 5:
'
Add an extra integration to your program which solves Eq. (5.77).

It is useful to check for correctness by using the hydrogen atom as an example. The normalised ground state density (in the sense of (5.76)), found at E = −0.5 a.u., is 4e−2r and we must solve

``
$
\frac{d^2}{dr^2}U(r) = −4re−2r, 
$
``

with the boundary conditions $U (0) = 0, U (\infty) = 1$, so


``
$
U (r) = −(r + 1)e−2r + 1
$
``


Check: Check whether your program produces these results
' "

# ╔═╡ a6568468-ba34-4700-bc42-0b059657d7d7
# Your code goes here ... 

# ╔═╡ Cell order:
# ╟─f4a7ca5a-c45b-11ef-2d6e-8fbb64e89f8a
# ╠═64b71987-1436-45b2-87c5-eaad577b76f0
# ╟─333b6eff-7cca-4b54-88d0-5ef40d2c3373
# ╠═00f519a1-4719-404a-989c-0f2fd74faf41
# ╟─65552674-4a15-4871-ac0d-22339ebc3c98
# ╠═7ed677c9-2716-48cc-b13c-c3aebecad636
# ╟─4f059050-4bc5-4eef-99ea-813d878a41e4
# ╟─e659b738-5fee-4f39-890e-249583b45018
# ╠═27edf672-bdde-4e6b-948c-e68259278f30
# ╟─27b56b77-3a86-4125-a079-864bf64c90af
# ╟─650e8c59-3fa0-490e-9a97-5cf0f52c0842
# ╠═16c8af8b-546b-4cc5-9201-74ba2f7cc738
# ╟─3528f321-3988-43ed-a10a-e227aeba96d5
# ╠═a6568468-ba34-4700-bc42-0b059657d7d7
