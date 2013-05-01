#import "ABCPrimeNumbersModel06.h"

@implementation ABCPrimeNumbersModel06

- (NSArray *)integersFrom:(NSInteger)fromInteger to:(NSInteger)toInteger {
    // 1st test (might be hard coded)
    // 2nd test (might count 'from' to 'to' by 2s)
    // 3nd test (real prime alg)
    
    NSMutableArray *allPrimes = [[NSMutableArray alloc] init];
    NSMutableArray *primesInRange = [[NSMutableArray alloc] init];
    
    for (int i = 2; i <= toInteger; ++i) {
        int potentialPrime = i;
        BOOL success = YES;
        for (int j = 0; j < [allPrimes count]; ++j) {
            int existingPrime = [[allPrimes objectAtIndex:j] intValue];
            NSInteger mod = (potentialPrime % existingPrime);
            BOOL isNotPrime = (mod == 0);
            if (isNotPrime) {
                success = NO;
                break;
            }
        }
        if (success) {
            [allPrimes addObject:[NSNumber numberWithInt:potentialPrime]];
            if (potentialPrime >= fromInteger && potentialPrime <= toInteger) {
                [primesInRange addObject:[NSNumber numberWithInt:potentialPrime]];
            }
        }
    }
    return primesInRange;
}

@end
