# Setup on any Ubuntu 20.04 VM
## Preconfig
```
git clone git@github.com:wenzel-felix/local-k8s-dra.git
chmod +x setup.sh
./setup.sh
```
## Follow dra installation 
Follow the official setup https://github.com/NVIDIA/k8s-dra-driver/tree/main?tab=readme-ov-file#setting-up-the-infrastructure

## Apply ollama setup
```
kubectl apply -f manifests/*
```

### Slides
https://docs.google.com/presentation/d/1ntjAJ7AehyIWxXggmjYiU8bW7D3liR7U6Dw5YbgDSTU/edit?usp=sharing
