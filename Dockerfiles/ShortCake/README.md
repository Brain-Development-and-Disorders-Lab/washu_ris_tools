# ShortCake

> This Docker container contains a cut-down version of the [ShortCake](https://github.com/rnakato/ShortCake) single-cell analysis toolkit.

## Usage

1. Export a port prior to running the job: `export LSF_DOCKER_PORTS='8888:8888'`

2. Start the job: `bsub -R 'gpuhost' -R "rusage[mem=32GB]" -n 16 -Is -q general-interactive -R 'select[port8888=1]' -a 'docker(henryburgess/shortcake)' /bin/bash`

3. Run any setup prior to starting the Jupyter Notebook instance.

4. Start a Jupyter Notebook instance: `jupyter notebook --ip=0.0.0.0 --NotebookApp.allow_origin=* --port=8888`

5. Access the Jupyter Notebook instance via a web browser at the following URL: `http://compute1-exec-nn.ris.wustl.edu:8888/?token=<48-character token>`. The actual token is contained in the output from step 4.

## Tools Included

* [Jupyter Notebook](https://jupyter.org/)
* [anndata](https://anndata.readthedocs.io/en/latest/)
* [scanpy](https://scanpy.scverse.org/en/stable/index.html)
* [scVelo](https://scvelo.readthedocs.io/en/stable/index.html)
* [CellRank 2](https://cellrank.readthedocs.io/en/latest/)
