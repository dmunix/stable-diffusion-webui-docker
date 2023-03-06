FROM nvidia/cuda:11.7.0-cudnn8-devel-ubuntu22.04

# Update our main system
RUN apt-get update
RUN apt-get dist-upgrade -y

# # Debian-based:
RUN apt install wget git python3 python3-venv pip -y

# install the cv2 dependencies that are normally present on the local machine, 
# but might be missing in your Docker container
RUN apt-get install ffmpeg libsm6 libxext6  -y

RUN adduser --disabled-password --gecos '' user
RUN mkdir /content && chown -R user:user /content

WORKDIR /content
USER user

# clone and install the stable diffusion repo
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
# RUN  bash ./stable-diffusion-webui/webui.sh --skip-torch-cuda-test
# RUN wget -qO- https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh | bash -s -- --skip-torch-cuda-test


EXPOSE 7860

# CMD ./stable-diffusion-webui/webui.sh --listen
# CMD cd /content/stable-diffusion-webui && python3 webui.py --xformers --listen --enable-insecure-extension-access
CMD bash
