#!/bin/bash
echo "Entering data"
cat > train.vw <<EOF
0 example0| a b c
1 example1| x y z
EOF
read

echo "Training vowpal wabbit"
vw -c --passes 20 --holdout_off train.vw -f model.vw
read

echo "Answering requests on port 26542"
vw -i model.vw  -t --daemon --quiet --port 26542
read

echo "Checking for daemon processes"
pgrep vw| wc -l
