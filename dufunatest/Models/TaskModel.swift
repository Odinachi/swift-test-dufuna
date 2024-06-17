
import Foundation

// MARK: - TaskModelElement
struct TaskModelElement: Codable {
    let taskID, userID: Int?
    let taskDetailRef, timeOfDay, hourOfDay, supportLevel: String?
    let action, taskGroup, taskType: String?
    let order: Int?
    let priority, supportPersonnel: String?
    let numSupportPersonnel: Int?
    let cron, taskDate, taskStartedOn, taskEndedOn: String?
    let workStatus: String?
    let taskAssignments: [TaskAssignment]?

    enum CodingKeys: String, CodingKey {
        case taskID = "taskId"
        case userID = "userId"
        case taskDetailRef, timeOfDay, hourOfDay, supportLevel, action, taskGroup, taskType, order, priority, supportPersonnel, numSupportPersonnel, cron, taskDate, taskStartedOn, taskEndedOn, workStatus, taskAssignments
    }
}

// MARK: - TaskAssignment
struct TaskAssignment: Codable {
    let assignee: Assignee?
    let assignmentStatus: String?
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

typealias TaskModel = [TaskModelElement]
