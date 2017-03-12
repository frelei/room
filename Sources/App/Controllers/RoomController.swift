import Vapor
import Foundation
import HTTP

final class RoomController {
    
    let droplet: Droplet
    
    init(droplet: Droplet) {
        self.droplet = droplet
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
       return try Room.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request) throws -> ResponseRepresentable {
//        try room.delete()
        return JSON([:])
    }
    
    func update(_ request: Request) throws -> ResponseRepresentable {
//        var updatedRoom = room
//        try updatedRoom.save()
//        return updatedRoom
        return ""
    }
    
    func create(_ request:Request) throws -> ResponseRepresentable {
//        var tempRoom = room
//        try tempRoom.save()
//        return room
        return ""
    }
    
}
