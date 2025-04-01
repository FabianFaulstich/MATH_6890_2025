import numpy as np
import scipy as sc
from scipy.linalg import eigh
import matplotlib.pyplot as plt

import re 
import os 

def compute_fock_matrix(T, V_en, eri, dm):

    h1e = T + V_en

    J = np.einsum('ijkl, ji -> kl', eri, dm)
    K = np.einsum('ijkl, jk -> il', eri, dm)

    return h1e + J - 0.5*K

def run_scf(T, V_en, eri, S, dm0 = None, eps = 1e-6, max_it = 100):

    if dm0 is None: 
        dm0 = np.zeros_like(T)
    
    dm = dm0
    diff = np.inf
    its = 0
    diffs = []

    while diff > eps and its < max_it:

        F = compute_fock_matrix(T, V_en, eri, dm)
        mo_e, mo_v = sc.linalg.eigh(F, S)
        dm1 = 2 * mo_v[:,:2] @ mo_v[:,:2].T

        its += 1 
        diff = np.linalg.norm(dm - dm1)
        diffs.append(diff)

        dm = dm1
        # print(f'Iteration: {its}, iteration progress: {diff}')

    print(f'\nFinished SCF after {its} steps')

    return dm, diffs

def exercise4():

    T = np.load(f'files/equi_geom/kinetic_energy_matrix_1.4.npy')
    Ven = np.load(f'files/equi_geom/nuclear_potential_matrix_1.4.npy')
    Vee = np.load(f'files/equi_geom/ERI_1.4.npy')
    rdm1 = np.load(f'files/equi_geom/rdm1_1.4.npy')

    F = compute_fock_matrix(T, Ven, Vee, rdm1)

    F_bm = np.load(f'files/equi_geom/Fock_matrix_1.4.npy')

    print(f'Recovered provided data in norm difference: {np.linalg.norm(F - F_bm)}')

def exercise5():

    T = np.load(f'files/equi_geom/kinetic_energy_matrix_1.4.npy')
    Ven = np.load(f'files/equi_geom/nuclear_potential_matrix_1.4.npy')
    Vee = np.load(f'files/equi_geom/ERI_1.4.npy')
    ovlp = np.load(f'files/equi_geom/overlap_matrix_1.4.npy')

    dm, diffs = run_scf(T, Ven, Vee, ovlp) 

    rdm1_bm = np.load(f'files/equi_geom/rdm1_1.4.npy')
    
    print(f'Recovered BM :{np.linalg.norm(dm - rdm1_bm)}')
    
    plt.plot(diffs)
    plt.yscale('log')
    plt.show()

    
    F = compute_fock_matrix(T, Ven, Vee, dm)
    F_bm = np.load(f'files/equi_geom/Fock_matrix_1.4.npy')
    print(f"Recovered Fock matrix {np.linalg.norm(F - F_bm)}")


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
        
        T = np.load(f'files/PES/kinetic_energy_matrix_{bd}.npy')
        Ven = np.load(f'files/PES/nuclear_potential_matrix_{bd}.npy')
        Vee = np.load(f'files/PES/ERI_{bd}.npy')
        ovlp = np.load(f'files/PES/overlap_matrix_{bd}.npy')
        enuc = np.load(f'files/PES/E_nuc_{bd}.npy')

        dm, diffs = run_scf(T, Ven, Vee, ovlp) 
        F = compute_fock_matrix(T, Ven, Vee, dm)

        e_ele = 0.5 * np.trace(dm @ (T + Ven + F))
        E_ele.append(e_ele)
        E_nuc.append(enuc)

        bds.append(float(bd))
        rdm1_bm = np.load(f'files/PES/rdm1_{bd}.npy')
        print(f'Recovered BM :{np.linalg.norm(dm - rdm1_bm)}')

        my_enuc = 3.0/(1.88973 * float(bd))

        print(f'Recovered nuclear repulsion: {enuc - my_enuc}')
        breakpoint()

    E_ele = np.array(E_ele)
    E_nuc = np.array(E_nuc)

    fig, (ax1, ax2, ax3) = plt.subplots(1, 3, figsize=(16, 6))

    ax1.plot(bds, E_ele)
    ax1.set_title("Electronic energy")
    
    ax2.plot(bds, E_nuc)
    ax2.set_title("Nuclear repulsion")
    
    ax3.plot(bds, E_ele + E_nuc)
    ax3.set_title("Total energy")
    
    plt.show()


if __name__ == "__main__":

    np.set_printoptions(linewidth = 300)

    #exercise4()
    #exercise5()
    exercise6()
