# machine_learning_docker

In this repository I showcase examples of using docker to make handling ML research and 
production easier. As of writing there are three projects

## Flask

I serve a pytorch based image classifier using flask. This is essentially the same code as in 
[the official pytorch tutorial](https://pytorch.org/tutorials/intermediate/flask_rest_api_tutorial.html) 

However, I also add a jupyter server running a notebook that access the above service. 
Furthermore, both of these are in docker containers so running them is quite easy.

## Multiple Jupyter Kernels in Docker

There are two projects for this one. The first one called `multiple_conda_environments` is 
simple and is meant as a tutorial. The second `jupter_ml_docker` is actually  useful Docker 
image that contains tensorflow and pytorch kernels. The docker-compose file manages two 
containers from this image - one running the jupyter notebook server with these two kernels and 
the other running tensorboard.