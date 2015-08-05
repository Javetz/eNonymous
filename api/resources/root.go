package resources

import (
	"github.com/emicklei/go-restful"
	"github.com/jagregory/halgo"
	"log"
)

type RootResource struct {
}

func (res RootResource) Register(container *restful.Container) {
	log.Println("registering route /api")

	ws := new(restful.WebService)
	ws.Path("/api")
	ws.Consumes(restful.MIME_JSON)
	ws.Produces(restful.MIME_JSON)

	ws.Route(ws.GET("/").To(res.getRoot).
		Doc("get the api entry point information").
		Operation("getroot"))

	container.Add(ws)
}

func (res RootResource) getRoot(req *restful.Request, resp *restful.Response) {
	log.Println("getting root api document")
	links := halgo.Links{}.
		Self("/api").
		Link("track", "/api/track")

	resp.WriteEntity(links)
}
