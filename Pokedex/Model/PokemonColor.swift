//
//  PokemonColor.swift
//  Pokedex
//
//  Created by Ricardo J. González on 30/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

let POKEMON_TEAL = Color(red: 0, green: 0.831, blue: 0.6)
let POKEMON_RED = Color(red: 0.956, green: 0.361, blue: 0.361)
let POKEMON_SKY = Color(red: 0.52, green: 0.937, blue: 0.949)

func typeColor(_ type: Pokemon.PokemonType?) -> Color {
    switch type {
    case .grass:
        return POKEMON_TEAL
    case .poison:
        return .purple
    case .fire:
        return POKEMON_RED
    case .flying:
        return POKEMON_SKY
    case .bug:
        return Color.green
    case .water:
        return Color.blue
    default:
        return .white
    }
}

func typeTextColor(_ type: Pokemon.PokemonType?) -> Color {
    switch type {
    case .flying:
        return .black
    default:
        return .white
    }
}
