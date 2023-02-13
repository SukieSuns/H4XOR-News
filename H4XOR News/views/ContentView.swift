//
//  ContentView.swift
//  H4XOR News
//
//  Created by Administrator on 12/24/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) {
                Post in
                NavigationLink(destination: DetailView(url: Post.url), label: {
                    HStack {
                        Text(String(Post.points))
                        Text(Post.title)  }
                })
                
            }
            .navigationTitle("H4XOR News")
        }
        .onAppear{
            self.networkManager.fenchData()
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



