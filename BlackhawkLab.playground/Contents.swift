import UIKit

//player number: [country, height, month, age]
var playerDict = [15: ["USA", "June", "25"], 89: ["CAN", "August", "29"], 43: ["USA", "March", "30"], 28: ["CAN", "January", "20"], 16: ["CAN", "July", "28"], 8: ["USA", "April", "27"], 58: ["CAN", "July", "24"], 17: ["USA", "October", "29"], 37.1: ["USA", "February", "29"], 70: ["USA", "April", "24"], 71.1: ["CAN", "November", "31"], 86: ["USA", "February", "24"], 78: ["USA", "May", "19"], 90: ["USA", "July", "33"], 52: ["CAN", "July", "25"], 14: ["CAN", "June", "25"], 23: ["CHE", "October", "23"], 37.2: ["CAN", "April", "19"], 25.1: ["CAN", "June", "21"], 94: ["CAN", "May", "38"], 39: ["CAN", "November", "27"], 11: ["CAN", "February", "25"], 27: ["DEU", "May", "21"], 67: ["CAN", "March", "19"], 62: ["CAN", "February", "27"], 71.2: ["CZE", "May", "22"], 42: ["CAN", "April", "20"], 46: ["CAN", "May", "22"], 38: ["CAN", "January", "20"], 4: ["USA", "October", "28"], 44: ["USA", "July", "21"], 55: ["CAN", "July", "19"], 5: ["USA", "March", "30"], 41: ["CAN", "September", "21"], 48: ["SWE", "January", "24"], 25.2: ["USA", "February", "31"], 72: ["USA", "June", "22"], 22: ["RUS", "October", "31"], 34: ["CZE", "February", "31"], 40: ["SWE", "August", "24"], 30: ["USA", "April", "24"]]

var heightInArray = [72, 74, 69, 76, 74, 72, 75, 72, 70, 69, 73, 74, 73, 68, 73, 74, 72, 71, 70, 75, 70, 75, 70, 75, 72, 70, 69, 75, 74, 72, 76, 76, 72, 73, 76, 75, 76, 78, 78, 74, 74, 75, 75]
var monthDict = ["January": 0, "February": 0, "March": 0, "April": 0, "May": 0, "June": 0, "July": 0, "August": 0, "September": 0, "October": 0, "Novemeber": 0, "December": 0]
var playerAgeArray: [(Double, String)] = []
var playerNationArray: [(Double, String)] = []
var numPlayers = 0
var totalAge = 0
var intAge = 0
var totHeight = 0
var avHeight = 0

for (playerNumber, playerage) in playerDict {
    if let age = playerage[2] as? String {
        numPlayers += 1
        intAge = Int(age)!
        totalAge += intAge
        playerAgeArray.append((playerNumber, age))
    }
}
var avAge = totalAge / numPlayers

// Sort the array based on the age
playerAgeArray.sort { $0.1 < $1.1 }
// Print the sorted player information
for (playerNumber, age) in playerAgeArray {
    print("Player \(playerNumber) is \(age) years old.")
}
print("\n")

for (playerNumber, playernation) in playerDict {
    if let nation = playernation[0] as? String {
        playerNationArray.append((playerNumber, nation))
    }
}
// Sort the array based on country of origin
playerNationArray.sort { $0.1 < $1.1 }
// Print the sorted player information
for (playerNumber, nation) in playerNationArray {
    print("Player \(playerNumber) is from \(nation).")
}
print("")
// average age of hte players
print("The average age of the players in \(avAge)")
print("")
// finding which month most of the players were born in
for (_, playerInfo) in playerDict {
    if let month = playerInfo[1] as? String {
        if let count = monthDict[month]{
            monthDict[month] = count + 1
        }
    }
}
if let maxCount = monthDict.values.max(){
    for (month, count) in monthDict{
        if count == maxCount{
            print("\(count) of the \(numPlayers) players were born in \(month).")
        }
    }
}
print("")
// finding average height in inches
for (x) in heightInArray{
    if let height = x as? Int{
        totHeight += height
    }
}
if numPlayers > 0 {
    avHeight = totHeight / numPlayers
    print("The average height of the players is \(avHeight) inches tall.")
}
