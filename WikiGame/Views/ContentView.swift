//
//  ContentView.swift
//  WikiGame
//
//  Created by Andrea Moreno on 19-06-24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity:1.0).ignoresSafeArea()
                
                
                VStack{
                    Image("LogoWikiGame")
                        .resizable()
                        .aspectRatio(contentMode:.fit).frame(width: 200).padding(.vertical,30.0)
                    
                    LoginAndSignupView()
                }
            }.navigationBarBackButtonHidden(true)
            
            
        }
    }
}
//Login and Sign UP
struct LoginAndSignupView: View {
    @State var TypeLoginAndSignup = true
    
    var body: some View{
        
        VStack{
            
            HStack {
                Spacer()
                Button("LOG IN"){
                    TypeLoginAndSignup = true
                    print("Screen Login")
                }.font(Font.custom("SF UI Display", size: 18).weight(.bold)).foregroundColor(TypeLoginAndSignup ? .white : .gray)
                
                
                
                Spacer()
                
                
                Button("SIGN UP"){
                    TypeLoginAndSignup = false
                    print("Screen SignUP")
                }.foregroundColor(TypeLoginAndSignup ? .gray : .white)
                
                
                
                Spacer()
            }
            
            Spacer(minLength: 35)
            
            
            
            if(TypeLoginAndSignup){
                LoginView()
            }else{
                SignupView()
                
            }
        }
        
    }
}

//LoginView
struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    @State var isScreenHomeActive = false
    
    var body: some View{
        
        //Inputs Email
        ScrollView{
            //Inputs Email
            VStack(alignment:.leading){
                Text("Email Address").fontWeight(.bold).foregroundColor(Color("dark-cian")).font(.title2)
                //Email
                ZStack(alignment:.leading){
                    if email.isEmpty{
                        Text("example@gmail.com").font(.caption)      .foregroundColor(Color(.gray))
                        .opacity(0.70)}
                    
                    TextField("",text: $email)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                
                Spacer(minLength: 25)
                
                //Password
                Text("Password").fontWeight(.bold).foregroundColor(Color(.white)).font(.title2)
                //Type your password
                ZStack(alignment:.leading){
                    if password.isEmpty{
                        Text("Enter your password").font(.caption)      .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                        .opacity(0.70)}
                    
                    SecureField("",text: $password)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,5)
                
                Text("Forgot your password?").font(.footnote).frame(width: 345,alignment: .trailing).foregroundColor(Color("dark-cian")).padding(.bottom)
                
                Spacer(minLength: 50)
                //Buttons
                Button(action: LoginButton, label: {
                    Text("LOG IN").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(Color("background-color")).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:18, leading:18, bottom: 18, trailing:18)).background(Color("dark-cian")).cornerRadius(12).overlay(RoundedRectangle(cornerRadius: 12).inset(by:0.5).stroke(Color("dark-cian"), lineWidth: 2.0).shadow(color:.white, radius: 6))
                })
                Spacer(minLength: 80)
                
                VStack (alignment: .center){
                    Text("Log in with social media").foregroundStyle(.white)
                    HStack{
                        //Facebook
                        Button(action: Facebook, label: {
                            Text("Facebook").font(.callout).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing:10)).background(Color("blue-gray")).cornerRadius(8)
                        })
                        
                        //Google
                        Button(action: Google, label: {
                            Text("Google").font(.callout).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing:10)).background(Color("blue-gray")).cornerRadius(8)
                        })
                    }
                }
                
               

                
            }.padding([.top, .leading, .trailing],40.0)
            
            NavigationLink(
                destination: Home(),
                isActive: $isScreenHomeActive,
                label: {
                    EmptyView()})
        }
    }
    func LoginButton(){
        print("Login Now")
        isScreenHomeActive = true
    }
}


//SignUp View
struct SignupView: View {
    @State var TypeSignup = true
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    
    var body: some View{
        
        ScrollView{
            
            VStack {
                //Headline
                Text("Choose a profile picture").font(.headline).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                
                //Subhealine
                Text("You can change or select it later").font(.subheadline).foregroundColor(.gray).padding(.bottom)
                
                //Avatar
                Button(action: TakePicture,label:{
                    
                    ZStack {
                        Image("profile").resizable().aspectRatio(contentMode: .fit).frame(width: 85, height: 85).clipped()
                        
                        Image(systemName: "camera").foregroundColor(.white).frame(width: 30, height: 30)
                    }
                    
                }).padding(.bottom, 35.0)
            }
            
            
      //INPUTS
            
            //Inputs Email
            VStack(alignment:.leading){
                        VStack {
                            Text("Email Address*").fontWeight(.bold).foregroundColor(Color("dark-cian")).font(.title2)
                        }
                        //Email
                        ZStack(alignment:.leading){
                            if email.isEmpty{
                                Text("example@gmail.com").font(.caption)      .foregroundColor(Color(.gray))}
                            
                            TextField("",text: $email)
                        }
                        
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom)
                        
                        Spacer(minLength: 15)
                        
                        
                        //Password
                        Text("Password*").fontWeight(.bold).foregroundColor(Color(.white)).font(.title2)
                        //Type your password
                        ZStack(alignment:.leading){
                            if password.isEmpty{
                                Text("Enter a password").font(.caption)      .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                                .opacity(0.70)}
                            
                            SecureField("",text: $password)
                        }
                        
                        Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom).frame(width: 345,alignment: .trailing)
                
                Spacer(minLength: 15)

                
                //Confirm Password
                Text("Confirm Password*").fontWeight(.bold).foregroundColor(Color(.white)).font(.title2)
                //Type your Confirm password
                ZStack(alignment:.leading){
                    if confirmPassword.isEmpty{
                        Text("Confirm the password").font(.caption)      .foregroundColor(Color(red: 0.94, green: 0.94, blue: 0.94))
                        .opacity(0.70)}
                    
                    SecureField("",text: $confirmPassword)
                }
                
                Divider().frame(height: 1).background(Color("dark-cian")).padding(.bottom,5).frame(width: 345,alignment: .trailing)
                        
                
                
                
                Spacer(minLength: 50)
                
                
                
                
                //Buttons
                Button(action: SignupButton, label: {
                    Text("SIGN UP").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(Color("background-color")).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:18, leading:18, bottom: 18, trailing:18)).background(Color("dark-cian")).cornerRadius(12).overlay(RoundedRectangle(cornerRadius: 12).inset(by:0.5).stroke(Color("dark-cian"), lineWidth: 2.0).shadow(color:.white, radius: 6))
                })
                
                
                Spacer(minLength: 70)
                
                //Social Media
                VStack (alignment: .center){
                    Text("Log in with social media").foregroundStyle(.white)
                    HStack{
                        //Facebook
                        Button(action: Facebook, label: {
                            Text("Facebook").font(.callout).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing:10)).background(Color("blue-gray")).cornerRadius(8)
                        })
                        
                        //Google
                        Button(action: Google, label: {
                            Text("Google").font(.callout).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.white).frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .center).padding(EdgeInsets(top:10, leading:10, bottom: 10, trailing:10)).background(Color("blue-gray")).cornerRadius(8)
                        })
                    }
                }
                
               

                
            }.padding(.horizontal,77.0)
            
            
            
            
        }
        
        
    }
    
}

//Buttons Login

                           
func Facebook(){
print("Entry with facebook")}

func Google(){
    print("Entry with Google")
}
func TakePicture(){
    print("Take a picture")
}
func SignupButton(){
    print("Create Profile")

}




#Preview {
    ContentView()
}

