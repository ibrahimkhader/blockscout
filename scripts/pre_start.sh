#!/bin/bash
cd /var/app

# export environment variables
echo exporting .env file
#while read -r name value; do export_string="${name##*/}=$value"; echo "$export_string" >> .env; done < <(aws ssm get-parameters-by-path --path "/dev/blockchain/backend" --with-decryption --query "Parameters[*].[Name,Value]" --output text)
source .env

# compile the code
echo Compiling the code
mix do deps.get, local.rebar --force, deps.compile

# Generating secret key
echo Generating secret key
echo "SECRET_KEY_BASE=$(mix phx.gen.secret)" >> .env
source .env

# Application Compiling
echo compiling the application
mix compile
#mix do ecto.create, ecto.migrate

# Installing Node.JS dependencies
#echo installing nodejs dependencies
#cd apps/block_scout_web/assets && npm install && node_modules/webpack/bin/webpack.js --mode production && cd -
#cd apps/explorer && npm install && cd -

# Build static assets for deployment
#echo Build static assets for deployment
#mix phx.digest
#echo enabling HTTPS
#cd apps/block_scout_web; mix phx.gen.cert blockchain-backend-server blockchain.orbitcosmos.com && cd -
