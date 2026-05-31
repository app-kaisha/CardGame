//
//  GameView.swift
//  JG2026_CreateDeckOfCards
//
//  Created by app-kaihatsusha on 30/05/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

struct GameView: View {
    
    @State private var cards: [Card] = []
    @State private var selectedCard: Card = Card(suit: .clubs, rank: .ten)
    
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
            
            CardView(card: selectedCard, width: 100, height: 150, fontSize: 50)
            
        }
        .padding()
        .onAppear {
            guard cards.isEmpty else { return }
            populateDeck()
            cards.shuffle()
            selectedCard = cards.removeFirst()
            print("Selected Card: \(selectedCard.rank) of \(selectedCard.suit)")
            printStats()
            
        }
        
    }
    
    private func populateDeck() {
        for rank in Rank.allCases {
            for suit in Suits.allCases {
                cards.append(Card(suit: suit, rank: rank))
            }
        }
        
        //printStats()

    }
    
    private func printStats() {
        print("Deck size: \(cards.count)")
        //cards.forEach { $0.printCard() }
    }
}

#Preview {
    GameView()
}
