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
        NavigationView {
            VStack(spacing: 15) {
                CardView(firstName: item.firstName ?? "",
                         lastName: item.lastName ?? "")
                Spacer()
                Divider()
                    Text("Elixirs:")
                        .font(.title.bold())
                    Spacer()
            ScrollView(.vertical,showsIndicators: false) {
                LazyVStack {
                    ForEach(item.elixirs ?? [], id: \.id) {item in
                        NavigationLink(destination: ElixirDetailsView(viewModel: ElixirViewModel(id: item.id ?? ""), item: item)) {
                        ElixirsView(name: item.name ?? "")
                        }
                        .padding(6)
                        Divider()
                    }
                }
            }
            }
            .navigationBarTitle("Wizard Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct WizardDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        WizardDetailsView(item: WizardsEntity())
    }
}

struct ElixirsView: View {
    var name: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(name)
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))

        }.padding(2)
    }
}
