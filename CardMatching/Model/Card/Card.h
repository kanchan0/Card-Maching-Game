//
//  Card.h
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 16/04/21.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property(strong, nonatomic)NSString *contents;
@property(nonatomic,getter=isChoosen)BOOL chosen;
@property(nonatomic, getter=isMatched)BOOL matched;

- (int)match:(NSArray *)otherCards;

@end


