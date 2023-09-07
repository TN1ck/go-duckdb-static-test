package main

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/marcboeker/go-duckdb"
)

func main() {
	// Connect to an in-memory DuckDB database
	db, err := sql.Open("duckdb", "")
	if err != nil {
		log.Fatalf("Failed to connect to DuckDB: %v", err)
	}
	defer db.Close()

	// Execute the SQL query
	rows, err := db.Query("SELECT 1 + 1")
	if err != nil {
		log.Fatalf("Failed to execute query: %v", err)
	}
	defer rows.Close()

	// Fetch and print the result
	for rows.Next() {
		var result int
		if err := rows.Scan(&result); err != nil {
			log.Fatalf("Failed to scan row: %v", err)
		}
		fmt.Println(result) // Should print 2
	}

	if err := rows.Err(); err != nil {
		log.Fatalf("Row error: %v", err)
	}
}
