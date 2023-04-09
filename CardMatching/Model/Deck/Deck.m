//
//  Deck.m
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import "Deck.h"

@interface Deck()
@property(strong,nonatomic)NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *)cards {
     if(!_cards){
    _cards = [[NSMutableArray alloc]init];      //doing this in getter insures that card is there
    }
         return _cards;
   }

-(void) addCard:(Card *)card atTop:(BOOL)atTop {
    if(atTop) {
        [self.cards insertObject:card atIndex:0];   //insertObject let us insert at specific index
    } else {
        [self.cards addObject:card]; //addObject is method of NSMutableArray to add element at end
    }
}

- (void) addCard:(Card *)card {
    [self addCard:card atTop:NO];           //doing this we are making second arg null
}

- (Card *)drawRandomCard {
    Card *randomCard = nil;

    if([self.cards count]) {
    unsigned index = arc4random() % [self.cards count];   // arc4randon is a random generator
    randomCard = self.cards[index];
    [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
