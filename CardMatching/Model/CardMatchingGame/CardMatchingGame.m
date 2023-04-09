//
//  CardMatchingGame.m
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 20/04/21.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
    @property(nonatomic,readwrite)NSInteger score;
@property(nonatomic,strong)NSMutableArray *cards;     // this of class Card
@end

@implementation CardMatchingGame

- (NSMutableArray *)cards{      //this is called lazy initialization
    if(!_cards){
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if(self){
        for (int i = 0; i< count; i++) {
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}
static const int MISMATCH_PENALITY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChoosen){
            card.chosen = NO;
        }else{
            // match against another card
            for(Card *otherCard in self.cards){
                if(otherCard.isChoosen && !otherCard.isMatched){
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore){
                        self.score += matchScore*MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else{
                        self.score -= MISMATCH_PENALITY;
                        otherCard.chosen = NO;
                    }
                    break;
              }
        }
        self.score -= COST_TO_CHOOSE;
        card.chosen = YES;
    }
  }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count] ? self.cards[index] : nil);
}

@end
