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
    
    func addRoutes(droplet: Droplet) {
        droplet.get("user", handler: show)
        droplet.delete("user", handler: delete)
        droplet.put("user", handler: create)
        droplet.post("user", handler: update)
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
        return try User.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request) throws -> ResponseRepresentable {
        let user: User = try request.object()
        try user.delete()
        return JSON([:])
    }
    
    func update(_ request: Request) throws -> ResponseRepresentable {
        var user: User = try request.object()
        try user.save()
        return user
    }
    
    func create(_ request:Request) throws -> ResponseRepresentable {
        var user: User = try request.object()
        try user.save()
        return user
    }
    
}
