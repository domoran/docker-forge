docker stop minecraft
docker rm minecraft
docker run -d -it --restart unless-stopped -p 25565:25565 -v /minecraft:/minecraft --name minecraft forge
