//
//  PokemonColor.swift
//  Pokedex
//
//  Created by Ricardo J. González on 30/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

let POKEMON_TEAL = Color(red: 0, green: 0.831, blue: 0.6)

func typeColor(_ type: String) -> Color {
    switch type {
    case "grass":
        return POKEMON_TEAL
    case "poison":
        return Color.purple
    default:
        return Color.white
    }
}
