//
//  model.swift
//  jsonParseLesson
//
//  Created by Захар Князев on 24.11.2021.
//

import Foundation

struct Lesson: Decodable {
    let id: Int
    let name: String
    let date: String //Date
    let image: String
    let link: String
}
