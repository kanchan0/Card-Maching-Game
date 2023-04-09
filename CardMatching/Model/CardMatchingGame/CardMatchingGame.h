//
//  CardMatchingGame.h
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 20/04/21.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

//this is my designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly)NSInteger score;
@end


