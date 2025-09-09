@echo off
cd ..
docker build -t darkarchon/mare-synchronos-server:latest . -f Dockerfile-MareSynchronosServer --no-cache --pull --force-rm
cd windows-local