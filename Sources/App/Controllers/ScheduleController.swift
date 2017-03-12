//
//  ScheduleController.swift
//  Room
//
//  Created by Rodrigo Leite on 11/03/17.
//
//

import Foundation
import Vapor
import HTTP

final class ScheduleController {
    
    func addRoutes(droplet: Droplet) {
        droplet.get("schedule", handler: show)
        droplet.delete("schedule", handler: delete)
        droplet.put("schedule", handler: create)
        droplet.post("schedule", handler: update)
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
        return try Schedule.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request) throws -> ResponseRepresentable {
        let schedule: Schedule = try request.object()
        try schedule.delete()
        return JSON([:])
    }
    
    func update(_ request: Request) throws -> ResponseRepresentable {
        var schedule: Schedule = try request.object()
        try schedule.save()
        return schedule
    }
    
    func create(_ request:Request) throws -> ResponseRepresentable {
        var schedule: Schedule = try request.object()
        try schedule.save()
        return schedule
    }
    
}
