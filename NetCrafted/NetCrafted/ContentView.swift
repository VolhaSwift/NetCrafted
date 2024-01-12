//
//  ContentView.swift
//  NetCrafted
//
//  Created by Виталий Орехов on 12.01.24.
//

import SwiftUI

struct ContentView: View {
    
    let urlString = URL(string: "https://jsonplaceholder.typicode.com/users/1")
//    guard let requestURL = URL(string: urlString) else {return}
    
    var body: some View {
        List(1...10, id: \.self) { number in
            Text("Row \(number)")
        }
        .onAppear{
            fetchUser()
        }
    }
    
    func fetchUser() {
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let usableData = data,
                    let response = response as? HTTPURLResponse,
                    response.statusCode == 200 {
                    print(usableData)
                }
            }
            task.resume()
        }
    }
}

#Preview {
    ContentView()
}
