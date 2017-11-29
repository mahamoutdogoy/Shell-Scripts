#!/bin/bash 

# !!! This is just an example out of context. 

expect -c 'spawn ssh -X $env(COMMON_USER)@$env(SERVER_CONNECT) ; send " docker exec -it $env(CONTAINER_ID) /bin/sh\r" ;interact'
