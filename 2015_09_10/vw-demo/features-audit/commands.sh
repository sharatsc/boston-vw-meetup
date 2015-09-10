#!/bin/bash
cat > vw.dat << EOF
1.0 0.5 'tag|user_features:1.0 age:20 male |ad_features:1.0 width:100 category_automobile |content_features this is a great car
EOF

echo "Parse an example with namespaces and tags"
read
vw --audit vw.dat --hash strings --quiet

echo "Parse an example with ngrams"
read
vw --audit vw.dat --ngram 2 --hash strings --quiet

echo "Parse an example with user ad interactions"
read
vw --audit vw.dat --hash strings --quadratic ua --quiet

echo "Parse an example with user x ad x description interactions"
read
vw --audit vw.dat --hash strings --interactions uac --quiet

