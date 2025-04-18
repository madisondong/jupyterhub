c = get_config()

c.JupyterHub.bind_url = 'http://:8000'
c.JupyterHub.authenticator_class = "null"
