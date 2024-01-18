import UIKit

class Bday64Calc {
    
    var curYear: Int
    var birthYear: Int
    
    init(curYear: Int, birthYear: Int) {
        self.curYear = curYear
        self.birthYear = birthYear
    }
    
    func calc64BDay() -> Int {
        let age64 = 64
        let yearOf64 = birthYear + age64
        return yearOf64
    }
}

let curYear = 2024
let birthYear = 2003
let birthdayCalc = Bday64Calc(curYear: curYear, birthYear: birthYear)

let yearof64 = birthdayCalc.calc64BDay()
print("The year of my 64th birthday will be in \(yearof64)")
    
