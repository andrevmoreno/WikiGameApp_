//
//  GameView_1.swift
//  WikiGame
//
//  Created by Andrea Moreno on 23-06-24.
//

import SwiftUI
import AVKit


struct GameView: View {
    
    
    var url: String
    var titles: String
    var studio: String
    var calificacion: String
    var publishedYear: String
    var descriptions: String
    var tags: [String]
    var imgsUrl: [String]
    
    
    
    
    var body: some View {
        ZStack {
            Color("background-color").ignoresSafeArea()
            
            VStack {
                
                video(url:url).frame(height:300)
                
                ScrollView {
                    Text("The witcher 3: Wild Hunt")
                }.frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct video:View {
    var url:String
    var body: some View {
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!)).ignoresSafeArea()
    }
}


#Preview {
    GameView(
        url: "ejemplo",
        titles:"Sonic The Hedgehog",
        studio: "Sega",
        calificacion: "E+",
        publishedYear: "1991",
        descriptions: "Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente",
        tags:["plataformas","mascota"],
        imgsUrl: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"
    ])
}
