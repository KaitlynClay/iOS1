import UIKit

class Pruis {
    var model: String
    var color: String
    var packages: String
    var accessories: String
    
    init(model: String, color: String, packages: String, accessories: String) {
        self.model = model
        self.color = color
        self.packages = packages
        self.accessories = accessories
    }
    
    func optionDisplay() {
        print("Models: LE, LE AWD, XLE, XLE AWD, Limited, Limited AWD")
        print("\nColors: Cutting Edge, Guardian Grey, Midnight BLack Metallic, Supersonic Red, Wind Chill Pearl, Reservoir Blue")
        print("\nPackages: Toyota Safety Sense, Rain-sensing variable intermittent windshield wipers, Auto-dimming rearview mirror with Homelink")
        print("\nLeather seats, heated seats, Wireless phone charging, Fixed glass roof, Power liftback")
    }
    
    func carDisplay() {
        print("\n\nPreview of your customized Pruis:")
        print("Model: \(self.model)")
        print("Color: \(self.color)")
        print("Packages: \(self.packages)")
        print("Accesories: \(self.accessories)")

    }
}
let selectedModel = "XLE AWD"
let selecctedColor = "Reservoir Blue"
let selectedPackage = "Rain-sensing variable intermittent windshield wipers"
let selectedAccesories = "Wireless phone charging"
let prius = Pruis(model: selectedModel, color: selecctedColor, packages: selectedPackage, accessories: selectedAccesories)
prius.optionDisplay()
prius.carDisplay()
