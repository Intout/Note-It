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
    
    fileprivate lazy var addButton: UIBarButtonItem = {
        
        let button = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonPressed))
        
        button.tintColor = UIColor.white
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableViewHelper = TableViewHelper(tableView: self.tableView)
        
        tableViewHelper?.delegate = self
        viewModel.delegate = self
        
        viewModel.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI(){
        self.view.backgroundColor = .orange
        view.addSubview(containerView)
        //containerView.addSubview(titleTextLabel)
        containerView.addSubview(tableView)
        tableView.backgroundColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationItem.rightBarButtonItem = addButton
        
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

extension ViewController: ViewModelDelegate{
    func dataDidFetched(data: [NoteData]) {
        tableViewHelper?.setData(data: data)
    }
}

extension ViewController: TableViewHelperDelegate{
    func rowSelected(for id: UUID) {
        print(self.viewModel.getData(with: id))
        viewModel.requestNavigation(for: id)
    }
            
    @objc func addButtonPressed(){
        viewModel.requestNavigation(for: nil)
    }
            
}
