server {
    listen 80;
    server_name jenkins.domain.tld;
    return 301 https://;
}
 
server {
    listen 80;
    server_name jenkins.domain.tld;
     
    location / {
      proxy_set_header        Host :;
      proxy_set_header        X-Real-IP ;
      proxy_set_header        X-Forwarded-For ;
      proxy_set_header        X-Forwarded-Proto ;
 
      # Fix the "It appears that your reverse proxy set up is broken" error.
      proxy_pass          http://127.0.0.1:8080;
      proxy_read_timeout  90;
 
      proxy_redirect      http://127.0.0.1:8080 https://jenkins.domain.tld;
  
      # Required for new HTTP-based CLI
      proxy_http_version 1.1;
      proxy_request_buffering off;
      # workaround for https://issues.jenkins-ci.org/browse/JENKINS-45651
      add_header 'X-SSH-Endpoint' 'jenkins.domain.tld:50022' always;
    }
  }
