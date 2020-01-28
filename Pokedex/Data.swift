//
//  Data.swift
//  Pokedex
//
//  Created by Ricardo González Castillo on 28/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import Foundation

let pokemonArray: [Pokemon] = load("sample_pokemon.json")

func load(_ filename: String) -> [Pokemon] {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else { fatalError("Couldn't find \(filename) in main bundle") }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode([Pokemon].self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \([Pokemon].self)\n\(error)")
    }
}
