# AlphaFold for Arman (endogenous peptide ligand-receptor complexes)

Small repo to run endogenous peptide ligand complexes. Rather quick and dirty with minimal dependencies. List of endogenous peptide ligands and their receptors taken via query from GPCRdb (see input folder). Relaxation only run for complexes without undefined AAs (Xs in sequence) and single chain ligands. Multi-chain ligands are defined seperately (see input_files/peptide_spec_ligands). Analysis script checks center of mass (COM) - if ligand COM is more extracellular than receptor COM, the ligand passes (see also output csv). 

## Structure of project:
```bash
af_arman
├── af_jobs(_af23)						# Parent folder for AF jobs
│   ├── RECEPTORNAME						# Receptor folder (with protein name)
│   │   └── GTP							# Ligand folder (with Guide-to-Pharmacology ID)
│   │       ├── 0_prepMSAs.run					# Script to run preparation step (CPU)
│   │       ├── 1_buildmodels.run				# Script to run modeling step (GPU)
│   │       ├── RECEPTORNAME-GTP				# AF output folder
│   │       │   ├── first_outside.pdb				# Highest ranked AF model that passed COM assessment
│   │       │   ├── ranked_[0-4].pdb				# AF output in ranked order
│   │       │   ├── ranking_debug.json				# Info about AF metrics of models and rank
│   │       │   ├── relax_metrics.json				# Info about clashes in models
│   │       │   ├── relaxed_model_[1-5]_multimer_v3_pred_0.pdb	# Relaxed AF model, not for all complexes
│   │       │   ├── timings.json				# JSON with duration of AF steps
│   │       │   └── unrelaxed_model_[1-5]_multimer_v3_pred_0.pdb	# Unrelaxed AF output
│   │       ├── RECEPTORNAME-GTP.fasta		# FASTA with receptor and ligand seq for AF
│   │       ├── RECEPTORNAME-GTP.json		# JSON with some info about complex
│   │       ├── RECEPTORNAME-GTP.pdb		# Best AF model (without check), i.e. ranked_0
│   │       ├── slurm-XXXXX.out			# Slurm output
├── ana_results_af23.ipynb			# File to analyze already run AF jobs
├── input_files					# Dir with input
│   ├── P70310_NTR2_mouse.fasta			# Fasta file for receptor with was not retrievable
│   ├── peptide_ligands_Arman.csv		# CSV with all endogenous ligand retrieved from GPCRdb by query
│   ├── peptide_ligands_Arman_completed.csv	# CSV with some additional information added with the preparation script
│   ├── peptide_specligands_Arman.csv		# CSV with information of ligands with multiple gains
│   └── ref_gpcr.pdb				# Reference structure for alignment (z-aligned)
├── make_alphafold_jobs_af22.ipynb		# Script to prepare jobs with old AF version
├── make_alphafold_jobs_af23.ipynb		# Script to prepare jobs with new AF version
└── output_files_af23				# Dir with output of ana_results
    ├── all_chosen_pdbs.zip			# Zip archive of all PDBs that passed the COM assessment
    ├── af_results.csv				# Info of AF results and their assessment
    └── individual_pdbs				# Folder with individual PDBs that passed assessment
       └── RECEPTORNAME-GTP-rank4.pdb
```
