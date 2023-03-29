for j in 0 1 2 3 4; do
  for i in  ccr6_human-3648 fpr1_human-1031 fpr1_human-3568 fpr1_human-3569 fpr2_human-1031 fpr2_human-3568 fpr2_human-3569 fshr_human-1157 g37l1_human-6067 gasr_human-8411 gpr37_human-6067 gpr39_human-5336 gpr39_human-5337 hrh4_human-1272 ntr1_human-1577 par1_human-4453 par4_human-4456; do
    cp */*/$i/ranked_$j.pdb tmp/${i}_$j.pdb
  done
done
