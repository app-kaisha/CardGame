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
    @State private var player1Cards: [Card] = []
    
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
            
            ScrollView(.vertical) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 66))]) {
                    ForEach(player1Cards) { playerCard in
                        CardView(card: playerCard, width: 66, height: 100)
                            .onTapGesture {
                                if playerCard.suit == selectedCard.suit || playerCard.type == selectedCard.type {
                                    // Find Tapped card in player1Array
                                    if let selectedIndex = player1Cards.firstIndex(where: { $0.id == playerCard.id }) {
                                        // found card - remvove and put in selected card
                                        selectedCard = player1Cards.remove(at: selectedIndex)
                                    }
                                } else {
                                    // TODO: Something to feedback no move
                                }
                            }
                    }
                }
            }
            
            Button("Pick a Card") {
                guard !cards.isEmpty else { return }
                let randomIndex = Int.random(in: 0...cards.count-1)
//                player1Cards.append(cards.remove(at: randomIndex))
                player1Cards.insert(cards.remove(at: randomIndex), at: 0)
                printStats()
            }
            .buttonStyle(.glassProminent)
            .tint(.red)
            .font(.title2)
            
            
//            ScrollView(.horizontal) {
//                LazyHStack {
//                    ForEach(player1Cards) { playerCard in
//                        CardView(card: playerCard, width: 66, height: 100)
//                    }
//                }
//            }
            
        }
        .padding()
        .onAppear {
            guard cards.isEmpty else { return }
            populateDeck()
            cards.shuffle()
            selectedCard = cards.removeFirst()
            print("Selected Card: \(selectedCard.rank) of \(selectedCard.suit)")
            printStats()
            for i in 0...4 {
                player1Cards.append(cards.removeFirst())
            }
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
