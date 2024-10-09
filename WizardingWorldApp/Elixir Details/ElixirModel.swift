//
//  ElixirModel.swift
//  WizardingWorldApp
//
//  Created by Suhaib Al Azzeh on 08/10/2024.
//

import Foundation

// MARK: - ElixirsEntity
struct ElixirsEntity: Codable {
    var id, name, effect: String?
    var sideEffects: String?
    var characteristics: String?
    var time: String?
    var difficulty: String?
    var ingredients: [Ingredient]?
    var inventors: [Inventor]?
    var manufacturer: String?
}

// MARK: - Ingredient
struct Ingredient: Codable {
    var id, name: String?
}

// MARK: - Inventor
struct Inventor: Codable {
    var id, firstName, lastName: String?
}
