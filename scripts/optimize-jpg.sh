#!/usr/bin/env bash

# Used for optimizing jpg images before committing into my blog.
# TODO: support png, parameterize size

for fname in *.jpg; do
    echo "Converting $fname ..."
    convert "$fname" -resize 750x750\> "out/$fname"
    jpegoptim --strip-all -t "out/$fname"
done
