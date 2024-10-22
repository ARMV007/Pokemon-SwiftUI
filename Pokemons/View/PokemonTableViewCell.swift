//
//  PokemonTableViewCell.swift
//  Pokemons
//
//  Created by Abhishek on 22/10/24.
//
import UIKit
import SDWebImage

class PokemonTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let idLabel = UILabel()
    let pokemonImageView = UIImageView()
    let cellContainerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        styleCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        cellContainerView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(cellContainerView)
        cellContainerView.addSubview(nameLabel)
        cellContainerView.addSubview(idLabel)
        cellContainerView.addSubview(pokemonImageView)

        NSLayoutConstraint.activate([
            cellContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellContainerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            pokemonImageView.leadingAnchor.constraint(equalTo: cellContainerView.leadingAnchor, constant: 16),
            pokemonImageView.centerYAnchor.constraint(equalTo: cellContainerView.centerYAnchor),
            pokemonImageView.widthAnchor.constraint(equalToConstant: 60),
            pokemonImageView.heightAnchor.constraint(equalToConstant: 60),

            nameLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: cellContainerView.topAnchor, constant: 16),

            idLabel.leadingAnchor.constraint(equalTo: pokemonImageView.trailingAnchor, constant: 16),
            idLabel.trailingAnchor.constraint(equalTo: cellContainerView.trailingAnchor, constant: -16),
            idLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            idLabel.bottomAnchor.constraint(lessThanOrEqualTo: cellContainerView.bottomAnchor, constant: -16)
        ])
    }

    private func styleCell() {
        pokemonImageView.layer.cornerRadius = 30
        pokemonImageView.clipsToBounds = true
        pokemonImageView.contentMode = .scaleAspectFill
        
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        idLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        idLabel.textColor = .gray
        
        cellContainerView.layer.cornerRadius = 12
        cellContainerView.layer.shadowColor = UIColor.black.cgColor
        cellContainerView.layer.shadowOpacity = 0.1
        cellContainerView.layer.shadowOffset = CGSize(width: 0, height: 2)
        cellContainerView.layer.shadowRadius = 4
        cellContainerView.backgroundColor = .white
    }

    func configure(with viewModel: PokemonViewModel) {
        nameLabel.text = viewModel.name
        idLabel.text = "ID: \(viewModel.url)"
        let placeholderImage = UIImage(named: "placeholder")
        pokemonImageView.sd_setImage(with: viewModel.imageURL, placeholderImage: placeholderImage)
    }
}
