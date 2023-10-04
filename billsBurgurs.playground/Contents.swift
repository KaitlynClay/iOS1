import UIKit

enum TypeBurger: String, CaseIterable {
    case classic = "Classic Cheeseburger"
    case cheese = "Plain Cheeseburger"
    case bacon = "Bacon Cheeseburger"
    case blt = "BLT Cheeseburger"
    case teriyake = "Teriyaki Cheeseburger"
}

enum SizeBurger: String, CaseIterable {
    case single = "Single"
    case doubled = "Double"
    case triple  = "Triple"
}

struct Burger {
    var type: TypeBurger
    var size: SizeBurger
    var price: Double
}

func priceBurger(burger: Burger) ->Double {
    var priceSize: Double = 0.0
    switch burger.size {
    case .single:
        priceSize = 6.0
    case .doubled:
        priceSize = 8.0
    case .triple:
        priceSize = 10.0
    }
    return burger.price + priceSize
}

func displayMenu() {
    print("Welcome to Bill's Gormet Burger Bistro")
    print("\nMenu: ")
    let selectedType = TypeBurger.blt
    let selectedSize = SizeBurger.single
    
    for type in TypeBurger.allCases {
        print("\(type.rawValue)")
    }

        print("\nSize options: ")
        for (index, size) in SizeBurger.allCases.enumerated() {
            print("\(index + 1). \(size.rawValue)")
        }
        
            let burger = Burger(type: selectedType, size: selectedSize, price: 0)
            let totalPrice = priceBurger(burger: burger)
            print("\nYou have selected a \(selectedSize.rawValue) \(selectedType.rawValue). Your total is $\(totalPrice). Enjoy your food!")
}

displayMenu()
