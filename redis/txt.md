* helm repo add stable https://kubernetes-charts.storage.googleapis.com/
* helm search repo stable/redis
* helm install stable/redis --generate-name
* helm ls
* helm uninstall smiling-penguin
* helm status smiling-penguin

* helm show values stable/redis
* helm install -f config.yml stable/redis --generate-name



NAME: redis-1581768670
LAST DEPLOYED: Sat Feb 15 20:11:14 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
** Please be patient while the chart is being deployed **
Redis can be accessed via port 6379 on the following DNS names from within your cluster:

redis-1581768670-master.default.svc.cluster.local for read/write operations
redis-1581768670-slave.default.svc.cluster.local for read-only operations


To get your password run:

    export REDIS_PASSWORD=$(kubectl get secret --namespace default redis-1581768670 -o jsonpath="{.data.redis-password}" | base64 --decode)

To connect to your Redis server:

1. Run a Redis pod that you can use as a client:

   kubectl run --namespace default redis-1581768670-client --rm --tty -i --restart='Never' \
    --env REDIS_PASSWORD=$REDIS_PASSWORD \
   --image docker.io/bitnami/redis:5.0.7-debian-10-r0 -- bash

2. Connect using the Redis CLI:
   redis-cli -h redis-1581768670-master -a $REDIS_PASSWORD
   redis-cli -h redis-1581768670-slave -a $REDIS_PASSWORD

To connect to your database from outside the cluster execute the following commands:

    kubectl port-forward --namespace default svc/redis-1581768670-master 6379:6379 &
    redis-cli -h 127.0.0.1 -p 6379 -a $REDIS_PASSWORD