//
//  Habit.swift
//  Habituator-iOS
//
//  Created by Adrian on 05.09.20.
//

import Foundation

struct Habit: Identifiable {
    var id = UUID()
    var name: String
    var timesCompleted: Int
}
