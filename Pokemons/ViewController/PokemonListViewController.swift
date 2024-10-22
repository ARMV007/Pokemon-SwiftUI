//
//  PokemonListViewController.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//


import UIKit
import Combine
import SwiftUI
class PokemonListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView = UITableView()
    private let viewModel = PokemonListViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        bindViewModel()
        viewModel.fetchPokemonList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }


    private func setupView() {
        view.backgroundColor = UIColor.systemGroupedBackground
        title = "Pokémon List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func bindViewModel() {
        viewModel.$pokemonList
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as! PokemonTableViewCell
        let pokemonViewModel = viewModel.pokemonList[indexPath.row]
        cell.configure(with: pokemonViewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = viewModel.pokemonList[indexPath.row]
        let detailView = PokemonDetailView(pokemonViewModel: selectedPokemon)
        let detailVC = UIHostingController(rootView: detailView)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
