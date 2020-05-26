#!/bin/bash
# Import the gpg signing key
echo $INPUT_GPG_KEY | gpg --import

debsign $INPUT_PACKAGES

dput $INPUT_REPOSITORY $INPUT_PACKAGES
