//
//  CardView.swift
//  JG2026_CreateDeckOfCards
//
//  Created by app-kaihatsusha on 30/05/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct CardView: View {
    
    @State var card: Card = Card(suit: .hearts, rank: .queen)
    
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
                    .font(.system(size: 20))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)
            }
            .frame(width: 50, height: 75)
        }
    }
}

#Preview {
    CardView()
}
