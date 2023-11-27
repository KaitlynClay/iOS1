import UIKit

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

struct DailyFoodInput {
    var day: String
    var foodItems: [(String, Double, String)]
}



class UserData{
    var nameUser: String
    var emailUser: String
    var phoneUser: String
    
    
    init(nameUser: String, emailUser: String, phoneUser: String, ageUser: Int, heightUser: Double, weightUser: Double) {
        self.nameUser = nameUser
        self.emailUser = emailUser
        self.phoneUser = phoneUser
    }
    
    func introMessage() {
        print("Welcome! \nPlease choose to log in or sign up.\n")
    }
    
    func signUp() {
        print("Thank you for creating an account!")
        print("Your name is \(self.nameUser)")
        print("Your number is \(self.phoneUser)")
        print("Your email is \(self.emailUser)")
    }
    
    func login() {
        print("\nWelcome back \(self.nameUser)!\n")
    }
    
    
}

let nameUserHard = "Jade Lennox"
let emailUserHard = "jlennox9610@gmail.com"
let phoneUserHard = "(608) 864-2506"

let userData = UserData(nameUser: nameUserHard, emailUser: emailUserHard, phoneUser: phoneUserHard, ageUser: 25, heightUser: 69, weightUser: 145)
userData.introMessage()
userData.signUp()
userData.login()


class FoodCalcs{
    // food name: fat, carbs, fiber, protein, grams/cup(or slice), grams/lb, grams/teaspoon, grams/tablesppon(in grams and cup measurements: exceptions(slices) bread, bacon, )
    // find calorie count: 1g fat = ~9cal; 1g carb = ~ 4cal; 1g fiber = ~ 2cal(negligible); 1g protien = ~ 4cal;
    var foodDataDict: [String: [Double]] = ["whole milk": [7.9, 12.8, 0, 7.9, 245, 16, 4.93, 14.8],
                                            "iceburg lettuce": [0.1, 1.6, 0.7, 0.5, 100, 0.625, 0.31, 0.93],
                                            "cheddar cheese": [37.4, 1.4, 0, 28.1, 132, 8.25, 4.12, 12.4],
                                            "white bread": [1, 14.7, 0.8, 2.7, 57, 3.56, 1.78, 5.35],
                                            "bacon": [3.6, 0.1, 0, 3.1, 8, 0.5, 0.25, 0.75],
                                            "green beans": [0.4, 9.9, 4, 2.4, 125, 7.81, 3.9, 11.7],
                                            "salted butter": [184.1, 0.1, 0, 1.9, 227, 14.18, 7.09, 21.26],
                                            "sweet pepper": [0.4, 9.4, 3.1, 1.5, 149, 9.31, 4.66, 13.98],
                                            "carrot": [0.3, 12.3, 3.6, 1.2, 128, 8, 4,12],
                                            "onion": [0.1, 3.8, 0.5, 0.3, 160, 10, 5, 15],
                                            "all purpose flour": [1.2, 95.4, 3.4, 12.9, 125, 7.81, 3.9, 11.7],
                                            "soy sauce": [0.1, 19.4, 2, 16, 237, 14.81, 7.41, 22.23],
                                            "mayonnaise": [159.3, 0, 0, 0, 240, 15, 7.5, 22.5],
                                            "ketchup": [0.7, 60.4, 0.7, 4.2, 240, 15, 7.5, 22.5],
                                            "olive oil": [216, 0, 0, 0, 218, 13.63, 6.81, 20.44],
                                            "canola oil": [218, 0, 0, 0, 219, 13.69, 6.85, 20.56],
                                            "worcesterchire": [0, 47.3, 0, 0, 245, 15.31, 7.65, 22.95],
                                            "peanut butter": [130, 50.5, 15.5, 64.7, 258, 16.13, 8.07, 24.21],
                                            "grape jelly":[0, 208, 16, 0, 320, 20, 10, 30]]

    

    
    func nutritionAmounts(for foodName: String, amount: Double, unit: String) -> [Double]? {
        if let foodInfo = foodDataDict[foodName] {
            let gramsPerUnit: Double
            
            switch unit {
            case "cups":
                gramsPerUnit = foodInfo[4]
            case "fluid ounces":
                gramsPerUnit = foodInfo[4] / 8.0
            case "pounds":
                gramsPerUnit = foodInfo[5] / 16.0
            case "teaspoon":
                gramsPerUnit = foodInfo[6]
            case "tablespoons":
                gramsPerUnit = foodInfo[7]
            default:
                gramsPerUnit = 1.0
            }
            
            
            let amountInGrams = amount * gramsPerUnit
            
            let nutritionAmount: [Double] = [
            (foodInfo[0] / foodInfo[4]) * amountInGrams,
            (foodInfo[1] / foodInfo[4]) * amountInGrams,
            (foodInfo[2] / foodInfo[4]) * amountInGrams,
            (foodInfo[3] / foodInfo[4]) * amountInGrams
            ]
            return nutritionAmount
        }
        return nil
    }
    
    

    
    struct CalorieTracker {
        var dayCalorieAmount: Double = 0.0
        var eatenCalorieAmount: Double = 0.0
        
        mutating func setDayCalorieAmount(calories: Double) -> Double? {
            dayCalorieAmount += calories
            return dayCalorieAmount
        }
        mutating func addEatenCalorieAmount(calories: Double) {
            eatenCalorieAmount += calories
        }
        mutating func calcRemainingCalories() -> Double? {
            return dayCalorieAmount - eatenCalorieAmount
        }
    }
    var calorieTrack = CalorieTracker()
    

    
    var weeklyFoodInputs: [String: DailyFoodInput] = [:]
    
    func addFoodToInput(day: String, foodItems: [(String, Double, String)]) {
        let dailyInput = DailyFoodInput(day: day, foodItems: foodItems)
        weeklyFoodInputs[day] = dailyInput
    }
    
    func setCalorieGoal(forDay day: String, calories: Double) {
            foodData.calorieTrack.setDayCalorieAmount(calories: calories)
        }

    func getCalorieGoal(forDay day: String) -> Double? {
        return foodData.calorieTrack.dayCalorieAmount
    }
    
    func calcTotalCalories(forDay day: String) -> Double? {
        guard let dailyInput = weeklyFoodInputs[day]
        else{
            return nil
        }
        var totalCals = 0.0
        for (foodName, amount, unit) in dailyInput.foodItems {
            if let nutritionAmount = nutritionAmounts(for: foodName, amount: amount, unit: unit) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                totalCals += calories
            } else {
                return nil
            }
        }
        return totalCals
    }
    
    func calcRemainingCals(forDay day: String, calorieGoal: Double) -> Double? {
        guard let dailyInput = weeklyFoodInputs[day]
        else {
            return nil
        }
        let eatenCals = dailyInput.foodItems.reduce(0.0) { result, foodItem in
            if let nutritionAmount = nutritionAmounts(for: foodItem.0, amount: foodItem.1, unit: foodItem.2) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                return result + calories
            } else {
                return result
            }
        }
        return max(0, calorieGoal - eatenCals)
    }
    
    func addEatenCalsFromFood(foodItems: [(String, Double, String)]) {
        for (foodName, amount, unit) in foodItems{
            if let nutritionAmount = nutritionAmounts(for: foodName, amount: amount, unit: unit) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                calorieTrack.addEatenCalorieAmount(calories: calories)
                print("Consumed \(Int(round(calories))) calories from \(amount) \(unit) of \(foodName)")
            }
        }
    }
}

let foodData = FoodCalcs()
let calorieGoalMonday: Double = 2000
let calorieGoalTuesday: Double = 2080
let calorieGoalWednesday: Double = 1900
let calorieGoalThursday: Double = 3000
let calorieGoalFriday: Double = 2230
let calorieGoalSaturday: Double = 2000
let calorieGoalSunday: Double = 1700


foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalMonday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalTuesday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalWednesday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalThursday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalFriday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalSaturday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalSunday)





let mondayFood = [
    ("peanut butter", 1, "cups"),
    ("salted butter", 2.0, "tablespoons"),
    ("ketchup", 2, "tablespoons")
]

let tuesdayFood = [
    ("whole milk", 1, "cups"),
    ("all purpose flour", 2.0, "tablespoons"),
    ("cheddar cheese", 1, "cups")
]

let wednesdayFood = [
    ("iceburg lettuce", 2, "cups"),
    ("carrot", 4.0, "tablespoons"),
    ("onion", 1, "tablespoons")
]

let thursdayFood = [
    ("sweet pepper", 2, "cups"),
    ("green beans", 1.0, "cups"),
    ("salted butter", 2, "tablespoons")
]

let fridayFood = [
    ("whole milk", 6, "tablespoons"),
    ("all purpose flour", 3.0, "cups"),
    ("olive oil", 2, "tablespoons")
]

let saturdayFood = [
    ("carrot", 1, "cups"),
    ("grape jelly", 4.0, "tablespoons"),
    ("cheddar cheese", 1, "cups")
]

let sundayFood = [
    ("peanut butter", 1.0, "cups"),
    ("all purpose flour", 4, "cups"),
    ("canola oil", 2, "tablespoons")
]


     
                   
foodData.addFoodToInput(day: "Monday", foodItems: mondayFood)
foodData.addEatenCalsFromFood(foodItems: mondayFood)
foodData.addFoodToInput(day: "Tuesday", foodItems: tuesdayFood)
foodData.addEatenCalsFromFood(foodItems: tuesdayFood)
foodData.addFoodToInput(day: "Wednesday", foodItems: wednesdayFood)
foodData.addEatenCalsFromFood(foodItems: wednesdayFood)
foodData.addFoodToInput(day: "Thursday", foodItems: thursdayFood)
foodData.addEatenCalsFromFood(foodItems: thursdayFood)
foodData.addFoodToInput(day: "Friday", foodItems: fridayFood)
foodData.addEatenCalsFromFood(foodItems: fridayFood)
foodData.addFoodToInput(day: "Saturday", foodItems: saturdayFood)
foodData.addEatenCalsFromFood(foodItems: saturdayFood)
foodData.addFoodToInput(day: "Sunday", foodItems: sundayFood)
foodData.addEatenCalsFromFood(foodItems: sundayFood)

if let totCalMonday = foodData.calcTotalCalories(forDay: "Monday") {
    let calories = Int(round(totCalMonday))
    print("\nTotal calories consumed on Monday: \(calories)")
}
if let remainingCalMonday = foodData.calcRemainingCals(forDay: "Monday", calorieGoal: calorieGoalMonday) {
    let remainCal = Int(round(remainingCalMonday))
    print("Remaining calories for Monday: \(remainCal)\n")
}


if let totCalTuesday = foodData.calcTotalCalories(forDay: "Tuesday") {
    let calories = Int(round(totCalTuesday))
    print("Total calories consumed on Tuesday: \(calories)")
}
if let remainingCalTuesday = foodData.calcRemainingCals(forDay: "Tuesday", calorieGoal: calorieGoalTuesday) {
    let remainCal = Int(round(remainingCalTuesday))
    print("Remaining calories for Tuesday: \(remainCal)\n")
}


if let totCalWednesday = foodData.calcTotalCalories(forDay: "Wednesday") {
    let calories = Int(round(totCalWednesday))
    print("Total calories consumed on Wednesday: \(calories)")
}
if let remainingCalWednesday = foodData.calcRemainingCals(forDay: "Wednesday", calorieGoal: calorieGoalWednesday) {
    let remainCal = Int(round(remainingCalWednesday))
    print("Remaining calories for Wednesday: \(remainCal)\n")
}


if let totCalThursday = foodData.calcTotalCalories(forDay: "Thursday") {
    let calories = Int(round(totCalThursday))
    print("Total calories consumed on Thursday: \(calories)")
}
if let remainingCalThursday = foodData.calcRemainingCals(forDay: "Thursday", calorieGoal: calorieGoalThursday) {
    let remainCal = Int(round(remainingCalThursday))
    print("Remaining calories for Thursday: \(remainCal)\n")
}


if let totCalFriday = foodData.calcTotalCalories(forDay: "Friday") {
    let calories = Int(round(totCalFriday))
    print("Total calories consumed on Friday: \(calories)")
}
if let remainingCalFriday = foodData.calcRemainingCals(forDay: "Friday", calorieGoal: calorieGoalFriday) {
    let remainCal = Int(round(remainingCalFriday))
    print("Remaining calories for Friday: \(remainCal)\n")
}


if let totCalSaturday = foodData.calcTotalCalories(forDay: "Saturday") {
    let calories = Int(round(totCalSaturday))
    print("Total calories for Saturday: \(calories)")
}
if let remainingCalSaturday = foodData.calcRemainingCals(forDay: "Saturday", calorieGoal: calorieGoalSaturday) {
    let remainCal = Int(round(remainingCalSaturday))
    print("Remaining calories consumed for Saturday: \(remainCal)\n")
}


if let totCalSunday = foodData.calcTotalCalories(forDay: "Sunday") {
    let calories = Int(round(totCalSunday))
    print("Total calories consumed on Sunday: \(calories)")
}
if let remainingCalSunday = foodData.calcRemainingCals(forDay: "Sunday", calorieGoal: calorieGoalSunday) {
    let remainCal = Int(round(remainingCalSunday))
    print("Remaining calories for Sunday: \(remainCal)")
}
                   




