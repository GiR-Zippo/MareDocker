@echo off

cls
echo Docker compose script for mare
echo set your enviroment variables in compose/.env

echo Be aware these are barebone configs. For https usage you have to figure out by your self!

set /p LBStyle=Select proxy type: (V)arnish (N)ginx:
IF /i "%LBStyle%" == "V" GOTO varnish
IF /i "%LBStyle%" == "N" GOTO nginx
GOTO end

:varnish
docker compose -f compose\mare-varnish.yml -p standalone up
goto end
:nginx
docker compose -f compose\mare-nginx.yml -p standalone up
:end

