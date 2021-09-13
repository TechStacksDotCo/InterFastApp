//
//  ProfileContentProvider.swift
//  InterFastApp
//
//  Created by Marc Boanas on 04/09/2021.
//

import Swift
import SwiftUI
import Combine

protocol ProfileContentProviderProtocol: ObservableObject {
    var privacyLevel: PrivacyLevel { get }
    var headerView: AnyView { get }
}

final class ProfileContentProvider<Store>: ProfileContentProviderProtocol where Store: PreferencesStoreProtocol {
    
    let privacyLevel: PrivacyLevel
    
    private var store: Store
    private var cancellables = Set<AnyCancellable>()
    
    init(
        privacyLevel: PrivacyLevel = DIContainer.shared.resolve(type: PrivacyLevel.self)!,
        store: Store = DIContainer.shared.resolve(type: Store.self)!
    ) {
        self.privacyLevel = privacyLevel
        self.store = store
        
        store.objectWillChange.sink { _ in
            self.objectWillChange.send()
        }
        .store(in: &cancellables)
    }
    
    var headerView: AnyView {
        privacyLevel <= store.profilePreference ? AnyView(ProfileHeaderView()) : AnyView(PrivateView())
    }
}
