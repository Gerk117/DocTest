//
//  DocView.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 18.09.2024.
//
import SwiftUI
import Kingfisher

struct DoctorViewCell: View {
    @State private(set) var isFavorite: Bool 
    private(set) var doctor: Doctor
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                HStack {
                    VStack {
                        KFImage(URL(string: doctor.imageName))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Spacer()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(doctor.lastName)
                            .font(.headline)
                        Text(doctor.name + " " + doctor.patronymic)
                            .font(.headline)
                        
                        let starImages = [
                            "zeroStars",
                            "oneStars",
                            "twoStars",
                            "threeStars",
                            "fourStars",
                            "fiveStars"
                        ]

                        let ratingIndex = max(0, min(5, Int(round(doctor.rating))))
                        Image(starImages[ratingIndex])
                            .resizable()
                            .frame(width: 80, height: 15)
                            .padding(.bottom, 5)
                        
                        HStack {
                            if !doctor.profession.isEmpty {
                                Text("\(doctor.profession)")
                                    .font(.subheadline)
                            }
                            
                            switch doctor.experience {
                            case 1...4:
                                Text("Стаж: \(doctor.experience) года")
                                    .font(.caption)
                            default:
                                Text("Стаж: \(doctor.experience) лет")
                                    .font(.caption)
                            }
                        }
                        .padding(.bottom, 5)
                        .foregroundStyle(.gray)
                        
                        Text("от \(doctor.price) р")
                            .font(.headline)
                            .padding(.bottom, 10)
                    }
                    .foregroundStyle(.black)
                }
                
                if doctor.isAvailable {
                    Button("Записаться") {}
                        .frame(width: 350, height: 50)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                } else {
                    Text("Нет свободного расписания")
                        .frame(width: 350, height: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)

            Button(action: {
                self.isFavorite.toggle()
            }) {
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
                    .padding()
            }
        }
    }
}


