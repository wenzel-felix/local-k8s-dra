# Setup on any Ubuntu 20.04 VM
## Preconfig
```
git clone https://github.com/wenzel-felix/local-k8s-dra.git
chmod +x local-k8s-dra/ubuntu2404_presetup.sh
./local-k8s-dra/ubuntu2404_presetup.sh
```
## Follow dra installation 
Follow the official setup https://github.com/NVIDIA/k8s-dra-driver/tree/main?tab=readme-ov-file#setting-up-the-infrastructure

## Apply ollama setup
```
kubectl apply -f manifests/
```

## (optional - for remote deployments) Create Ngrok Ingress
**Note:** You need a Ngrok account to follow these steps
```
NGROK_API_KEY=<your-apikey>
NGROK_AUTHTOKEN=<your-authtoken>
NGROK_DOMAIN=<your-ngrok-domain>
```
```
helm repo add ngrok https://ngrok.github.io/kubernetes-ingress-controller
helm repo update
chmod +x ingress/install_ngrok.sh
./ingress/install_ngrok.sh
```

## Run OpenWeb UI in Docker
```
docker run -d -p 3000:8080 \
  -e AUTOMATIC1111_BASE_URL=https://$NGROK_DOMAIN/ \
  -e OLLAMA_BASE_URL=https://$NGROK_DOMAIN \
  -e ENABLE_IMAGE_GENERATION=True \
  -v open-webui:/app/backend/data \
  --name open-webui --restart always ghcr.io/open-webui/open-webui:main 
```


### Slides
https://docs.google.com/presentation/d/1ntjAJ7AehyIWxXggmjYiU8bW7D3liR7U6Dw5YbgDSTU/edit?usp=sharing
