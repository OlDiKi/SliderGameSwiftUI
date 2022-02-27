//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Дмитрий Олейнер on 26.02.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue = Double.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                    .padding()
                SliderValue(currentValue: $currentValue, opacity:
                computeScore())
                    .frame(
                        height: 100)
                Text("100")
                    .padding()
            }
            
            VStack {
                
                Buttons(title: "Проверь меня!") {
                    showAlert.toggle()
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Your Score"),
                          message: Text("\(computeScore())"))
                }
                .padding()
            }
            
            Buttons(title: "Начать заново") {
                getNewGame()
            }
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    private func getNewGame() {
        targetValue = Int.random(in: 1...100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
