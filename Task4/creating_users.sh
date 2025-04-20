openssl genrsa -out ivan.key 2048
openssl req -new -key ivan.key -out ivan.csr -subj "/CN=ivan/O=developers"
openssl x509 -req -in ivan.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out ivan.crt -days 365

openssl genrsa -out dmitry.key 2048
openssl req -new -key dmitry.key -out dmitry.csr -subj "/CN=dmitry/O=qa"
openssl x509 -req -in dmitry.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out dmitry.crt -days 365

openssl genrsa -out alex.key 2048
openssl req -new -key alex.key -out alex.csr -subj "/CN=alex/O=admin"
openssl x509 -req -in alex.csr -CA ~/.minikube/ca.crt -CAkey ~/.minikube/ca.key -CAcreateserial -out alex.crt -days 365

kubectl config set-credentials ivan --client-certificate=ivan.crt --client-key=ivan.key
kubectl config set-credentials dmitry --client-certificate=dmitry.crt --client-key=dmitry.key
kubectl config set-credentials alex --client-certificate=alex.crt --client-key=alex.key