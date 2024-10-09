//
//  WizardingWorldAppApp.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import SwiftUI

@main
struct WizardingWorldAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WizardsViewModel())
        }
    }
}
