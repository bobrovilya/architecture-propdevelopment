#!/bin/bash
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: developers-rolebinding
  namespace: default
subjects:
- kind: Group
  name: developers
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: namespace-editor
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: qa-rolebinding
  namespace: default
subjects:
- kind: Group
  name: qa
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: namespace-viewer
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: admin-rolebinding
  namespace: default
subjects:
- kind: Group
  name: admin
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: dmitry-rolebinding
  namespace: default
subjects:
- kind: User
  name: dmitry
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: namespace-viewer
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: ivan-rolebinding
  namespace: default
subjects:
- kind: User
  name: ivan
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: namespace-editor
  apiGroup: rbac.authorization.k8s.io
EOF

kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: alex-rolebinding
  namespace: default
subjects:
- kind: User
  name: alex
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: Role
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
EOF

echo "Role bindings created."
echo "kubectl auth can-i create pods --as ivan"
kubectl auth can-i create pods --as ivan
echo "kubectl auth can-i create pods --as dmitry"
kubectl auth can-i create pods --as dmitry
echo "kubectl auth can-i get pods --as dmitry"
kubectl auth can-i get pods --as dmitry
echo "kubectl auth can-i get secrets --as alex"
kubectl auth can-i get secrets --as alex