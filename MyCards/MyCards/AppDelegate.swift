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
    
    
    
    
    
    
    
    

    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {

        guard

            validate(bundleID: options[.sourceApplication]) &&

            else { return false }

        return open(url)
    }

    
    
    
    
    
    
    
    private func validate(bundleID: Any?) -> Bool {
        
        guard let source = bundleID as? String else { return false }
        
        guard source.contains("io.swifting") else { return false }
        
        return true
    }
    
    
    
    
    
    
    
    

    private func open(_ url: URL) -> Bool {
        return true
    }

}
