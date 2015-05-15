#!/usr/bin/env bash

if [ -f ./README.md ] && [ -f ./LICENSE ];
then
  echo "Removing old gem.."
	gem uninstall -x barnyard2waldo
	echo "Building gem.."
	gem build barnyard2waldo.gemspec
	echo "Installing gem.."
	gem install barnyard2waldo-`bump current |grep -o [0-9].*`.gem
	git status
	echo "Validating gem.."
	gem list --local |grep barnyard2waldo
else
	echo "not in root gem directory, existing."
fi
