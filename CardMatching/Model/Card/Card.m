//
//  Card.m
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import "Card.h"
@interface Card()

@end

@implementation Card

- (int)match:(NSArray *)otherCards{
    int score=0;
    for(Card *card in otherCards){
        if ([card.contents isEqualToString:self.contents]) {
            score=1;
        }
    }
    return score;
}
@end
