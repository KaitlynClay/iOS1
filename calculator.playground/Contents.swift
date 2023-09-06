import UIKit

var a = 5
var b = 10
var c:Float = 15
var x = 3
var y:Float = 7
var z = 9

var addNums = 0
var subNums = 0
var multiNums = 0
var diviNums = 0
var percenNums = 0


addNums += b
addNums += z

subNums -= b

multiNums = (a * x) * z
multiNums *= b

diviNums = multiNums / x
diviNums /= x

percenNums = Int((y / c) * 100)
//percenNums *= 100

print("This is the total of what was added", addNums)
print("This it the total of what was subtracted", subNums)
print("This is the total of what was multiplied", multiNums)
print("This is the total of what was divided", diviNums)
print("This is the percentage", percenNums, "%")
