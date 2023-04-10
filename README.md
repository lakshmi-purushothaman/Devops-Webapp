## Simple Flask Web App

docker build -t python-web-app .

docker build --target development --tag devops-python-web-app:prod .

docker run -d -v ${PWD}:/app -w /app --name devops-python-web-app devops-python-web-app:prod


docker exec -it devops-python-web-app sh