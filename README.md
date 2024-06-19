docker build -t hello_go_http_multistage .
docker run -p 8080:8080 -t hello_go_http_multistage .
