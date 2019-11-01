helm install --name cloudbees-core --set OperationsCenter.HostName='demo.k8s.stubrown.net' --set OperationsCenter.Ingress.tls.Enable=true --set nginx-ingress.Enabled=true --set OperationsCenter.ServiceType='ClusterIP' --set OperationsCenter.Ingress.tls.SecretName='cloudbees-core-example-com-tls' --namespace='cloudbees-core'  cloudbees/cloudbees-core

