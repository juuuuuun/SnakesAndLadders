//
//  Player.m
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        _currentSquare = 0;
        _gameLogic = @{
                       // Ladders
                       @4 : @14,
                       @9 : @31,
                       @20 : @38,
                       @28 : @84,
                       @40 : @59,
                       @51 : @67,
                       @63 : @81,
                       
                       // Snakes
                       @17 : @7,
                       @64 : @60,
                       @89 : @26,
                       @95 : @75,
                       @99 : @78
                       };
        _gameOver = NO;
    }
    return self;
}

-(void)roll {
    int rollValue = arc4random_uniform(6)+1;
    self.currentSquare += rollValue;
    NSLog(@"\nYou rolled a %i", rollValue);
    NSLog(@"\nYou landed on %li", self.currentSquare);
    
    if(self.currentSquare >= 100) {
        NSLog(@"\nYOU WIN!");
        self.gameOver = YES;
    }
    
    if( self.gameLogic[@(self.currentSquare)] != nil ) {
        NSInteger oldSpace = self.currentSquare;
        self.currentSquare = [self.gameLogic[@(self.currentSquare)] integerValue];
        if(oldSpace > self.currentSquare) {
            NSLog(@"\nLanded on snake!");
            NSLog(@"\nYou fell from %li to %li", oldSpace, self.currentSquare);
        } else {
            NSLog(@"\nStairway to heaven!");
            NSLog(@"\nYou jumped from %li to %li", oldSpace, self.currentSquare);
        }
        
    }
}

@end
