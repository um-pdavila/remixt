#!/bin/bash
# this script uses the ANACONDA_TOKEN env var. 
# to create a token:
# >>> anaconda login
# >>> anaconda auth -c -n travis --max-age 307584000 --url https://anaconda.org/USERNAME/PACKAGENAME --scopes "api:write api:read"
set -e

#echo "Converting conda package..."
#conda convert --platform all $HOME/miniconda2/conda-bld/linux-64/PACKAGENAME-*.tar.bz2 --output-dir conda-bld/

conda install --use-local $PACKAGENAME

echo "Deploying to Anaconda.org..."
echo anaconda -t $CONDA_UPLOAD_TOKEN upload $HOME/miniconda2/conda-bld/linux-64/$PACKAGENAME-*.tar.bz2
anaconda -t $CONDA_UPLOAD_TOKEN upload $HOME/miniconda2/conda-bld/linux-64/$PACKAGENAME-*.tar.bz2

echo "Successfully deployed to Anaconda.org."
exit 0
