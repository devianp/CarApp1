
import UIKit

@UIApplicationMain final class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        let layout = UICollectionViewFlowLayout()
        let featuredCarsController = FeaturedCarsController(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: featuredCarsController)

        window?.makeKeyAndVisible()

        return true
    }
}
