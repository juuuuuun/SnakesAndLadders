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
    NSLog(@"\n%@ rolled a %i", self.name, rollValue);
    NSLog(@"\n%@ landed on %li", self.name, self.currentSquare);
    
    if(self.currentSquare >= 100) {
        self.gameOver = YES;
    }
    
    if( self.gameLogic[@(self.currentSquare)] != nil ) {
        NSInteger oldSpace = self.currentSquare;
        self.currentSquare = self.gameLogic[@(self.currentSquare)].integerValue;
        if(oldSpace > self.currentSquare) {
            NSLog(@"\nLanded on snake!");
            NSLog(@"\n%@ fell from %li to %li", self.name, oldSpace, self.currentSquare);
        } else {
            NSLog(@"\nStairway to heaven!");
            NSLog(@"\n%@ jumped from %li to %li", self.name, oldSpace, self.currentSquare);
        }
        
    }
}

- (NSString *)score {
    return [NSString stringWithFormat:@"%@: %li", self.name, self.currentSquare];
}

@end
