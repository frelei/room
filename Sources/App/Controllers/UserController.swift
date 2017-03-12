//
//  UserController.swift
//  Room
//
//  Created by Rodrigo Leite on 11/03/17.
//
//

import Foundation
import Vapor
import HTTP

final class UserController {
    
    let droplet: Droplet
    
    init(droplet: Droplet) {
        self.droplet = droplet
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
        return try User.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request, _ user: User) throws -> ResponseRepresentable {
        try user.delete()
        return JSON([:])
    }
    
    func update(_ request: Request, _ user: User) throws -> ResponseRepresentable {
        var updatedUser = user
        try updatedUser.save()
        return updatedUser
    }
    
    func create(_ request:Request, _ user: User) throws -> ResponseRepresentable {
        var tempUser = user
        try tempUser.save()
        return tempUser
    }
    
}
