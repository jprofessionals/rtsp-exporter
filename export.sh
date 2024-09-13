#!/usr/bin/env bash

set -euo pipefail

set -o allexport
source config.env
set +o allexport

rm tavle.jpg || true
ffmpeg -y -i "rtsp://$STREAM_USER:$STREAM_PASSWORD@192.168.1.101/stream1" -f image2 -frames:v 1 tavle.jpg

gcloud auth activate-service-account "$SERVICE_ACCOUNT_NAME" --key-file "$KEY_FILE"
gcloud storage cp tavle.jpg "$BUCKET_NAME"

