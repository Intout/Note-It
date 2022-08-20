//
//  AppCoordinator.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    var parentCoordinator: Coordinator? {get set}
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController? {get set}
    
    func start()
}

class AppCoordinator: Coordinator{
    weak var parentCoordinator: Coordinator?
    
    var childCoordinators: [Coordinator] = []
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        goToNoteList()
    }
    
    func goToNoteList(){
        parentCoordinator = self
        let viewController = ViewController()
        print("Trying to push!")
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}