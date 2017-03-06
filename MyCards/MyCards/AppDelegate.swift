//
//  AppDelegate.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 16/10/16.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        configureWindow()
        return true
    }

    private func configureWindow() {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let cardsViewController = CardsViewController()
        window.backgroundColor = .white
        window.rootViewController = UINavigationController(rootViewController: cardsViewController)
        window.makeKeyAndVisible()
        self.window = window
    }
    
    
    
    
    
    private lazy var effectView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    
    
    
    

    func applicationDidEnterBackground(_ application: UIApplication) {
        effectView.frame = window?.bounds ?? .zero
        window?.addSubview(effectView)
    }

    
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        effectView.removeFromSuperview()
    }
    
    
    
    
    
}
