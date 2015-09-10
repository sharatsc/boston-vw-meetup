#!/bin/bash
alias vw='/Users/sharatchikkerur/vowpal_wabbit/vowpalwabbit/vw'
cat > lda.dat << EOF
| good food better ambience best test
| bad service worse food worst prices
| better food worse ambience
EOF

echo "Train lda model with two topics"
read
vw --lda 2 -b 4 --lda_D 3 -f lda.model --readable_model lda.readable.model -d lda.dat -l 0.1 -k -p train.predictions

vw -t -i lda.model -d lda.dat -p test.default.predictions
vw -t -i lda.model -d lda.dat -p test.large_epsilon.predictions --lda_epsilon 10000

echo "Get predictions using the model"
head *predictions
