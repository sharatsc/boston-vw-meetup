#!/bin/bash

# Write out the sample data
cat << EOF > oaa.dat
1 ex1| a
2 ex2| a b
3 ex3| c d e
2 ex4| b a
1 ex5| f g
EOF

echo "Learn the model using reduction of linear regressors"
vw --oaa 3 oaa.dat -f oaa.model
read

echo "Do predictions"
vw --quiet -t -i oaa.model oaa.dat -p oaa.predict -r oaa.raw.predict
read

echo "Seeing final predictions"
cat oaa.predict
read

echo "Seeing raw predictions"
cat oaa.raw.predict
read

