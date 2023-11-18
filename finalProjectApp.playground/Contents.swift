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
    var ageUser: Int
    var heightUser: Double //inches
    var weightUser: Double  //pounds
    
    init(nameUser: String, emailUser: String, phoneUser: String, ageUser: Int, heightUser: Double, weightUser: Double) {
        self.nameUser = nameUser
        self.emailUser = emailUser
        self.phoneUser = phoneUser
        self.ageUser = ageUser
        self.heightUser = heightUser
        self.weightUser = weightUser
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
        print("\nWelcome back \(self.nameUser)!")
    }
    
    func calcBMI() -> Double {
        var calcBMI = (weightUser / (heightUser * heightUser) * 703).rounded(toPlaces: 1)
        return calcBMI
    }
    
    func disBMI() {
        let bmi = calcBMI()
        print("Your BMI is \(bmi)\n")
    }
    
}

let nameUserHard = "Jade Lennox"
let emailUserHard = "jlennox9610@gmail.com"
let phoneUserHard = "(608) 864-2506"

let userData = UserData(nameUser: nameUserHard, emailUser: emailUserHard, phoneUser: phoneUserHard, ageUser: 25, heightUser: 69, weightUser: 145)
userData.introMessage()
userData.signUp()
userData.login()
userData.disBMI()


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
                                            "grape jelly":[0, 13, 1, 0, 320, 20, 10, 30]]
    func nutritionAmounts(for foodName: String, amount: Double, unit: String) -> [Double]?  {
        if let foodInfo = foodDataDict[foodName] {
            if unit == "cups" {
                let conversionFactor = foodInfo[4]
                let amountInGrams = amount * conversionFactor
                let nutritionAmount: [Double] = [
                    (foodInfo[0] / conversionFactor) * amountInGrams,
                    (foodInfo[1] / conversionFactor) * amountInGrams,
                    (foodInfo[2] / conversionFactor) * amountInGrams,
                    (foodInfo[3] / conversionFactor) * amountInGrams
                ]
                return nutritionAmount
            } else if unit == "fluid ounces" {
                let conversionFactor = 8.0
                let amountInCups = amount / conversionFactor
                let cupsToGrams = foodInfo[4]
                let amountInGrams = amountInCups * cupsToGrams
                let nutritrionAmount: [Double] = [
                    (foodInfo[0] / cupsToGrams) * amountInGrams,
                    (foodInfo[1] / cupsToGrams) * amountInGrams,
                    (foodInfo[2] / cupsToGrams) * amountInGrams,
                    (foodInfo[3] / cupsToGrams) * amountInGrams
                ]
                return nutritrionAmount
            } else if  unit == "pounds"{
                let conversionFactor = foodInfo[5]
                let amountInCups = amount * conversionFactor
                let cupsToGrams = foodInfo[4]
                let amountInGrams = amountInCups * cupsToGrams
                let nutritionAmount: [Double] = [
                    (foodInfo[0] / cupsToGrams) * amountInGrams,
                    (foodInfo[1] / cupsToGrams) * amountInGrams,
                    (foodInfo[2] / cupsToGrams) * amountInGrams,
                    (foodInfo[3] / cupsToGrams) * amountInGrams
                ]
                return nutritionAmount
            } else if  unit == "teaspoons"{
                let conversionFactor = foodInfo[6]
                let amountInGrams = amount * conversionFactor
                let nutritionAmount: [Double] = [
                    foodInfo[0] * amountInGrams,
                    foodInfo[1] * amountInGrams,
                    foodInfo[2] * amountInGrams,
                    foodInfo[3] * amountInGrams
                ]
                return nutritionAmount
            } else if  unit == "tablespoons"{
                let conversionFactor = foodInfo[7]
                let amountInGrams = amount * conversionFactor
                let nutritionAmount: [Double] = [
                    foodInfo[0] * amountInGrams,
                    foodInfo[1] * amountInGrams,
                    foodInfo[2] * amountInGrams,
                    foodInfo[3] * amountInGrams
                ]
                return nutritionAmount
            }
        }
        return nil
    }
    
//    func calcTotalCalories(ingredients: [(String, Double, String)]) -> Double? {
//        var totalCalories = 0.0
//        for (foodName, amount, unit) in ingredients {
//            if let nutritionAmount = nutritionAmounts(for: foodName, amount: amount, unit: unit) {
//                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
//                totalCalories += calories
//            } else {
//                return nil
//            }
//        }
//        return totalCalories
//    }
    
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
    
//    func addEatenCaloriesFromFood(foodItems: [(String, Double, String)]) {
//        for (foodName, amount, unit) in foodItems {
//            if  let nutritionAmount = nutritionAmounts(for: foodName, amount: amount, unit: unit) {
//                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
//                calorieTrack.addEatenCalorieAmount(calories: calories)
//            }
//        }
//    }
    
    var weeklyFoodInputs: [String: DailyFoodInput] = [:]
    
    func addFoodToInput(day: String, foodItems: [(String, Double, String)]) {
        let dailyInput = DailyFoodInput(day: day, foodItems: foodItems)
        weeklyFoodInputs[day] = dailyInput
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
    
    func calcRemainingCals(forDay day: String) -> Double? {
        guard let dailyInput = weeklyFoodInputs[day]
        else {
            return nil
        }
        let totalCals = calcTotalCalories(forDay: day) ?? 0.0
        let eatenCals = dailyInput.foodItems.reduce(0.0) { result, foodItem in
            if let nutritionAmount = nutritionAmounts(for: foodItem.0, amount: foodItem.1, unit: foodItem.2) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                return result + calories
            } else {
                return result
            }
        }
        return totalCals - eatenCals
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
foodData.calorieTrack.setDayCalorieAmount(calories: 2000)

let itemName = "whole milk"
let amount = 16
let unit = "fluid ounces"

let mondayFood = [
    ("whole milk", 2, "cups"),
    ("peanut butter", 2.0, "tablespoons"),
    ("grape jelly", 2, "tablespoons")
]

//for (foodName, amount, unit) in mondayFood {
//    if let nutritionAmount = foodData.nutritionAmounts(for: foodName, amount: amount, unit: unit) {
//        let fat = nutritionAmount[0]
//        let carbs = nutritionAmount[1]
//        let fiber = nutritionAmount[2]
//        let protein = nutritionAmount[3]
//        print("Nutritional amounts for \(amount) \(unit) of \(itemName)")
//        print("Fat: \(fat) grams")
//        print("Carbs: \(carbs) grams")
//        print("Fiber: \(fiber) grams")
//        print("Protien: \(protein) grams")
//    } else {
//        print("Food not found in directory")
//    }
//    }

     
                   
foodData.addFoodToInput(day: "Monday", foodItems: mondayFood)
foodData.addEatenCalsFromFood(foodItems: mondayFood)

if let totCalMonday = foodData.calcTotalCalories(forDay: "Monday") {
    let calories = Int(round(totCalMonday))
    print("Total calories consumed on Monday: \(calories)")
}

if let remainingCalMonday = foodData.calcRemainingCals(forDay: "Monday") {
    let remainCal = Int(round(remainingCalMonday))
    print("Remainnig calories for Monday: \(remainCal)")
}
                   
//if let nutritionAmount = foodData.nutritionAmounts(for: itemName, amount: Double(amount), unit: unit) {
//    let fat = Int(round(nutritionAmount[0]))
//    let carbs = Int(round(nutritionAmount[1]))
//    let fiber = Int(round(nutritionAmount[2]))
//    let protein = Int(round(nutritionAmount[3]))
//    print("Adjusted nutrition for \(amount) \(unit) of \(itemName)")
//    print("Fat: \(fat) grams")
//    print("Carbs: \(carbs) grams")
//    print("Fiber: \(fiber) grams")
//    print("Protien: \(protein) grams")
//} else {
//    print("Food not found in directory")
//}

//foodData.addEatenCalsFromFood(foodName: itemName, amount: Double(amount), unit: unit)

if let calGoal = foodData.calorieTrack.setDayCalorieAmount(calories: 0) {
    let goal = Int(calGoal)
    print("\nCalorie Goal: \(goal) calories")
}


if let totalCalorie = foodData.calcTotalCalories(forDay: "Monday") {
    let calories = Int(round(totalCalorie))
    print("Total calories: \(calories) calories")
}
    
if let remainingCalories = foodData.calorieTrack.calcRemainingCalories() {
    var remainCal = Int(round(remainingCalories))
    print("Remainng calories: \(remainCal) calories")
}



