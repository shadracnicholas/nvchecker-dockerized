#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout master
  git add -A
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER
  nvchecker version: $NVCHECKER_VERSION
  tornado version: $TORNADO_VERSION
  pycurl version: $PYCURL_VERSION
  "
}

upload_files() {
  git remote add origin https://${GH_TOKEN}@github.com/snw35/nvchecker.git > /dev/null 2>&1
  git push --quiet --set-upstream origin
}

setup_git
commit_website_files
upload_files
