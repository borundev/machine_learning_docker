FROM jupyter/minimal-notebook
ADD home/images /home/jovyan/images
ADD home/Client.ipynb /home/jovyan
ADD requirements.txt /home/jovyan

RUN pip install -U pip
WORKDIR /home/jovyan
RUN pip install -U -r requirements.txt
RUN rm requirements.txt

USER root
RUN chown -R jovyan:users /home/jovyan
USER jovyan


#ENTRYPOINT ["jupyter", "notebook", "--no-browser","--ip=0.0.0.0","--NotebookApp.token=''",
#"--NotebookApp.password=''"]
