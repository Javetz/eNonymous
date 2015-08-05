package database

type ModelStatement interface {
	GetSelectAll() string

	GetInsert() string
	GetUpdate() string
	GetDelete() string
}
