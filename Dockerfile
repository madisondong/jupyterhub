FROM python:3.11-slim

RUN apt-get update && apt-get install -y npm nodejs git
RUN apt-get update && apt-get install -y sudo adduser


WORKDIR /srv/jupyterhub

RUN git clone https://github.com/jupyterhub/jupyterhub.git /srv/jupyterhub

COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

RUN pip install --upgrade pip && pip install . && pip install jupyterhub-dummyauthenticator jupyterhub notebook jupyterlab

RUN npm install -g configurable-http-proxy
RUN useradd -m admin


EXPOSE 8000

CMD ["jupyterhub", "-f", "jupyterhub_config.py"]
