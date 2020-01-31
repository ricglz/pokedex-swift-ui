//
//  PokemonScrollView.swift
//  Pokedex
//
//  Created by Ricardo J. González on 31/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct PokemonScrollView: View {
    var pokemonArray: [Pokemon]
    
    var body: some View {
        ScrollView {
            ForEach(pokemonArray) { pokemon in
                HStack {
                    PokemonCard(pokemon: pokemon)
                }
            }
        }
    }
}

struct PokemonScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonScrollView(pokemonArray: pokemonArray)
    }
}
