# docker_ndcodfweb

## Build docker images
```
git clone https://github.com/WilliamFromTW/docker_ndcodfweb.git    
cd docker_ndcodfweb
docker build -t ndcodfweb:latest .      
docker volume create ndcodfweb-conf
docker run --restart always  -v ndcodfweb-conf:/etc/ndcodfweb -v /etc/letsencrypt:/etc/letsencrypt  --name ndcodfweb -d  -p 9980:9980 ndcodfweb:latest    
```
*** wait 5 minutes for service startup

## add ip or website in /etc/ndcodfweb/ndcodfweb.xml for access privileges
````
docker exec -it ndcodfweb bash
vi /etc/ndcodfweb/ndcodfweb.xml
<host desc="Regex pattern of hostname to allow or deny." allow="true">117\.56\.68\.133</host>
<host desc="Regex pattern of hostname to allow or deny." allow="true">odf\.nat\.gov\.tw</host>
````

## known bugs
Fail to open chinese file name     

for ndcodfweb 1.6    

