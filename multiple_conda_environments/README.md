# An example of making a dockerized jupyter server with multiple conda based kernels

## Dockerfile

In this example we:

1. Start with Ubuntu
2. Download and install miniconda
```dockerfile
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin
```
3. Install jupyter in the base environment
4. Create two more environments and add them to jupyter kernel list. This is a non-trivial step 
   as one has to run `ipykernel install` in the new environment. Usually one would do that by 
   doing `conda init` and then activating the new environment but this requires starting a new 
   bash shell which we cannot do here. This is thus handled in a different way by running 
   commands in the appropriate shells in the following manner
```dockerfile
RUN conda env create -f binder/environment_one.yml
SHELL ["conda","run","-n","one","/bin/bash","-c"]
RUN python -m ipykernel install --name kernel_one --display-name "Display Name One"
RUN pip install -U -r binder/requirements_one.txt
```
5. Add a new user and switch to his directory
6. Perform `conda init` as well as make it so that by default a new bash session opens in a one 
   of the newly created environments
```dockerfile
SHELL ["/bin/bash","-c"]
RUN conda init
RUN echo 'conda activate one' >> ~/.bashrc
```

## Docker-Compose

In the compose file we set up the service to run behind traefik. While this example only has one 
service so a path prefix is not necessary but in general it will be so we add a path prefix via 
command

```dockerfile
command: "--NotebookApp.base_url='multiple_conda_environments'"
```

