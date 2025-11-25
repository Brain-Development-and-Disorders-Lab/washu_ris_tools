# COBIND

> This Docker container allows you to use the [COBIND](https://bitbucket.org/CBGR/cobind_tool/src/main/) tool.

## Usage

Refer to the documentation at the COBIND [repository](https://bitbucket.org/CBGR/cobind_tool/src/main/) for tool-specific instructions.

This version of the container patches issues related to various dependencies and this [GitHub Issue](https://github.com/snakemake/snakemake/issues/2607). The following package version have been specified in `requirements.txt`:

* `tabulate<0.9.0`
* `pulp<2.8.0`
