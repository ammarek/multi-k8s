docker build -t ammar1ammar1/multi-client:latest -t ammar1ammar1/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ammar1ammar1/multi-server:latest -t ammar1ammar1/multi-server:$SHA -f ./server/Dockerfile ./server
docker built -t ammar1ammar1/multi-worker:latest -t ammar1ammar1/mutli-worker:$SHA -f ./worker/Dockerfile ./worker 
docker push ammar1ammar1/multi-client:latest
docker push ammar1ammar1/multi-server:latest
docker push ammar1ammar1/multi-worker:latest

docker push ammar1ammar1/multi-client:$SHA
docker push ammar1ammar1/multi-server:$SHA
docker push ammar1ammar1/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=ammar1ammar1/multi-server:$SHA
kubectl set image deployments/client-deployment client=ammar1ammar1/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=ammar1ammar1/multi-worker:$SHA