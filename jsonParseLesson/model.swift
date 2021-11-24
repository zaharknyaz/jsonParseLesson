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
    let date: Date
    let imageLesson: String? //делаем optional, если image нет в пакете, то ошибок не будет
    let link: String
    let comments: [Comment]?
    enum codingKeys: String, CodingKey{
        case id, name, date, link, comments
        case imageLesson = "image"
    }
}

struct Comment: Decodable {
    let id: Int
    let text: String
    let date: Date
    let user: User
}

struct User: Decodable {
    let id: Int
    let name: String
    let gender: Gender
}

enum Gender: String, Decodable {
    case male
    case female
}
