Navigate to this folder
cd local-sync-text-editor

In bash:
chmod +x ./start.sh

Docker:
docker build -t local-sync-text-editor .

docker run -d --name sync-text-editor -p 8080:5000 -v sync-text-data:/data --restart=always local-sync-text-editor

Podman:

cd ~/local-sync-text-editor

podman build -t local-sync-text-editor .

podman run -d --name sync-text-editor -p 8080:5000 -v sync-text-data:/data local-sync-text-editor