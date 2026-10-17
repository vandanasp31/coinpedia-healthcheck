#!/bin/bash
# Simple health check for Coinpedia Markets
URL="https://markets.coinpedia.org/broken-url"
 
RESULT=$(curl -s -o /dev/null -w "%{http_code} %{time_total}" "$URL")
STATUS=$(echo "$RESULT" | awk '{print $1}')
TIME=$(echo "$RESULT" | awk '{print $2}')

if [ "$STATUS" -eq 200 ]; then
  echo "OK: $URL is UP (HTTP $STATUS) - Response time: ${TIME}s"
else
  echo "ERROR: $URL is DOWN or has issues (HTTP $STATUS) - Response time: ${TIME}s"
  exit 1
fi
