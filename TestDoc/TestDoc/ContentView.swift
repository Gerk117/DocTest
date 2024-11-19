//
//  ContentView.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 18.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = DoctorViewModel()
//    @ObservedObject
    
    var body: some View {
        TabView {
            NavigationView {
                ScrollView {
                    TextField("Search ...", text: $viewModel.searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color(.white))
                        .cornerRadius(8)
                        .padding(.horizontal, 20)
                        .padding(.bottom,10)
                    HStack {
                        Button("По цене \(viewModel.isPriceAscending ? "↑" : "↓")") {
                            viewModel.setSortOption(.byPrice)
                        }
                        Divider()
                        Button("По стажу") {
                            viewModel.setSortOption(.byExperience)
                        }
                        .padding(5)
                        Divider()
                        Button("По рейтингу") {
                            viewModel.setSortOption(.byRating)
                        }
                    }
                    .foregroundStyle(.gray)
                    .frame(width: 343, height: 32)
                    .background(.white)
                    .cornerRadius(10)

                    VStack(spacing: 16) {
                        ForEach(viewModel.filteredDoctors) { doctor in
                            NavigationLink(destination: DoctorView(doctor: doctor)) {
                                DoctorViewCell(isFavorite: doctor.isFavorite, doctor: doctor)
                            }
                        }
                    }
                    .padding()
                }
                .background(Color(red: 235/255, green: 235/255, blue: 235/255))
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Педиатры")
                            .font(.system(size: 24))
                    }
                }
            }
            .tabItem { Label("Главная", systemImage: "house") }

            Text("Приемы")
                .tabItem { Label("Приемы", systemImage: "calendar") }

            Text("Чат")
                .tabItem { Label("Чат", systemImage: "message") }

            Text("Профиль")
                .tabItem { Label("Профиль", systemImage: "person.circle") }
        }
        .tint(.pink)
        .onAppear() {
            viewModel.load()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


