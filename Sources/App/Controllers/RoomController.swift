import Vapor
import Foundation
import HTTP

final class RoomController {
    
    func show(_ request: Request) throws -> ResponseRepresentable {
       return try Room.all().makeNode().converted(to: JSON.self)
    }
    
    func delete(_ request: Request, _ room: Room) throws -> ResponseRepresentable {
        try room.delete()
        return JSON([:])
    }
    
    func update(_ request: Request, _ room: Room) throws -> ResponseRepresentable {
        var updatedRoom = room
        try updatedRoom.save()
        return updatedRoom
    }
    
    func create(_ request:Request, _ room: Room) throws -> ResponseRepresentable {
        var tempRoom = room
        try tempRoom.save()
        return room
    }
    
}
