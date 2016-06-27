# nginx reverse proxy and host entries for local testing
# and making ciruithub apps available outside the VM to the local
# network
{ config, pkgs, ... }:

{
  # local circuithub sites
  networking.extraHosts =
    ''
      127.0.0.1 circuithub.test
      127.0.0.1 projects.circuithub.test
      127.0.0.1 api.circuithub.test
    '';

  # reverse proxy to local circuithub sites
  services.nginx = {
    enable = true;
    httpConfig =
    ''
        ## Start circuithub.test ##
        server {
          listen       80;
          server_name  circuithub.test;

          ## send request back to apache1 ##
          location / {
            proxy_pass  http://127.0.0.1:8081;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          }
        }
        ## Start api.circuithub.test ##
        server {
          listen       80;
          server_name  api.circuithub.test;

          ## send request back to apache1 ##
          location / {
            proxy_pass  http://127.0.0.1:8082;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          }
        }
        ## Start projects.circuithub.test ##
        server {
          listen       80;
          server_name  projects.circuithub.test;

          ## send request back to apache1 ##
          location / {
            proxy_pass  http://127.0.0.1:8083;
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          }
        }
    '';
  };
}
