//
//  PreferencesView.swift
//  InterFastApp
//
//  Created by Marc Boanas on 13/09/2021.
//

import SwiftUI

struct PreferencesView<Store>: View where Store: PreferencesStoreProtocol {
    
    @ObservedObject var store: Store
    
    init(store: Store = DIContainer.shared.resolve(type: Store.self)!) {
        self.store = store
    }
    
    var body: some View {
        VStack {
            PreferenceView(title: .profile, value: store.profilePreference) { value in
                store.profilePreference = value
            }
            Spacer()
        }
    }
}

struct PreferenceView: View {
    private let title: PrivacySetting
    private let value: PrivacyLevel
    private let onPreferenceUpdated: (PrivacyLevel) -> Void
    
    init(title: PrivacySetting, value: PrivacyLevel, onPreferenceUpdated: @escaping (PrivacyLevel) -> Void) {
        self.title = title
        self.value = value
        self.onPreferenceUpdated = onPreferenceUpdated
    }
    
    var body: some View {
        HStack {
            Text(title.rawValue).font(.body)
            Spacer()
            PreferenceMenu(title: value.title, onPreferenceUpdated: onPreferenceUpdated)
        }.padding()
    }
}

struct PreferenceMenu: View {
    @State var title: String
    private let onPreferenceUpdated: (PrivacyLevel) -> Void
    
    init(title: String, onPreferenceUpdated: @escaping (PrivacyLevel) -> Void) {
        _title = State<String>(initialValue: title)
        self.onPreferenceUpdated = onPreferenceUpdated
    }
    
    var body: some View {
        Menu(title) {
            Button(PrivacyLevel._public.title) {
                onPreferenceUpdated(PrivacyLevel._public)
                title = PrivacyLevel._public.title
            }
            Button(PrivacyLevel._private.title) {
                onPreferenceUpdated(PrivacyLevel._private)
                title = PrivacyLevel._private.title
            }
        }
    }
}

struct PreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesView(store: PreferenceStore())
    }
}
