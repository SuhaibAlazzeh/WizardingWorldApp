//
//  ElixirDetailsView.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import SwiftUI

struct ElixirDetailsView: View {
    @StateObject var viewModel: ElixirViewModel
    var item: Elixir
    var body: some View {
        VStack(spacing: 15) {
            ElixirsView(name: item.name ?? "")
            Divider()
            ElixirDetailsCards(name: viewModel.elixirsInfo.name ?? "",
                               effect: viewModel.elixirsInfo.effect ?? "",
                               sideEffects: viewModel.elixirsInfo.sideEffects ?? "",
                               characteristics: viewModel.elixirsInfo.characteristics ?? "",
                               time: viewModel.elixirsInfo.time ?? "",
                               difficulty: viewModel.elixirsInfo.difficulty ?? "",
                               ingredients: viewModel.elixirsInfo.ingredients ?? [],
                               inventors: viewModel.elixirsInfo.inventors ?? [],
                               manufacturer: viewModel.elixirsInfo.manufacturer ?? "")
            Spacer()
        }
        
        .onAppear{
            viewModel.getData(id: item.id ?? "")
        }
        .alert("\(viewModel.errorMessage)", isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

struct ElixirDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ElixirDetailsView(viewModel: ElixirViewModel(id: ""), item: Elixir())
    }
}

struct ElixirDetailsCards: View {
    var name: String
    var effect: String
    var sideEffects: String
    var characteristics: String
    var time: String
    var difficulty: String
    var ingredients: [Ingredient]
    var inventors: [Inventor]
    var manufacturer: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Name: \(name)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))

            Text("Effect: \(effect)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
            
            Text("Side Effects: \(sideEffects)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
            
            Text("Characteristics: \(characteristics)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
            
            Text("Time: \(time)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
            
            Text("Difficulty: \(difficulty)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
            
            ForEach(ingredients, id: \.id){ item in
                Text("Ingredients: ")
                ElixirsView(name: item.name ?? "")
            }
            
            ForEach(inventors, id: \.id){ item in
                Text("Inventors: ")
                CardView(firstName: item.firstName ?? "",
                         lastName: item.lastName ?? "")
            }
            
            Text("Manufacturer: \(manufacturer)")
                .font(.headline)
                .fontWeight(.black)
                .foregroundStyle(Color(.black))
        }.padding(2)
    }
}
