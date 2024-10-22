//
//  PokemonDetailView.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//


import SwiftUI
import SDWebImageSwiftUI

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    let pokemonViewModel: PokemonViewModel

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all)
            
            VStack {
                WebImage(url: pokemonViewModel.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("pokemonImage")

                Text(pokemonViewModel.name)
                    .font(.system(size: 32, weight: .bold))
                    .padding()
                    .accessibilityIdentifier("pokemonName")

                Text(pokemonViewModel.description)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(20)
                    .accessibilityIdentifier("pokemonDescription")

                Spacer()
            }
        }
    }
}


#Preview {
    PokemonDetailView(
        pokemonViewModel: PokemonViewModel(
            pokemon: Pokemon(
                name: "bulbasaur",
                url: "https://pokeapi.co/api/v2/pokemon/1/"
            )
        )
    )
}
