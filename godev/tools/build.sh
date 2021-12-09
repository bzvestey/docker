#!/bin/bash

set -e

echo ============================================================
{ # Try to run the program

  # if we have a pid.lock file, then check it for a  PID.  If the file has a
  # PID, then kill the process.
  if [ -f $TOOLS/pid.lock ]; then
    PID_CURRENT_RUN=$(<$TOOLS/pid.lock)
    if [ $PID_CURRENT_RUN ]; then
      echo "Killing old copy of the process"
      echo $PID_CURRENT_RUN
      kill -KILL $PID_CURRENT_RUN
      echo > $TOOLS/pid.lock
    fi
  fi

  echo "Building Server" && go install -v

  echo "Running Server" && $TOOLS/run.sh

} || { # catch it if there was an error, as we do not want to exit with non 0
  echo "We had an error... Look in the console for the issue!"
}
echo ============================================================