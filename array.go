package main

import "fmt"

func main() {
	fruits := []string{"apple", "banana", "cherry"}
	fruits = append(fruits, "orange")
	for _, fruit := range fruits {
		fmt.Println(fruit)
	}
}
