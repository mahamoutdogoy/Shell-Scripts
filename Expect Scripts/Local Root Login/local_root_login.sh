#!/bin/bash

expect <(cat <<'EOD'
spawn sudo su - 
send "Your_Password\r"
interact
EOD
) 

