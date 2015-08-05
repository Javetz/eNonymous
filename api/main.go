package main

import (
	_ "github.com/denisenkom/go-mssqldb"
	"github.com/emicklei/go-restful"
	"github.com/emicklei/go-restful/swagger"
	"github.com/marchuanv/eNonymous/api/resources"
	resourcesv1 "github.com/marchuanv/eNonymous/api/resources/v1"
	"log"
	"net/http"
	"os"
)

func main() {
	// to see what happens in the package, uncomment the following
	restful.TraceLogger(log.New(os.Stdout, "[restful] ", log.LstdFlags|log.Lshortfile))

	wsContainer := restful.NewContainer()

	// Root
	var root = resources.RootResource{}
	root.Register(wsContainer)

	// lookups
	resourcesv1.EmploymentTypesResource{}.Register(wsContainer)
	resourcesv1.TagsResource{}.Register(wsContainer)

	// Optionally, you can install the Swagger Service which provides a nice Web UI on your REST API
	// You need to download the Swagger HTML5 assets and change the FilePath location in the config below.
	// Open http://localhost:8080/apidocs and enter http://localhost:8080/apidocs.json in the api input field.

	config := swagger.Config{
		WebServices:    wsContainer.RegisteredWebServices(), // you control what services are visible
		WebServicesUrl: "http://localhost:5555",
		ApiPath:        "/apidocs.json",

		// Optionally, specifiy where the UI is located
		SwaggerPath:     "/apidocs/",
		SwaggerFilePath: "./swagger-ui/dist"}
	swagger.RegisterSwaggerService(config, wsContainer)

	log.Printf("start listening on localhost:5555")
	server := &http.Server{Addr: ":5555", Handler: wsContainer}
	log.Fatal(server.ListenAndServe())
}
