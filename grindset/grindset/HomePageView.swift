//
//  HomePageView.swift
//  grindset
//
//  Created by Sydney Tsai on 6/9/22.
//

import SwiftUI

struct HomePageView: View {
    
    @State var showPomo = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Grindset")
                    .padding()
                    .font(.largeTitle)
                HStack (spacing: 30){
                    NavigationLink(destination: PomodoroView()) {
                        Text ("Pomodoro")
                    }
                    NavigationLink(destination: DecisionView()) {
                        Text ("Pick")
                    }
                    NavigationLink(destination: ToDoView()) {
                        Text ("To Do")
                    }
                }
            }
        }
    }
}
