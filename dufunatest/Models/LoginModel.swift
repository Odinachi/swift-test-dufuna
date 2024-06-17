
import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let user: User?
    let userToken: UserToken?
}

// MARK: - User
struct User: Codable {
    let sub: String?
    let emailVerified: Bool?
    let realmAccess: RealmAccess?
    let name, preferredUsername, givenName, userID: String?
    let familyName, email, organization, careHome: String?

    enum CodingKeys: String, CodingKey {
        case sub
        case emailVerified = "email_verified"
        case realmAccess = "realm_access"
        case name
        case preferredUsername = "preferred_username"
        case givenName = "given_name"
        case userID = "userId"
        case familyName = "family_name"
        case email, organization, careHome
    }
}

// MARK: - RealmAccess
struct RealmAccess: Codable {
    let roles: [String]?
}

// MARK: - UserToken
struct UserToken: Codable {
    let accessToken, refreshToken: String?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
