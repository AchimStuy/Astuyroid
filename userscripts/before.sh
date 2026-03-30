#!/bin/bash

# override `-e "SIGN_BUILDS=true"` by:

mkdir --parents vendor/lineage-priv/keys

# * copy lineage-priv directory
cp -r lineage/scripts/lineage-priv-template/. vendor/lineage-priv/keys

# * copy existing keys from /srv/keys to lineage-priv
cp --no-dereference --update=none --verbose /srv/keys/*.{bin,pem,pk8} vendor/lineage-priv/keys

# * create keys, that don't exist
cd vendor/lineage-priv/keys/
./keys.sh
cd ../../../

# * copy created keys to /srv/keys
cp --no-dereference --update=none --verbose vendor/lineage-priv/keys/*.{bin,pem,pk8} /srv/keys

echo "The verified boot hash is $(cat vendor/lineage-priv/keys/avb_custom_key.bin | openssl dgst -sha256 | sed 's/SHA2-256(stdin)= //' | tr [a-z] [A-Z])."
