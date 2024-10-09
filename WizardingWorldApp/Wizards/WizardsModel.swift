//
//  WizardsModel.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import Foundation

// MARK: - WizardsEntityElement
struct WizardsEntity: Codable {
    var elixirs: [Elixir]?
    var id: String?
    var firstName: String?
    var lastName: String?
}

// MARK: - Elixir
struct Elixir: Codable {
    var id, name: String?
}

enum NetworkError: Error {
    case noInternet
    case serverError
    case timeout
}
