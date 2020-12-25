# machine_learning_docker

In this repository I showcase a container that inherits from tensorflow and then I install conda and create a pytorch environment. I then rename the original kernel to Tensorflow and the new one is called PyTorch. The launched jupyter notebook then has two kernels one for tensorflow and one for pytorch. This project came about because I was installing both tensorflow and pytorch in the same environment but due to some change going from tensorflow v1 to v2 tensorboard was breaking. So the solution was to not install tensorflow in the environment which has pytorch.

This turned out to be an instructive excercise because making docker and conda play with each other is a non-trivial excercise.

For fun (and personal usecase) I also put these services behind trafik. While at it I also threw in a flask container just to showcase to myself how to handle path prefixes and exposed ports on a simple docker file written completely from scratch.
