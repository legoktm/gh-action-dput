# GitHub Action to upload Debian package

This GitHub Action uses [dput](https://manpages.debian.org/unstable/dput/dput.1.en.html)
to upload Debian packages to a PPA or repository.

## Configuration
* `gpg_key`: This should be saved as a [GitHub secret](https://help.github.com/en/actions/configuring-and-managing-workflows/creating-and-storing-encrypted-secrets)
as base64 encoded. `gpg --export-secret-key --armor | base64` should do the
trick.
* `repository`: Repository to upload to.
* `packages`: Paths of .changes files to upload, defaults to `*_source.changes`.

```yaml

on: [push]

jobs:
  build-deb:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2

      - uses: legoktm/gh-action-build-deb@ubuntu-bionic
        name: Build package for ubuntu-bionic
        id: build-ubuntu-bionic
        with:
          args: --no-sign

      - uses: legoktm/gh-action-dput@master
        name: Upload package
        # Only upload on pushes to master or a tag
        if: github.event_name == 'push' && (github.event.ref == 'refs/heads/master' || startsWith(github.event.ref, 'refs/tags'))
        with:
          gpg_key: ${{ secrets.GPG_KEY }}
          repository: ppa:legoktm/test
          packages: output/*_source.changes
```

## Related Actions

* [gh-action-auto-dch](https://github.com/legoktm/gh-action-auto-dch) automatically adds a changelog entry based on the git information and distro.
* [gh-action-build-deb](https://github.com/legoktm/gh-action-build-deb) build Debian packages.

## License

Copyright © 2020 Kunal Mehta under the GPL, version 3 or any later version.
