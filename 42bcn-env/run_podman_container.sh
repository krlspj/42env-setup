#!/bin/bash

podman run -d --name 42bcn-env \
	--env-file 42variables.env \
	-v ./install-scripts:/install-scripts \
	-v ./shared-data:/shared-data \
	debian:latest \
	/bin/bash -c "cd /install-scripts && ./setup.sh && tail -f /dev/null"
