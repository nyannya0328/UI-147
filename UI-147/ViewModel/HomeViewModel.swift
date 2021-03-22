//
//  HomeViewModel.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var cards = [
    
        Card(cardcolor: .red, title: "A"),
        Card(cardcolor: .orange, title: "B"),
        Card(cardcolor: .purple, title: "C"),
        Card(cardcolor: .green, title: "D"),
        Card(cardcolor: .pink, title: "E"),
        Card(cardcolor: .blue, title: "F")
    ]
    @Published var swipedCard = 0
    
    @Published var showCard = false
    @Published var selectedColor = Card(cardcolor: Color.clear, title: "")
    
    @Published var showcontent = false
    
    var content = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"

}

