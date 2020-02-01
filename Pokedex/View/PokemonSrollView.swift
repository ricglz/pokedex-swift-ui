//
//  PokemonScrollView.swift
//  Pokedex
//
//  Created by Ricardo J. González on 31/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct PokemonScrollView: View {
    var chunkedPkArray: [[Pokemon]]
    
    var body: some View {
        ScrollView {
            ForEach(0..<chunkedPkArray.count) { index in
                HStack {
                    ForEach(self.chunkedPkArray[index]) { (pokemon) in
                        PokemonCard(pokemon: pokemon)
                    }
                }.frame(height: 150)
                    .padding(.bottom)
            }
        }.padding(.horizontal)
    }
}

struct PokemonScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonScrollView(chunkedPkArray: pokemonArray.chunked(into: 2))
    }
}
