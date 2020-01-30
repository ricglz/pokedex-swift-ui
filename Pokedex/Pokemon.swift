//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ricardo González Castillo on 28/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct Pokemon: Decodable {
    enum PokemonType: String, Decodable, CaseIterable, Identifiable {
        var id: String { rawValue }

        case fire = "fire";
        case grass = "grass";
        case water = "water";
        case poison = "poison";
        case flying = "flying";
        case electric = "electric";
    }

    private var pokedexNumber: Int
    var name: String
    private var primaryType: PokemonType
    private var secondaryType: PokemonType?

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
        typeColor(primaryType.rawValue)
    }

    func secondaryColor() -> Color? {
        secondaryType == nil ? nil : typeColor(secondaryType!.rawValue)
    }
}
