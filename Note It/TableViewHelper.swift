//
//  TableViewHelper.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation
import UIKit


class TableViewHelper: NSObject{
    weak var tableView: UITableView?
    
    init(tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
    }
    
}

extension TableViewHelper: UITableViewDelegate{

}

extension TableViewHelper: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
