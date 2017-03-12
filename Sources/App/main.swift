import Vapor
import VaporMySQL

let droplet = Droplet()

// MARK: VaporMySQL
let mySQLProvider = try VaporMySQL.Provider(config: droplet.config)
droplet.addProvider(mySQLProvider)
droplet.preparations = [Room.self, User.self, Schedule.self]


// MARK: - Room
let roomController = RoomController()
roomController.addRoutes(droplet: droplet)

// MARK: - User
let userController = UserController()
userController.addRoutes(droplet: droplet)

// MARK: - Schedule
let scheduleController = ScheduleController()
scheduleController.addRoutes(droplet: droplet)

droplet.get { req in
    return try droplet.view.make("welcome", [
        "message": droplet.localization[req.lang, "welcome", "title"]
        ])
}

droplet.run()


//drop.resource("posts", PostController())
