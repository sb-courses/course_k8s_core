helm install --name cloudbees-core --set Persistence.StorageClass='nfs-client' --set OperationsCenter.HostName='eks.k8s.stubrown.org' --set OperationsCenter.Ingress.tls.Enable=true --set nginx-ingress.Enabled=true --set OperationsCenter.ServiceType='ClusterIP' --set OperationsCenter.Ingress.tls.SecretName='cloudbees-core-stubrown-tls' --namespace='cloudbees-core'  cloudbees/cloudbees-core

