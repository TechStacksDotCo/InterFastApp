//
//  AppDelegate.swift
//  InterFastApp
//
//  Created by Marc Boanas on 04/09/2021.
//

import Swift
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        registerDependencies()
        return true
    }
}

//MARK:- Dependency Injection
extension AppDelegate {
    typealias Provider = ProfileContentProvider<PreferenceStore>
    
    private func registerDependencies() {
        let container = DIContainer.shared
        container.register(type: PreferenceStore.self, component: PreferenceStore())
        container.register(type: PrivacyLevel.self, component: PrivacyLevel._public)
        
        
        container.register(type: Provider.self, component: Provider())
    }
}
