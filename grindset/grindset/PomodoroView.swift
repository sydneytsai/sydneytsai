//
//  PomodoroView.swift
//  grindset
//
//  Created by Sydney Tsai on 6/8/22.
//

import SwiftUI

struct PomodoroView: View {
    @State var countDown = 0
    @State var timerRunning = false
    @State var sad = false
    @State var kim = Image("kim")
    @State var cardi = Image("cardi")
    @State var completed = 0;
    @State var isBreak = false
    @State private var selectedItem: Int = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func convertSecondsToTime(timeInSeconds : Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    var body: some View {
        VStack (spacing: 30) {
            Text("Pomodoro")
                .padding()
                .font(.largeTitle)
            Text(convertSecondsToTime(timeInSeconds: countDown))
                .font(.title2)
                .onReceive(timer) { _ in
                    if countDown > 0 && timerRunning {
                        countDown -= 1
                    } else {
                        if (!isBreak && timerRunning) {
                            completed += 1
                        }
                        timerRunning = false
                    }
                }
            HStack(spacing: 30) {
                Button("Work") {
                    countDown = 2700
                    isBreak = false
                    timerRunning = false
                    sad = false
                }
                Button("Break") {
                    countDown = 900
                    isBreak = true
                    timerRunning = false
                }
            }
            HStack(spacing: 30) {
                Button ("Start") {
                    if (countDown > 0) {
                        timerRunning = true
                    }
                    sad = false
                }
                Button ("Stop") {
                    timerRunning = false
                    sad = true
                }
                Button ("Reset") {
                    countDown = 0
                    timerRunning = false
                    sad = false
                    completed = 0
                    isBreak = false
                }.foregroundColor(.red)
            }
            ZStack {
                if sad && !isBreak && countDown > 0{
                    kim.resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
                } else {
                    kim.resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).opacity(0.0)
                }
                if isBreak && !timerRunning && countDown > 0 && countDown != 900 {
                    cardi.resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100)
                } else {
                    cardi.resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).opacity(0.0)
                }
            }
            Text("Completed: \(completed)")
        }
    }
}
