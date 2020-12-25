FROM ubuntu:21.04
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y wget

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /miniconda
ENV PATH=$PATH:/miniconda/condabin:/miniconda/bin

COPY binder binder

RUN conda env update -f binder/environment.yml

RUN conda env create -f binder/environment_one.yml
SHELL ["conda","run","-n","one","/bin/bash","-c"]
RUN python -m ipykernel install --name kernel_one --display-name "Display Name One"
RUN pip install -U -r binder/requirements_one.txt


RUN conda env create -f binder/environment_two.yml
SHELL ["conda","run","-n","two","/bin/bash","-c"]
RUN python -m ipykernel install --name kernel_two --display-name "Display Name Two"
RUN pip install -U -r binder/requirements_two.txt

ENV NB_USER feynman
ENV NB_UID 1000

RUN useradd -m -s /bin/bash -N -u $NB_UID $NB_USER

ENV HOME=/home/${NB_USER}
WORKDIR $HOME
USER $NB_USER

SHELL ["/bin/bash","-c"]
RUN conda init
RUN echo 'conda activate one' >> ~/.bashrc

EXPOSE 8888
COPY README.md README.md
ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''","--NotebookApp.password=''"]
