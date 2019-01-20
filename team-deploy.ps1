./team-build.ps1

docker push spirrochet/capstone-test

docker image prune --force

scp "$(pwd)/team-web-server-upgrade.sh" root@uw-thalesians.spirrochet.com:/root

ssh root@uw-thalesians.spirrochet.com `
"export DOCKERHUB_NAME=spirrochet; export WEB_SERVER_URL=$WEB_SERVER_URL;" `
"export MESSAGES_IMAGE_NAME=$MESSAGES_IMAGE_NAME; chmod +x team-web-server-upgrade.sh; ./team-web-server-upgrade.sh" `
