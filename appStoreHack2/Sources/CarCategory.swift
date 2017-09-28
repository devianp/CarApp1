
import UIKit

class CarCategory: NSObject {
    var name: String?
    var cars: [Car]?
    
    static func sampleCarCategories() -> [CarCategory] {
        // rename to 911
        let bestNewCarsCategory = CarCategory()
        bestNewCarsCategory.name = "911"
        
        // define an array of apps
        var cars = [Car]()
        
        // logic
        
        let porsche8 = Car()
        porsche8.name = "991.2 (2015-)"
        porsche8.category = "911"
        porsche8.imageName = "2"
        cars.append(porsche8)
        
        let porsche7 = Car()
        porsche7.name = "991 (2012-2014)"
        porsche7.category = "911"
        porsche7.imageName = "2"
        cars.append(porsche7)
        
        let porsche6 = Car()
        porsche6.name = "997 (2005-2011)"
        porsche6.category = "911"
        porsche6.imageName = "2"
        cars.append(porsche6)
        
        let porsche5 = Car()
        porsche5.name = "996 (1999-2004)"
        porsche5.category = "911"
        porsche5.imageName = "2"

        cars.append(porsche5)
        
        let porsche4 = Car()
        porsche4.name = "993 (1995-1998)"
        porsche4.category = "911"
        porsche4.imageName = "2"

        cars.append(porsche4)
        
        let porsche3 = Car()
        porsche3.name = "964 (1989–1994)"
        porsche3.category = "911"
        porsche3.imageName = "2"

        cars.append(porsche3)
        
        let porsche2 = Car()
        porsche2.name = "930 (1975-1989)"
        porsche2.category = "911"
        porsche2.imageName = "2"

        cars.append(porsche2)
        
        let porsche1 = Car()
        porsche1.name = "911 (1963–1989)"
        porsche1.category = "911"
        porsche1.imageName = "2"
        cars.append(porsche1)

        bestNewCarsCategory.cars = cars

        
        // coudl be model view on top
        let bestNewGamesCategory = CarCategory()
        bestNewGamesCategory.name = "911"
        
        var bestNewGamesCars = [Car]()
        
        
        let porsche8a = Car()
        porsche8a.name = "991.2 (2015-)"
        porsche8a.category = "Games"
        porsche8a.imageName = "2"
        bestNewGamesCars.append(porsche8a)
        
        let porsche7a = Car()
        porsche7a.name = "991 (2012-2014)"
        porsche7a.category = "Games"
        porsche7a.imageName = "2"
        bestNewGamesCars.append(porsche7a)
        
        let porsche6a = Car()
        porsche6a.name = "997 (2005-2011)"
        porsche6a.category = "Games"
        porsche6a.imageName = "2"
        bestNewGamesCars.append(porsche6a)
        
        let porsche5a = Car()
        porsche5a.name = "996 (1999-2004)"
        porsche5a.category = "Games"
        porsche5a.imageName = "2"
        bestNewGamesCars.append(porsche5a)
        
        let porsche4a = Car()
        porsche4a.name = "993 (1995-1998)"
        porsche4a.category = "Games"
        porsche4a.imageName = "2"
        bestNewGamesCars.append(porsche4a)
        
        let porsche3a = Car()
        porsche3a.name = "964 (1989–1994)"
        porsche3a.category = "Games"
        porsche3a.imageName = "2"
        bestNewGamesCars.append(porsche3a)
        
        let porsche2a = Car()
        porsche2a.name = "930 (1975-1989)"
        porsche2a.category = "Games"
        porsche2a.imageName = "2"
        bestNewGamesCars.append(porsche2a)
        
        let porsche1a = Car()
        porsche1a.name = "911 (1963–1989)"
        porsche1a.category = "Games"
        porsche1a.imageName = "2"
        bestNewGamesCars.append(porsche1a)
        
        
        
        bestNewGamesCategory.cars = bestNewGamesCars
        
        
        return [bestNewGamesCategory, bestNewCarsCategory]
        
    }
    
}
