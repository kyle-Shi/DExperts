API_RATE=20
OUTPUT_DIR=generations/toxicity/dexperts
PROMPTS_DATASET=prompts/nontoxic_prompts-10k.jsonl

python -m scripts.run_toxicity_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --perspective-rate-limit $API_RATE \
    --alpha 2.0 \
    --filter_p 0.9 \
    $OUTPUT_DIR