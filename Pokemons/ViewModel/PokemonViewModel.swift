//
//  PokemonViewModel.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//

import Foundation

struct PokemonViewModel {
    let pokemon: Pokemon
    
    var name: String {
        pokemon.name.capitalized
    }
    
    var url: String {
        pokemon.url
    }
    
    //For Demo 
    var description: String {
        "This Pokémon is known for its unique abilities and natural talents, making it a key part of any trainer’s team. Its special powers are linked to its type, and it often evolves into more powerful forms as it gains experience in battle. Whether defending its territory or forming bonds with its trainer, this Pokémon demonstrates loyalty, strength, and a deep connection to nature and the world around it."
    }
    
    var imageURL: URL? {
        URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonID).png")
    }
    
    private var pokemonID: String {
        let components = pokemon.url.split(separator: "/")
        return components.last.map { String($0) } ?? ""
    }
}
