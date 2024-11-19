//
//  Untitled.swift
//  TestDoc
//
//  Created by Георгий Ксенодохов on 20.09.2024.
//


import Combine
import Foundation

final class DoctorViewModel: ObservableObject {
    @Published private(set) var data = [Doctor]()
    @Published var searchText: String = "" {
        didSet {
            filterDoctors()
        }
    }
    
    @Published private(set) var filteredDoctors = [Doctor]()
    private var service = DoctorService()
    private var currentSortOption: SortOption = .none
    private(set) var isPriceAscending: Bool = true

    enum SortOption {
        case none, byExperience, byRating, byPrice
    }

    init() {
        load()
    }

    func load() {
        service.getDoctors { [weak self] doctors in
            DispatchQueue.main.async {
                self?.data = doctors
                self?.filteredDoctors = doctors
            }
        }
    }

    private func filterDoctors() {
        if searchText.isEmpty {
            filteredDoctors = data
        } else {
            filteredDoctors = data.filter { doctor in
                doctor.name.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        sortDoctors()
    }

    func sortDoctors() {
        switch currentSortOption {
        case .byRating:
            filteredDoctors.sort { $0.rating > $1.rating }
        case .byExperience:
            filteredDoctors.sort { $0.experience > $1.experience }
        case .byPrice:
            if isPriceAscending {
                filteredDoctors.sort { $0.price < $1.price }
            } else {
                filteredDoctors.sort { $0.price > $1.price }
            }
        case .none:
            break
        }
    }

    func setSortOption(_ option: SortOption) {
        if option == .byPrice {
            isPriceAscending.toggle()
        }
        
        currentSortOption = option
        sortDoctors()
    }
}
