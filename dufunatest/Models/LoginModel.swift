// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

// MARK: - LoginModel
struct LoginModel: Codable {
    let status: String?
    let code: Int?
    let message: String?
    let data: DataClass?
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User?
    let userToken: UserToken?
}

// MARK: - User
struct User: Codable {
    let sub: String?
    let emailVerified: Bool?
    let realmAccess: RealmAccess?
    let organization, name: String?
    let groups: [String]?
    let preferredUsername, givenName, familyName, userID: String?
    let email, lastRole: String?

    enum CodingKeys: String, CodingKey {
        case sub
        case emailVerified = "email_verified"
        case realmAccess = "realm_access"
        case organization, name, groups
        case preferredUsername = "preferred_username"
        case givenName = "given_name"
        case familyName = "family_name"
        case userID = "userId"
        case email, lastRole
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
