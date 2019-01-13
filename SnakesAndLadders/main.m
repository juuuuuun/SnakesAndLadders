//
//  main.m
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "PlayerManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\nSNAKES AND LADDERS!");
        
        PlayerManager* playerManager = [[PlayerManager alloc] init];
        
        while(true) {
            NSLog(@"\nType number of players that will playing: ");
            char playerNumberInput[255];
            fgets(playerNumberInput, 255, stdin);
            NSString* playerNumberInputString = [[NSString stringWithUTF8String:playerNumberInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            if(playerNumberInputString.integerValue > 0) {
                [playerManager createPlayers:playerNumberInputString.integerValue];
                break;
            } else {
                NSLog(@"\nPlease input a valid positive integer number.");
            }
            
//            if([playerNumberInputString isEqualToString:@"quit"]) {
//                return 0;
//            }
        }
        
        while(true) {
            NSLog(@"\nType 'roll' or 'r' to roll dice.");
            
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
            
            NSLog(@"\n%@", inputString);
            
            if([inputString isEqualToString:@"roll"] ||
               [inputString isEqualToString:@"r"]) {
                [playerManager roll];
                NSLog(@"\n%@", [playerManager score]);
            }
            
            if(playerManager.gameOver == YES) {
                [playerManager restartGame];
                NSLog(@"\nLet's play again with same number of players!");
            }
            
            if([inputString isEqualToString:@"quit"]) {
                NSLog(@"\nWould you like to 'quit' or 'restart'?");
                char quitInput[255];
                fgets(quitInput, 255, stdin);
                NSString* quitString = [[[NSString stringWithUTF8String:quitInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] lowercaseString];
                
                if([quitString isEqualToString:@"quit"]) {
                    NSLog(@"\nThank you for playing!");
                    break;
                } else if([quitString isEqualToString:@"restart"]) {
                    [playerManager restartGame];
                    NSLog(@"\nLet's play again with same number of players!");
                }
            }
        }
    }
    return 0;
}
