# Use the Jupyter minimal notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Copy the conda lock file into the container
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install the packages from the conda lock file using mamba
RUN mamba update --quiet --file /tmp/conda-linux-64.lock \
    && mamba clean --all -y -f \
    && fix-permissions "${CONDA_DIR}" \
    && fix-permissions "/home/${NB_USER}"

# This is a test comment to trigger GitHub Actions
#This is a SECOND test comment to trigger GitHub Actions
#This is a THIRD test comment to trigger GitHub Actions