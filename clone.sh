#!/bin/sh

echo "Cloning repositories..."

BRODA=$HOME/broda
GRIXU=$SITES/grixu

# Broda
git clone git@github.com:grixu/ee.git $BRODA/ee
git clone git@github.com:enet-web/engine.git $BRODA/engine
git clone git@github.com:enet-web/turnusy.git $BRODA/turnusy
git clone git@github.com:enet-web/template.git $BRODA/template
git clone git@github.com:enet-web/sanatoria.git $BRODA/sanatoria
git clone git@github.com:enet-web/category-choose.git $BRODA/category-choose
git clone git@github.com:enet-web/welcomer.git $BRODA/welcomer
git clone git@github.com:enet-web/paywall-button.git $BRODA/paywall-button
git clone git@github.com:enet-web/room-availability.git $BRODA/room-availability
git clone git@github.com:enet-web/auction-partake.git $BRODA/auction-partake

# Grixu
git clone git@github.com:grixu/synchronizer.git $GRIXU/synchronizer
git clone git@github.com:grixu/api-client.git $GRIXU/api-client
git clone git@github.com:grixu/query-builder-filters.git $GRIXU/query-builder-filters
git clone git@github.com:grixu/backup-cleaner.git $GRIXU/backup-cleaner
git clone git@github.com:grixu/flashcards.git $GRIXU/flashcards
git clone git@github.com:grixu/grixu.git $GRIXU/grixu
git clone git@github.com:grixu/flashcards-old.git $GRIXU/flashcards-old
git clone git@github.com:grixu/laravel-starter.git $GRIXU/laravel-starter
