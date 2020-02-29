#!/bin/bash

echo "*** running sam deploy without BisectBatchOnFunctionError flag set" > output.txt
sam deploy -t sam_first_update.yaml >> output.txt

echo "*** checking list-event-source-mappings" >> output.txt
aws lambda list-event-source-mappings --function-name sam-test-function >> output.txt


echo "*** running sam deploy with BisectBatchOnFunctionError flag set" >> output.txt
sam deploy -t sam_second_update.yaml >> output.txt

echo "*** checking list-event-source-mappings again" >> output.txt
aws lambda list-event-source-mappings --function-name sam-test-function >> output.txt