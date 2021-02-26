package service

import (
	"context"
	"net/http"

	httptransport "github.com/go-kit/kit/transport/http"
	"github.com/gorilla/mux"
)

// NewHTTPServer ...
func NewHTTPServer(ctx context.Context, endpoints Endpoints) http.Handler {
	r := mux.NewRouter()

	getR := r.Methods(http.MethodGet).Subrouter()

	guideR := getR.PathPrefix("/guidelines").Subrouter()

	guideR.Path("/documents").Handler(httptransport.NewServer(
		endpoints.GetGuidelinesDocument,
		decodeGetGuidelinesDocumentRequest,
		encodeResponse,
	))

	guideR.Path("/documents/{filename}").Handler(httptransport.NewServer(
		endpoints.GetDocument,
		decodeGetDocumentRequest,
		encodeResponse,
	))

	return r
}
