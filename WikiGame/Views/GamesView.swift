//
//  GamesView.swift
//  WikiGame
//
//  Created by Andrea Moreno on 20-06-24.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        
        Text("Hi since screen")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
             
                perform:{
                    
                    print("json")
                    print("title firts json")
                }
            )

        //Text("Game").font(.system(size: 30,weight:.bold))

    }
}

#Preview {
    GamesView()
}
