#import "ABCOddNumbersModel04.h"

@implementation ABCOddNumbersModel04

// First draft (part of wiring)
//- (NSArray *)oddIntegersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
//    return nil;
//}

// First solution that fixed the first test
//       -testListNumberOfOddValuesBetween1And10
//- (NSArray *)oddIntegersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
//    return @[@1];
//}

// Second solution that returned 10 values for test:
//       -testListNumberOfOddValuesBetween1And20
//- (NSArray *)oddIntegersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
//    return @[@1,@1,@1,@1,@1,@1,@1,@1,@1,@1];
//}

// Third solution that works for all tests so far
//       
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
