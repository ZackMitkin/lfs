docker build -t lfs-dev .

docker run \
  --name lfs-dev \
  --mount type=bind,source="$(pwd)"/shared,target=/shared \
  --env-file .env \
  -w /shared \
  -t -i --rm \
  --user=lfs \
  lfs-dev

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)