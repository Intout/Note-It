//
//  NoteDetailsViewController + ViewModel.swift
//  Note It
//
//  Created by Mert Tecimen on 21.08.2022.
//

import Foundation

protocol NoteDetailsViewModelDelegate: AnyObject{
    func dataDidFetched(data: NoteData?)
}

extension NoteDetailsViewController{
    class ViewModel{
        weak var appCoordinator: AppCoordinator?
        weak var delegate: NoteDetailsViewModelDelegate?
        var data: NoteData?
        var selectedImage: String?
        
        func setData(data: NoteData?){
            
            if data == nil{
                selectedImage = "Appointments"
            } else {
                selectedImage = data?.imageName
            }
            self.data = data
        }
        
        func viewDidLoad(){
            delegate?.dataDidFetched(data: getData())
        }
        
        func getData() -> NoteData?{
            return data
        }
        
        func doneButtonEvent(title: String, subtitle: String, body: String){
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:MM"
            
            if data == nil{
                appCoordinator?.detailsDone(with: .init(title: title, subTitle: subtitle, body: body, imageName: selectedImage!, createdAt: dateFormatter.string(from: Date()), updatedAt: dateFormatter.string(from: Date())))
            } else {
                print(DateFormatter().string(from: Date()))
                data?.updatedAt = dateFormatter.string(from: Date())
                data?.imageName = selectedImage!
                data?.title = title
                data?.subTitle = subtitle
                data?.body = body
                appCoordinator?.detailsDone(with: data!)
            }
            
        }
        
    }
}
