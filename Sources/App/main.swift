import Vapor

let drop = Droplet()

// Mark: - Room
let roomController = RoomController()
drop.get("room", handler: roomController.show)
drop.delete("room", Room.self, handler: roomController.delete)
drop.put("room", Room.self, handler: roomController.create)
drop.post("room", Room.self, handler: roomController.update)


drop.run()


//drop.get { req in
//    return try drop.view.make("welcome", [
//    	"message": drop.localization[req.lang, "welcome", "title"]
//    ])
//}
//
//drop.resource("posts", PostController())

