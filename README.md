# Deis Slugbuilder

[![Build Status](https://travis-ci.org/deis/slugbuilder.svg?branch=master)](https://travis-ci.org/deis/slugbuilder)

Deis Slugbuilder takes a git archive and compiles a slug and puts it in endpoint which can be a S3 based object store or file server.

## Installation

You will need Docker and Kubectl to use this package.

```
$ make build
$ make deploy
```
