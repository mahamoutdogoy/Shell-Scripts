a=(`find . -xdev -maxdepth 1 -type f`) ; for i in ${a[*]} ; do mkdir `basename $i`_dir ; mv $i `echo $i`_dir ; done ; rename 's/\_dir//g' * ; rename 's/\.[^\.]*$//' * ; rename 's/_/ /g' *
