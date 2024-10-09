//
//  ContentView.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: WizardsViewModel
    var body: some View {
        NavigationView {
            ScrollView(.vertical,showsIndicators: false) {
                    LazyVStack {
                        ForEach(viewModel.wizardsList, id: \.id) {item in
                            NavigationLink(destination: WizardDetailsView(item: item)) {
                                CardView(firstName: item.firstName ?? "",
                                         lastName: item.lastName ?? "")
                            }
                            .padding(6)
                            Divider()
                        }
                    }
                .padding(.vertical, 60)
            }
            .navigationBarTitle("Wizarding World")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        .onAppear{
            viewModel.getData()
        }
        .alert("\(viewModel.errorMessage)", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: WizardsViewModel())
    }
}

struct CardView: View {
    var firstName: String
    var lastName: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text(firstName)
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))

            Text(lastName)
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
        }.padding(2)
    }
}
