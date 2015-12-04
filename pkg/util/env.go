package util

import (
	"log"
	"os"
)

func MustEnv(name string) string {
	s := os.Getenv(name)
	if s == "" {
		log.Printf("missing %s", name)
		os.Exit(1)
	}
	return s
}
