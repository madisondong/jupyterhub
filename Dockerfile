FROM python:3.11-slim

RUN apt-get update && apt-get install -y npm nodejs git

WORKDIR /srv/jupyterhub

RUN git clone https://github.com/jupyterhub/jupyterhub.git /srv/jupyterhub

RUN pip install --upgrade pip && pip install .

RUN npm install -g configurable-http-proxy

# COPY jupyterhub_config.py /srv/jupyterhub/jupyterhub_config.py

EXPOSE 8000

CMD ["jupyterhub", "-f", "/srv/jupyterhub/jupyterhub_config.py"]
