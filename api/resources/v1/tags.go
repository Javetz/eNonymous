package v1

import (
	"errors"
	"github.com/emicklei/go-restful"
	"github.com/jagregory/halgo"
	"github.com/jmoiron/sqlx"
	"github.com/marchuanv/eNonymous/api/database"
	"log"
)


type TagDataModel struct {
	Id    int    `db:"Id"`
	Name string `db:"Name"`
}

type TagResourceModel struct {
	Links           halgo.Links
	Tags []TagDataModel
}

type TagsResource struct {
}

func (res TagsResource) Register(container *restful.Container) {

	ws := new(restful.WebService)
	ws.Path("/api/lookups/tags")
	ws.Consumes(restful.MIME_JSON)
	ws.Produces(restful.MIME_JSON)

	ws.Route(ws.GET("/").To(res.getTags).
		Doc("get a list of available tags").
		Operation("getTags"))

	container.Add(ws)
}


func (res TagsResource) getTags(req *restful.Request, resp *restful.Response) {

	links := halgo.Links{}.
		Self("/api/lookups/tags").
		Link("root", "/api").
		Link("lookups", "/api/lookups")

	// go fetch our employmenttype data from the db

	tags := []TagDataModel{}
	stmt := database.TagsStatement{}.GetSelectAll()
	db, err := sqlx.Connect("mssql", "server=d101983;user id=retroUser;password=Password")
	if err != nil {
		log.Fatal("Could not connect to the database, " + err.Error())
		return
	}

	defer db.Close()

	err = db.Select(&tags, stmt)
	if err != nil {
		resp.WriteError(500, errors.New("Error retrieving tags from database, "+err.Error()))
		return
	}

	data := TagResourceModel{
		Links:           links,
		Tags: tags,
	}
	resp.WriteEntity(data)
}