//
//  NewHabit.swift
//  Habituator-iOS
//
//  Created by Adrian B. Haeske on 04.09.20.
//

import SwiftUI

struct AddHabitView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var userHabits: UserHabits
    
    @State private var name = ""
    var body: some View {
        NavigationView {
            
            
            VStack {
                Text("Was möchtest du dir angewöhnen?")
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding()
                
                TextField("z.B. 2l trinken", text: $name)
                    .padding(30)
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                
                Button("Hinzufügen") {
                    self.addHabit()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(16)
                
                Button("Abbrechen") {
                    self.presentationMode.wrappedValue.dismiss()
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("Neue Gewohnheit")
        }
        
    }
    
    func addHabit() {
        let newHabit = Habit(name: name, timesCompleted: 0)
        userHabits.habits.append(newHabit)
        self.presentationMode.wrappedValue.dismiss()
        
    }
}

struct NewHabit_Previews: PreviewProvider {
    static var previews: some View {
        let userHabits = UserHabits()
        NavigationView {
            AddHabitView(userHabits: userHabits)
        }
        .preferredColorScheme(.dark)
    }
}
