package urls

import (
	"fmt"
	"strings"

	"github.com/goware/urlx"
)

type Tar struct {
	Host       string
	Bucket     string
	ObjectName string
}

func (t Tar) String() string {
	return fmt.Sprintf("%s/%s/%s", t.Host, t.Bucket, t.ObjectName)
}

func ParseTar(str string) (*Tar, error) {
	u, err := urlx.Parse(str)
	if err != nil {
		return nil, fmt.Errorf("invalid tar URL %s (%s)", str, err)
	} else if tarURL.Host == "" {
		return nil, fmt.Errorf("invalid tar URL %s (no host)", str)
	}

	ret := &Tar{}
	ret.Host = u.Host
	spl := strings.Split(u.Path, "/")
	if len(spl) < 2 {
		return nil, fmt.Errorf("no bucket and object name in tar URL path %s", u.Path)
	}
	ret.Bucket = spl[0]
	ret.ObjectName = strings.Join(spl[1:], "/")
	return ret, nil
}
