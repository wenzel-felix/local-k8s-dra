#! /bin/bash

helm upgrade -i ngrok-ingress-controller ngrok/kubernetes-ingress-controller \
   --namespace ngrok-ingress \
   --create-namespace \
   --set credentials.apiKey=$NGROK_API_KEY \
   --set credentials.authtoken=$NGROK_AUTHTOKEN

kubectl apply -f - <<EOF
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ai-ingress
spec:
  ingressClassName: ngrok
  rules:
  - host: $NGROK_DOMAIN
    http:
      paths:
      - path: /sdapi/v1
        pathType: Prefix
        backend:
          service:
            name: automatic1111-service
            port:
              number: 80
      - path: /api
        pathType: Prefix
        backend:
          service:
            name: ollama-gpu-service
            port:
              number: 80
EOF
