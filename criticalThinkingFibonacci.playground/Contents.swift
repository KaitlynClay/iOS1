import UIKit

func clockRun(closure: ((Int, Int, Int, String) -> Void)?) {
    var seconds = 58
    var minutes = 59
    var hours = 9
    var light = "am"
    
    while true {
        seconds += 1
        if seconds == 60 {
            seconds = 0
            minutes += 1
            if minutes == 60 {
                minutes = 0
                hours += 1
                if hours == 13 && light == "am"{
                    hours = 1
                    light = "pm"
                } else if hours == 13 && light == "pm"{
                    hours = 1
                    light = "am"
                }
            }
        }
        
        closure?(hours, minutes, seconds, light)
        
        print(String(format: "%.2d:%.2d:%.2d \(light)", hours, minutes, seconds))
        Thread.sleep(forTimeInterval: 1)
    }
}

let closure: ((Int, Int, Int, String) -> Void) = {hours, minutes, seconds, light in
    if hours == 7 && minutes == 0 && seconds == 1 && light == "am"{
        print("     Time to let the dogs out and feed them.")
    } else if hours == 8 && minutes == 30 && seconds == 1 && light == "am"{
        print("     Remember to feed the horses, cats, and chickens.")
    }else if hours == 12 && minutes == 0 && seconds == 1 && light == "am"{
        print("     Check to se if Dad needs lunch out in the field.")
    }else if hours == 2 && minutes == 0 && seconds == 1 && light == "pm"{
        print("     Let the horses out on the pasture.")
    }else if hours == 6 && minutes == 15 && seconds == 1 && light == "pm"{
        print("     Bring the horses back in and feed the dogs.")
    }else if hours == 10 && minutes == 0 && seconds == 1 && light == "pm"{
        print("     Start thinking about going to bed.")
    }
}

clockRun(closure: closure)
