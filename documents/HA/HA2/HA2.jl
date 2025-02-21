### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ 416fc3ba-ea3b-11ef-2ebf-eb59f835a816
md"# Homework assignment
Due Date: 02/28 by 11:59 pm

Fill in your solutions in the Pluto notebook provided below. Once completed, execute the notebook and export it as a PDF. Upload the PDF to Gradescope for grading, and assign the pages to the respective exercises. Please ensure that all of your solutions, including the code you wrote, are visible and legible in the exported PDF before submitting it to Gradescope. Keep in mind that adjustments to assignments after the submission deadline will not be accommodated.

"

# ╔═╡ 9b9a017e-c8fc-4ff3-96a4-93c714ecd706
md"# Conceptual Problems"

# ╔═╡ 0775e7a7-67d3-41c5-8d50-05dca096e9c6
md" #### Exercise 1:
Determine the electronic configuration of nickel.
"

# ╔═╡ a32bf2fb-7b39-4fa3-aabb-473182069bef
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ ed97e184-f667-4beb-a68e-b9ff6453dbf7
md" #### Exercise 2:
Prove the expression for the expectation value of the electron-nucleus attraction for Slater determinants, i.e., 

``
$
V_{\rm en} = 
\langle \Psi | \sum_{i=1}^N\sum_{j=1}^{N_{nuc}} \frac{Z_j}{\Vert R_j - r_i\Vert}| \Psi\rangle
=
\sum_{i=1}^N
\langle \phi_i |\sum_{j=1}^{N_{nuc}} \frac{Z_j}{\Vert R_j - r\Vert}| \phi_i\rangle
$
``

"

# ╔═╡ 305d39a3-bd1b-420c-8c16-7f61811c37a1
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ 4e273a42-8e69-403d-8741-22c9aa2b9b8a
md" #### Exercise 3:
Given the spin-generalized Fock matrix, derive the spin-restricted Fock matrix, i.e., 
``
$
F[D] = T + V_{\rm en} + V_J[D] - \frac{1}{2} V_K[D]
$
``
where 
``
$
[V_J[D]]_{k,l}
=
\sum_{i,j}v_{ijkl} D_{ji} 
$
``
and 
``
$
[V_K[D]]_{i,l}
=
\sum_{j,k}v_{ijkl} D_{jk}.
$
``

"

# ╔═╡ a8921fb3-d2fb-49da-b2ab-aa4348171a90
md" #### Solution:

Your solution goes here ...
"

# ╔═╡ a9354c71-c8e9-4e19-8eb4-1934bc6b1db3
md"# Programming Problems"

# ╔═╡ f69d05f3-c8bd-49f6-9124-1801399df434
md" #### Exercise 4:
Given the integral files $T$, $V_{\rm en}$, and $v$ in files/equi$\_$geom, write a function that computes the spin-restricted Fock matrix.  

"

# ╔═╡ 0d3d1dbc-2bc0-4314-9467-d298fda50a3d
function compute_Fock_matrix(T::Matrix{Float64}, V_en::Matrix{Float64}, eri::Matrix{Float64}, dm::Matrix{Float64})
	# Your code goes here ... 
	return F
end

# ╔═╡ 9aa4ae3d-dfcb-4914-a0aa-5e0c05078649
md" 
Verify your code by comparing with Fock$\_$matrix$\_$1.4.npy in equi$\_$geom
"

# ╔═╡ dbd3d78c-1bd1-44ff-99af-a18dfe8dbfcf
# Your code goes here

# ╔═╡ 8218d31b-0d96-470c-9054-72458c621341
md" #### Exercise 5:
Using the overlap matrices in files/equi$\_$geom, write a self-consisten field iteration method.

"

# ╔═╡ 934fc34a-cd11-44ea-8766-a045398dc13a


# ╔═╡ 9c2639af-7e97-4831-b2a7-1e1b6f119ab4
md" 
Verify your implementation by initializing your code with zero and comparing your output to rdm1$\_$1.4 in equi$\_$geom. 

Report your convergence as a difference function per iteration.
"

# ╔═╡ 492dae7d-7af2-4da6-9953-997b8bbaed23
# Your code goes here

# ╔═╡ 7eed4ff4-1568-4991-8139-e6a6dd4f230d
md" #### Exercise 6:
Write a routine that performs RHF for the full potential energy surface of LiH. Use the data provided in files/PES.
"

# ╔═╡ ef8ccae6-f036-476b-b890-dc0ce31b2c85
# Your code goes here

# ╔═╡ f23c17cb-9215-4c7a-a4df-d2ae3e567763
md"
Plot your computed potential energy surface and compare with the data provided in files/PES.
"

# ╔═╡ e86ba48c-5964-4564-828d-d771e0f03c4f
# Your code goes here

# ╔═╡ Cell order:
# ╟─416fc3ba-ea3b-11ef-2ebf-eb59f835a816
# ╟─9b9a017e-c8fc-4ff3-96a4-93c714ecd706
# ╟─0775e7a7-67d3-41c5-8d50-05dca096e9c6
# ╟─a32bf2fb-7b39-4fa3-aabb-473182069bef
# ╟─ed97e184-f667-4beb-a68e-b9ff6453dbf7
# ╟─305d39a3-bd1b-420c-8c16-7f61811c37a1
# ╟─4e273a42-8e69-403d-8741-22c9aa2b9b8a
# ╟─a8921fb3-d2fb-49da-b2ab-aa4348171a90
# ╟─a9354c71-c8e9-4e19-8eb4-1934bc6b1db3
# ╟─f69d05f3-c8bd-49f6-9124-1801399df434
# ╠═0d3d1dbc-2bc0-4314-9467-d298fda50a3d
# ╟─9aa4ae3d-dfcb-4914-a0aa-5e0c05078649
# ╠═dbd3d78c-1bd1-44ff-99af-a18dfe8dbfcf
# ╟─8218d31b-0d96-470c-9054-72458c621341
# ╠═934fc34a-cd11-44ea-8766-a045398dc13a
# ╟─9c2639af-7e97-4831-b2a7-1e1b6f119ab4
# ╠═492dae7d-7af2-4da6-9953-997b8bbaed23
# ╟─7eed4ff4-1568-4991-8139-e6a6dd4f230d
# ╠═ef8ccae6-f036-476b-b890-dc0ce31b2c85
# ╟─f23c17cb-9215-4c7a-a4df-d2ae3e567763
# ╠═e86ba48c-5964-4564-828d-d771e0f03c4f
