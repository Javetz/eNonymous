package v1

import (
	"errors"
	"github.com/emicklei/go-restful"
	"github.com/jagregory/halgo"
	"github.com/jmoiron/sqlx"
	"github.com/marchuanv/eNonymous/api/database"
	"log"
)

type EmploymentTypeDataModel struct {
	Id    int    `db:"Id"`
	Value string `db:"Value"`
}

type EmploymentTypeResourceModel struct {
	Links           halgo.Links
	EmploymentTypes []EmploymentTypeDataModel
}

type EmploymentTypesResource struct {
}

func (res EmploymentTypesResource) Register(container *restful.Container) {

	ws := new(restful.WebService)
	ws.Path("/api/lookups/employmenttypes")
	ws.Consumes(restful.MIME_JSON)
	ws.Produces(restful.MIME_JSON)

	ws.Route(ws.GET("/").To(res.getEmploymentTypes).
		Doc("get a list of available employment types").
		Operation("getEmploymentTypes"))

	container.Add(ws)
}

func (res EmploymentTypesResource) getEmploymentTypes(req *restful.Request, resp *restful.Response) {

	links := halgo.Links{}.
		Self("/api/lookups/employmenttypes").
		Link("root", "/api").
		Link("lookups", "/api/lookups")

	// go fetch our employmenttype data from the db

	empTypes := []EmploymentTypeDataModel{}
	stmt := database.EmploymentTypeStatement{}.GetSelectAll()
	db, err := sqlx.Connect("mssql", "server=localhost;user id=retroUser;password=Password")
	if err != nil {
		log.Fatal("Could not connect to the database, " + err.Error())
		return
	}

	defer db.Close()

	err = db.Select(&empTypes, stmt)
	if err != nil {
		resp.WriteError(500, errors.New("Error retrieving employment types from database, "+err.Error()))
		return
	}

	data := EmploymentTypeResourceModel{
		Links:           links,
		EmploymentTypes: empTypes,
	}
	resp.WriteEntity(data)
}
