//
//  AppDelegate.swift
//  RickAndMorty
//
//  Created by Ali Amanvermez on 28.12.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureWindow(destinationVC: RMTabViewController())
        return true
    }
    func configureWindow(destinationVC: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        window?.rootViewController = destinationVC
    }
}

