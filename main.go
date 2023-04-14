package main

import (
	"github.com/spf13/pflag"
	"vr_api/config"
)

var (
	conf = pflag.StringP("config", "c", "", "config filepath")
)

func main() {
	pflag.Parse()

	// 初始化配置
	if err := config.Run(*conf); err != nil {
		panic(err)
	}

}
