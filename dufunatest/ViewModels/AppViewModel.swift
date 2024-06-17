//
//  AppViewModel.swift
//  dufunatest
//
//  Created by  Apple on 17/06/2024.
//

import Foundation
import Combine

class AppViewModel: ObservableObject {
    //Using singleton to access our vm
    static let shared = AppViewModel()
    
    @Published var items: [Task] = []
    
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
        //set the method
        request.httpMethod = "POST"
        //set content type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //set the body
        request.httpBody = httpBody

        self.isLoading = true
        self.errorMessage = nil

        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: LoginModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
               
             
             
                //check the status of our call
                switch completion {
                case .finished:
                    self.isLoggedIn = true
                case .failure(let error):
                    self.errorMessage = "\(error.localizedDescription)"
                }
            }, receiveValue: { 
                [weak self] user in
          
                
                guard let self = self else { return }
                print("KKKKKK 3  \(self.isLoading)")
                self.isLoading = false
                //set the user
                self.user = user
                self.isLoggedIn = true
            })
            .store(in: &self.cancellables)
    } 
    
    func fetchHomeData() {
        
        let url = URL(string: "https://api.staging.caresaas.co.uk/caresaas/v1/services/tasks/FKRC/careHome/2?assignee=\(user?.data?.user?.userID ?? "")")


       

        var request = URLRequest(url: url!)
        //set the method
        request.httpMethod = "GET"
        //set content type
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
      

        self.isLoading = true
        self.errorMessage = nil
       
        URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: TaskModel.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
              
                switch completion {
                   
                    
                case .failure(let error):
                    self.isLoading = false
                    self.errorMessage = "\(error.localizedDescription)"
                    
                case .finished:
                    self.isLoading = false
                }
            }, receiveValue: { [weak self] data in
                guard let self = self else { return }
              
                self.items =  data.data ?? []
                print("KKKKKK here \(self.items)")
                
            })
            .store(in: &self.cancellables)
    }
    
    
    
}
