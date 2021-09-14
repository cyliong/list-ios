import UIKit
import RealmSwift
import Flutter
import FlutterPluginRegistrant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var flutterEngine = FlutterEngine(name: "list.engine")

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
        
        flutterEngine.run()
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        
        return true
    }

}

