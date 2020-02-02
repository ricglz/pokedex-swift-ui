//
//  PokemonScrollView.swift
//  Pokedex
//
//  Created by Ricardo J. González on 31/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct PokemonScrollView: View {
    @ObservedObject var network = NetworkingManager()

    var body: some View {
        ScrollView {
            if network.pkMatrix.isNotEmpty() {
                ForEach(network.pkMatrix, id: \.first!.id) { (array) in
                    HStack {
                        ForEach(array) { (pokemon) in
                            PokemonCard(pokemon: pokemon)
                        }
                    }.frame(height: 150).padding(.bottom)
                }
            }
        }
    }
}

struct PokemonScrollView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonScrollView()
    }
}
