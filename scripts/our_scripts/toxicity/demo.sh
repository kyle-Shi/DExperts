API_RATE=20
MODEL_DIR=models/experts/toxicity/large
OUTPUT_DIR=generations/toxicity/dexperts/demo_experts
PROMPTS_DATASET=prompts/toy_prompt.jsonl

python -m scripts.run_toxicity_experiment \
    --use-dataset \
    --dataset-file $PROMPTS_DATASET \
    --model-type dexperts \
    --model gpt2-large \
    --nontoxic-model $MODEL_DIR/finetuned_gpt2_nontoxic \
    --toxic-model $MODEL_DIR/finetuned_gpt2_toxic \
    --perspective-rate-limit $API_RATE \
    --alpha 2.0 \
    --filter_p 0.9 \
    $OUTPUT_DIR