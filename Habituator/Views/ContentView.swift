//
//  ContentView.swift
//  Habituator-iOS
//
//  Created by Adrian B. Haeske on 04.09.20.
//

import SwiftUI

struct ContentView: View {
    
    
    @ObservedObject var userHabits = UserHabits()
    @State private var showingNewHabitSheet = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    ForEach(userHabits.habits) {
                        HabitTileView(name: $0.name, timesCompleted: $0.timesCompleted)
                    }
                    .navigationBarTitle("Gewohnheiten")
                    .navigationBarItems(trailing: Button("Neue Gewohnheit") { self.showingNewHabitSheet = true }
                    )
                })
                .frame(height: geo.size.height)
                .frame(maxWidth: .infinity)
                .padding(.top)
            }
        }
        .sheet(isPresented: $showingNewHabitSheet, content: {
            AddHabitView(userHabits: userHabits)
        })
        .onAppear(perform: generateRandomHabits)
    }
    
    func generateRandomHabits() {
        let habit1 = Habit(name: "Morgendehnung", timesCompleted: 2)
        let habit2 = Habit(name: "Kurzsport", timesCompleted: 5)
        let habit3 = Habit(name: "Drei Früchte essen", timesCompleted: 8)
        
        userHabits.habits.append(habit1)
        userHabits.habits.append(habit2)
        userHabits.habits.append(habit3)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        
    }
}
