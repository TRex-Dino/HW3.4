//
//  ContentView.swift
//  HW3.4
//
//  Created by Dmitry on 11.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 100.0
    @State private var currentValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    private var alphaValue: Int {
        let difference = abs(lround(targetValue) - currentValue)
        return 100 - difference
    }
    private var message: String {
        alphaValue >= 99 ?  "You're the best!" : "You can better!"
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Подвиньте слайдер,\n как можно ближе к: \(currentValue)")
                .multilineTextAlignment(.center)
            
            HStack(spacing: 20) {
                Text("0")
                SliderUIkit(value: $targetValue, alpha: Double(alphaValue) / 100)
                Text("100")
            }
            
            Button("Проверь меня!", action: checkMeOut)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Your score: \(alphaValue)"), message: Text(message))
                }
            
            Button("Начать заново", action: newGame)
        }
        .padding()
    }
    
    private func checkMeOut() {
        showAlert.toggle()
    }
    
    private func newGame() {
        currentValue = Int.random(in: 0...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
