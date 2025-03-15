### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ d95860c8-fd62-11ef-28ea-cb69ddf9b2bc
md"# Homework assignment
Due Date: 03/24 by 11:59 pm

Fill in your solutions in the Pluto notebook provided below. Once completed, execute the notebook and export it as a PDF. Upload the PDF to Gradescope for grading, and assign the pages to the respective exercises. Please ensure that all of your solutions, including the code you wrote, are visible and legible in the exported PDF before submitting it to Gradescope. Keep in mind that adjustments to assignments after the submission deadline will not be accommodated.

"

# ╔═╡ 7f173786-b882-4753-85e9-4fd15ab38df1
md"# Conceptual Problems"

# ╔═╡ a9e8faf1-ed3f-49b9-9fb2-3959893c1c1b
md" #### Exercise 1:
Prove that 

``
$
\langle \Psi_0 | V| \Psi_0\rangle = \frac{1}{2} \sum_{i,j\in [\![N]\!]}\langle ij||ij\rangle
$
``
"

# ╔═╡ 93e8518f-a89b-418b-93b3-a7e402f21246


# ╔═╡ 51c605cc-7725-4a31-9fcf-f9e8576bf942
md" #### Exercise 2:
Following the notation in class, prove that

``
$
\sum_{i \in [\![N]\!]} \varepsilon_i
=
\sum_{i \in [\![N]\!]} \left(
h_{ii} + \sum_{j \in [\![N]\!]} \langle ij||ij\rangle
\right)
$
``
"

# ╔═╡ af40db75-a153-460f-bfbd-3bd8a945403d
# Your solution goes here 

# ╔═╡ 8043bd4b-a3a0-47b5-846a-019c41c23269
md" #### Exercise 3:
Prove that 

``
$
\langle i|V_{\rm eff}|a\rangle
=
\sum_{j \in [\![N]\!]}
\langle ij||aj\rangle
$
``
"

# ╔═╡ 0f60b10a-e718-40be-8ebf-f288a3f525a6
# Your solution goes here 

# ╔═╡ fe4066a1-ddd8-4111-9fa8-c6b39cb512de
md"# Programming Problems"

# ╔═╡ 4148f908-41e6-47a0-a786-1443c120c290
md" ### MP2 calculations for LiH
"

# ╔═╡ a5611341-45ce-4564-a92d-d41cf6e4d148
md" #### Exercise 4:
Given the AO integral files $v$ and the MO energies in files/equi$\_$geom, write a function that computes the spin-restricted MP2 correlation energy.  
"

# ╔═╡ 63f425d1-3cbb-4195-b552-257e04d80cea


# ╔═╡ 9fd25621-0b98-4e72-8006-c486c32b90aa
md" 
Verify your implementation by comparing your output to mp2$\_$ecorr$\_$1.4 in equi$\_$geom. 
"

# ╔═╡ 088463a1-c980-4f6c-84c2-5c520d206c2a
# Your code goes here

# ╔═╡ f0e80a28-9aef-4c40-837d-1ae5f0374383
md" #### Exercise 5:
Write a routine that performs spin-restricted MP2 for the full potential energy surface of LiH. Use the data provided in files/PES. 
"

# ╔═╡ 435a3bcd-a73b-45d8-a77a-27596544b8b0


# ╔═╡ e1b066ff-930a-49db-a710-bfbd01058ba2
md"
Plot your computed potential energy surface reporting the total energy and compare with the data provided in files/PES. In addition to the MP2 energy include a plot of the RHF energies, comapring the two theories. 
"

# ╔═╡ ae05d2c4-c52a-45ea-801b-c6bfaeedc815
# Your code goes here

# ╔═╡ Cell order:
# ╟─d95860c8-fd62-11ef-28ea-cb69ddf9b2bc
# ╟─7f173786-b882-4753-85e9-4fd15ab38df1
# ╟─a9e8faf1-ed3f-49b9-9fb2-3959893c1c1b
# ╠═93e8518f-a89b-418b-93b3-a7e402f21246
# ╟─51c605cc-7725-4a31-9fcf-f9e8576bf942
# ╠═af40db75-a153-460f-bfbd-3bd8a945403d
# ╟─8043bd4b-a3a0-47b5-846a-019c41c23269
# ╠═0f60b10a-e718-40be-8ebf-f288a3f525a6
# ╟─fe4066a1-ddd8-4111-9fa8-c6b39cb512de
# ╟─4148f908-41e6-47a0-a786-1443c120c290
# ╟─a5611341-45ce-4564-a92d-d41cf6e4d148
# ╠═63f425d1-3cbb-4195-b552-257e04d80cea
# ╠═9fd25621-0b98-4e72-8006-c486c32b90aa
# ╠═088463a1-c980-4f6c-84c2-5c520d206c2a
# ╠═f0e80a28-9aef-4c40-837d-1ae5f0374383
# ╠═435a3bcd-a73b-45d8-a77a-27596544b8b0
# ╟─e1b066ff-930a-49db-a710-bfbd01058ba2
# ╠═ae05d2c4-c52a-45ea-801b-c6bfaeedc815
