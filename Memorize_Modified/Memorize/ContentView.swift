//
//  ContentView.swift
//  Memorize
//
//  Created by Nandini Saha on 2022-08-22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    var body: some View {
        //VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.horizontal, 10.0)
//            Spacer(minLength: 20)
//            HStack{
//                remove
//                Spacer()
//                add
//            }
//            .font(.largeTitle)
//            .padding(.horizontal, 10.0)
      //  }
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 25)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.foregroundColor(.red)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MemoryGameViewModel()
        Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.light)
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
