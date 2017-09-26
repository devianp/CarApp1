//
//  Models.swift
//  appStoreHack2
//
//  Created by Devian Patel on 15/05/2017.
//  Copyright © 2017 Devian Patel. All rights reserved.
//

import UIKit

class AppCategory: NSObject {
    var name: String?
    var apps: [App]?
    
    static func sampleAppCategories() -> [AppCategory] {
        // rename to 911
        let bestNewAppsCategory = AppCategory()
        bestNewAppsCategory.name = "911"
        
        // define an array of apps
        var apps = [App]()
        
        // logic
        
        let porsche8 = App()
        porsche8.name = "991.2 (2015-)"
        porsche8.category = "911"
        porsche8.imageName = "2"
        apps.append(porsche8)
        
        let porsche7 = App()
        porsche7.name = "991 (2012-2014)"
        porsche7.category = "911"
        porsche7.imageName = "2"
        apps.append(porsche7)
        
        let porsche6 = App()
        porsche6.name = "997 (2005-2011)"
        porsche6.category = "911"
        porsche6.imageName = "2"
        apps.append(porsche6)
        
        let porsche5 = App()
        porsche5.name = "996 (1999-2004)"
        porsche5.category = "911"
        porsche5.imageName = "2"

        apps.append(porsche5)
        
        let porsche4 = App()
        porsche4.name = "993 (1995-1998)"
        porsche4.category = "911"
        porsche4.imageName = "2"

        apps.append(porsche4)
        
        let porsche3 = App()
        porsche3.name = "964 (1989–1994)"
        porsche3.category = "911"
        porsche3.imageName = "2"

        apps.append(porsche3)
        
        let porsche2 = App()
        porsche2.name = "930 (1975-1989)"
        porsche2.category = "911"
        porsche2.imageName = "2"

        apps.append(porsche2)
        
        let porsche1 = App()
        porsche1.name = "911 (1963–1989)"
        porsche1.category = "911"
        porsche1.imageName = "2"
        apps.append(porsche1)

        bestNewAppsCategory.apps = apps

        
        // coudl be model view on top
        let bestNewGamesCategory = AppCategory()
        bestNewGamesCategory.name = "911"
        
        var bestNewGamesApps = [App]()
        
        
        let porsche8a = App()
        porsche8a.name = "991.2 (2015-)"
        porsche8a.category = "Games"
        porsche8a.imageName = "2"
        bestNewGamesApps.append(porsche8a)
        
        let porsche7a = App()
        porsche7a.name = "991 (2012-2014)"
        porsche7a.category = "Games"
        porsche7a.imageName = "2"
        bestNewGamesApps.append(porsche7a)
        
        let porsche6a = App()
        porsche6a.name = "997 (2005-2011)"
        porsche6a.category = "Games"
        porsche6a.imageName = "2"
        bestNewGamesApps.append(porsche6a)
        
        let porsche5a = App()
        porsche5a.name = "996 (1999-2004)"
        porsche5a.category = "Games"
        porsche5a.imageName = "2"
        bestNewGamesApps.append(porsche5a)
        
        let porsche4a = App()
        porsche4a.name = "993 (1995-1998)"
        porsche4a.category = "Games"
        porsche4a.imageName = "2"
        bestNewGamesApps.append(porsche4a)
        
        let porsche3a = App()
        porsche3a.name = "964 (1989–1994)"
        porsche3a.category = "Games"
        porsche3a.imageName = "2"
        bestNewGamesApps.append(porsche3a)
        
        let porsche2a = App()
        porsche2a.name = "930 (1975-1989)"
        porsche2a.category = "Games"
        porsche2a.imageName = "2"
        bestNewGamesApps.append(porsche2a)
        
        let porsche1a = App()
        porsche1a.name = "911 (1963–1989)"
        porsche1a.category = "Games"
        porsche1a.imageName = "2"
        bestNewGamesApps.append(porsche1a)
        
        
        
        bestNewGamesCategory.apps = bestNewGamesApps
        
        
        return [bestNewGamesCategory, bestNewAppsCategory]
        
    }
    
}


// what is an app: will be a car
class App: NSObject {
    var name: String?
    var id: NSNumber?
    var category: String?
    
    // test 1
    var imageName: String?
}

