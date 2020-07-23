#! /bin/bash

kubectl apply -f ~/test/pv1.yaml
kubectl apply -f ~/test/pv2.yaml
kubectl apply -f ~/test/httpd-pvc.yaml

echo -n "Running ."
while [ true ]
do
    con=`kubectl get pvc | awk /mysql/ | awk /Bound/`
    if [ -n "$con" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

kubectl apply -f ~/test/wp-pvc.yaml
echo -n "Running ."
while [ true ]
do
    con=`kubectl get pvc | awk /wp/ | awk /Bound/`
    if [ -n "$con" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

kubectl create secret generic mysql-password --from-literal=password=mypass
kubectl describe secret mysql-password

kubectl apply -f ~/test/mysql.yaml
echo -n "Running ."
while [ true ]
do
    con=`kubectl get pods | awk /mysql/ |awk /running/`
    if [ -n "$con" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

kubectl apply -f ~/test/wp.yaml
echo -n "Running ."
while [ true ]
do
    con=`kubectl get pods | awk /wp/ |awk /running/`
    if [ -n "$con" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

kubectl apply -f ~/test/mysql-service.yaml
echo -n "Running ."
while [ true ]
do
    con=`kubectl get service | awk /mysql/`
    if [ -n "$con" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

kubectl apply -f ~/test/wp-service.yaml
echo -n "Running ."
while [ true ]
do
    port=`kubectl get service | awk /wordpress/'{print $5}' | cut -d: -f 2 | cut -d/ -f 1`
    if [ -n "$port" ]
    then
        break
    fi
    echo -n "."
    sleep 1
done

echo "finish!!!!!!"
