import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
//    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      
      
      window = UIWindow(frame: UIScreen.main.bounds)

          // Create an instance of your custom view controller
          let flutterViewController = MyFlutterViewController()
          let navigationController = UINavigationController(rootViewController: flutterViewController)
          // Set the custom view controller as the root view controller of the window
          window?.rootViewController = navigationController
          window?.makeKeyAndVisible()

          return true
  }
}
