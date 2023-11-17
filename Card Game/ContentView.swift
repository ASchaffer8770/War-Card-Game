//
//  ContentView.swift
//  Card Game
//
//  Created by Alex Schaffer on 11/5/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card13"
    
    @State var cpuCard = "card13"
    
    @State var playerScore = 0
    
    @State var cpuScore = 0
    
    
    var body: some View {
        
        ZStack {
            
            Image("background-cloth")
            
            VStack {
                
                Image("logo")
                
                HStack {
                    Image(playerCard)
                        .padding()
                    Image(cpuCard)
                        .padding()
                }.padding()
                
                Button(action: {
                    dealCards()
                }, label: {
                    Image("button")
                })
                
                
                HStack {
                    VStack {
                        Text("Player ").padding().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        Text(String(playerScore)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    }
                    VStack {
                        Text("Bot").padding().font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                        Text(String(cpuScore)).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).foregroundColor(.white)
                    }

                }
                
                    
            }
        }
        .foregroundColor(.green)
        .padding()
    }
    
    func dealCards() {
        //Randomizes players cards when deal button is pressed
        var playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        //Randomize CPU cards
        var cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
            
        //Update scores and decide winner
        if playerCardValue > cpuCardValue {
            //adding one to player card
            playerScore += 1
        }
        else if cpuCardValue > playerCardValue {
            //adding 1 to cpu score
            cpuScore += 1
        }
        else {
            //tie results in a new deal
            dealCards()
        }
    }
    
}

#Preview {
    ContentView()
}
