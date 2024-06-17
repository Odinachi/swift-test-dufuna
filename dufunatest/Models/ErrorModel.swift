//
//  ErrorModel.swift
//  dufunatest
//
//  Created by  Apple on 17/06/2024.
//

import Foundation

struct ErrorModel: Codable {
    let status: String?
    let code: Int?
    let message: String?
}
