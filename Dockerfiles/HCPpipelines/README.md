# HCP Pipelines

> This Docker container allows you to run HCP Pipeline scripts on RIS Compute1.

## Usage

1. Export any storage required for accessing data during the job (Note: This example makes the `HOME`, and `STORAGE1` paths available during the job): `export STORAGE1=/storage1/fs1/<RIS directory>`, `export LSF_DOCKER_VOLUMES="$HOME:$HOME $STORAGE1:$STORAGE1"`

2. Start the job: `bsub -R 'gpuhost' -R "rusage[mem=32GB]" -n 16 -Is -q general-interactive -a 'docker(henryburgess/hcppipelines)' /bin/bash`

3. Activate the included Python venv: `source /opt/venv/bin/activate`

4. Run any setup prior to running the bash script. Check that all PATH variables have been set correctly. If not, run the following command: `PATH=/opt/venv/bin:/usr/local/fsl/bin:/usr/local/freesurfer/bin:/usr/local/connectome-workbench/workbench/bin_linux64:/usr/local/msm_hocr:/usr/local/mrtrix3/bin:/usr/local/ants/bin:/usr/local/c3d/bin:$PATH`

5. Execute the bash script: `./script.sh`

## Troubleshooting

* Ensure the `FS_LICENSE` environment variable is set after starting the container. If not, run: `FS_LICENSE=/usr/local/freesurfer/license.txt`
