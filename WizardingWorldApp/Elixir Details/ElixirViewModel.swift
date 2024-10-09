//
//  ElixirViewModel.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import Foundation

class ElixirViewModel: ObservableObject {

    @Published var elixirsInfo: ElixirsEntity = ElixirsEntity()
    @Published var showAlert = false
    var errorMessage = ""
    init(id: String) {
        getData(id: id)
        }

    func getData(id: String) {
        guard let url = URL(string: "https://wizard-world-api.herokuapp.com/Elixirs/\(id)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let elixirsInfo = try JSONDecoder().decode(ElixirsEntity.self, from: data)
                DispatchQueue.main.async {
                    self.elixirsInfo = elixirsInfo
                }
            } catch {
                print(error)
                switch error {
                case NetworkError.serverError:
                    print("Error: Server error.")
                    self.errorMessage = "Error: Server error."
                case NetworkError.noInternet:
                    print("Error: No internet connection.")
                    self.errorMessage = "Error: No internet connection."
                case NetworkError.timeout:
                    print("Error: timeout.")
                    self.errorMessage = "Error: timeout."
                default:
                    print("An unknown error occurred.")
                    self.errorMessage = "An unknown error occurred."
                }
                self.showAlert = true
            }
        }
        task.resume()
    }
}
