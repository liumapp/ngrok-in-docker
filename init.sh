#!/bin/bash

echo '============================================================='
echo '$                                                           $'
echo '$                      liumapp                              $'
echo '$                                                           $'
echo '$                                                           $'
echo '$  email:    liumapp.com@gmail.com                          $'
echo '$  homePage: http://www.liumapp.com                         $'
echo '$  Github:   https://github.com/liumapp                     $'
echo '$                                                           $'
echo '============================================================='
echo '.'

docker pull hteen/ngrok

docker run -idt --name ngrok-server \
-v /Users/docker/ngrok-in-docker/client:/myfiles \
-e DOMAIN="liumapp.com" hteen/ngrok /bin/sh /server.sh