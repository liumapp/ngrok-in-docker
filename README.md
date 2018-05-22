# ngrok-in-docker
Using docker-compose to deploy ngrok in docker . 

## how to use

### CentOS

* clone the project in your /Users/.

* update init.sh , make the volumes folder you like .

* run init.sh

* wait a few mins , and enter ./clients folder . you can find a "bin" directory . 

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
