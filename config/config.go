package config

type vars struct {
	DB_NAME     string `required:"true"`
	DB_USERNAME string `required:"true"`
	DB_PASSWORD string `required:"true"`
	DB_HOST     string `required:"true"`
	DB_PORT     string `required:"true"`
	SSL_MODE    string `required:"true"`
}

var Var vars
