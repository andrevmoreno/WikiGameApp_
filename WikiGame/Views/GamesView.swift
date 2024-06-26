//
//  GamesView.swift
//  WikiGame
//
//  Created by Andrea Moreno on 20-06-24.
//
import SwiftUI

struct GamesView: View {
    @ObservedObject var allVideoGame = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url: String = ""
    @State var titles: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var publishedYear: String = ""
    @State var descriptions: String = ""
    @State var tags: [String] = [""]
    @State var imgsUrl: [String] = [""]

    let formGrid = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        //Logo

        ZStack {
            Color("background-color").ignoresSafeArea()

            VStack {
                Image("LogoWikiGame")
                    .resizable()
                    .aspectRatio(contentMode:.fit).frame(width: 200).padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                Text("Game")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                
                ScrollView {
                    LazyVGrid(columns: formGrid, spacing: 8) {
                        ForEach(allVideoGame.gamesInfo, id: \.self) { game in
                            Button {
                                url = game.videosUrls.mobile
                                titles = game.title
                                studio = game.studio
                                calificacion = game.contentRaiting
                                publishedYear = game.publicationYear
                                descriptions = game.description
                                tags = game.tags
                                imgsUrl = game.galleryImages
                                
                                print("Touch Game\(titles)")
                                
                                gameviewIsActive = true
                                
                            } label: {
                                VStack {
                                  //  Text("\(game.title)")
                                    AsyncImage(url: URL(string: "\(game.galleryImages[0])")) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipShape(RoundedRectangle(cornerRadius: 4))
                                            .padding(.vertical, 1.0 )
                                    } placeholder: {
                                        placeholderImage()
                                    } NavigationLink(destination: GameView(url: url, titles: titles, studio: studio, calificacion: calificacion, publishedYear: publishedYear, descriptions: descriptions, tags: tags, imgsUrl: imgsUrl),
                                                     isActive: $gameviewIsActive, label: {EmptyView()})
                                }
                            }
                        }
                    }
                }
            }.frame(width: 350,alignment: .trailing)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            print("json\(allVideoGame.gamesInfo.first?.title ?? "No data")")
            print("Title first json\(allVideoGame.gamesInfo.first?.title ?? "No data")")
        }
    }
    
    // Placeholder image function
    func placeholderImage() -> some View {
        ProgressView()
    }
}

#Preview {
    GamesView()
}
