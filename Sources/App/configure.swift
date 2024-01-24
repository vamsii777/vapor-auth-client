import NIOSSL
import Fluent
import FluentMongoDriver
import Vapor

// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    app.logger.logLevel = .notice
    app.http.server.configuration.port = 8089
    
    let corsConfiguration = CORSMiddleware.Configuration(
        allowedOrigin: .any(["http://auth.localhost:3000", "http://localhost:8090", "http://localhost:8089"]),
        allowedMethods: [.GET, .POST, .PUT, .OPTIONS, .DELETE, .PATCH],
        allowedHeaders: [.accept, .authorization, .contentType, .origin, .xRequestedWith, .userAgent, .accessControlAllowOrigin, .accessControlAllowHeaders, .init("X-CSRF-TOKEN")],
        allowCredentials: true
    )
    let cors = CORSMiddleware(configuration: corsConfiguration)
    app.middleware.use(cors, at: .beginning)
    
    let sessionsMiddleware = app.sessions.middleware
    app.middleware.use(sessionsMiddleware)
    app.sessions.use(.fluent(.mongo))
    
    try app.databases.use(DatabaseConfigurationFactory.mongo(
        connectionString: Environment.get("DATABASE_URL") ?? "mongodb://localhost:27017/vapor_database"
    ), as: .mongo)

    // register routes
    try routes(app)
}
