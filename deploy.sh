docker build -t sandeepkaukab/multi-client:latest -t sandeepkaukab/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sandeepkaukab/multi-server:latest -t sandeepkaukab/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sandeepkaukab/multi-worker:latest -t -t sandeepkaukab/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push sandeepkaukab/multi-client:latest
docker push sandeepkaukab/multi-server:latest
docker push sandeepkaukab/multi-worker:latest
docker push sandeepkaukab/multi-client:$SHA
docker push sandeepkaukab/multi-server:$SHA
docker push sandeepkaukab/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sandeepkaukab/multi-server:$SHA
kubectl set image deployments/client-deployment client=sandeepkaukab/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sandeepkaukab/multi-client:$SHA
