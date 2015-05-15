# barnyard2-waldo

[![Gem Version](https://badge.fury.io/rb/barnyard2waldo.png)](http://badge.fury.io/rb/barnyard2waldo)
[![Gem](https://img.shields.io/gem/dt/barnyard2waldo.svg)](http://badge.fury.io/rb/barnyard2waldo)

Describe the waldo bookmark for barnyard2

## Code Status

[![Build Status](https://travis-ci.org/shadowbq/barnyard2-waldo.svg?branch=master)](https://travis-ci.org/shadowbq/barnyard2-waldo)
[![Code Climate](https://codeclimate.com/github/shadowbq/barnyard2-waldo/badges/gpa.svg)](https://codeclimate.com/github/shadowbq/barnyard2-waldo)
[![Test Coverage](https://codeclimate.com/github/shadowbq/barnyard2-waldo/badges/coverage.svg)](https://codeclimate.com/github/shadowbq/barnyard2-waldo)
[![GitHub tag](https://img.shields.io/github/tag/shadowbq/barnyard2-waldo.svg)](http://github.com/shadowbq/barnyard2-waldo)

This simple scripts provides a decoded output for the barnyard2 bookmark file (waldo file)

## Installation

`$> gem install barnyard2waldo`

## Usage

```shell
$> waldo
Barnyard spool: /var/log/snort/merged.log.1426175522
Record Idx: 119879
2015-03-12 11:52:02 -0400
```

## Extended Help

```shell
$> waldo -h
Usage: waldo [OPTIONS]
    -b                               Bookmark file
                                       Default: /var/spool/barnyard.waldo
Options::
    -h, --help                       Display this screen
```

## Reference:
https://github.com/firnsy/barnyard2/blob/master/src/spooler.c
