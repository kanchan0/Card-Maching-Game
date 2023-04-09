//
//  ViewController.h
//  CardMatching
//
//  Created by Tiwari, Kanchan Kumar (Cognizant) on 14/04/21.

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

- (IBAction)flipCard:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UILabel *flipLabel;
@property (nonatomic)int flipCount;
@property(nonatomic, strong)Deck *deck;
@property(nonatomic,strong)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//- (NSString *) randonGen;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


// protected
// for subclass
// Abstract class must implement must describe method createDeck as described below
- (Deck *)createDeck;   //abstract      * In objective c there is no abstract keywords                       //which can be used to make class abstract. It is just a concept                     //and we have to document it to let other know it is abstract
@end

