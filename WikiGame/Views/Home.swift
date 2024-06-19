//
//  Home.swift
//  WikiGame
//
//  Created by Andrea Moreno on 20-06-24.
//

import SwiftUI
import AVKit

struct Home: View {
    
    @State var selectTab: Int = 2
    
    var body: some View {
        
        
        TabView(selection: $selectTab){
            //Profile
            Text("Profile").font(.system(size: 30,weight:.bold))
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")}.tag(0)
            
            //Game
            GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Game")}.tag(1)
            
            
            //Home
            ScreenHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")}.tag(2)
            
            //Favorite
            Text("Favorite").font(.system(size: 30,weight:.bold))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")}.tag(3)
        }.accentColor(.white)
        

        
    }
    
    init(){
        
        UITabBar.appearance().backgroundColor = UIColor(Color("menu"))
        print("Screen View Home")
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("tab-bar-item"))
        UITabBar.appearance().isTranslucent = true
    }
    
}


//Screens
//Screens Home
struct ScreenHome: View {
    @State var findText = ""
    var body: some View {
        
        ZStack {
            Color("background-color").ignoresSafeArea()
            
            
            VStack {
                //Logo
                Image("LogoWikiGame")
                    .resizable()
                    .aspectRatio(contentMode:.fit).frame(width: 200).padding()
                
                //Search
                HStack{
                    
                    Button(action: finding, label: {
                        Image(systemName: "magnifyingglass").foregroundColor(findText.isEmpty ? Color(.systemGray): Color("dark-cian"))
                    })
                    
                    ZStack(alignment: .leading){
                        
                        if findText.isEmpty{
                            Text("Search a video").foregroundStyle(.gray)
                    }
                        TextField("",text: $findText).foregroundColor(.white)
                        
                        
                    }
                    
                }.padding([.top, .leading, .trailing, .bottom],9.0).background(Color("blue-gray")).cornerRadius(12)
                
               Spacer(minLength: 20)
                
                
                ScrollView {
                    SubModuleHome()
                }

                
            }.frame(width: 350,alignment: .trailing)
            
            
            
        }.navigationBarHidden(false)
            .navigationBarBackButtonHidden(true)
    }
    
    func finding(){
        print("user is finding of search\(findText)")
    }
}
//Most popular
struct SubModuleHome: View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    @State var isPlayerActive = false
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        
        VStack {
            Text("MOST POPULAR")
                .font(.title3)
                .fontWeight(.bold).foregroundColor(.white).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity , alignment: .leading).padding(.top)
            //Videos
            ZStack{
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL:\(url)")
                    isPlayerActive = true
                }, label: {
                    
                    VStack(spacing: 0){
                        Image("thewitcher").resizable().scaledToFill()
                        
                        Text("The witcher 3: Wild Hunt").font(.title3).fontWeight(.black).padding(.all, 13.0).frame(minWidth: 20, maxWidth: 350, alignment: .leading).background(Color("blue-gray"))
                        
                    }.cornerRadius(4)
      
                })
                
                Image(systemName: "play.circle.fill").resizable().foregroundColor(.white).frame(width:42,height: 42)
                
            }.frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity , alignment: .center).padding(.vertical)
            
            Text("SUGGESTED FOR YOU")                .font(.title3)
                .fontWeight(.bold).foregroundColor(.white).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity , alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack(alignment: .top, spacing: 8){
                    //Button 1
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        VStack(alignment: .center){
                            
                                Image("FPS")
                                    .resizable()
                                    .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                
                            Text("FPS").fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("dark-cian"))
                            
                            
                        }.frame(width: 195,height: 100)
                         .background(Color("blue-gray"))
                         .cornerRadius(8)
                          
                        
                    })
                    
                    //Button 2
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        VStack(alignment: .center){
                            
                                Image("RPG")
                                    .resizable()
                                    .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                
                            Text("RPG").fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("dark-cian"))
                            
                            
                        }.frame(width: 195,height: 100)
                         .background(Color("blue-gray"))
                         .cornerRadius(8)
                    })
                    
                    //Button 3
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        
                        VStack(alignment: .center){
                            
                                Image("OpenWorld")
                                    .resizable()
                                    .scaledToFit()
                                .frame(width: 40, height: 40, alignment: .center)
                                
                            Text("OPEN WORLD").fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("dark-cian"))
                            
                            
                        }.frame(width: 195,height: 100)
                         .background(Color("blue-gray"))
                         .cornerRadius(8)
                    })
                    
                }
                
                
            }
            
            Spacer(minLength: 30)

            //Categories
            Text("RECOMMENDED FOR YOU").font(.title3)
                .fontWeight(.bold).foregroundColor(.white).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity , alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    //Image 1
                    Button(action: {url = urlVideos[0]
                        print("URL:\(url)")
                        isPlayerActive = true},
                        label: {
                        Image("video-games").resizable().scaledToFit()
                        .frame(width: 227, height: 128)
                    })
                    
                    //Image 2
                    Button(action: {url = urlVideos[0]
                        print("URL:\(url)")
                        isPlayerActive = true},
                        label: {
                        Image("video-games-2").resizable().scaledToFit()
                        .frame(width: 227, height: 128)
                    })
                    
                    
                }
            }
            Spacer(minLength: 30)

            //VIDEOS YOU MIGHT LIKE
            Text("VIDEOS YOU MIGHT LIKE").font(.title3)
                .fontWeight(.bold).foregroundColor(.white).frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/,maxWidth: .infinity , alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    //Image 1
                    Button(action: {url = urlVideos[0]
                        print("URL:\(url)")
                        isPlayerActive = true},
                        label: {
                        Image("video-games-3").resizable().scaledToFit()
                        .frame(width: 227, height: 128)
                    })
                    
                    //Image 2
                    Button(action: {url = urlVideos[0]
                        print("URL:\(url)")
                        isPlayerActive = true},
                        label: {
                        Image("video-games-4").resizable().scaledToFit()
                        .frame(width: 227, height: 128)
                    })
                    
                    
                }
            }
            
        }
        NavigationLink(
            destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)),
            isActive: $isPlayerActive,
            label: {
                EmptyView()
            })
    }
}








#Preview {
    Home()
}
