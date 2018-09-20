#!/bin/bash

CONFIG_PATH="$(pwd)"

if [ "$1" == "--build" ]; then
  NODE_ENV=production babel src --source-maps --out-dir build/ --presets=react-app
fi

if [ "$1" == "--build-watch" ]; then
  NODE_PATH=src/ NODE_ENV=production babel --watch src --source-maps --out-dir build/
fi
if [ "$1" == "--test" ]; then
  NODE_PATH=src/ jest --env=jsdom
fi

if [ "$1" == "--test-watch" ]; then
  NODE_PATH=src/ jest --watch --env=jsdom
fi

if [ "$1" == "--lint" ]; then

  if [ -f "${CONFIG_PATH}/.eslintrc" ]; then
    eslintrc_file="${CONFIG_PATH}/.eslintrc"
  else
    eslintrc_file="${CONFIG_PATH}/node_modules/@aleksandarstevic/lib-base/config/.eslintrc"
  fi

  eslint --config="${eslintrc_file}" --ext=js --ext=jsx ./src
fi
