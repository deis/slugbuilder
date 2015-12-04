package main

import (
	"io/ioutil"
	"log"
	"os"

	"github.com/deis/slugbuilder/pkg/urls"
	"github.com/deis/slugbuilder/pkg/util"
	"github.com/minio/minio-go"
)

const (
	tarURLEnv           = "TAR_URL"
	putURLEnv           = "PUT_URL"
	accessKeyIDFile     = "/var/run/secrets/object/store/access-key-id"
	accessSecretKeyFile = "/var/run/secrets/object/store/access-secret-key"
)

func main() {
	tarURLStr := util.MustEnv(tarURLEnv)
	putURLStr := util.MustEnv(putURLEnv)

	tarURL, err := urls.ParseTar(tarURLStr)
	if err != nil {
		log.Println(err)
		os.Exit(1)
	}

	accessKeyID, err := ioutil.ReadFile(accessKeyIDFile)
	if err != nil {
		log.Printf("missing access key at %s", accessKeyIDFile)
		os.Exit(1)
	}
	accessSecretKey, err := ioutil.ReadFile(accessSecretKeyFile)
	if err != nil {
		log.Printf("missing access secret key at %s", accessSecretKeyFile)
		os.Exit(1)
	}

	log.Printf("downloading %s", tarURL)
	config := minio.Config{
		Endpoint:        tarURL.Host,
		AccessKeyID:     accessKeyID,
		SecretAccessKey: accessSecretKey,
	}

	s3Client, err := minio.New(config)
	if err != nil {
		log.Printf("couldn't create new S3 client (%s)", err)
		os.Exit(1)
	}

}
