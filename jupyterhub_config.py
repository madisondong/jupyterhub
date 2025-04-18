c = get_config()

c.JupyterHub.bind_url = 'http://:8000'

c.Authenticator.admin_users = {'admin'}
c.JupyterHub.admin_access = True
