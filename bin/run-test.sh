#!/bin/bash

: ${CLIENT:="node"}

if [[ ! -z $SERVER ]]; then

  if [ "$SERVER" == "pouchdb-server" ]; then
    export COUCH_HOST='http://127.0.0.1:6984'
    echo -e "Starting up pouchdb-server\n"
    ./node_modules/.bin/pouchdb-server -p 6984 &
  else
    # I mistype pouchdb-server a lot
    echo -e "Unknown SERVER $SERVER. Did you mean pouchdb-server?\n"
    exit 1
  fi
fi

if [ "$CLIENT" == "node" ]; then
    npm run test-node
else
    npm run test-browser
fi
