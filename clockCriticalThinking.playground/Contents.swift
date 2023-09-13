import UIKit

func clockRun() {
    var seconds = 55
    var minutes = 59
    var hours = 12
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
        print(String(format: "%.2d:%.2d:%.2d \(light)", hours, minutes, seconds))
        Thread.sleep(forTimeInterval: 1)
    }
}

clockRun()
