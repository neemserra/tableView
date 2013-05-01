#import <GHUnitIOS/GHUnit.h>
#import "ABCOddNumbersModel.h"

@interface ABCOddNumbersModel03Tests : GHTestCase

@property (nonatomic, strong) ABCOddNumbersModel *testObject;

@end

@implementation ABCOddNumbersModel03Tests

- (void) setUp {
    self.testObject = [[ABCOddNumbersModel alloc] init];
}

- (void)testSanity {
    // GHAssertEquals(0, 1, @"This breaks -- until you fix me!");
    GHAssertEquals(1, 1, @"Making sure 1 == 1!");
}

- (void)testListNumberOfOddValuesBetween1And10 {
    NSArray *listOfNumbers = [self.testObject oddIntegersFrom:1 to:10];
    NSInteger countOfNumbers = [listOfNumbers count];
    GHAssertTrue(countOfNumbers > 0, @"We should have more than zero numbers.");
}
@end
