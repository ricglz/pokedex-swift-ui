//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ricardo González Castillo on 28/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct Pokemon: Decodable, Identifiable, Hashable {
    enum PokemonType: String, Decodable, CaseIterable, Identifiable {
        var id: String { rawValue }

        case fire = "fire"
        case grass = "grass"
        case water = "water"
        case poison = "poison"
        case flying = "flying"
        case electric = "electric"
        case bug = "bug"
    }

    private var pokedexNumber: Int
    var name: String
    private var primaryType: PokemonType
    private var secondaryType: PokemonType?

    var id: Int { pokedexNumber }

    init(_ name: String,_ types: [String],_ number: Int) {
        self.name = name
        pokedexNumber = number
        primaryType = PokemonType(rawValue: types[0].lowercased())!
        secondaryType = types.count > 1 ?
            PokemonType(rawValue: types[1].lowercased()) :
            nil
    }

    func formattedNumber() -> String {
        String(format: "#%03d", arguments: [pokedexNumber])
    }

    func types() -> [PokemonType] {
        if secondaryType != nil {
            return [primaryType, secondaryType!]
        }
        return [primaryType]
    }

    func primaryColor() -> Color {
        typeColor(primaryType)
    }

    func secondaryColor() -> Color? {
        secondaryType == nil ? nil : typeColor(secondaryType)
    }
}
