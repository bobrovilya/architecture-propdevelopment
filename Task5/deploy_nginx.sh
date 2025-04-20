# Front-end сервис
kubectl run front-end-app --image=nginx --labels role=front-end --expose --port 80

# Back-end API сервис
kubectl run back-end-api-app --image=nginx --labels role=back-end-api --expose --port 80

# Admin Front-end сервис
kubectl run admin-front-end-app --image=nginx --labels role=admin-front-end --expose --port 80

# Admin Back-end API сервис
kubectl run admin-back-end-api-app --image=nginx --labels role=admin-back-end-api --expose --port 80