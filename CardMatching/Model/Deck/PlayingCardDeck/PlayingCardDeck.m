//
//  PlayingCardDeck.m
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck

-(instancetype)init {
    self = [super init];       // this statement is written only in init almost never used elsewhere
    if(self) {
        for(NSString *suit in [PlayingCard validSuits]) {
                for(NSUInteger rank = 1; rank <= [PlayingCard maxRank];rank++) {
                        PlayingCard *card = [[PlayingCard alloc]init];
                        card.rank =rank;
                        card.suit = suit;
                        [self addCard:card];
                }
           }
     }
    return self;
}

@end
