//
//  InterFastAppApp.swift
//  InterFastApp
//
//  Created by Marc Boanas on 04/09/2021.
//

import SwiftUI

@main
struct InterFastAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
