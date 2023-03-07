# Stable-diffusion-webui
Simple docker container for https://github.com/AUTOMATIC1111/stable-diffusion-webui

# Models
Models are stored inside the container, the default model will be automatically added with the installation, custom models aren't added by default at the moment, but you can download them from inside the conteiner and saved them here:

```
/content/stable-diffusion-webui/models/Stable-diffusion
```

# Installation
I had some issues with running the installation directly during the docker build, it will often get stuck when downloading the config files, so I suggest to follow this manual steps instead.
```python
# navigate to the stable-diffusion-webui folder
# build the image
docker compose up

# run container with GPU support
docker run -p 7860:7860 --gpus all -it --name stablediffusion stable-diffusion-webui-docker_stable-diffusion

# Install and run stable diffusion
./stable-diffusion-webui/webui.sh --listen
```
# Run stable diffusion
At this point the container should be up and running and you can access the webui at http://localhost:7860

# Run container
If you want to run the container after it stopped, run the following commands:
```python
# start container
docker start stablediffusion
# run stablediffusion
docker exec -it stablediffusion ./stable-diffusion-webui/webui.sh --listen
```
# Additional docker commands
I leave here some additional commands as a referebce if you want to rebuild or add additional features or models to the container.

```python
# access container terminal
docker exec -it stablediffusion bash

# Remove container
docker rm -f stablediffusion

# remove image
docker rmi -f stable-diffusion-webui-docker_stable-diffusion
```