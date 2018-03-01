
|![](https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Warning.svg/156px-Warning.svg.png) | Deis Workflow is no longer maintained.<br />Please [read the announcement](https://deis.com/blog/2017/deis-workflow-final-release/) for more detail. |
|---:|---|
| 09/07/2017 | Deis Workflow [v2.18][] final release before entering maintenance mode |
| 03/01/2018 | End of Workflow maintenance: critical patches no longer merged |
| | [Hephy](https://github.com/teamhephy/workflow) is a fork of Workflow that is actively developed and accepts code contributions. |

# Deis Slugbuilder v2

[![Build Status](https://ci.deis.io/job/slugbuilder/badge/icon)](https://ci.deis.io/job/slugbuilder)
[![Docker Repository on Quay](https://quay.io/repository/deisci/slugbuilder/status "Docker Repository on Quay")](https://quay.io/repository/deisci/slugbuilder)

Deis (pronounced DAY-iss) Workflow is an open source Platform as a Service (PaaS) that adds a developer-friendly layer to any [Kubernetes](http://kubernetes.io) cluster, making it easy to deploy and manage applications on your own servers.

For more information about the Deis Workflow, please visit the main project page at https://github.com/deis/workflow.

We welcome your input! If you have feedback, please [submit an issue][issues]. If you'd like to participate in development, please read the "Development" section below and [submit a pull request][prs].

# About

The slugbuilder downloads a git archive ([gzip](http://www.gzip.org/)ped [tar](https://www.gnu.org/software/tar/)ball) from a specified [S3 API compatible server][s3-api], compiles a [slug](https://devcenter.heroku.com/articles/slug-compiler) and uploads it to a specified S3 API compatible server.

This component is usually launched by the [Deis Builder](https://github.com/deis/builder) and used inside the Deis [PaaS](https://en.wikipedia.org/wiki/Platform_as_a_service), but it is flexible enough to be used as a pod inside any Kubernetes cluster.

Please see https://github.com/deis/builder/blob/master/README.md for a more detailed description of how `slugbuilder` interacts with `builder`.

# Development

The Deis project welcomes contributions from all developers. The high level process for development matches many other open source projects. See below for an outline.

* Fork this repository
* Make your changes
* [Submit a pull request][prs] (PR) to this repository with your changes, and unit tests whenever possible.
  * If your PR fixes any [issues][issues], make sure you write Fixes #1234 in your PR description (where #1234 is the number of the issue you're closing)
* The Deis core contributors will review your code. After each of them sign off on your code, they'll label your PR with LGTM1 and LGTM2 (respectively). Once that happens, the contributors will merge it

[issues]: https://github.com/deis/slugbuilder/issues
[prs]: https://github.com/deis/slugbuilder/pulls
[s3-api]: http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html
[v2.18]: https://github.com/deis/workflow/releases/tag/v2.18.0
