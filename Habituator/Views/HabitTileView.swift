//
//  HabitTile.swift
//  Habituator-iOS
//
//  Created by Adrian B. Haeske on 04.09.20.
//

import SwiftUI

struct HabitTileView: View {
    var name: String
    @State var timesCompleted: Int
    @State private var todayDone = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.green)
                .frame(width: 300, height: 100)
                .cornerRadius(48)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(name)
                        .foregroundColor(.white)
                        .font(.headline)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    Text("schon \(timesCompleted) Mal geschafft")
                        .foregroundColor(.white)
                }
                .padding()
                
                Spacer()
                
                if !todayDone {
                    Button(action: donePressed, label: {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 66)
                    })
                    .padding()
                } else {
                    Button(action: donePressed, label: {
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: 66)
                            
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 30)
                        }
                        
                    })
                    .padding()
                }
                
                
            }.padding()
        }
    }
    
    func donePressed() {
        if !todayDone { timesCompleted += 1 }
        else { timesCompleted -= 1 }
        
        todayDone.toggle()
    }
}

struct HabitTile_Previews: PreviewProvider {
    static var previews: some View {
        HabitTileView(name: "Morgendehnung", timesCompleted: 4)
    }
}
