c = get_config()

c.JupyterHub.bind_url = 'http://:8000'
c.Authenticator.allow_all = True

