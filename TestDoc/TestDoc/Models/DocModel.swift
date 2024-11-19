//
//  DocModel.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 20.09.2024.
//
import Foundation

struct Doctor: Identifiable {
    let id = UUID()
    let name: String
    let lastName: String
    let profession: String
    let patronymic: String
    let experience: Int
    let price: Int
    let imageName: String
    let isAvailable: Bool
    let education: String?
    let rating: Double
    var isFavorite: Bool
}
