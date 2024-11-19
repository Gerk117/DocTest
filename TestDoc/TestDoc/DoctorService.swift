//
//  DoctorService.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 20.09.2024.
//

import Foundation

final class DoctorService {
    
    private var task: URLSessionTask? = nil
    
    func getDoctors(comp: @escaping ([Doctor]) -> Void) {
        guard task == nil else {
            return
        }
        guard let url = URL(string: "https://raw.githubusercontent.com/salfa-ru/test_iOS_akatosphere/main/test.json") else {
            return
        }
        let req = URLRequest(url: url)
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var docResult = [Doctor]()
        let task = URLSession.shared.dataTask(with: req) { data, _, error in
            guard error == nil else {
                return
            }
            guard let data else {
                return
            }
            guard let docJSON = try? decoder.decode(DocJSON.self, from: data) else {
                return
            }
            for i in docJSON.data.users {
                let price = [i.homePrice,
                             i.hospitalPrice,
                             i.videoChatPrice,
                             i.textChatPrice].filter({ $0 > 0 }).min() ?? 0
                
                let doctor = Doctor(name: i.firstName,
                                    lastName: i.lastName,
                                    profession: "Педиатор",
                                    patronymic: i.patronymic,
                                    experience: Int.random(in: 1...20),
                                    price: price,
                                    imageName: i.avatar ?? "",
                                    isAvailable: true,
                                    education: i.educationTypeLabel?.name,
                                    rating: i.ratingsRating,
                                    isFavorite: i.isFavorite)
                docResult.append(doctor)
            }
            comp(docResult)
            self.task = nil
        }
        self.task = task
        task.resume()
    }
}
