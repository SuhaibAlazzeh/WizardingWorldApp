//
//  WizardDetailsView.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import SwiftUI

struct WizardDetailsView: View {
    var item: WizardsEntity
    var body: some View {
        VStack {
            CardView(firstName: item.firstName ?? "", lastName: item.lastName ?? "")
            Spacer()
        }
    }
}

struct WizardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WizardDetailsView()
    }
}
