//
//  ViewController + ViewModel.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation

protocol ViewModelDelegate: AnyObject{
    func dataDidFetched(data: [NoteData])
}

extension ViewController{
    
    class ViewModel: ObservableObject{
        weak var appCoordinator: AppCoordinator?
        weak var delegate: ViewModelDelegate?
        
        private var dummyData: [NoteData] = [.init(title: "Grocery List", subTitle: "List for Bakery and Super Market", body: "Body", imageName: "square.and.arrow.up.circle", createdAt: "10/10/2022")]
        
        
        func getData() -> [NoteData]{
            return dummyData
        }
        
        func getData(with id: UUID) -> NoteData{
            return getData().first(where: {
                $0.id == id
            })!
        }
        
        func requestNavigation(for id: UUID){
            appCoordinator?.goToNoteDetails(with: getData(with: id))
        }
        
        func viewDidLoad(){
            delegate?.dataDidFetched(data: getData())
        }
        
        
    }
}
