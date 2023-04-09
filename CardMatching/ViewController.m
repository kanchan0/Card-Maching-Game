//
//  ViewController.m
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 14/04/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (Deck *)deck {
    if(!_deck){
        _deck = [self createDeck];
    }
    return _deck;
}

- (CardMatchingGame *)game{
    if(!_game){
        _game =[[CardMatchingGame alloc]initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    }
    return _game;
}


- (Deck *)createDeck {     // abstract method
    return nil;
}
- (void)setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipLabel.text = [NSString stringWithFormat:@"Flips : %d",self.flipCount];
    NSLog(@"Flipcount :  %d",self.flipCount);
}

/*
- (NSString *) randonGen{
    NSUInteger len = 13;
    NSUInteger len1 = 4;
    NSArray *arr = @[@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"K",@"Q",@"J"];
    NSArray *arr1 = @[@"♥️",@"♦️",@"♠️",@"♣️",];
    u_int32_t r = arc4random() % len;
    u_int32_t p = arc4random() % len1;
    NSString *str = [NSString stringWithFormat:@"%@ %@",arr[r],arr1[p]];
    NSLog(@"%@",str);
    return str;
}
 */

/*
- (IBAction)flipCard:(UIButton *)sender {
    
    //UIImage *cardImage = [UIImage imageNamed:@"cardLogo"];
    //[sender setBackgroundImage:cardImage forState:UIControlStateNormal];
    
    //OR
    
    // [sender setBackgroundImage:[UIImage imageNamed:@"cardLogo"] forState:UIControlStateNormal];
    
    
    if([sender.currentTitle length]==0) {
        Card *card = [self.deck drawRandomCard];
        if(card){      // this will make sure that when deck is over it doesn't flip
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
        }
       
    }else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardLogo"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    self.flipCount++; // it is calling both getter and setter for flipCount
}
 
 */

- (IBAction)flipCard:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    for(UIButton *cardbutton in self.cardButtons){
        int cardIndex = [self.cardButtons indexOfObject:cardbutton];
        Card *card = [self.game cardAtIndex:cardIndex];
        [cardbutton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardbutton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardbutton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score : %ld",(long)self.game.score];
    }
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChoosen ? card.contents:@"";
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return [UIImage imageNamed:card.isChoosen ?@"cardfront":@"cardLogo"];
}
@end
