import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    
    let websiteController = WebsiteController()
    try app.register(collection: websiteController)
    
    let usersController = UsersController()
    try app.register(collection: usersController)
    
    let postsController = PostsController()
    try app.register(collection: postsController)
    
    let commentsController = CommentsController()
    try app.register(collection: commentsController)
}
