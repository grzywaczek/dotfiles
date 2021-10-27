#!/bin/sh

echo "Cloning repositories..."

RYWAL=$HOME/rywal
BRODA=$HOME/broda
GRIXU=$SITES/grixu

# Rywal
git clone git@github.com:grixu/synchronizer.git $RYWAL/synchronizer
git clone git@github.com:grixu/socius-client.git $RYWAL/socius-client
git clone git@github.com:grixu/socius-models.git $RYWAL/socius-models
git clone git@github.com:grixu/api-client.git $RYWAL/api-client
git clone git@github.com:grixu/socius-dto.git $RYWAL/socius-dto
git clone git@github.com:grixu/relationship-data-transfer-object.git $RYWAL/relationship-data-transfer-object
git clone git@github.com:grixu/query-builder-filters.git $RYWAL/query-builder-filters
git clone git@github.com:grixu/data-factories.git $RYWAL/data-factories
git clone git@github.com:grixu/passport-module-auth.git $RYWAL/passport-module-auth
git clone git@github.com:grixu/php-mssql-docker.git $RYWAL/php-mssql-docker
git clone git@github.com:rywal-rhc/rental-cfg.git $RYWAL/rental-cfg
git clone git@github.com:rywal-rhc/grip-cfg.git $RYWAL/grip-cfg
git clone git@github.com:rywal-rhc/grip-cfg.git $RYWAL/grip-cfg
git clone git@github.com:rywal-rhc/cleat.git $RYWAL/cleat
git clone git@github.com:rywal-rhc/deposit-ui.git $RYWAL/deposit-ui
git clone git@github.com:rywal-rhc/ivm.git $RYWAL/ivm
git clone git@github.com:rywal-rhc/dds.git $RYWAL/dds
git clone git@github.com:rywal-rhc/socius.git $RYWAL/socius
git clone git@github.com:rywal-rhc/deposit-ui-docs.git $RYWAL/deposit-ui-docs
git clone git@github.com:rywal-rhc/mobile-catalog-pl.git $RYWAL/mobile-catalog-pl
git clone git@github.com:rywal-rhc/mobile-catalog-en.git $RYWAL/mobile-catalog-en
git clone git@github.com:rywal-rhc/pts.git $RYWAL/pts
git clone git@github.com:rywal-rhc/serwis-docs.git $RYWAL/serwis-docs
git clone git@github.com:rywal-rhc/rotopino.git $RYWAL/rotopino
git clone git@github.com:rywal-rhc/serwis-site.git $RYWAL/serwis-site

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
git clone git@github.com:grixu/backup-cleaner.git $GRIXU/backup-cleaner
git clone git@github.com:grixu/flashcards.git $GRIXU/flashcards
git clone git@github.com:grixu/grixu.git $GRIXU/grixu
git clone git@github.com:grixu/flashcards-old.git $GRIXU/flashcards-old
git clone git@github.com:grixu/laravel-starter.git $GRIXU/laravel-starter
git clone git@github.com:grixu/laravel-starter.git $GRIXU/laravel-starter
