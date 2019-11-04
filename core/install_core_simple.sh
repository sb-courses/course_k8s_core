helm install --name cloudbees-core --set OperationsCenter.HostName='eks.k8s.stubrown.org' --set nginx-ingress.Enabled=true --set OperationsCenter.ServiceType='ClusterIP' --namespace cloudbees-core cloudbees/cloudbees-core

