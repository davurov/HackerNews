//
//  ContentView.swift
//  Hacker News
//
//  Created by Abduraxmon on 02/11/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                        
                    }
                }
                
            }
            .padding(EdgeInsets(top: 0, leading: -20, bottom: 0, trailing: -20))
            .navigationBarTitle("Haker News")
        }
        .onAppear {
            self.networkManager.fetchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

