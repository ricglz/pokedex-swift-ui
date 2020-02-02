//
//  ContentView.swift
//  Pokedex
//
//  Created by Ricardo González Castillo on 1/25/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Pokédex").font(.largeTitle)
                .foregroundColor(.primary)
                .italic()
            PokemonScrollView()
        }.padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
