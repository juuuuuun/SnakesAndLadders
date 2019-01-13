//
//  PlayerManager.h
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayerManager : NSObject

@property (nonatomic, strong) NSMutableArray<Player*>* players;
@property (nonatomic) NSInteger currentIndex;
@property (nonatomic) BOOL gameOver;

- (void) createPlayers:(NSInteger)numberOfPlayers;

- (void) roll;
- (Player *) currentPlayer;
- (NSString *) score;
- (void) restartGame;


@end

NS_ASSUME_NONNULL_END
