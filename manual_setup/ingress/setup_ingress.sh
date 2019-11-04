kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.23.0/deploy/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.23.0/deploy/provider/aws/service-l4.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.23.0/deploy/provider/aws/patch-configmap-l4.yaml
kubectl patch -n ingress-nginx service ingress-nginx -p '{"spec":{"externalTrafficPolicy":"Local"}}'

kubectl create namespace cloudbees-core
kubectl label namespace cloudbees-core name=cloudbees-core
kubectl config set-context $(kubectl config current-context) --namespace=cloudbees-core

# Apply the SSL settings to the port named 'https'
kubectl annotate -n ingress-nginx service ingress-nginx service.beta.kubernetes.io/aws-load-balancer-ssl-ports="https"
# Reference of the ACM certificate to apply to the listener
kubectl annotate -n ingress-nginx service ingress-nginx service.beta.kubernetes.io/aws-load-balancer-ssl-cert="arn:aws:acm:us-east-1:324005994172:certificate/5d6edee9-4e23-47b9-8103-b56124b9bfdf"
# Use only modern TLS ciphers - https://aws.amazon.com/about-aws/whats-new/2017/02/elastic-load-balancing-support-for-tls-1-1-and-tls-1-2-pre-defined-security-policies/
kubectl annotate -n ingress-nginx service ingress-nginx service.beta.kubernetes.io/aws-load-balancer-ssl-negotiation-policy="ELBSecurityPolicy-TLS-1-2-2017-01"

kubectl patch -n ingress-nginx service ingress-nginx -p "$(cat patch-nginx-service-tls.yaml)"

kubectl patch -n ingress-nginx configmap nginx-configuration -p "$(cat patch-nginx-configuration-redirect.yaml)"

kubectl patch -n ingress-nginx service ingress-nginx -p "$(cat patch-nginx-service-redirect.yaml)"



