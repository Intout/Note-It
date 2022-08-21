//
//  NoteDetailsViewController + ViewModel.swift
//  Note It
//
//  Created by Mert Tecimen on 21.08.2022.
//

import Foundation

extension NoteDetailsViewController{
    class ViewModel{
        weak var appCoordinator: AppCoordinator?
        var data: NoteData?
        
        func setData(data: NoteData?){
            self.data = data
        }
        
    }
}
