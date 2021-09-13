//
//  PreferencesStore.swift
//  InterFastApp
//
//  Created by Marc Boanas on 09/09/2021.
//

import Foundation

protocol PreferencesStoreProtocol: ObservableObject {
    var profilePreference: PrivacyLevel { get set }
}

final class PreferenceStore: PreferencesStoreProtocol {
    @Published var profilePreference: PrivacyLevel = value(for: .profile, defaultValue: ._public) {
        didSet {
            set(value: profilePreference, for: .profile)
        }
    }
}

//MARK:- Methods for saving preferences to UserDefaults
extension PreferenceStore {
    
    private func set(value: PrivacyLevel, for key: PrivacySetting) {
        UserDefaults.standard.set(value.title, forKey: key.rawValue)
    }
    
    private static func value(for key: PrivacySetting, defaultValue: PrivacyLevel) -> PrivacyLevel {
        let value = UserDefaults.standard.string(forKey: key.rawValue) ?? ""
        return PrivacyLevel.from(string: value) ?? defaultValue
    }
    
    func resetPreferences() {
        let defaults = UserDefaults.standard
        PrivacySetting.allCases.forEach { setting in
            defaults.removeObject(forKey: setting.rawValue)
        }
    }
}
