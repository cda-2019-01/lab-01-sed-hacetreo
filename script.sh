# Escriba su código aquí
awk '{print gensub(/\/([(0-9)(0-9)]*)/,"-""\\1",1)}' data.csv > out.1
awk '{print gensub(/\/([(0-9)(0-9)]*)/,"-20""\\1",1)}' out.1 > out.2
tr '[:lower:]'  '[:upper:]' < out.2  | awk '{print gensub(/([0-9][0-9])-([0-9][0-9])-([0-9][0-9][0-9][0-9])/, " \\3-\\2-\\1", 1)}' | sed 's/;;/;\N;/g' | sed 's/,/./g'| sed 's/;/,/g' | sed 's/,N/,\\N/g' | sed 's/,/./4g' | sed "/\N/ d"  
rm out.*
