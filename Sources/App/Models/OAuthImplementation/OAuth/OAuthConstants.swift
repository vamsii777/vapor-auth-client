import Vapor

struct OAuthConstants {
    
    static let oAuthProvider: String = Environment.get("OAUTH_PROVIDER") ?? "http://auth.dewonderstruck.com:8090"
    
    static let callbackURL: String = Environment.get("OAUTH_CALLBACK_URL") ?? "http://auth.dewonderstruck.com:8089/oauth"
    
    static let stateVerifier: String = "\([UInt8].random(count: 32).hex)"
    
    static let codeVerifier = "\([UInt8].random(count: 32).hex)"
    
    static let nonce = "\([UInt8].random(count: 32).hex)"
    
    static let maxAgeAccessToken: Int = Environment.get("OAUTH_ACCESS_TOKEN_MAX_AGE").flatMap(Int.init) ?? 60 * 60 * 24 * 30
    
    static let maxAgeRefreshToken: Int = Environment.get("OAUTH_REFRESH_TOKEN_MAX_AGE").flatMap(Int.init) ?? 60 * 60 * 24 * 30
    
    static let maxAgeIDToken: Int = Environment.get("OAUTH_ID_TOKEN_MAX_AGE").flatMap(Int.init) ?? 60 * 60 * 24 * 30
    
    static let serverSessionCookieName = "vapor-session"
    
    static let resourceServerUsername = Environment.get("OAUTH_RESOURCE_SERVER_USERNAME") ?? "dewonderstruck"
    
    static let resourceServerPassword = Environment.get("OAUTH_RESOURCE_SERVER_PASSWORD") ?? "pass@d"
    
    static let clientID = Environment.get("OAUTH_CLIENT_ID") ?? "Np2bX4LcD1K9jRiV7f8U"
    
    // Decrypt the clientSecret I'm lazy to do so
    static let clientSecret = Environment.get("OAUTH_CLIENT_SECRET") ?? "$2b$12$xbcGrKKg8g/L7l63etB4WeilBeWc7IxC.6534CKIR3jmkkb24Kh72"
}
