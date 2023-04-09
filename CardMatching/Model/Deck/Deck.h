//
//  Deck.h
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;
- (Card *)drawRandomCard;
@end


