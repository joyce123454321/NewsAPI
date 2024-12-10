//
//  ContentView.swift
//  NewsAPI
//
//  Created by Joyce Chang (student LM) on 12/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var json = "Loading..."
    
    var body: some View {
        VStack {
            Text(json)
        }
        .task {
            let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2024-11-10&sortBy=publishedAt&apiKey=2dabcf77f76642b9ac60ec1fd0bf31aa")!
            let (data, _) = try! await URLSession.shared.data(from: url)
            json = String(decoding: data, as: UTF8.self)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
