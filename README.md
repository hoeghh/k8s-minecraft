# Run on Docker host

First create a directory with read/write acces for a user with uid 1000.
This is usually yourself. Find the use account with uid 1000 by running :

```
id 1000
```

Now start Minecraft witht he following command
```
# Get current username, if this has uid 1000.
# If not, then replace with the username that has.
user=$(whoami)

# Create a folder in current users home folder for persistance
mkdir /home/$user/minecraft-server

# Start minecraft
# 1. Accept the eula
# 2. Map minecraft port to host
# 4. Mount volume in container for persistance
# 5. name of the docker image to use

docker run -d     \
  -e EULA=true    \
  -p 25565:25565  \
  -v /home/$user/minecraft-server:/minecraft-data/ \
  --name minecraft \
  hoeghh/minecraft:1.12.2
```

# Running in Kubernetes
You need a Kubernetes cluster and Helm installed

Edit the PV file minecraft.pv.yaml to point to your nfs share.
Then apply the PV and PVC, and then helm install minecraft.

```
kubectl apply -f minecraft.pv.yaml
kubectl apply -f minecraft.pvc.yaml
cd helmchart/k8s-minecraft/
helm install . --name overworld
```
