### v2.0.0-rc2 -> v2.0.0

#### Documentation

- [`1bbaf04`](https://github.com/deis/slugbuilder/commit/1bbaf04c1dbee3dab0881e1816d9dd4c8804616a) CHANGELOG.md: add entry for v2.0.0-rc2

#### Maintenance

- [`d059474`](https://github.com/deis/slugbuilder/commit/d0594746ff7f8ff7fac27386b5c5b197ff430e09) various: remove beta status

### v2.0.0-rc1 -> v2.0.0-rc2

### v2.0.0-beta4 -> v2.0.0-rc1

#### Fixes

 - [`43670fd`](https://github.com/deis/slugbuilder/commit/43670fd42c207843b6b93d1455050233f53c0381) Dockerfile: update objstorage CLI
 - [`8f14856`](https://github.com/deis/slugbuilder/commit/8f14856444da0460be6e630513d919f2edfb9cff) build.sh: rename DEBUG to DEIS_DEBUG, unset after use

#### Documentation


#### Maintenance

 - [`9ec6144`](https://github.com/deis/slugbuilder/commit/9ec6144fcba25ef30e3c9b413caba1f66549e049) buildpacks: update heroku-buildpack-go to v40
 - [`e2c6193`](https://github.com/deis/slugbuilder/commit/e2c6193f5b9b48191098cd196e2163052fe1feea) buildpacks: update heroku-buildpack-go to v37
 - [`3aa67ed`](https://github.com/deis/slugbuilder/commit/3aa67ed9e94b684e2e0439acbee91cbda2cdbcad) rootfs/Dockerfile: DEIS_RELEASE -> WORKFLOW_RELEASE

### v2.0.0-beta3 -> v2.0.0-beta4

#### Documentation

 - [`3d76654`](https://github.com/deis/slugbuilder/commit/3d76654507f9ee5315d207a8063b8d628bef9474) CHANGELOG.md: update for v2.0.0-beta3

#### Maintenance

 - [`58d98a2`](https://github.com/deis/slugbuilder/commit/58d98a25b054eb53cb608f3f5e61ea17c277e826) buildpacks: update heroku-buildpack-php to v102
 - [`3ba9995`](https://github.com/deis/slugbuilder/commit/3ba9995da832724ca1b3a5fc443b0162284319e5) buildpacks: update heroku-buildpack-nodejs to v90
 - [`883ef2b`](https://github.com/deis/slugbuilder/commit/883ef2b9b8d42aaa03ee7603912d4e7fa3305688) buildpacks: update heroku-buildpack-go to v34
 - [`3fd5577`](https://github.com/deis/slugbuilder/commit/3fd55775ba2c9675b1dcc3976b1f2ebda6457069) buildpacks: update heroku-buildpack-scala to v70

### v2.0.0-beta2 -> v2.0.0-beta3

#### Maintenance

 - [`8dbd543`](https://github.com/deis/slugbuilder/commit/8dbd543c27251eb7e30164e9403a1b192550182a) .travis.yml: Deep six the travis -> jenkins webhooks
 - [`4b0f026`](https://github.com/deis/slugbuilder/commit/4b0f026a32a9b71952baaba40c97caf67d84c2f4) buildpacks: update heroku-buildpack-python to v80
 - [`46944c1`](https://github.com/deis/slugbuilder/commit/46944c1b85dc02aa263512ee7bd8b4adf6a68680) buildpacks: update heroku-buildpack-go to v32
 - [`928a283`](https://github.com/deis/slugbuilder/commit/928a2838e67fa96b2301202fc7ca3c44f6d41e5b) buildpacks: update heroku-buildpack-ruby to v146
 - [`d204afa`](https://github.com/deis/slugbuilder/commit/d204afa1d5c235e3a7be3ec4b3a50559491d5bdf) buildpacks: update heroku-buildpack-php to v101
 - [`537ec95`](https://github.com/deis/slugbuilder/commit/537ec953cb8f965aaba3194d3084c6a656d21fd8) buildpacks: update heroku-buildpack-scala to v69
 - [`3c066a2`](https://github.com/deis/slugbuilder/commit/3c066a2914ff30113d140ed2a2b7bb4233b833df) changelog: update the changelog for the beta2

### v2.0.0-beta1 -> v2.0.0-beta2

#### Features

 - [`a713e13`](https://github.com/deis/slugbuilder/commit/a713e139983995b9f8bdd424497f5fd7683aca03) storage: use the objectstorage cli for upload and download of slug
 - [`71a4ed2`](https://github.com/deis/slugbuilder/commit/71a4ed22b32d2d74e7ef25d3c82eb3b21e283236) _scripts: add CHANGELOG.md and generator script
 - [`9ab1265`](https://github.com/deis/slugbuilder/commit/9ab126507c86a476633f84cb0a23d67c20e1f9c8) storage: Add support for multiple object storages

#### Fixes

 - [`c55ef21`](https://github.com/deis/slugbuilder/commit/c55ef213fd4538cfe1bc4b7584e4d19af55a39d4) objectstorecli: the latest version having the s3 auth fix

#### Maintenance

 - [`d0cb417`](https://github.com/deis/slugbuilder/commit/d0cb417cb0ffb12e7edf6d0d22a3079f04e3b115) buildpacks: update heroku-buildpack-ruby to v145
 - [`1f4479e`](https://github.com/deis/slugbuilder/commit/1f4479edb15936b2eea26c6964fec05af37e5710) buildpacks: update heroku-buildpack-multi to v1.0.0
 - [`6037c8b`](https://github.com/deis/slugbuilder/commit/6037c8b67d1b3b9e31eab040b899aef9dead111b) buildpacks: update heroku-buildpack-nodejs to v89
 - [`d9de4bc`](https://github.com/deis/slugbuilder/commit/d9de4bc9a5c62bc115107889623046c650ce8905) buildpacks: update heroku-buildpack-scala to v67
 - [`a659ff7`](https://github.com/deis/slugbuilder/commit/a659ff767f4ecc031a568e3790ecc570e06573ae) buildpacks: update heroku-buildpack-python to v78

### 2.0.0-alpha -> v2.0.0-beta1

#### Features

 - [`b521c89`](https://github.com/deis/slugbuilder/commit/b521c89810fffd315b4f1ea53de534dfc1399535) mutable: add support for immutable builds
 - [`8d4e36f`](https://github.com/deis/slugbuilder/commit/8d4e36f2850465aa9b8d374455228e437d7b1c5e) gcs: change signature to s3v2 based on gcs domain

#### Fixes

 - [`5d58418`](https://github.com/deis/slugbuilder/commit/5d58418daec1716b77b320e03d4e528c25a579fd) ProcFile: get procfile from the slug if it is not provided
 - [`9145cfd`](https://github.com/deis/slugbuilder/commit/9145cfd91b75a9119ab0f79c8ea817a3918da0eb) deis-slugbuilder.yaml,deis-store-secret.yaml: remove secret, use minio-user instead

#### Maintenance

 - [`03f84d9`](https://github.com/deis/slugbuilder/commit/03f84d9e8debe1924c92c5feb32918c30479375d) buildpacks: update heroku-buildpack-go to v31
 - [`352c0c6`](https://github.com/deis/slugbuilder/commit/352c0c62ef7769c0e4311be5d513c59b2fcc3c62) buildpacks: update heroku-buildpack-scala to v66
 - [`ce9f98a`](https://github.com/deis/slugbuilder/commit/ce9f98a66b1bd6faed5e1f538db49c4017dfc284) buildpacks: update heroku-buildpack-php to v94
 - [`2c9d592`](https://github.com/deis/slugbuilder/commit/2c9d592bf63cdf29943719c49297e4a2e9993a09) buildpacks: update heroku-buildpack-nodejs to v88
 - [`907a71c`](https://github.com/deis/slugbuilder/commit/907a71cfd23c139e9e81da4fb4ca03e7584d631d) buildpacks: update all Heroku buildpacks
 - [`6daa794`](https://github.com/deis/slugbuilder/commit/6daa794a1b918e52689ffcf6110dab74ed23fd0f) release: bump version to v2-beta

### 2.0.0-alpha

#### Features

 - [`ebe48c2`](https://github.com/deis/slugbuilder/commit/ebe48c20442e2bb193f8e6c26868894d1522c457) deploy.sh: push deisci/slugbuilder:v2-alpha images from master

#### Fixes

 - [`16da6d4`](https://github.com/deis/slugbuilder/commit/16da6d431604c1172b376850af8841be257f336c) build.sh: remove keys from build output
 - [`39b1d10`](https://github.com/deis/slugbuilder/commit/39b1d1008ff423345a7ab1d7e627737741e8950b) build.sh: pipe all mc output to /dev/null
 - [`db9ca5f`](https://github.com/deis/slugbuilder/commit/db9ca5febc2aecf239dff11548d3817bc49427aa) Dockerfile,mc,build.sh: add mc binary and configure it for use
 - [`37e9c2c`](https://github.com/deis/slugbuilder/commit/37e9c2c896cf8606fef85066b1dffdcf68302b28) Dockerfile,mc,build.sh: add support for downloading tarballs from minio
 - [`1eaaca3`](https://github.com/deis/slugbuilder/commit/1eaaca3e20c1e88bdb2852d12a504685b4a5ab72) build: change if condition to faill over no credentials endpoint

#### Maintenance

 - [`8b1f9fd`](https://github.com/deis/slugbuilder/commit/8b1f9fd6b17322357b81f4a70b0eba6f948c7e23) release: set version and lock to deis registry
 - [`d01e9ec`](https://github.com/deis/slugbuilder/commit/d01e9ec398a5a472f676918e7cda0e1793884e31) Dockerfile: update version
