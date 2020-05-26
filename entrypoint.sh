#!/bin/bash
# Import the gpg signing key
echo $INPUT_GPG_KEY | base64 --decode | gpg --import

debsign $INPUT_PACKAGES

dput $INPUT_REPOSITORY $INPUT_PACKAGES
