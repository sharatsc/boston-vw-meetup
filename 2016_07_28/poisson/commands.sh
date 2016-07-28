#!/bin/bash
# Point to VW binary
RED='\033[0;31m'
NC='\033[0m'
export VW=/usr/local/bin/vw
set -x 

# Examine data file
printf "${RED}Examining the data file${NC}\n"
head poisson.dat
read

#Train poisson model using l = 0.01 posses 100
printf "${RED}Training poisson model. Note the use of loss_function and link${NC}\n"
${VW} -d poisson.dat -f poisson.model --loss_function poisson --link poisson -b 2 -l 0.01 --passes 100 -k -c 
read

# Get predictions
printf "${RED}Running in test mode to get predictions. Note the use of loss_function${NC}\n"
${VW} -d poisson.dat -i poisson.model -p poisson.train.predict --loss_function poisson -t 
read

# Compare labels with predictions
printf "${RED}Comparing labels with predictions${NC}\n"
cut -f1 -d " " poisson.dat > labels; paste labels poisson.train.predict | less
