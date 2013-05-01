#import "ABCOddNumbersModel06.h"

@implementation ABCOddNumbersModel06

- (NSArray *)integersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
    NSInteger isEven = (fromInteger % 2 == 0);
    if (isEven) {
        ++fromInteger;
    }
    NSMutableArray *oddIntegerArray = [[NSMutableArray alloc] init];
    for (int oddInteger = fromInteger; oddInteger < toInteger; oddInteger += 2) {
        [oddIntegerArray addObject:@(oddInteger)];
    }
    return oddIntegerArray;
}

@end
