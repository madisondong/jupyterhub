c = get_config()

c.JupyterHub.bind_url = 'http://:8000'

c.JupyterHub.authenticator_class = 'dummyauthenticator.DummyAuthenticator'
c.DummyAuthenticator.password = "admin"  # shared password
c.Authenticator.create_system_users = True

c.Spawner.default_url = '/lab'
c.Spawner.start_timeout = 120  
c.Authenticator.allowed_users = {'admin', 'alice'}
c.Authenticator.admin_users = {'admin'}
c.JupyterHub.admin_access = True
