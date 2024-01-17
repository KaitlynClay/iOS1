import UIKit

let con1 = Int.random(in: 1...200)
let con2 = Int.random(in: 1...200)
let con3 = Int.random(in: 1...200)
let con4 = Int.random(in: 1...200)
let con5 = Int.random(in: 1...200)

var num1 = Int.random(in: 1...200)
var num2 = Int.random(in: 1...200)
var num3 = Int.random(in: 1...200)
var num4 = Int.random(in: 1...200)
var num5 = Int.random(in: 1...200)

var unOList = [Int]()
unOList.append(con1)
unOList.append(con2)
unOList.append(con3)
unOList.append(con4)
unOList.append(con5)

unOList.append(num1)
unOList.append(num2)
unOList.append(num3)
unOList.append(num4)
unOList.append(num5)

var numArray = unOList
numArray.sort()

print(numArray)

var numDict: [String: Int] = [:]
for (index, num) in numArray.enumerated() {
    let key = "variable\(index + 1)"
    numDict[key] = num
}

let dictminFind = numDict["variable1"]
let dictmaxFind = numDict["variable10"]

if let dictmax = dictmaxFind {
    print("Highest number: \(dictmax)")}
if let dictmin = dictminFind {
    print("Lowest number: \(dictmin)")}



