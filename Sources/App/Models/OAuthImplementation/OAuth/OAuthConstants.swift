import Vapor 

struct OAuthConstants { 

    static let oAuthProvider: String = "http://auth.dewonderstruck.com:8090"

    static let callbackURL: String = "http://auth.dewonderstruck.com:8089/oauth"

    static let stateVerifier: String = "\([UInt8].random(count: 32).hex)"

    static let codeVerifier = "\([UInt8].random(count: 32).hex)"

    static let nonce = "\([UInt8].random(count: 32).hex)"

    static let maxAgeAccessToken: Int = 600 * 2

    static let maxAgeRefreshToken: Int = 60 * 60 * 24 * 30

    static let maxAgeIDToken: Int = 60 * 60

    static let serverSessionCookieName = "vapor-session"

    static let resourceServerUsername = "dewonderstruck"

    static let resourceServerPassword = "pass@d"

    static let clientID = "Np2bX4LcD1K9jRiV7f8U"

    // Decrypt the clientSecret I'm lazy to do so
    static let clientSecret = "$2b$12$xbcGrKKg8g/L7l63etB4WeilBeWc7IxC.6534CKIR3jmkkb24Kh72"
}
