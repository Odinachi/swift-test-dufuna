//
//  AppViewModel.swift
//  dufunatest
//
//  Created by  Apple on 17/06/2024.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    @Published var items: [TaskModel] = []
    
    @Published var isLoading: Bool = false
    
    @Published var isLoggedIn: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var user: LoginModel?
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(_ username :String,_ password : String) {
        
    let url = URL(string: "https://api.staging.caresaas.co.uk/caresaas/v1/services/auth/login")

        

        guard let httpBody = try? JSONEncoder().encode([ "userName":username,"password":password]) else {
            self.errorMessage = "Invalid login data"
            return
        }

        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody

        self.isLoading = true
        self.errorMessage = nil

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: LoginModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                switch completion {
                case .finished:
                    self.isLoggedIn = true
                    
                case .failure(let error):
                    self.errorMessage = "\(error.localizedDescription)"
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.user = response
                self.isLoggedIn = true
            })
            .store(in: &self.cancellables)
    }
    
}
