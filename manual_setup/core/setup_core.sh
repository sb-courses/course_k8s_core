export INSTALLER=cloudbees-core_2.190.2.2_kubernetes.tgz
tar xzvf $INSTALLER
DOMAIN_NAME=eks.k8s.stubrown.org
cd cloudbees-core_2.190.2.2_kubernetes
sed -e s,cloudbees-core.example.com,$DOMAIN_NAME,g < cloudbees-core.yml > tmp && mv tmp cloudbees-core.yml
