### A Pluto.jl notebook ###
# v0.19.46

using Markdown
using InteractiveUtils

# ╔═╡ 7bbcea86-ea52-11ef-307b-ff9eca1f3e29
md"# Homework assignment
Due Date: 03/17 by 11:59 pm

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
n_{1, \uparrow} + n_{1, \downarrow} + n_{2, \uparrow} + n_{2, \downarrow}
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
Write two functions that generate $a_{p, s}$ and $a_{p,s}^\dagger$ given $K\in\mathbb{N}$, $p\in [\![K]\!]$ and $s \in \{\frac{1}{2}, -\frac{1}{2}\}$.
"

# ╔═╡ d57b9c45-5ffb-4d35-8f92-3c830bdd37c1
begin

function annihilation_operator(K, p, s)
    N = 2^(2K)  
    mode_index = 2 * (p - 1) + (s == -1/2 ? 1 : 0)  

    A_ps = zeros(Float64, N, N)

    for n in 0:N-1
        if (n & (1 << mode_index)) != 0  
            sign = (-1)^(count_ones(n & ((1 << mode_index) - 1)))  
            new_state = n & ~(1 << mode_index)  
            A_ps[new_state + 1, n + 1] = sign
        end
    end
    return A_ps
end

function creation_operator(K, p, s)
    return adjoint(annihilation_operator(K, p, s))  
end


end

# ╔═╡ 519aa138-01a5-4984-80f3-89f3b570d697
md" 
Verify your code by checking the CAR for the generated matrices $a_{p, s}$ and $a_{p,s}^\dagger$
"

# ╔═╡ 05fa88c6-42fe-480c-95d4-c1e45b8371ea
md" #### Exercise 5:
Write a function that generates the Hamiltonian

``
$
H = U \sum_{i=1}^{K} n_{i, \uparrow} n_{i, \downarrow} + t \sum_{\sigma \in \{\uparrow, \downarrow\}}\sum_{\substack{i,j = 1\\ \langle i, j\rangle = 1}}^{K} (a_{i,\sigma}^\dagger a_{j,\sigma} + c.c.)
$
``
provided the input $U$, $t$, and $n$.
"

# ╔═╡ 1b779c70-62b5-4a2c-9a2c-6206040b0d6f
begin

function number_operator(K, p, s)
    a_ps_dagger = creation_operator(K, p, s)
    a_ps = annihilation_operator(K, p, s)
    return a_ps_dagger * a_ps
end

function hubbard_hamiltonian(K, U, t)
    N = 2^(2K)  
    H = zeros(Float64, N, N)

    for i in 1:K
        ni_up = number_operator(K, i, 1/2)  
        ni_down = number_operator(K, i, -1/2) 
        H += U * (ni_up * ni_down)
    end

    for i in 1:K
        j = (i % K) + 1  
		
        for σ in [1/2, -1/2]  
            a_iσ_dag = creation_operator(K, i, σ)
            a_jσ = annihilation_operator(K, j, σ)

            H += -t * (a_iσ_dag * a_jσ + a_jσ' * a_iσ_dag)  
        end
    end

    return Hermitian(H)
end

end

# ╔═╡ 6c0e6e61-f2ed-4c4f-956b-3a3994699eb7
md" 
Verify your code by checking your analytic solution to Exercise 3. 
"

# ╔═╡ ced5e67c-bdcf-43bb-8f2a-c870463ee66b
# Your code goes here ....

# ╔═╡ 98740918-811d-474d-9e0f-034e3c5dc6c9
md" #### Exercise 6 (Metal to Mott Insulator at Half-Filling):
At half-filling (one electron per site), the system undergoes a phase transition as $U$ increases:

For $U=0$ (the non-Interacting Limit): 
The system is a Luttinger liquid (gapless metallic state) with a well-defined Fermi surface. 

For $U>0$ but small: 
The system remains metallic, but correlation effects modify the low-energy behavior.

For $U\gg t$ (Strong Coupling Limit): 
The system enters a Mott insulating phase where charge transport is suppressed due to the energy cost of double occupancy. A charge gap opens, preventing conductivity.

Show this phase transition numerically.
"

# ╔═╡ 2f7f81ed-7863-4444-8d3a-681807f4e6dc


# ╔═╡ a3a453d6-0928-4f4d-9703-4ca6665aca5b
# Your code goes here ....

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
# ╠═519aa138-01a5-4984-80f3-89f3b570d697
# ╟─05fa88c6-42fe-480c-95d4-c1e45b8371ea
# ╠═1b779c70-62b5-4a2c-9a2c-6206040b0d6f
# ╟─6c0e6e61-f2ed-4c4f-956b-3a3994699eb7
# ╠═ced5e67c-bdcf-43bb-8f2a-c870463ee66b
# ╟─98740918-811d-474d-9e0f-034e3c5dc6c9
# ╠═2f7f81ed-7863-4444-8d3a-681807f4e6dc
# ╟─a3a453d6-0928-4f4d-9703-4ca6665aca5b
