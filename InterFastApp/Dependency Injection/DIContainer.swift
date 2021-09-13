//
//  DIContainer.swift
//  InterFastApp
//
//  Created by Marc Boanas on 09/09/2021.
//

import Foundation

protocol DIContainerProtocol {
    func register<Component>(type: Component.Type, component: Component)
    func resolve<Component>(type: Component.Type) -> Component?
}

class DIContainer: DIContainerProtocol {
    static let shared = DIContainer()
    private init() {}
    var components: [String: Any] = [:]
    func register<Component>(type: Component.Type, component: Component) {
        components["\(type)"] = component
    }
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }
}
