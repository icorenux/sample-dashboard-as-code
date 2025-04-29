#!/bin/bash

DD_API_KEY=""
DD_APP_KEY=""
DD_API_URL="https://api.datadoghq.com/api/v1/monitor"

get_monitors() {
  GET_MONITORS=$(curl -s -X GET "$DD_API_URL" \
  -H "DD-API-KEY: $DD_API_KEY" \
  -H "DD-APPLICATION-KEY: $DD_APP_KEY" \
  | jq -r '.[] | select((.options.evaluation_delay // 0) == 0) | .id')
}

patch_monitors() {
  for monitor_name in $GET_MONITORS; do
    curl -X PUT "$DD_API_URL/$monitor_name" \
    -H "Content-Type: application/json" \
    -H "DD-API-KEY: $DD_API_KEY" \
    -H "DD-APPLICATION-KEY: $DD_APP_KEY" \
    -d '{
      "options": {
        "evaluation_delay": 900
      }
    }'
    echo "Patched monitor name: $monitor_name"
  done
}

main() {
  get_monitors
  while IFS= read -r monitor_name; do
    #echo "$monitor_name"
    patch_monitors
  done <<< "$GET_MONITORS"
}

main "$@"
