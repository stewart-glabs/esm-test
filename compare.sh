#!/usr/bin/env bash
set -euo pipefail

npx tsc

control_output="$(node control.js)"
experiment_output="$(node dist/experiment.js)"

if [ "$control_output" != "$experiment_output" ]; then
  echo "error: outputs differ" >&2
  diff <(echo "$control_output") <(echo "$experiment_output") >&2 || true
  exit 1
fi

echo "success"
