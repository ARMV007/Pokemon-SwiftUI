//
//  PokemonListViewModel.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//


import Combine
import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList = [PokemonViewModel]()
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPokemonList() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100")!
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonListResponse.self, decoder: JSONDecoder())
            .map { response in
                response.results.map { PokemonViewModel(pokemon: $0) }
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { [weak self] in
                self?.pokemonList = $0
            })
            .store(in: &cancellables)
    }
}
