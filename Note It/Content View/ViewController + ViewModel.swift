//
//  ViewController + ViewModel.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation
import RealmSwift

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
        
        func getData(with id: UUID) -> NoteData?{
            
            do{
                var currentData = try Realm().objects(NoteDataObject.self).first(where: {$0.id == id})
                return .init(id: currentData!.id,title: currentData!.title, subTitle: currentData!.subtitle, body: currentData!.body, imageName: currentData!.imagName, createdAt: currentData!.createdAt, updatedAt: currentData!.updatedAt)
            } catch{
                print("Error!")
            }
        return nil
        }
        
        func requestNavigation(for id: UUID?){
            
            if let id = id{
                appCoordinator?.goToNoteDetails(with: getData(with: id))
            } else {
                appCoordinator?.goToNoteDetails(with: nil)
            }
            
        }
        
        func viewDidLoad(){
            do{
                let data: [NoteDataObject] = try Array(Realm().objects(NoteDataObject.self))
                delegate?.dataDidFetched(data: data.map{
                    NoteData(id: $0.id, title: $0.title, subTitle: $0.subtitle, body: $0.body, imageName: $0.imagName, createdAt: $0.createdAt, updatedAt: $0.updatedAt)
                })
            } catch {
                print("No data")
            }
        }
        
        func updateData(data: NoteData){
            do{
                if let item = try Realm().objects(NoteDataObject.self).first(where: { $0.id == data.id }){
                    try Realm().write{
                        item.imagName = data.imageName
                        item.title = data.title
                        item.subtitle = data.subTitle
                        item.body = data.body
                        item.updatedAt = data.updatedAt!
                    }
                } else {
                    let realm = try! Realm()
                    try! realm.write{
                        realm.add(data.managedObject())
                    }
                }
            } catch {
                print("Error!")
            }
            
        }
        
    }
}
