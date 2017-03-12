//
//  Crudable.swift
//  Room
//
//  Created by Rodrigo Leite on 11/03/17.
//
//

import Foundation
import Vapor
import Fluent
import HTTP

protocol Crudable {}

extension Crudable {
    
    func delete<T:Model>(_ request: Request, _ model: T) throws -> ResponseRepresentable {
        try model.delete()
        return JSON([:])
    }
    
    func update<T:Model>(_ request: Request, _ model: T) throws -> ResponseRepresentable {
        var updated = model
        try updated.save()
        return updated
    }
    
    func create<T:Model>(_ request:Request, _ model: T) throws -> ResponseRepresentable {
        var new = model
        try new.save()
        return new
    }
    
}
