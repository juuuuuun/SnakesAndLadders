//
//  main.m
//  SnakesAndLadders
//
//  Created by Jun Oh on 2019-01-12.
//  Copyright © 2019 Jun Oh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"\nSNAKES AND LADDERS!");
        
        Player* playerOne = [[Player alloc] init];
        while(true) {
            NSLog(@"\nType 'roll' or 'r' to roll dice.");
            
            char userInput[255];
            fgets(userInput, 255, stdin);
            NSString* inputString = [[NSString stringWithUTF8String:userInput] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"\n%@", inputString);
            
            if([inputString isEqualToString:@"roll"] ||
               [inputString isEqualToString:@"r"]) {
                [playerOne roll];
            }
            
            if(playerOne.gameOver == YES) {
                break;
            }
        }
    }
    return 0;
}
