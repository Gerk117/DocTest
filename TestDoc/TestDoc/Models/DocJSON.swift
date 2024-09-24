//
//  DocModel.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 20.09.2024.
//

struct DocJSON: Codable {
    var data: DocUsersJSON
}

struct DocUsersJSON: Codable {
    var users: [DocInfoJSON]
}

struct DocInfoJSON: Codable {
    var id: String
    var slug: String
    var firstName: String
    var patronymic: String
    var lastName: String
    var gender: String
    var genderLabel: String
    var avatar: String?
    var educationTypeLabel : Education?
    var textChatPrice: Int
    var videoChatPrice: Int
    var homePrice: Int
    var hospitalPrice: Int
    var ratingsRating: Double
    var isFavorite: Bool
//    var specialization : String
}

struct Education: Codable {
    var name: String
}
