# Train LDA model
vw --lda 5 --lda_D 8 \
        -b 4 -d data --readable_model vw.readable.model \
        --predictions vw.predictions \
        --passes 10 -l 0.1 --lda_alpha 0.1 -k -c --initial_t 0
# Display model file
echo "Model file"
cat vw.readable.model
#Display data
echo "Data"
cat data
#Display predictions
echo "Predictions"
cat vw.predictions | tail -8
