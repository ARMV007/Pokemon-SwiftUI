//
//  PokemonTableViewCellTests.swift
//  Pokemons
//
//  Created by Siri on 23/10/24.
//


import XCTest
import SDWebImage
@testable import Pokemons

class PokemonTableViewCellTests: XCTestCase {

    func testPokemonTableViewCellConfiguration() {
        let mockPokemon = Pokemon(name: "Charmander", url: "https://pokeapi.co/api/v2/pokemon/4/")
        let mockPokemonViewModel = PokemonViewModel(pokemon: mockPokemon)
        
        let cell = PokemonTableViewCell(style: .default, reuseIdentifier: "PokemonCell")
        cell.configure(with: mockPokemonViewModel)
        
        XCTAssertEqual(cell.nameLabel.text, "Charmander", "The name label should display the correct Pokémon name.")
        XCTAssertEqual(cell.idLabel.text, "ID: https://pokeapi.co/api/v2/pokemon/4/", "The ID label should display the correct Pokémon URL.")
        XCTAssertNotNil(cell.pokemonImageView.image, "The imageView should not be nil after configuration.")
    }
}
