//
//  MainView.swift
//  JG2026_CreateDeckOfCards
//
//  Created by app-kaihatsusha on 30/05/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @State private var cards: [Card] = []
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                    ForEach(cards) { card in
                        CardView(card: card)
                    }
                }
                .scrollIndicators(.hidden)
            }
            .onAppear {
                guard cards.isEmpty else { return }
                populateDeck()
            }
        }
        .padding()
    }
    
    private func populateDeck() {
        for rank in Rank.allCases {
            for suit in Suits.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        
        //        print("Deck size: \(cards.count)")
        //        cards.forEach { $0.printCard() }
    }
}

#Preview {
    MainView()
}
