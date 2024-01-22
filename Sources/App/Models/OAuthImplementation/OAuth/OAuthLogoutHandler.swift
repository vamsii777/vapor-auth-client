import Vapor

class OAuthLogoutHandler {
    private let oAuthProviderURL: String
    private let serverSessionCookieName: String

    init(oAuthProviderURL: String, serverSessionCookieName: String) {
        self.oAuthProviderURL = oAuthProviderURL
        self.serverSessionCookieName = serverSessionCookieName
    }

    func logout(_ request: Request) async throws -> Response {
        // Call the OAuth provider's logout endpoint
        let cookie = request.cookies[serverSessionCookieName]?.string ?? ""
        let headers = HTTPHeaders(dictionaryLiteral: ("Cookie", "\(serverSessionCookieName)=\(cookie)"))
        do {
            _ = try await request.client.get(URI(string: "\(oAuthProviderURL)/oauth/logout"), headers: headers)
        } catch {
            throw OAuthClientErrors.openIDProviderResponseError("Calling /oauth/logout failed.")
        }

        // Create a response and delete the session cookies
        var response = Response(status: .ok)
        clearCookies(response: &response)
        return response
    }

    private func clearCookies(response: inout Response) {
        let deleteCookie = HTTPCookies.Value(
            string: "",
            expires: Date(timeIntervalSince1970: 0),
            maxAge: 0,
            domain: nil,
            path: nil,
            isSecure: false,
            isHTTPOnly: true,
            sameSite: nil
        )

        response.cookies[serverSessionCookieName] = deleteCookie
        // Clear other cookies as needed (e.g., access_token, refresh_token, etc.)
    }
}
