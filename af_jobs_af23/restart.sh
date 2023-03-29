for i in */*;
do
  if ls $i/*.pdb 1> /dev/null 2>&1; then  
    :
    #echo "  $i is fine"
  else
    echo "  $i has PROBLEM; restarting"
    REC=`echo $i| cut -d "/" -f1`
    LIG=`echo $i| cut -d "/" -f2`
    cd $i
    #rm */msa*/*/mgn*
    #rm sl*
    #sbatch < 0_prepMSAs.run
    #if [ -f $REC-$LIG/msas/A/bfd_uniref_hits.a3m -a -f $REC-$LIG/msas/B/bfd_uniref_hits.a3m ]; then
    if [ -f $REC-$LIG/msas/A/pdb_hits.sto -a -f $REC-$LIG/msas/B/pdb_hits.sto ]; then
      echo "    Input done"
      #sed -i "s@singleton@singleton\n#SBATCH --nice@g" 1_buildmodels.run
      #sbatch < 1_buildmodels.run
      #ls $REC-$LIG/msas/A/bfd_uniref_hits.a3m
      #ls $REC-$LIG/msas/B/bfd_uniref_hits.a3m
    else
      echo "    Input lacking"
      #rm slurm*
      #sbatch < 0_prepMSAs.run
    fi
    cd ../..
  fi
  #if grep -q "Permission" $i/slurm*; then
  #  echo "$i needs restart"
  #  cd $i
  #  if grep -q "ERROR" slurm*; then
  #    echo "  Both"
  #    #rm slurm*
  #    #sbatch < 0_prep_MSAs.run
  #    #sbatch < 1_buildmodels.run
  #  #elif grep -q "Could not find Jackhmmer" slurm*; then
  #  #  echo "  Jackhmmer error"
  #  #  rm *
  #  #  sbatch < 1_buildmodels.run
  #  else
  #    echo "  Only second"
  #    #sbatch < 1_buildmodels.run
  #  fi
  #  cd ../..
  #else
  #  echo "    $i is fine"
  #fi
done
