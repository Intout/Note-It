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
        
        private var dummyData: [NoteData] = [.init(title: "Grocery List", subTitle: "List for Bakery and Super Market", body: "Body", imageName: "Groceries", createdAt: "10/10/2022")]
        
        
        func getData() -> [NoteData]{
            return dummyData
        }
        
        func getData(with id: UUID) -> NoteData{
            return getData().first(where: {
                $0.id == id
            })!
        }
        
        func requestNavigation(for id: UUID?){
            
            if let id = id{
                appCoordinator?.goToNoteDetails(with: getData(with: id))
            } else {
                appCoordinator?.goToNoteDetails(with: nil)
            }
            
        }
        
        func viewDidLoad(){
            delegate?.dataDidFetched(data: getData())
        }
        
        func updateData(data: NoteData){
            let dataCondition = getData().firstIndex{
                $0.id == data.id
            }
            if dataCondition != nil{
                dummyData[dataCondition!] = data
            } else {
                dummyData.append(data)
            }
        }
        
    }
}
