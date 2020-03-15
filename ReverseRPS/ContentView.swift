//
//  ContentView.swift
//  ReverseRPS
//
//  Created by Nicholas Maccharoli on 2020/03/15.
//  Copyright © 2020 Nicholas Maccharoli. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var gameInProgress: Bool = false
    @State var score: Int = 0
    @State var reverseAnswer: Bool = Bool.random()
    @State var currentQuestion: RPS = RPS.allCases.randomElement()!
    
    func resetGame() {
        reverseAnswer = Bool.random()
        score = 0
        currentQuestion = RPS.allCases.randomElement()!
    }
    
    var topBanner: some View {
        Text("Rock, Paper Scissors!")
            .fontWeight(.heavy)
    }
    
    var startStopButton: some View {
        Button(action: {
            self.gameInProgress.toggle()
            self.resetGame()
        }) {
            Text(gameInProgress ? "END GAME" : "START")
                .font(Font.body)
            
        }
        .foregroundColor(Color.white)
        .frame(width: CGFloat(300.0))
        .padding(.vertical, CGFloat(20.0))
        .background( gameInProgress ? Color.red : Color.green)
        .clipShape(Capsule())
    }
    
    var playButtons: some View {
        PlayButtons(options: RPS.allCases, action: { choice in
            let isGeneralVictory = choice.isVictoryAgainst(self.currentQuestion)
            let win = self.reverseAnswer ? !isGeneralVictory : isGeneralVictory
            
            if win {
                self.score += 10
            } else {
                self.score -= 10
            }
            
            self.currentQuestion = RPS.allCases.randomElement()!
            self.reverseAnswer.toggle()
        })
    }
    
    var questionPrompt: some View {
        VStack(spacing: 50.0) {
            Text(currentQuestion.title)
                .font(Font.largeTitle)
                .fontWeight(Font.Weight.heavy)
            
            Text("Whats the " + (reverseAnswer ? "loosing answer" : "winning answer") + "?")
            
            Text(gameInProgress ? "Score: \(score)" : "")
        }
    }
    
    var body: some View {
        VStack(spacing: 50.0) {
            topBanner
            
            if gameInProgress {
                questionPrompt
                playButtons
            }
            
            startStopButton
        }
    }
}


struct PlayButtons: View {
    var options: [RPS]
    var action: (RPS) -> Void
    var body: some View {
        HStack {
            ForEach(options, id: \.self) { option in
                Button(action: {
                    self.action(option)
                }, label: { Text(option.title)})
                    .pillButton()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
