#!/bin/bash

echo "Rolling back to previous version..."
ln -sfn /tmp/blue /tmp/current
echo "Rolled back to blue version."
