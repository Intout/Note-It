//
//  Data.swift
//  Note It
//
//  Created by Mert Tecimen on 20.08.2022.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

struct NoteData: Identifiable{
    var id = UUID()
    var title: String
    var subTitle: String
    var body: String
    var imageName: String
    var createdAt: String
    var updatedAt: String?
}

extension NoteData: Persistable {
    public init(managedObject: NoteDataObject) {
        id = managedObject.id
        title = managedObject.title
        subTitle = managedObject.subtitle
        body = managedObject.body
        imageName = managedObject.imagName
        createdAt = managedObject.createdAt
        updatedAt = managedObject.updatedAt
    }
    public func managedObject() -> NoteDataObject {
        let noteData = NoteDataObject()
        noteData.id = id
        noteData.title = title
        noteData.subtitle = subTitle
        noteData.body = body
        noteData.imagName = imageName
        noteData.createdAt = createdAt
        noteData.updatedAt = updatedAt!
        return noteData
    }
}

@objcMembers class NoteDataObject: Object{
    dynamic var id = UUID()
    dynamic var title = ""
    dynamic var subtitle = ""
    dynamic var body = ""
    dynamic var imagName = ""
    dynamic var createdAt = ""
    dynamic var updatedAt = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
}
