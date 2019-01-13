//
//  Player.h
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Player : NSObject


@property (nonatomic) NSInteger currentSquare;
@property (nonatomic, strong) NSDictionary<NSNumber*, NSNumber*>* gameLogic;
@property (nonatomic) BOOL gameOver;
@property (nonatomic, strong) NSString* name;

-(void) roll;
-(NSString *) score;

@end

NS_ASSUME_NONNULL_END
