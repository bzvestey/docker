package main

import (
	"fmt"
	"net/http"
	"os"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello World!")
}

func main() {
	fmt.Println("Hello Gophers!")
	port := ":" + os.Getenv("PORT")
	http.HandleFunc("/", handler)
	fmt.Printf("\nApplication now listening on %v\n", port)
	http.ListenAndServe(port, nil)
}
