
```
# For viewing in the browser, you may need a port-forward
# if your machine is not running in the same network
ssh -L 8080:localhost:8080 cato
```

# Port-Forward da host a --> VM a --> nodePort di cluster Kubernetes

### su VM (192.168.40.89)

```
# kubcetl get node -o wide
NAME       STATUS   ROLES           AGE    VERSION   INTERNAL-IP    EXTERNAL-IP   OS-IMAGE     
         KERNEL-VERSION     CONTAINER-RUNTIME  
minikube   Ready    control-plane   116m   v1.34.0   192.168.49.2   <none>        Ubuntu 22.0  
4.5 LTS   6.8.0-90-generic   docker://28.4.0

# kubectl get svc
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE  
db           ClusterIP   10.97.68.91     <none>        5432/TCP         27m  
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP          116m  
redis        ClusterIP   10.99.199.202   <none>        6379/TCP         30m  
result       NodePort    10.109.174.79   <none>        8081:31001/TCP   30m  
vote         NodePort    10.99.212.255   <none>        8080:31000/TCP   30m

```

### Portforwarding in minikube
```
# kubectl port-forward svc/vote 31000:8080
# kubectl port-forward svc/vote 31001:8081
```

### su host

```
ssh -L 31000:localhost:31000 192.168.40.89

ssh -L 31001:localhost:31001 192.168.40.89
```

### su Browser in host

```
http://localhost:31000
http://localhost:31001
```
