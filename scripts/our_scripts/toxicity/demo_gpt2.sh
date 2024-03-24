API_RATE=20
OUTPUT_DIR=generations/toxicity/dexperts/demo_gpt2
PROMPTS_DATASET=prompts/toy_prompt.jsonl

python -m scripts.run_toxicity_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type gpt2 \
    --model gpt2-large \
    --perspective-rate-limit $API_RATE \
    --filter_p 0.9 \
    $OUTPUT_DIR