package main

import (
  "net/http"
  "strings"
  "testing"
  "io/ioutil"

  "github.com/pkg/errors"
  "github.com/stretchr/testify/assert"
)

func MakeRequest() (string, error) {
  res, err := http.Get("http://127.0.0.1:8080/titles")
  if err != nil {
    return "", errors.Wrap(err, "An error occurred while making the request")
  }
  defer res.Body.Close()

  out, err := ioutil.ReadAll(res.Body)
  if err != nil {
    return "", errors.Wrap(err, "An error occurred while reading the response")
  }

  return string(out), nil
}

func TestGetTitles(t *testing.T) {
  res, err := MakeRequest()
  if err != nil {
    t.Errorf("expected error to be nil got %v", err)
  }

  res = strings.TrimSpace(res)
  assert.Contains(t, res, "Pride and Prejudice")
  assert.Contains(t, res, "Emma")
}
