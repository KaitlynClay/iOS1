import UIKit

// func that specifies how many decimal places a number can have
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// for the multiple foods/day. Sets a format that the data passed has to follow
struct DailyFoodInput {
    var day: String
    var foodItems: [(String, Double, String)]
}


// class that has all the users more personel data
class UserData{
    // defining all the variables that will be used in the UserData class
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
    
    // message which would print out when a user first enters the app
    func introMessage() {
        print("Welcome! \nPlease choose to log in or sign up.\n")
    }
    
    // func for the user to create an account
    func signUp() {
        print("Thank you for creating an account!")
        print("Your name is \(self.nameUser)")
        print("Your number is \(self.phoneUser)")
        print("Your email is \(self.emailUser)")
    }
    
    // func for a returning user
    func login() {
        print("\nWelcome back \(self.nameUser)!\n")
    }
    
    // calculating the BMI of the user (uses lbs and height in inches)
    func calcBMI() -> Double {
        var calcBMI = (weightUser / (heightUser * heightUser) * 703).rounded(toPlaces: 1)
        return calcBMI
    }
    
    // func to format how the BMI will be displayed
    func disBMI() {
        let bmi = calcBMI()
        print("Your BMI is \(bmi)\n")
    }

    
    
}

// hardcoding the name, email, and phone of the user
let nameUserHard = "Jade Lennox"
let emailUserHard = "jlennox9610@gmail.com"
let phoneUserHard = "(608) 864-2506"

// passing the user data to the UserData class and defining what the values for the BMI calc will be
let userData = UserData(nameUser: nameUserHard, emailUser: emailUserHard, phoneUser: phoneUserHard, ageUser: 25, heightUser: 69, weightUser: 145)
// calls the welcom message to be printed
userData.introMessage()
// calls the sign up messages to be printed
userData.signUp()
// calls the welcome back user message
userData.login()
// calls the BMI calculation message
userData.disBMI()


// all the food data and manipulation
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

    

    // calculating the grams in each amount of the different hardcoded foods
    func nutritionAmounts(for foodName: String, amount: Double, unit: String) -> [Double]? {
        // seeing if the food the user entered is in the foodDataDict
        if let foodInfo = foodDataDict[foodName] {
            let gramsPerUnit: Double
            
            // calculating the measurments
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
            
            // calculating the nutrition amount of the food for the amount specified
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
    
    

    // keeps track of how many calories/day the user wants to consume
    struct CalorieTracker {
        // defining the calorie amounts variables
        var dayCalorieAmount: Double = 0.0
        var eatenCalorieAmount: Double = 0.0
        
        // setting the calorie goal amount for the corresponding day
        mutating func setDayCalorieAmount(calories: Double) -> Double? {
            dayCalorieAmount += calories
            return dayCalorieAmount
        }
        // adding the calories from the eaten food to the in-struct value
        mutating func addEatenCalorieAmount(calories: Double) {
            eatenCalorieAmount += calories
        }
        // calculating how many calories remain
        mutating func calcRemainingCalories() -> Double? {
            return dayCalorieAmount - eatenCalorieAmount
        }
    }
    // defining the CalorieTracker struct to be used outside the struct
    var calorieTrack = CalorieTracker()
    

    // defining a variable to hold the food inputs for the week
    var weeklyFoodInputs: [String: DailyFoodInput] = [:]
    
    // adding the inputted food from the user to be able to be manipulated
    func addFoodToInput(day: String, foodItems: [(String, Double, String)]) {
        let dailyInput = DailyFoodInput(day: day, foodItems: foodItems)
        weeklyFoodInputs[day] = dailyInput
    }
    
    // setting the calorie goal for the corresponding day
    func setCalorieGoal(forDay day: String, calories: Double) {
            foodData.calorieTrack.setDayCalorieAmount(calories: calories)
        }
    
    // getting the calorie goal from the func that set it
    func getCalorieGoal(forDay day: String) -> Double? {
        return foodData.calorieTrack.dayCalorieAmount
    }
    
    // calcing the total calories from the foods the user inputted
    func calcTotalCalories(forDay day: String) -> Double? {
        guard let dailyInput = weeklyFoodInputs[day]
        else{
            return nil
        }
        var totalCals = 0.0
        // finding/using the amounts from the foods to find the total calories consumed
        for (foodName, amount, unit) in dailyInput.foodItems {
            if let nutritionAmount = nutritionAmounts(for: foodName, amount: amount, unit: unit) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                totalCals += calories
            } else {
                return nil
            }
        }
        // returning the total calorie amount
        return totalCals
    }
    
    // finds the eaten calorie amount and returns how many calories are left
    func calcRemainingCals(forDay day: String, calorieGoal: Double) -> Double? {
        guard let dailyInput = weeklyFoodInputs[day]
        else {
            return nil
        }
        // finding the calorie amount that has been consumed
        let eatenCals = dailyInput.foodItems.reduce(0.0) { result, foodItem in
            if let nutritionAmount = nutritionAmounts(for: foodItem.0, amount: foodItem.1, unit: foodItem.2) {
                let calories = (nutritionAmount[0] * 9) + (nutritionAmount[1] * 4) + (nutritionAmount[3] * 4)
                return result + calories
            } else {
                return result
            }
        }
        // returning the number of calories left in the calorie goal and if the calories left is in the negatives it will return 0
        return max(0, calorieGoal - eatenCals)
    }
    
    // calcs and displays the calories from a specific amount of a food
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
// setting the calorie goals for each day of the week
let calorieGoalMonday: Double = 2000
let calorieGoalTuesday: Double = 2080
let calorieGoalWednesday: Double = 1900
let calorieGoalThursday: Double = 3000
let calorieGoalFriday: Double = 2230
let calorieGoalSaturday: Double = 2000
let calorieGoalSunday: Double = 1700


// sending the calorie goal amount to the func that will set it
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalMonday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalTuesday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalWednesday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalThursday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalFriday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalSaturday)
foodData.calorieTrack.setDayCalorieAmount(calories: calorieGoalSunday)




// hardcoding the foods for each day
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


     
// sending the food data to the addFoodToInput and the addEatenCalsFromFood to be able to be manipulated
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

// calling the finished calorie amounts for wach day of the week
// first is displaying the calorie goal for the day
// second is the amount eaten for the day
// third is the calories left in the goal
if let calGoal = Optional(calorieGoalMonday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Monday: \(calGoalInt)")
}
if let totCalMonday = foodData.calcTotalCalories(forDay: "Monday") {
    let calories = Int(round(totCalMonday))
    print("Total calories consumed on Monday: \(calories)")
}
if let remainingCalMonday = foodData.calcRemainingCals(forDay: "Monday", calorieGoal: calorieGoalMonday) {
    let remainCal = Int(round(remainingCalMonday))
    print("Remaining calories for Monday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalTuesday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Tuesday: \(calGoalInt)")
}
if let totCalTuesday = foodData.calcTotalCalories(forDay: "Tuesday") {
    let calories = Int(round(totCalTuesday))
    print("Total calories consumed on Tuesday: \(calories)")
}
if let remainingCalTuesday = foodData.calcRemainingCals(forDay: "Tuesday", calorieGoal: calorieGoalTuesday) {
    let remainCal = Int(round(remainingCalTuesday))
    print("Remaining calories for Tuesday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalWednesday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Wednesday: \(calGoalInt)")
}
if let totCalWednesday = foodData.calcTotalCalories(forDay: "Wednesday") {
    let calories = Int(round(totCalWednesday))
    print("Total calories consumed on Wednesday: \(calories)")
}
if let remainingCalWednesday = foodData.calcRemainingCals(forDay: "Wednesday", calorieGoal: calorieGoalWednesday) {
    let remainCal = Int(round(remainingCalWednesday))
    print("Remaining calories for Wednesday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalThursday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Thursday: \(calGoalInt)")
}
if let totCalThursday = foodData.calcTotalCalories(forDay: "Thursday") {
    let calories = Int(round(totCalThursday))
    print("Total calories consumed on Thursday: \(calories)")
}
if let remainingCalThursday = foodData.calcRemainingCals(forDay: "Thursday", calorieGoal: calorieGoalThursday) {
    let remainCal = Int(round(remainingCalThursday))
    print("Remaining calories for Thursday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalFriday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Friday: \(calGoalInt)")
}
if let totCalFriday = foodData.calcTotalCalories(forDay: "Friday") {
    let calories = Int(round(totCalFriday))
    print("Total calories consumed on Friday: \(calories)")
}
if let remainingCalFriday = foodData.calcRemainingCals(forDay: "Friday", calorieGoal: calorieGoalFriday) {
    let remainCal = Int(round(remainingCalFriday))
    print("Remaining calories for Friday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalSaturday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Saturday: \(calGoalInt)")
}
if let totCalSaturday = foodData.calcTotalCalories(forDay: "Saturday") {
    let calories = Int(round(totCalSaturday))
    print("Total calories for Saturday: \(calories)")
}
if let remainingCalSaturday = foodData.calcRemainingCals(forDay: "Saturday", calorieGoal: calorieGoalSaturday) {
    let remainCal = Int(round(remainingCalSaturday))
    print("Remaining calories consumed for Saturday: \(remainCal)\n")
}


if let calGoal = Optional(calorieGoalSunday) {
    let calGoalInt = Int(calGoal)
    print("\nCalorie goal for Sunday: \(calGoalInt)")
}
if let totCalSunday = foodData.calcTotalCalories(forDay: "Sunday") {
    let calories = Int(round(totCalSunday))
    print("Total calories consumed on Sunday: \(calories)")
}
if let remainingCalSunday = foodData.calcRemainingCals(forDay: "Sunday", calorieGoal: calorieGoalSunday) {
    let remainCal = Int(round(remainingCalSunday))
    print("Remaining calories for Sunday: \(remainCal)")
}
                   




