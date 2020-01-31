//
//  PokemonCard.swift
//  Pokedex
//
//  Created by Ricardo González Castillo on 28/01/20.
//  Copyright © 2020 Ricardo González Castillo. All rights reserved.
//

import SwiftUI

struct TypePill: View {
    var type: Pokemon.PokemonType
    var typeValue: String { type.rawValue }

    var body: some View {
        HStack {
            Text(typeValue.capitalized)
                .font(.footnote)
                .fontWeight(.semibold)
                .padding(.vertical, 3)
                .padding(.horizontal, 15)
                .foregroundColor(typeTextColor(type))
        }.background(typeColor(type))
            .contrast(1.25)
            .cornerRadius(20)
    }
}

struct TypeStack: View {
    var types: [Pokemon.PokemonType]

    var body: some View {
        VStack {
            ForEach(types, id: \.self) { (pokemonType) in
                TypePill(type: pokemonType).padding(.bottom)
            }
        }
    }
}

struct PokemonCard: View {
    var pokemon: Pokemon

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(pokemon.name).font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.top)
                Spacer()
                Text(pokemon.formattedNumber())
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding(.trailing)
                    .opacity(0.5)
            }.padding(.top)
            HStack {
                TypeStack(types: pokemon.types()).padding(.trailing)
                ZStack(alignment: .bottomTrailing) {
                    Image("pokeball").resizable().opacity(0.05)
                    Image(pokemon.name).resizable().frame(width: 100, height: 100)
                }.frame(width: 125, height: 125)
            }.padding(.bottom).padding(.horizontal)
        }.background(pokemon.primaryColor())
            .cornerRadius(15)
            .shadow(radius: 2.5)
            .frame(width: 265)
    }
}

struct PokemonCard_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCard(pokemon: pokemonArray[5])
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
