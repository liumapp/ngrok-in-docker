# ngrok-in-docker
Using docker-compose to deploy ngrok in docker . 

## how to use

### CentOS

* clone the project in your /Users/.

* update init.sh , make the volumes folder you like .

* run init.sh

* wait a few mins , and enter ./clients folder . you can find a "bin" directory . 

* if you CentOS has Nginx listen 80 , plz add nginx config below :

		server {
		     listen       80;
		     server_name  tunnel.liumapp.com *.tunnel.liumapp.com;
		     location / {
			     proxy_redirect off;
			     proxy_set_header Host $host;
			     proxy_set_header X-Real-IP $remote_addr;
			     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			     proxy_pass http://172.31.53.9:7070;
			     proxy_request_buffering off;
			     proxy_buffering off;
		     }
		 }
		 server {
		     listen       443;
		     server_name  tunnel.liumapp.com *.tunnel.liumapp.com;
		     location / {
			     proxy_redirect off;
			     proxy_set_header Host $host;
			     proxy_set_header X-Real-IP $remote_addr;
			     proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			     proxy_pass http://172.31.53.9:2443;
			     proxy_request_buffering off;
			     proxy_buffering off;
		     }
		 }

### Domain

* add tunnel to your host server

* add *.tunnel to your host server

### Client

Assume your client server is macOS

* copy the file /client/bin/darwin_amd64/ngrok into your local server.

* add a file named ngrok.cfg , and add content below :

		server_addr: "tunnel.liumapp.com:4443"
		trust_host_root_certs: false

* run 

		./ngrok -config ./ngrok.cfg -subdomain wechat 192.168.99.100:80		

	which means wechat.tunnel.liumapp.com will be located to 192.168.99.100:80		
