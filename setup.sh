#!/bin/bash
# Exit on error
set -e

# Create and activate conda environment (if not already created)
conda env list | grep diffwave || conda create -n diffwave python=3.10.16 -y
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate diffwave

# Install dependencies (alternatively, use conda env update with environment.yml)
pip install models/diffwave/.
pip install PySoundFile

# Download checkpoints
wget https://lmnt.com/assets/diffwave/diffwave-ljspeech-22kHz-1000578.pt -P checkpoints/diffwave/

# Run inference (adjust paths as needed)
# python3 inference_NS.py --checkpoint_file generator_v3 \
#     --input_wavs_dir ../../open-universe/data/voicebank_demand/16k/test/noisy \
#     --output_dir ../../open-universe/results/voicebank_demand/16k/test/noisy/hifi-gan


# ./diff_inference.sh diffwave-ljspeech-22kHz-1000578.pt testing_files/noisy testing_results
