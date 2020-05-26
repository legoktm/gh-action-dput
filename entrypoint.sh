#!/bin/bash
# Import the gpg signing key
gpg --import < $INPUT_GPG_KEY

debsign $INPUT_PACKAGES

dput $INPUT_REPOSITORY $INPUT_PACKAGES
