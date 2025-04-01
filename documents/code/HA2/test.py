import numpy as np
import scipy as sc
import matplotlib.pyplot as plt

import re
import os


from pyscf import gto, scf


def compute_Fock_matrix(T, V_en, eri, dm):

    h1e = T + V_en

    vj = np.einsum("ijkl,ji->kl", eri, dm)
    vk = np.einsum("ijkl,jk->il", eri, dm)

    fock = h1e + vj - vk * 0.5

    return fock


def run_scf(S, T, V_en, eri, dm0, eps=1e-7, max_iter=100):

    rdm1 = dm0
    diff = np.inf
    it = 0
    diffs = []

    while diff > eps and it < max_iter:

        # Generate Fock matrix
        F = compute_Fock_matrix(T, V_en, eri, rdm1)

        # Solve the GEVP
        mo_e, mo_v = sc.linalg.eigh(F, S)
        dm_new = 2 * mo_v[:, :2] @ mo_v[:, :2].T
        diff = np.linalg.norm(dm_new - rdm1)
        rdm1 = dm_new
        it += 1
        diffs.append(diff)

        # print(f"Iteration {it}; Norm difference in Fock matrix {diff}")

    print(
        f"\nDone!\n Congerged to accuracy {eps} in norm difference of the Fock matrix after {it} iterations\n"
    )
    return rdm1, mo_e, mo_v, F, diffs


def exercise4():

    print(10 * "#")
    print("Running Exercise 4:\n")
    T = np.load(f"files/equi_geom/kinetic_energy_matrix_1.4.npy")
    Ven = np.load(f"files/equi_geom/nuclear_potential_matrix_1.4.npy")
    Vee = np.load(f"files/equi_geom/ERI_1.4.npy")
    rdm1 = np.load(f"files/equi_geom/rdm1_1.4.npy")

    myfock = compute_Fock_matrix(T, Ven, Vee, rdm1)

    # Loading the benchmark
    fock_bm = np.load(f"files/equi_geom/Fock_matrix_1.4.npy")

    print(f"Recovering the provided Fock matrix with our code.")
    print(f"Norm difference is: {np.linalg.norm(fock_bm - myfock)}\n")


def exercise5():

    print(10 * "#")
    print("Running Exercise 5:\n")

    # Loading data
    T = np.load(f"files/equi_geom/kinetic_energy_matrix_1.4.npy")
    Ven = np.load(f"files/equi_geom/nuclear_potential_matrix_1.4.npy")
    Vee = np.load(f"files/equi_geom/ERI_1.4.npy")
    ovlp = np.load(f"files/equi_geom/overlap_matrix_1.4.npy")

    # Generating initial guess
    dm0 = np.zeros_like(T)

    # Running SCF
    mydm, mo_e, mo_v, myfock, diffs = run_scf(ovlp, T, Ven, Vee, dm0, eps=1e-10)

    # Loading the benchmark
    fock_bm = np.load(f"files/equi_geom/Fock_matrix_1.4.npy")
    rdm1_bm = np.load(f"files/equi_geom/rdm1_1.4.npy")

    print(f"Recovering the provided Fock matrix with our code.")
    print(f"Norm difference of Fock matrix is: {np.linalg.norm(fock_bm - myfock)}")
    print(f"Norm difference of 1-RDM is: {np.linalg.norm(rdm1_bm - mydm)}\n")

    plt.plot(diffs, "-o")

    plt.title("SCF convergence for LiH")
    plt.xlabel("Iteration")
    plt.ylabel("Norm difference Fock matrix")

    plt.yscale("log")
    plt.show()


def exercise6():

    directory = "files/PES/"
    pattern = re.compile(r"ERI_([\d\.]+)\.npy")
    number_set = set()

    for filename in os.listdir(directory):
        match = pattern.match(filename)
        if match:
            number_set.add(match.group(1))

    E_ele = []
    E_nuc = []
    bds = []
    for bd in sorted(number_set, key=float):

        T = np.load(directory + f"kinetic_energy_matrix_{bd}.npy")
        Ven = np.load(directory + f"nuclear_potential_matrix_{bd}.npy")
        Vee = np.load(directory + f"ERI_{bd}.npy")
        ovlp = np.load(directory + f"overlap_matrix_{bd}.npy")
        Enuc = np.load(directory + f"E_nuc_{bd}.npy")

        dm0 = np.zeros_like(T)

        rdm1, mo_e, mo_v, F, diffs = run_scf(ovlp, T, Ven, Vee, dm0, 1e-7)
        e_ele = 0.5 * np.trace(rdm1 @ (T + Ven + F))

        my_enuc = 3/(1.88973 * float(bd))
        
        if my_enuc - Enuc> 1e-6:
            breakpoint()

        E_ele.append(e_ele)
        E_nuc.append(Enuc)
        bds.append(np.round(float(bd), 2))



    E_ele = np.array(E_ele)
    E_nuc = np.array(E_nuc)

    fig, (ax1, ax2, ax3) = plt.subplots(1, 3, figsize=(16, 6))

    ax1.plot(bds, E_ele)
    ax1.set_title("Electronic energy")
    ax1.set_xlabel("Bond distance")

    ax2.plot(bds, E_nuc)
    ax2.set_title("Nuclear repulsion")
    ax2.set_xlabel("Bond distance")

    ax3.plot(bds, E_ele + E_nuc)
    ax3.set_title("Total energy")
    ax3.set_xlabel("Bond distance")

    plt.show()


if __name__ == "__main__":

    # Setting numpy print options
    np.set_printoptions(linewidth=300)

    exercise4()
    exercise5()
    exercise6()
