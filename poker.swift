// Enum для масти карты
enum Suit: String, CaseIterable {
    case clubs = "♣️"
    case diamonds = "♦️"
    case hearts = "♥️"
    case spades = "♠️"
}
// Enum для достоинства карты
enum Rank: Int, CaseIterable {
    case two = 2, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king, ace
}
// Класс для карты
class Card {
    let suit: Suit
    let rank: Rank
    
    init(suit: Suit, rank: Rank){
        self.suit=suit
        self.rank=rank
    }
    
    // Метод для получения масти + достоинства карты
    func getDescription() -> String {
        return "\(suit.rawValue)\(rank)"
    }
}

// Класс для колоды карт
class Deck {
    var cards: [Card]
    
    init() {
        cards = [Card]()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(suit: suit, rank: rank)
                cards.append(card)
            }
        }
    }
    
    // Метод для перемешивания карт в колоде
    func shuffle() {
        cards.shuffle()
    }

    // Метод для раздачи 5 карт с колоды
    func deal() -> [Card] {
        if(cards.count < 5){
            print("There are not enough cards in the deck")
            return []
        }
        else{
            var result = [Card]()
            for _ in 1...5{
                result.append(cards.removeFirst())
            }
 
            return result
        }
    }
}

// Класс руки
class Hand {
    var cards: [Card]

    init(cards: [Card]){
        self.cards=cards
    }
    
    // Метод для определения комбинации в руке
    func rank() -> String {

        let flush = cards.allSatisfy({$0.suit == cards[0].suit})
    
        
        let straight = cards.enumerated().allSatisfy({$0 == 4 || $1.rank.rawValue == cards[$0 + 1].rank.rawValue + 1})
        
        if flush && straight {
            if cards[0].rank == .ace && cards[4].rank == .ten {
                return "Royal flush"
            } else {
                return "Straight flush"
            }
        }
        
        if let quad = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 4}) {
            return "Quads \(quad.rank)"
        }
        
        if let triple = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 3}),
           let pair = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2 && card.rank != triple.rank}) {
            return "Full House \(triple.rank) and \(pair.rank)"
        }
        
        if flush {
            return "Flush \(cards.first!.suit)"
        }
        
        if straight {
            return "Straight to \(cards.first!.rank)"
        }
        
        if let triple = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 3}) {
            return "Set \(triple.rank)"
        }
        
        if let pair1 = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2}),
           let pair2 = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2 && card.rank != pair1.rank}) {
           
           
           return "Two pairs \(pair1.rank) and \(pair2.rank)"
        }
        
        if let pair = cards.first(where: {card in cards.filter({$0.rank == card.rank}).count == 2}) {
            return "Pair \(pair.rank)"
        }
        
        return "High card \(cards[0].rank)"
    }
    
    // Метод для получения информации о комбинации на руке
    func getDescription() -> String {

        cards.sort(by: {$0.rank.rawValue > $1.rank.rawValue})
        return "\(cards.map({$0.getDescription()}).joined(separator: " ")) - \(rank())"
    }
}

var deck = Deck()
deck.shuffle()

var hands: [Hand] = []

// Раздаем 10 рук
for _ in 1...10 {
    let hand = Hand(cards: deck.deal())
    hands.append(hand)
}

for hand in hands {
    print(hand.getDescription())
}