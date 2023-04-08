## Simple Flask Web App

docker build -t python-web-app .


docker run -d -v ${PWD}:/app -w /app --name python-web-app python-web-app


docker exec -it python-web-app sh