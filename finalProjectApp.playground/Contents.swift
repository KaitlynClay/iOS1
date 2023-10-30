import UIKit


class UserData{
    var nameUser: String
    var emailUser: String
    var phoneUser: String
    
    init(nameUser: String, emailUser: String, phoneUser: String) {
        self.nameUser = nameUser
        self.emailUser = emailUser
        self.phoneUser = phoneUser
    }
    
    func introMessage() {
        print("Welcome!\n Please choose to log in or sign up.\n")
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
    
}

let nameUserHard = "Jade Lennox"
let emailUserHard = "jlennox9610@gmail.com"
let phoneUserHard = "(608) 864-2506"

let userData = UserData(nameUser: nameUserHard, emailUser: emailUserHard, phoneUser: phoneUserHard)
userData.introMessage()
userData.signUp()
userData.login()


class FoodCalcs{
    // food name: fat, carbs, fiber, protein (in grams and cup measurements: exceptions(slices) bread, bacon, )
    // find calorie count: 1g fat = ~9cal; 1g carb = ~ 4cal; 1g fiber = ~ 2cal(negligible); 1g protien = ~ 4cal;
    var foodDataDict: [String: [Double]] = ["whole milk": [7.9, 12.8, 0, 7.9],
                                            "iceburg lettuce": [0.1, 1.6, 0.7, 0.5],
                                            "cheddar cheese": [37.4, 1.4, 0, 28.1],
                                            "white bread": [1, 14.7, 0.8, 2.7],
                                            "bacon": [3.6, 0.1, 0, 3.1],
                                            "green beans": [0.4, 9.9, 4, 2.4],
                                            "salted butter": [184.1, 0.1, 0, 1.9],
                                            "sweet pepper": [0.4, 9.4, 3.1, 1.5],
                                            "carrot": [0.3, 12.3, 3.6, 1.2],
                                            "onion": [0.1, 3.8, 0.5, 0.3]]
}

let foodData = FoodCalcs()

