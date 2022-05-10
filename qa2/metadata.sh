#!/bin/bash

for metadata_name in $(Invoke-RestMethod -uri http://169.254.169.254/latest/meta-data/); do
	echo " $metadata_name values is as follows: "
	echo "$(curl http://169.254.169.254/latest/meta-data/$metadata_name -H application/json)"
done	
