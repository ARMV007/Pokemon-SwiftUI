//
//  Pokemon.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//


struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokemonListResponse: Decodable {
    let results: [Pokemon]
}
