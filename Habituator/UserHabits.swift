//
//  Habits.swift
//  Habituator-iOS
//
//  Created by Adrian on 05.09.20.
//

import SwiftUI

class UserHabits: ObservableObject {
    @Published var habits = [Habit]()
}
