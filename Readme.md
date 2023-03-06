# Stable-diffusion-webui
Simple docker container for https://github.com/AUTOMATIC1111/stable-diffusion-webui

# Models
The default model will be automatically added with the installation, custom models aren't added by default at the moment.

# Installation
I had some issues with running the installation directly during the docker build, it will often get stuck when downloading the config files, so I suggest to follow this manual steps instead.
```python
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
If you want to play and add additional features to the Dockerfile you can use the following commands to remove the container and image.

```python
# Remove container
docker rm -f stablediffusion
# remove image
docker rmi -f stable-diffusion-webui-docker_stable-diffusion
```