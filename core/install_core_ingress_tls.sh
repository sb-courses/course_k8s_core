helm install --name cloudbees-core --set Persistence.StorageClass='nfs-client' --set OperationsCenter.HostName='demo.k8s.stubrown.net' --set OperationsCenter.Ingress.tls.Enable=true --set nginx-ingress.Enabled=true --set OperationsCenter.ServiceType='ClusterIP' --set OperationsCenter.Ingress.tls.SecretName='cloudbees-core-stubrown-tls' --namespace='cloudbees-core'  cloudbees/cloudbees-core

