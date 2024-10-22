//
//  PokemonListViewModelTests.swift
//  PokemonsTests
//
//  Created by Abhishek on 23/10/24.
//

import XCTest
import Combine
@testable import Pokemons

class PokemonListViewModelTests: XCTestCase {

    var viewModel: PokemonListViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUpWithError() throws {
        super.setUp()
        viewModel = PokemonListViewModel()
        cancellables = []
    }

    override func tearDownWithError() throws {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testInitialPokemonListIsEmpty() {
        XCTAssertTrue(viewModel.pokemonList.isEmpty, "Pokemon list should be empty initially.")
    }

    func testPokemonListFetch() {
        let expectation = XCTestExpectation(description: "Fetch Pokemon List")
        
        viewModel.$pokemonList
            .dropFirst()
            .sink { pokemons in
                if !pokemons.isEmpty {
                    XCTAssertGreaterThan(pokemons.count, 0, "The Pokemon list should not be empty after fetch.")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.fetchPokemonList()
        wait(for: [expectation], timeout: 10.0)
    }
}
