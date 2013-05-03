//
//  ABCOddNumbersModel.m
//  ABCTableViewTutorial
//
//  Created by dev1 on 4/26/13.
//  Copyright (c) 2013 Asynchrony. All rights reserved.
//

#import "ABCOddNumbersModel.h"

@implementation ABCOddNumbersModel

- (NSArray *)oddIntegersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
    NSInteger isEven = (fromInteger % 2 == 0);
    if (isEven) {
        ++fromInteger;
    }
    NSMutableArray *oddIntegerArray = [[NSMutableArray alloc] init];
    for (int oddInteger = fromInteger; oddInteger < toInteger; oddInteger += 2) {
        [oddIntegerArray addObject:[NSNumber numberWithInt:oddInteger]];
    }
    return oddIntegerArray;
}

@end
