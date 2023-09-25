import UIKit

var value = 1000

func fibMath(num: Int) -> Int{
    var num1 = 0
    var num2 = 1
    var numA = 0
    print(num1)
    print(num2)
    while num2 <= value {
        numA = num1
        num1 = num2
        num2 = numA + num2
        if num2 <= value {
            print(num2)
        }
    }
    return num1
}

fibMath(num: value)
