Docker BubbleUPNP Server
========================

This Dockerfile creates an image based on debian:wheezy for running
[bubbleupnpserver](http://www.bubblesoftapps.com/bubbleupnpserver/)

I created this image because I wanted to be able to stream from my DLNA servers
to my chromecasts.  However, the existing images needed to be privileged,
didn't work, or didn't provide the login details for the admin site.

This image has a clean install of bubbleupnpserver which means it will go
through the first time access when you access the web frontend on
http://localhost:58050.

To run:

    docker run --net=host rwgrim/docker-bubbleupnpserver

You need to run with host networking so that it can find the UPnP/DLNA servers
on your network.

