FROM docker.pkg.github.com/legoktm/gh-action-images/dput:latest

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
