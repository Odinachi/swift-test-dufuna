// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let taskModel = try? JSONDecoder().decode(TaskModel.self, from: jsonData)

import Foundation

// MARK: - TaskModel
struct TaskModel: Codable {
    let status: String?
    let code: Int?
    let message: String?
    let data: [Task]?
}

// MARK: - Datum
struct Task: Codable {
    let taskID, taskType, timeOfDay, taskGroup: String?
    let action, order: String?
    let priority: String?
    let taskDetailRef: String?
    let hourOfDay, supportLevel: String?
    let taskStartedOn, taskEndedOn: JSONNull?
    let taskDate: String?
    let workStatus: JSONNull?
    let isAssigned: Bool?
    let supportPersonnel: String?
    let noSupportPersonnel: Int?
    let userID: Int?
    let taskScheduleID: String?
    let taskAssignments: [TaskAssignment]?

    enum CodingKeys: String, CodingKey {
        case taskID = "taskId"
        case taskType, timeOfDay, taskGroup, action, order, priority, taskDetailRef, hourOfDay, supportLevel, taskStartedOn, taskEndedOn, taskDate, workStatus, isAssigned, supportPersonnel, noSupportPersonnel
        case userID = "userId"
        case taskScheduleID = "taskScheduleId"
        case taskAssignments
    }
}

// MARK: - TaskAssignment
struct TaskAssignment: Codable {
    let assignee: Assignee?
    let assignmentStatus: JSONNull?
}

// MARK: - Assignee
struct Assignee: Codable {
    let userID: Int?
    let firstName, lastName: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case firstName, lastName
    }
}

// MARK: - Encode/decode helpers

@objcMembers class JSONNull: NSObject, Codable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
            return true
    }

    override public init() {}

    public required init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if !container.decodeNil() {
                    throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
    }

    public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encodeNil()
    }
}
