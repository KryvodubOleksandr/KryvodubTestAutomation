@testable import App
import Fluent
import Vapor

extension User {
    static func create(
        username: String? = nil,
        on database: Database
    ) throws -> User {
        let createUsername: String
        if let suppliedUsername = username {
            createUsername = suppliedUsername
        } else {
            createUsername = UUID().uuidString
        }
        
        let password = try Bcrypt.hash("password")
        let user = User(
            username: createUsername,
            password: password,
            email: "\(createUsername)@mail.com",
            firstname: "Test",
            lastname: "Test",
            age: "22",
            gender: "male",
            address: "Ukraine",
            website: "github.com"
        )
        try user.save(on: database).wait()
        return user
    }
}

extension Post {
    static func create(
        title: String = "Post test title",
        description: String = "Post test description",
        body: String = "Post test body",
        user: User? = nil,
        on database: Database
    ) throws -> Post {
        var postsUser = user
        
        if postsUser == nil {
            postsUser = try User.create(on: database)
        }
        
        let post = Post(
            title: title,
            description: description,
            body: body,
            userID: postsUser!.id!)
        try post.save(on: database).wait()
        return post
    }
}
