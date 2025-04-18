FROM python:3.11

# Install system dependencies
RUN apt-get update && apt-get install -y npm nodejs git sudo adduser bash coreutils passwd login

WORKDIR /srv/jupyterhub

RUN git clone https://github.com/jupyterhub/jupyterhub.git /srv/jupyterhub

COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

RUN pip install --upgrade pip && pip install . && pip install jupyterhub-dummyauthenticator jupyterhub notebook jupyterlab

RUN npm install -g configurable-http-proxy

# Pre-create admin
RUN useradd -m admin && useradd -m alice

EXPOSE 8000

CMD ["jupyterhub", "-f", "jupyterhub_config.py"]
