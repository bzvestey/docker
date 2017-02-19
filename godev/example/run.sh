#!/bin/bash

set -e

# Starting up the process in the background
$GOBINARIES/$OUTPUT_NAME &

# save the PID of the process so that we can kill it the next time we need to
echo $! > $TOOLS/pid.lock
