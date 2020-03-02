//
//  ContentView.swift
//  Homework3-SP20
//
//  Created by Nick Claffey on 3/1/20.
//  Copyright © 2020 iOS Class. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var coin1 = Image("cent")
    
    @State var coin2 = Image("cent")
    
    @State var coin3 = Image("cent")
    
    @State var flip1Disable = false
    
    @State var flip2Disable = false
    
    @State var flip3Disable = false
    
    @State var alertIsVisble = false
    
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Spacer()
                self.coin1
                Spacer()
                self.coin2
                Spacer()
                self.coin3
                Spacer()

            }
            Spacer()
            HStack{
            Spacer()
                Button(action: {
                    self.coin1 = flipCoin()
                    self.flip1Disable = true
                    self.isGameOver()
                         
                }){
                    Text("Flip coin 1")
                }.alert(isPresented: $alertIsVisble){
                () -> Alert in
                    return Alert(title: Text("Thanks for Playing!"), message: Text(self.winOrLose()), dismissButton: .default(Text("Ok")))}
                .disabled(self.flip1Disable)
                Spacer()
                Button(action:{
                    self.coin2 = flipCoin()
                    self.flip2Disable = true
                    self.isGameOver()
                
                }){
                    Text("Flip coin 2")
                }.alert(isPresented: $alertIsVisble){
                () -> Alert in
                    return Alert(title: Text("Thanks for Playing!"), message: Text(self.winOrLose()), dismissButton: .default(Text("Ok")))}
                .disabled(self.flip2Disable)
                Spacer()
                Button(action:{
                    self.coin3 = flipCoin()
                    self.flip3Disable = true
                    self.isGameOver()
            
                }){
                    Text("Flip coin 3")
                }.alert(isPresented: $alertIsVisble){
                    () -> Alert in
                    return Alert(title: Text("Thanks for Playing!"), message: Text(self.winOrLose()), dismissButton: .default(Text("Ok")))
                }.disabled(self.flip3Disable)
                    
                Spacer()
                
            }
            Spacer()
        Button(action:{
            self.resetGame()
        }){
                Text("Reset")
            }
            Spacer()
            
            
            
        }
       
    }
    

        
    func isGameOver(){
        if(flip1Disable == true && flip2Disable == true && flip3Disable == true){
            self.alertIsVisble = true
        }
        
    }
    
    func winOrLose() -> String{
        if((self.coin1 == Image("head") && self.coin2 == Image("head") && self.coin3 == Image("head")) || (self.coin1 == Image("tail") && self.coin2 == Image("tail") && self.coin3 == Image("tail"))){
            return "Winner! Press Reset to Play Aagain!"
        }
        return "Better Luck Next Time"
    }
    
    func resetGame(){
        self.coin1 = Image("cent")
        self.coin2 = Image("cent")
        self.coin3 = Image("cent")
        
        self.flip1Disable = false
        self.flip2Disable = false
        self.flip3Disable = false
        
        self.alertIsVisble = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func flipCoin() -> Image{
    let coinFace = Int.random(in: 1...2)
    if(coinFace == 1){
       return Image("head")
    }else{
       return Image("tail")
    }
    
}



//Example of a function - takes in 3 string variables and returns a string
//func checkWin(varName: String, varName: String, varName: String) -> String {}
