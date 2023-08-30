import UIKit

let hoursPerWeek = 168
var hoursSlept = 0
var hoursWorked = 0

print("Please tell us how many hours you worked and slept each day this week.")
//Sunday
hoursSlept += 6
hoursWorked += 0
//Monday
hoursSlept += 8
hoursWorked += 8
//Tuesday
hoursSlept += 7
hoursWorked += 8
//Wednesday
hoursSlept += 7
hoursWorked += 8
//Thursday
hoursSlept += 5
hoursWorked += 7
//Friday
hoursSlept += 8
hoursWorked += 8
//Saturday
hoursSlept += 11
hoursWorked += 0

var sleep = Double(hoursSlept) / Double(hoursPerWeek)
var work = Double(hoursWorked) / Double(hoursPerWeek)

print("You slept", sleep * 100, "percent of your week.")
print("You worked", work * 100, "percent of your week.")

