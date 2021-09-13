//
//  ProfileView.swift
//  InterFastApp
//
//  Created by Marc Boanas on 04/09/2021.
//

import SwiftUI

struct ProfileView<ContentProvider>: View where ContentProvider: ProfileContentProviderProtocol {
    
    @ObservedObject private var provider: ContentProvider
    
    init(
        provider: ContentProvider = DIContainer.shared.resolve(type: ContentProvider.self)!
    ) {
        self.provider = provider
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    provider.headerView
                }
            }
            .navigationBarTitle("Profile View")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileView<ProfileContentProvider<PreferenceStore>>()
    }
}
