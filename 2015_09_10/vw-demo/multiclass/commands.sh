#!/bin/bash

# Write out the sample data
cat << EOF > ect.dat
1 ex1| a
2 ex2| a b
3 ex3| c d e
2 ex4| b a
1 ex5| f g
EOF

echo "Learn the model using reduction of linear regressors"
vw --ect 3 ect.dat -f ect.model
read

echo "Do predictions"
vw --quiet -t -i ect.model ect.dat -p ect.predict
read

echo "Seeing final predictions"
cat ect.predict
read

