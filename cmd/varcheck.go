package main

import (
	"fmt"
	"net/http"
	"os"
)

func varcheck(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("HOSTNAME : " + os.Getenv("HOSTNAME")))
}
