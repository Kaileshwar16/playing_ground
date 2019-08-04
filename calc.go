package main

import (
	"fmt"
	"sort"
)

func findMedian(nums []int) float64 {
	sort.Ints(nums)
	n := len(nums)
	mid := n / 2
	if n%2 == 0 {
		return float64(nums[mid-1]+nums[mid]) / 2
	}
	return float64(nums[mid])
}

func main() {
	numbers := []int{3, 5, 1, 2, 4}
	fmt.Println(findMedian(numbers)) // Output: 3
}
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733291
# Auto edit 1747733292
# Auto edit 1747733292
# Auto edit 1747733292
# Auto edit 1747733292
# Auto edit 1747733292
