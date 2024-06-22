//
//  ViewModel.swift
//  WikiGame
//
//  Created by Andrea Moreno on 21-06-24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var gamesInfo = [Game]()
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://gamestreamapi.herokuapp.com/api/games") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Invalid response")
                return
            }

            guard let data = data else {
                print("No data")
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Game].self, from: data)
                DispatchQueue.main.async {
                    self.gamesInfo = decodedData
                }
            } catch {
                print("Decoding error: \(error)")
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("Response data: \(jsonString)")
                }
            }
        }.resume()
    }
}
