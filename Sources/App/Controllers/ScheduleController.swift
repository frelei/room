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
    
    let droplet: Droplet
    
    init(droplet: Droplet) {
        self.droplet = droplet
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
        return try Schedule.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request, _ schedule: Schedule) throws -> ResponseRepresentable {
        try schedule.delete()
        return JSON([:])
    }
    
    func update(_ request: Request, _ schedule: Schedule) throws -> ResponseRepresentable {
        var updatedSchedule = schedule
        try updatedSchedule.save()
        return updatedSchedule
    }
    
    func create(_ request:Request, _ schedule: Schedule) throws -> ResponseRepresentable {
        var tempSchedule = schedule
        try tempSchedule.save()
        return tempSchedule
    }
    
}
