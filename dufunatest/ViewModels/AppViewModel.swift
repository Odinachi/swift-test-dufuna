//
//  AppViewModel.swift
//  dufunatest
//
//  Created by  Apple on 17/06/2024.
//

import Foundation
import Combine

@MainActor
class AppViewModel: ObservableObject {
    //Using singleton to access our vm
    static let shared = AppViewModel()
    
    @Published var items: [TaskItem] = []
    
    @Published var isLoading: Bool = false
    
    @Published var isLoggedIn: Bool = false
    
    @Published var errorMessage: String?
    
    @Published var user: LoginModel?
    
    
    private var cancellables = Set<AnyCancellable>()
    
    
    @MainActor  func login(_ username: String, _ password: String) async {
        guard let url = URL(string: "https://api.staging.caresaas.co.uk/caresaas/v1/services/auth/login") else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        guard let httpBody = try? JSONEncoder().encode(["userName": username, "password": password]) else {
            self.errorMessage = "Invalid login data"
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        self.isLoading = true
        self.errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Check for HTTP response status
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                
                let errorResponse = try? JSONDecoder().decode(ErrorModel.self, from: data)
                
                if let errorResponse = errorResponse {
                    
                    self.errorMessage = errorResponse.message
                } else {
                    self.errorMessage = "Invalid username or password."
                }
                
                self.isLoading = false
                return
            }
            
            let user = try JSONDecoder().decode(LoginModel.self, from: data)
            self.user = user
            self.isLoggedIn = true
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
    
    @MainActor func fetchHomeData() async {
        guard let userID = user?.data?.user?.userID else {
            self.errorMessage = "User ID not found"
            return
        }
        
        guard let url = URL(string: "https://api.staging.caresaas.co.uk/caresaas/v1/services/tasks/FKRC/careHome/2?assignee=\(userID)") else {
            self.errorMessage = "Invalid URL"
            return
        }
        self.isLoading = true
        self.errorMessage = nil
        
        print("kkk call 1 \(self.isLoading)")
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(user?.data?.userToken?.accessToken ?? "")", forHTTPHeaderField: "Authorization")
        
       
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            print("kkk call 2 \(response)")
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                let errorResponse = try? JSONDecoder().decode(ErrorModel.self, from: data)
                self.errorMessage = errorResponse?.message ?? "HTTP Error: \(httpResponse.statusCode)"
                self.isLoading = false
                return
            }
         
            print("kkk call 3 \(data)")
            let taskModel = try JSONDecoder().decode(TaskModel.self, from: data)
            print("kkkkkkk 1 \(taskModel.data!)")
            self.items = taskModel.data ?? []
            
        } catch {
            self.errorMessage = error.localizedDescription
        }
        
        self.isLoading = false
    }
    
    
}
