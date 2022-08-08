//
//  ToDoView.swift
//  grindset
//
//  Created by Sydney Tsai on 6/9/22.
//

import SwiftUI

struct ToDoView: View {
    @State private var isSelected: Bool = false
    
    var body: some View {
        VStack{
            Button(action: {
                print("Pressed!")
            }){
            }.buttonStyle(PlainButtonStyle())
        }
    }
}
