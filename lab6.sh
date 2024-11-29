#!/bin/bash

PORT_FILE="ports.txt"

if [[ -f "$PORT_FILE" ]]; then
    mapfile -t PORTS < "$PORT_FILE"
else
    echo "Файл не найден"
    exit 1
fi

INSTANCE_IDS=()
for i in "${!PORTS[@]}"; do
    INSTANCE_IDS+=("instance_$((i + 1))")
done

for i in "${!PORTS[@]}"; do
    INSTANCE_ID=${INSTANCE_IDS[$i]}
    PORT=${PORTS[$i]}
    echo "Запуск $INSTANCE_ID на порту $PORT"
    INSTANCE_ID=$INSTANCE_ID PORT=$PORT python app.py &
done

sleep 2
echo "Запустилось"
