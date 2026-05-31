//
//  CardView.swift
//  JG2026_CreateDeckOfCards
//
//  Created by app-kaihatsusha on 30/05/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    let card: Card
    
    private let width: CGFloat
    private let height: CGFloat
    private let fontSize: CGFloat
    
    init(card: Card = Card(suit: .spades, rank: .two), width: CGFloat = 50, height: CGFloat = 75, fontSize: CGFloat = 20) {
        self.card = card
        self.width = width
        self.height = height
        self.fontSize = fontSize
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundStyle(.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray, lineWidth: 2)
                    }
                Text("\(card.suit.rawValue)\(card.rank.type)")
                    .font(.system(size: fontSize))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(width: width, height: height)
        }
    }
}

#Preview {
    CardView(card: Card(suit: .spades, rank: .ace))
}
