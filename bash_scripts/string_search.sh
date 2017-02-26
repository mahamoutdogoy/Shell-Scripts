#!/bin/bash

### Recursive string detection. Same as grep -ri "<pattern>" <File-name>

find . -type f -exec grep -i "Madison" {} \; 2>/dev/null
