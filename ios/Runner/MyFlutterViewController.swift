//
//  MyFlutterViewController.swift
//  Runner
//
//  Created by renpengtian on 2023/10/20.
//

import UIKit

class MyFlutterViewController: UIViewController {
    private var flutterEngine: FlutterEngine!
    private var methodChannel: FlutterMethodChannel!
    private var pageName: String?
    
    init(pageName: String? = nil) {
      self.pageName = pageName
      super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        flutterEngine = EngineGroupManager.shared.createEngine()
        flutterEngine.run()
        // Do any additional setup after loading the view.
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)

            // Add the FlutterViewController as a child view controller
            addChild(flutterViewController)
            view.addSubview(flutterViewController.view)
            flutterViewController.view.frame = view.bounds
            flutterViewController.didMove(toParent: self)
        
        
        let channel = FlutterMethodChannel(name: "com.example.myapp/open_page", binaryMessenger: flutterViewController.binaryMessenger as! FlutterBinaryMessenger)
        
        channel.setMethodCallHandler { [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) in
              if call.method == "open_page" {
                // Handle the method call from Flutter here
                print("Received method call from Flutter: \(call.method)")
                if let pageName = call.arguments as? String {
                        // Create a new MyFlutterViewController with the page name
                    let newFlutterViewController = MyFlutterViewController(pageName: pageName)

                        // Present the new MyFlutterViewController
                    self?.navigationController?.pushViewController(newFlutterViewController, animated: true)
//                    self?.present(newFlutterViewController, animated: true, completion: nil)

                }
                result("Success")
              }
            }
        
        
        let registrar = flutterViewController
        let factory = NativeLabelPlatformViewFactory(messenger: registrar.binaryMessenger)
                registrar.registrar(forPlugin: "NativeLabelPlatformView")?.register(factory, withId: "com.example.myapp/text_view")

        
        let targetPageName = pageName ?? "page1"
        channel.invokeMethod("open_page", arguments: targetPageName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

