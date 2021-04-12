package main

import (
	"net/http"
	"time"
)

func healthz(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("ok " + time.Now().Format(time.RFC3339)))
}
