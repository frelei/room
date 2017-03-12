import Vapor
import VaporRedis

let droplet = Droplet()

// MARK: Redis
let redisProvider = try VaporRedis.Provider(config: droplet.config)
droplet.addProvider(redisProvider)


// MARK: - Room
let roomController = RoomController(droplet: droplet)
droplet.get("room", handler: roomController.show)
droplet.delete("room", handler: roomController.delete)
droplet.put("room", handler: roomController.create)
droplet.post("room", handler: roomController.update)



// MARK: - User
let userController = UserController(droplet: droplet)
droplet.get("user", handler: userController.show)
droplet.delete("user", User.self, handler: userController.delete)
droplet.put("user", User.self, handler: userController.create)
droplet.post("user", User.self, handler: userController.update)


droplet.get { req in
    return try droplet.view.make("welcome", [
        "message": droplet.localization[req.lang, "welcome", "title"]
        ])
}


droplet.run()


//drop.resource("posts", PostController())

