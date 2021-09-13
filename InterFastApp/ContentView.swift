//
//  ContentView.swift
//  InterFastApp
//
//  Created by Marc Boanas on 04/09/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ProfileView<ProfileContentProvider<PreferenceStore>>()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
