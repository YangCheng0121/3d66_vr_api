package routers

import (
	"github.com/gin-gonic/gin"
	"net/http"
)

func InitRouter() *gin.Engine {
	router := gin.Default()

	router.StaticFS("/static", http.Dir("static"))

	return router
}
