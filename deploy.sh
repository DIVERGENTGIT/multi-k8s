docker build -t vikas888/multi-client:latest -t vikas888/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vikas888/multi-server:latest -t vikas888/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vikas888/multi-worker:latest -t viaks888/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push vikas888/multi-client:latest
docker push vikas888/multi-client:$SHA
docker push vikas888/multi-server:latest 
docker push vikas888/multi-server:$SHA
docker push vikas888/multi-worker:latest
docker push vikas888/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=vikas888/multi-server:$SHA
kubectl set image deployments/client-deployment server=vikas888/multi-client:$SHA
kubectl set image deployments/worker-deployment server=vikas888/multi-worker:$SHA


