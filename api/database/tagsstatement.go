package database

type TagsStatement struct {
}

func (stmt TagsStatement) GetSelectAll() string {
	return "SELECT * FROM eNonymous.dbo.Tag"
}

func (stmt TagsStatement) GetInsert() string {
	return ""
}

func (stmt TagsStatement) GetUpdate() string {
	return ""
}

func (stmt TagsStatement) GetDelete() string {
	return ""
}
