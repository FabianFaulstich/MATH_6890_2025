### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ 7bbcea86-ea52-11ef-307b-ff9eca1f3e29
md"# Homework assignment
Due Date: 02/28 by 11:59 pm

Fill in your solutions in the Pluto notebook provided below. Once completed, execute the notebook and export it as a PDF. Upload the PDF to Gradescope for grading, and assign the pages to the respective exercises. Please ensure that all of your solutions, including the code you wrote, are visible and legible in the exported PDF before submitting it to Gradescope. Keep in mind that adjustments to assignments after the submission deadline will not be accommodated.

"

# ╔═╡ d4ebff40-bc17-46ee-bf86-21e644ef56f4
md"# Conceptual Problems"

# ╔═╡ 954049b1-0e76-4109-9d20-5447495b5ccd
md" #### Exercise 1:
Prove that 

``
$
[a_p^\dagger,a_q] = \delta_{p,q}.
$
``
"

# ╔═╡ 24f8459f-b2ef-4452-b060-18986f8238cb
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ d09c0474-3cb8-430e-95a0-9f1a0ec1a598
md" #### Exercise 2:
Compute 

``
$
\langle-| a_j a_i a_n a_p^\dagger a_q^\dagger a_r  a_s a_m^\dagger a_l^\dagger a_k^\dagger | -\rangle
$
``
using Wick's theorem for the absolute vacuum state.  
"

# ╔═╡ 36de2ce5-a88e-4455-b85a-99059a26a6c2
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ 35b9663e-880a-42de-b3d5-d6a315fb634d
md" #### Exercise 3:
Consider the Hamiltoian 

``
$
H = U \left( 
n_{1, \uparrow} n_{1, \downarrow} + n_{2, \uparrow} n_{2, \downarrow}
\right)+ 
t\left( a_{0,\uparrow}^\dagger a_{1,\uparrow} + a_{1,\uparrow}^\dagger a_{0,\uparrow}+ a_{0, \downarrow}^\dagger a_{1, \downarrow} + a_{1, \downarrow}^\dagger a_{0, \downarrow}
\right)
$
``
where 
``
$
n_{i,\sigma} = a_{i,\sigma}^\dagger a_{i,\sigma}
$
``
Analytically determine all solutions to the Schrödinger equation fulfilling 
``
$
\left( 
n_{1, \uparrow} n_{1, \downarrow} + n_{2, \uparrow} n_{2, \downarrow}
\right) |\Psi \rangle 
=
2 |\Psi \rangle 
$
``
"

# ╔═╡ f99624ec-5770-4a87-b668-27d6b17bee95
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ d16251b7-a361-45f0-aed3-362bd6eef479
md"# Programming Problems"

# ╔═╡ f25723cb-92de-44e8-a15c-26f0488f2e55
md" #### Exercise 4:
Write two functions that generate $a_p$ and $a_p^\dagger$ provided $K$ and $p$ as input.
"

# ╔═╡ d57b9c45-5ffb-4d35-8f92-3c830bdd37c1


# ╔═╡ 519aa138-01a5-4984-80f3-89f3b570d697
md" 
Verify your code by checking the CAR for the generated matrices $a_p$ and $a_p^\dagger$. 
"

# ╔═╡ 1f9db2af-8d79-4e43-8df4-6fc3eb91e07d
# Your code goes here

# ╔═╡ 05fa88c6-42fe-480c-95d4-c1e45b8371ea
md" #### Exercise 5:
Write a function that generates the Hamiltonian

``
$
H = U \sum_{i=1}^{n} n_{i, \uparrow} n_{i, \downarrow} + t \sum_{\sigma \in \{\uparrow, \downarrow\}}\sum_{\substack{i,j = 1\\ \langle i, j\rangle = 1}}^{n} (a_{i,\sigma}^\dagger a_{j,\sigma} + c.c.)
$
``
provided the input $U$, $t$, and $n$.
"

# ╔═╡ 1b779c70-62b5-4a2c-9a2c-6206040b0d6f


# ╔═╡ 6c0e6e61-f2ed-4c4f-956b-3a3994699eb7
md" 
Verify your code by checking your analytic solution to Exercise 3. 
"

# ╔═╡ 184e1b3b-7e1d-444a-adbb-e5edfc1d75e4
# Your code goes here

# ╔═╡ 98740918-811d-474d-9e0f-034e3c5dc6c9
md" #### Exercise 6:

"

# ╔═╡ a3a453d6-0928-4f4d-9703-4ca6665aca5b


# ╔═╡ Cell order:
# ╟─7bbcea86-ea52-11ef-307b-ff9eca1f3e29
# ╟─d4ebff40-bc17-46ee-bf86-21e644ef56f4
# ╟─954049b1-0e76-4109-9d20-5447495b5ccd
# ╟─24f8459f-b2ef-4452-b060-18986f8238cb
# ╟─d09c0474-3cb8-430e-95a0-9f1a0ec1a598
# ╟─36de2ce5-a88e-4455-b85a-99059a26a6c2
# ╟─35b9663e-880a-42de-b3d5-d6a315fb634d
# ╟─f99624ec-5770-4a87-b668-27d6b17bee95
# ╟─d16251b7-a361-45f0-aed3-362bd6eef479
# ╟─f25723cb-92de-44e8-a15c-26f0488f2e55
# ╠═d57b9c45-5ffb-4d35-8f92-3c830bdd37c1
# ╟─519aa138-01a5-4984-80f3-89f3b570d697
# ╠═1f9db2af-8d79-4e43-8df4-6fc3eb91e07d
# ╟─05fa88c6-42fe-480c-95d4-c1e45b8371ea
# ╠═1b779c70-62b5-4a2c-9a2c-6206040b0d6f
# ╟─6c0e6e61-f2ed-4c4f-956b-3a3994699eb7
# ╠═184e1b3b-7e1d-444a-adbb-e5edfc1d75e4
# ╠═98740918-811d-474d-9e0f-034e3c5dc6c9
# ╠═a3a453d6-0928-4f4d-9703-4ca6665aca5b
