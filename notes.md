# images
mysql:5.7 || bookstore
# network 
books-net
# volume
mysql-volume
# Docker Run 
docker run -d --name database --network books-net -v mysql-volume:/var/lib/mysql --env-file ./env.txt mysql:5.7
docker run -d --name app-con --network books-net -p 80.80 bookstore
# Clean Up
docker system df (shows the size of all files cached and size)
docker rm -f
docker system prune -a -f

