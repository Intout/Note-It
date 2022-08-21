//
//  NoteTableViewCell.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    private(set) lazy var containerView: UIView = {
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    fileprivate lazy var vStack: UIStackView = {
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 10
        return stackView
        
    }()
    
    private(set) lazy var titleLabel: UILabel = {
       
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private(set) lazy var editDateLabel: UILabel = {
       
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private(set) lazy var image: UIImageView = {
       
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white.withAlphaComponent(0.5)
        
        self.addSubview(containerView)
        containerView.addSubview(vStack)
        
        vStack.addArrangedSubview(titleLabel)
        vStack.addArrangedSubview(subtitleLabel)
        vStack.addArrangedSubview(editDateLabel)
        containerView.addSubview(image)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: image.leadingAnchor),
            vStack.topAnchor.constraint(equalTo: containerView.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            image.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            image.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            image.widthAnchor.constraint(equalTo: containerView.heightAnchor),
            image.heightAnchor.constraint(equalTo: containerView.heightAnchor),
        ])
        
    }

}
