//
//  ViewController.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {
    var viewModel = ViewModel()
    private var tableViewHelper: TableViewHelper?
    
    fileprivate let containerView: UIView = {
       
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    
    fileprivate let titleTextLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.text = "Title"
        return label
        
    }()
    
    fileprivate let tableView: UITableView = {
       
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("View Loaded!")
        self.tableViewHelper = TableViewHelper(tableView: self.tableView)
        self.view.backgroundColor = .orange
        
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(containerView)
        //containerView.addSubview(titleTextLabel)
        containerView.addSubview(tableView)
        tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let navigationBarAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)
        ]
        
        navigationController?.navigationBar.largeTitleTextAttributes = navigationBarAttributes
        
        self.title = "Notes"
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        /*
        NSLayoutConstraint.activate([
            titleTextLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleTextLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20)
        ])
         */
        
    }


}

