# Pytorch model served in Flask


This is a dockerized version of [the official pytorch tutorial on deploying pytorch using Flask](https://pytorch.org/tutorials/intermediate/flask_rest_api_tutorial.html). 

To run it check the hostname and traefik username and password in the file sourcing environment 
variables and run `./run.sh up`. This will start a flask server running a pretrained image 
classifier and a jupyter notebook that can act as a client to test the server.

To run the notebook go to `https://hostname/flask_client/` and open and run `Client.ipynb`.

## Trying on other images

There are two sample images in the docker image. To try on other images simply upload them in 
the images folder before running the jupyter notebook.

## Accessing the server from outside

Note that this notebook connects to the server internally using the docker network. If you want to connect to the server from outside then you will have to make some changes.

First the URL needs to point to the external dockerized address
~~url='http://flask:5000/flask/predict'~~ url='https://hostname/flask/predict'. The the call to 
requests.posts needs to have HTTP basic authntication as well as have SSL verification turned 
off since traefik redirects HTTP traffic to HTTPS ~~requests.post(url,files={"file": open(file,
'rb')})~~ requests.post(url,files={"file": open(file,'rb')},user=('name','pass'),verify=False)

```jupyterpython
url='https://hostname/flask/predict'
for file in glob.glob('images/*.jpg'):
    resp = requests.post(url,
                         files={"file": open(file,'rb')}, 
                         user=('name','pass'),
                         verify=False)
    plt.figure(figsize=(2,2))
    im=Image.open(file)
    plt.imshow(np.array(im))
    try:
        class_name=resp.json()['class_name']
        plt.title(class_name)
    except:
        print(resp.content)
```


