docker build -t cwpark6607/multi-client:latest -t cwpark6607/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t cwpark6607/multi-server:latest -t cwpark6607/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t cwpark6607/multi-worker:latest -t cwpark6607/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push cwpark6607/multi-client:latest
docker push cwpark6607/multi-server:latest
docker push cwpark6607/multi-worker:latest
docker push cwpark6607/multi-client:$SHA
docker push cwpark6607/multi-server:$SHA
docker push cwpark6607/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=cwpark6607/multi-client:$SHA
kubectl set image deployments/server-deployment server=cwpark6607/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=cwpark6607/multi-worker:$SHA