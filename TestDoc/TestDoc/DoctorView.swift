//
//  DocInfoView.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 22.09.2024.
//

import SwiftUI
import Kingfisher
struct DoctorView: View {
    
    let doctor: Doctor
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    if doctor.imageName == "" {
                        Image(systemName: "person.crop.circle", variableValue: nil)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(25)
                            .foregroundStyle(.gray)
                    } else {
                        KFImage(URL(string: doctor.imageName))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .cornerRadius(25)
                    }
                    VStack(alignment: .leading){
                        Text(doctor.lastName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        Text(doctor.name + " " + doctor.patronymic)
                        // порой дублируются имена в api 
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .padding(.bottom,5)
                }
                
                HStack {
                    Image("clock")
                        .scaleEffect(1.5)
                        .frame(width: 20, height: 20)
                    switch doctor.experience {
                    case 1...4 :
                        Text("Опыт работы: \(doctor.experience) года")
                            .font(.caption)
                            .foregroundColor(.gray)
                    default :
                        Text("Опыт работы: \(doctor.experience) лет")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                HStack {
                    Image("medkit")
                        .scaleEffect(1.5)
                        .frame(width: 20, height: 20)
                    Text(doctor.profession)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image("hat")
                        .scaleEffect(1.5)
                        .frame(width: 20, height: 20)
                    Text(doctor.education ?? "")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                HStack {
                    Image("marker")
                        .scaleEffect(1.5)
                        .frame(width: 20, height: 20)
                    Text("Городская больница") // api ничего нормально не написано так что будет так
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
            }
            .padding(.bottom, 16)
            
            HStack() {
                Text("Стоимость услуг")
                    .font(.subheadline)
                Spacer()
                Text("от \(doctor.price) р")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding(15)
            .background(.white)
            .cornerRadius(10)
            ScrollView{
                Text("Тут должно быть описание врача и прочее но в api ничего нет поэтому я его и не добавил но уверен что врач просто огонь и лучше его нет обязательно запишитесь и будьте здоровы Тут должно быть описание врача и прочее но в api ничего нет поэтому я его и не добавил но уверен что врач просто огонь и лучше его нет обязательно запишитесь и будьте здоровы Тут должно быть описание врача и прочее но в api ничего нет поэтому я его и не добавил но уверен что врач просто огонь и лучше его нет обязательно запишитесь и будьте здоровы Тут должно быть описание врача и прочее но в api ничего нет поэтому я его и не добавил но уверен что врач просто огонь и лучше его нет обязательно запишитесь и будьте здоровы Тут должно быть описание врача и прочее но в api ничего нет поэтому я его и не добавил но уверен что врач просто огонь и лучше его нет обязательно запишитесь и будьте здоровы")
            }
                .padding(.top, 10)
            Spacer()
            Button(action: {
                // Действие при нажатии на кнопку
            }) {
                Text("Записаться")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(Color(red: 235/255, green: 235/255, blue: 235/255))
    }
}

