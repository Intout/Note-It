//
//  Data.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation

struct NoteData: Identifiable{
    var id = UUID()
    var title: String
    var subTitle: String
    var body: String
    var imageName: String
    var createdAt: String
    var updatedAt: String?
}
