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

## License

Copyright 2013, 2014, 2015, 2016 Engine Yard, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at <http://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

[issues]: https://github.com/deis/slugbuilder/issues
[prs]: https://github.com/deis/slugbuilder/pulls
[s3-api]: http://docs.aws.amazon.com/AmazonS3/latest/API/APIRest.html
