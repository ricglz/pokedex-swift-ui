//
//  NetworkingManager.swift
//  Pokedex
//
//  Created by Ricardo J. González on 01/02/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class NetworkingManager: ObservableObject {
    init() {
        fetchPokemon()
    }

    @Published var pkMatrix: [[Pokemon]] = pokemonArray.chunked(into: 2)

    private func fetchPokemon() {
        apollo.fetch(query: GetPokemonQuery()) { result in
            switch result {
                case .success(let graphQLResult):
                    if let pokemons = graphQLResult.data?.pokemons {
                        self.pkMatrix = pokemons.map { (pokemonGraphql) -> Pokemon in
                            Pokemon((pokemonGraphql?.name)!,
                                    pokemonGraphql?.types as! [String],
                                    Int((pokemonGraphql?.number)!)!)
                        }.chunked(into: 2)
                    } else if let errors = graphQLResult.errors {
                        print(errors)
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
}
