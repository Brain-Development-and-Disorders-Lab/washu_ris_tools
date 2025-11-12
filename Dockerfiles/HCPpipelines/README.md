# HCP Pipelines

> This Docker container allows you to run HCP Pipeline scripts on RIS Compute1.

## Usage

1. Export any storage required for accessing data during the job (Note: This example makes the `HOME`, and `STORAGE1` paths available during the job): `export STORAGE1=/storage1/fs1/<RIS directory>`, `export LSF_DOCKER_VOLUMES="$HOME:$HOME $STORAGE1:$STORAGE1"`

2. Start the job: `bsub -R 'gpuhost' -R "rusage[mem=32GB]" -n 16 -Is -q general-interactive -R 'select[port8888=1]' -a 'docker(henryburgess/hcppipelines)' /bin/bash`

3. Run any setup prior to running the bash script.

4. Execute the bash script: `./script.sh`
