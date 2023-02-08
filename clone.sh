#!/bin/sh

echo "Cloning repositories..."

EVIONICA=$HOME/evionica

# Evionica
git clone git@gitlab.com:Evionica_DEV/ata/ata-frontend-application.git $EVIONICA/ata-frontend
git clone git@gitlab.com:Evionica_DEV/ata/docs.git $EVIONICA/docs
git clone git@gitlab.com:Evionica_DEV/ata/ata-cloud-deployment.git ata-cloud
git clone git@gitlab.com:Evionica_DEV/ata/ata-core.git ata-core
