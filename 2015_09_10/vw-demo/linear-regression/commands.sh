#!/bin/bash

# Write out the sample data
cat >regression.dat << EOF
1 ex1_[1]| a
0.6 ex2_[0.6]| a b
-0.6 ex3_[-0.6]| x y
-1 ex4_[-1]| y z
0 ex5_[0]| c
EOF

echo "Learn the model using linear regressor"
read
vw --final_regressor regression.model -d regression.dat --readable_model readable.model
read

echo "Do predictions"
vw --quiet -t -i regression.model regression.dat -p regression.predict
read

echo "Seeing final predictions"
cat regression.predict
read

echo "Learn the model using multiple passes"
read
vw --final_regressor regression.model -d regression.dat --readable_model readable.model --passes 100 -k --holdout_off -c
read

echo "Do predictions"
vw --quiet -t -i regression.model regression.dat -p regression.predict
read

echo "Seeing final predictions"
cat regression.predict
read

############################################################
# Quantile prediction
echo "Doing median prediction instead of quantile prediction"
read

echo "Learn the model using multiple passes"
read
vw --final_regressor regression.model -d regression.dat --readable_model readable.model --passes 100 -k --holdout_off -c --loss_function quantile
read

echo "Do predictions"
vw --quiet -t -i regression.model regression.dat -p regression.predict
read

echo "Seeing final predictions"
cat regression.predict
read


