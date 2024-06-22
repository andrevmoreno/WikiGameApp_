//
//  GamesView.swift
//  WikiGame
//
//  Created by Andrea Moreno on 20-06-24.
//

import SwiftUI


struct GamesView: View {

    @ObservedObject var allVideoGame = ViewModel()
    
    @State var gameviewIsActive:Bool = false
    @State var url:String = ""
    @State var titles:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var publishedYear:String = ""
    @State var descriptions:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]

    let formGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
    
    ]
    var body: some View {
        
        ZStack{
            Color("background-color").ignoresSafeArea()
            VStack{
                Text("Game").font(.title2).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white).padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                ScrollView{
                    
                    LazyVGrid(columns:formGrid,spacing: 8){
                        
                        ForEach(allVideoGame.gamesInfo, id:\.self){ game in
                           
                            Button {
                                url = game.videosUrls.mobile
                                titles = game.title
                                studio = game.studio
                                calificacion = game.contentRaiting
                                publishedYear = game.publicationYear
                                descriptions = game.description
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                
                                print("Touch game\(titles)")
                            
                            } label: {
                                Text("\(game.title)")
                            }

                        }
                        
                    }
                }
                
                
            }
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
             
                perform:{
                    
                    print("json\(allVideoGame.gamesInfo[0])")
                    print("title firts json\(allVideoGame.gamesInfo[0].title)")
                }
            )

        //Text("Game").font(.system(size: 30,weight:.bold))

    }
}

#Preview {
    GamesView()
}
