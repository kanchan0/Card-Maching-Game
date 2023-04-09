//
//  PlayingCard.h
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import "Card.h"
@interface PlayingCard : Card

@property(strong,nonatomic)NSString *suit;
@property(nonatomic)NSUInteger rank;
+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end


