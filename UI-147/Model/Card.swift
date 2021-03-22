//
//  Card.swift
//  UI-147
//
//  Created by にゃんにゃん丸 on 2021/03/21.
//

import SwiftUI

struct Card: Identifiable {
    var id = UUID().uuidString
    var cardcolor : Color
    var offset : CGFloat = 0
    var title : String
}


