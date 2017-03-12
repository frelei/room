import Vapor
import Foundation
import HTTP

final class RoomController {
    
    func addRoutes(droplet: Droplet) {
        droplet.get("room", handler: roomController.show)
        droplet.delete("room", handler: roomController.delete)
        droplet.put("room", handler: roomController.create)
        droplet.post("room", handler: roomController.update)
    }
    
    func show(_ request: Request) throws -> ResponseRepresentable {
       return try Room.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request) throws -> ResponseRepresentable {
        let room: Room = try request.object()
        try room.delete()
        return JSON([:])
    }
    
    func update(_ request: Request) throws -> ResponseRepresentable {
        var room: Room = try request.object()
        try room.save()
        return room
    }
    
    func create(_ request:Request) throws -> ResponseRepresentable {
        var room: Room = try request.object()
        try room.save()
        return room
    }
    
}
