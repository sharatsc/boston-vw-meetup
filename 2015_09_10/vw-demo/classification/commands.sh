#!/bin/bash

# Write out the sample data
cat >binary.dat << EOF
1 ex1_1| a
-1 ex2_0| a b
1 ex3_1| c d e
-1 ex4_0| b a
1 ex5_1| f g
EOF
read

##############################################
# User linear regressor as a binary classifier
echo "Learn the model using linear regressor"
vw --final_regressor binary.model -d binary.dat --readable_model readable.model
read

echo "Do predictions(linear regressor)"
vw --quiet -t -i binary.model binary.dat -p binary.predict
read

echo "Seeing final predictions(linear regressor)"
cat binary.predict
read

##############################################
# User logistic regressor as a binary classifier
read
echo "Learn the model using logistic regressor"
vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function logistic
read

echo "Do predictions(logistic regressor)"
vw --quiet -t -i binary.model binary.dat -p binary.predict --link logistic
read

echo "Seeing final predictions(linear regressor)"
cat binary.predict
read

##############################################
# User hinge loss regressor as a binary classifier
echo "Learn the model using hinge loss"
vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function hinge
read

echo "Do predictions(hinge loss)"
vw --quiet -t -i binary.model binary.dat -p binary.predict
read

echo "Seeing final predictions(hinge loss)"
cat binary.predict
read

##############################################
# Report binary loss
echo "Learn the model using hinge but report binary loss"
vw --final_regressor binary.model -d binary.dat --readable_model readable.model --loss_function hinge --binary
read

echo "Do predictions(binary loss)"
vw --quiet -t -i binary.model binary.dat -p binary.predict --binary
read

echo "Seeing final predictions(linear regressor)"
cat binary.predict readable.model
read

