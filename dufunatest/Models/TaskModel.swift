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
    let data: [TaskItem]?
}

// MARK: - Datum
import Foundation

struct TaskItem: Codable, Hashable {
    let taskID: String?
    let taskType: String?
    let timeOfDay: String?
    let taskGroup: String?
    let action: String?
    let order: String?
    let priority: String?
    let taskDetailRef: String?
    let hourOfDay: String?
    let supportLevel: String?
    let taskStartedOn: JSONNull?
    let taskEndedOn: JSONNull?
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(taskID)
        hasher.combine(taskType)
        hasher.combine(timeOfDay)
        hasher.combine(taskGroup)
        // Continue combining other properties as needed
    }
    
    static func == (lhs: TaskItem, rhs: TaskItem) -> Bool {
        return lhs.taskID == rhs.taskID &&
               lhs.taskType == rhs.taskType &&
               lhs.timeOfDay == rhs.timeOfDay &&
               lhs.taskGroup == rhs.taskGroup
        // Continue comparing other properties as needed
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
