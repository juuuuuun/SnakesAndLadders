//
//  PlayerManager.m
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import "PlayerManager.h"


@implementation PlayerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        _players = [[NSMutableArray alloc] init];
        _currentIndex = 0;
        _gameOver = NO;
    }
    return self;
}

- (void)createPlayers:(NSInteger)numberOfPlayers {
    for(int i = 0; i < numberOfPlayers; i++) {
        Player* player = [[Player alloc] init];
        player.name = [NSString stringWithFormat:@"player%i", i+1];
        
        [self.players addObject:player];
    }
}

- (void)roll {
    [[self currentPlayer] roll];
    if([self currentPlayer].gameOver == YES) {
        self.gameOver = YES;
        NSLog(@"\n%@ WINS!", [self currentPlayer].name);
    }
    self.currentIndex++;
}

- (Player *)currentPlayer {
    return self.players[self.currentIndex % self.players.count];
}

- (NSString *)score {
    NSMutableString* scoreToReturn = [[NSMutableString alloc] init];
    for(Player* player in self.players) {
        [scoreToReturn appendFormat:@"%@, ", [player score]];
    }
    [scoreToReturn replaceCharactersInRange:NSMakeRange(scoreToReturn.length-2, 2) withString:@""];
    return scoreToReturn;
}

- (void)restartGame {
    NSInteger numberOfPlayers = self.players.count;
    [self.players removeAllObjects];
    [self createPlayers:numberOfPlayers];
    self.gameOver = NO;
    self.currentIndex = 0;
}
@end
