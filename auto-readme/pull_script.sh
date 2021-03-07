#!/bin/sh

# Adding maker submodule
git submodule add git@github.com:mrsegev/auto-readme-script.git
git submodule update --init --recursive
git submodule update --remote --recursive
