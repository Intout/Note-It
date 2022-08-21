//
//  TableViewHelper.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation
import UIKit

protocol TableViewHelperDelegate: AnyObject{
    func rowSelected(for id: UUID)
}

class TableViewHelper: NSObject{
    weak var tableView: UITableView?
    weak var delegate: TableViewHelperDelegate?
    
    private var data: [NoteData] = []
    
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        registerCell()
    }
    
    private func registerCell(){
        tableView?.register(NoteTableViewCell.self, forCellReuseIdentifier: "noteTableViewCell")
    }
    
    func setData(data: [NoteData]){
        self.data = data
        DispatchQueue.main.async { [unowned self] in
            self.tableView?.reloadData()
        }
    }
    
}

extension TableViewHelper: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.rowSelected(for: data[indexPath.item].id)
    }
}

extension TableViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteTableViewCell", for: indexPath) as! NoteTableViewCell
        
        cell.titleLabel.text = data[indexPath.item].title
        cell.subtitleLabel.text = data[indexPath.item].subTitle
        cell.editDateLabel.text = data[indexPath.item].createdAt
        cell.image.image = UIImage(systemName: data[indexPath.item].imageName)
        
        
        return cell
    }
    
}
