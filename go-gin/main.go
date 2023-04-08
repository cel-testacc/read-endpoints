package main

import (
  "database/sql"
  "fmt"
  "log"
  "os"
  "net/http"

  "github.com/gin-gonic/gin"
  "github.com/go-sql-driver/mysql"
)

type TitlesDB struct {
  ID int64
  Title string
  AuthorID int64
}

var db *sql.DB

func main() {
  cfg := mysql.Config {
    User: os.Getenv("DBUSER"),
    Passwd: os.Getenv("DBPASS"),
    Net: "tcp",
    Addr: "127.0.0.1:3306",
    DBName: os.Getenv("DBSQLENDPOINTS"),
  }

  var err error
  db, err = sql.Open("mysql", cfg.FormatDSN())
  if err != nil {
    log.Fatal(err)
  }

  pingErr := db.Ping()
  if pingErr != nil {
    log.Fatal(pingErr)
  }
  fmt.Println("Connected!")

  router := gin.Default()
  router.GET("/titles", getTitles)

  router.Run("localhost:8080")
}

func getTitles(c *gin.Context) {
  var titlesdb []TitlesDB

  rows, err := db.Query("SELECT * FROM titles")
  if err != nil {
    c.IndentedJSON(http.StatusNotFound, gin.H{"message": "error in retrieving titles list"})
  }
  defer rows.Close()

  for rows.Next() {
    var tcheck TitlesDB
    if err := rows.Scan(&tcheck.ID, &tcheck.Title, &tcheck.AuthorID); err != nil {
      c.IndentedJSON(http.StatusNotFound, gin.H{"message": "error in retrieving titles list"})
    }
    titlesdb = append(titlesdb, tcheck)
  }
  if err:= rows.Err(); err != nil {
    c.IndentedJSON(http.StatusNotFound, gin.H{"message": "error in retrieving titles list"})
  }
  c.IndentedJSON(http.StatusOK, titlesdb)
}
