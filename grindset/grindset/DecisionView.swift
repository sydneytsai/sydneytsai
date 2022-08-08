//
//  DecisionView.swift
//  grindset
//
//  Created by Sydney Tsai on 6/9/22.
//

import SwiftUI

struct DecisionView: View {
    @State private var selectedItem: Int = 0
    @State var randomInt = 0
    @State var randomStringNum = 0
    @State private var min: String = ""
    @State private var max: String = ""
    @State var rng = 0
    @State var num = 0
    
    var body: some View {
        
        VStack(spacing: 30) {
            Text("Decision Maker")
                .padding()
                .font(.largeTitle)
            if selectedItem == 0 {
                Button("Flip Coin") {
                    randomInt = Int.random(in: 0..<2)
                }
                if randomInt == 0 {
                    Text("Heads")
                } else {
                    Text("Tails")
                }
            }
            
            if selectedItem == 1 {
                VStack(spacing: 30) {
                    Button(action: {
                        randomStringNum = Int.random(in: 0..<9)
                    }) {
                        Image("8ball")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                    }
                    if randomStringNum == 0 {
                        Text("Reply hazy, try again.")
                    } else {
                        if randomStringNum == 1 {
                            Text("Without a doubt.")
                        } else {
                            if randomStringNum == 2 {
                                Text("My reply is no.")
                            } else {
                                if randomStringNum == 3 {
                                    Text("Concentrate and ask again.")
                                } else {
                                    if randomStringNum == 4 {
                                        Text("Signs point to yes.")
                                    } else {
                                        if randomStringNum == 5 {
                                            Text("Outlook not so good.")
                                        } else {
                                            if randomStringNum == 6 {
                                                Text("Ask again later.")
                                            } else {
                                                if randomStringNum == 7 {
                                                    Text(" It is decidedly so.")
                                                } else {
                                                    if randomStringNum == 8 {
                                                        Text("Very doubtful.")
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Text("Ask me a question and press the button.")
                    .italic()
            }
            if selectedItem == 2 {
                VStack (spacing: 30) {
                    HStack (alignment: .center) {
                        TextField("Minimum", text: $min)
                            .multilineTextAlignment(.center)
                        TextField("Maximum", text: $max)
                            .multilineTextAlignment(.center)
                    }
                    Button("Generate") {
                        rng = Int.random(in: (Int(min) ?? 0)..<(Int(max) ?? 10)+1)
                    }
                    Text(String(rng))
                }
            }
            Spacer()
            VStack {
                Picker("Type", selection: $selectedItem) {
                    Text("Coin").tag(0)
                    Text("8 Ball").tag(1)
                    Text("RNG").tag(2)
                }
            }
            .padding()
        }
    }
}
