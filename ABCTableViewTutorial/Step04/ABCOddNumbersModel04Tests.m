#import <GHUnitIOS/GHUnit.h>
#import "ABCOddNumbersModel04.h"

@interface ABCOddNumbersModel04Tests : GHTestCase

@property (nonatomic, strong) ABCOddNumbersModel04 *testObject;

@end

@implementation ABCOddNumbersModel04Tests

- (void)setUp {
    self.testObject = [[ABCOddNumbersModel04 alloc] init];
}

- (void)testListNumberOfOddValuesBetween1And10 {
    NSArray *listOfNumbers = [self.testObject oddIntegersFrom:1 to:10];
    NSInteger countOfNumbers = [listOfNumbers count];
    GHAssertTrue(countOfNumbers > 0, @"We should have more than zero numbers.");
}

- (void)testCountOfOddValuesBetween1And20 {
    NSArray *listOfNumbers = [self.testObject oddIntegersFrom:1 to:20];
    NSInteger expectedCountOfNumbers = [listOfNumbers count];
    GHAssertEquals(expectedCountOfNumbers, 10, @"We should have 10 numbers.");
}

- (void)testActualOddValuesBetween14And22 {
	NSArray *actualOddValues = [self.testObject oddIntegersFrom:14 to:22];
	NSInteger expectedCountOfNumbers = [actualOddValues count];
	NSArray *expectedOddValues = @[@15,@17,@19,@21];
	GHAssertEquals(expectedCountOfNumbers, 4, @"We should have 4 numbers.");
	GHAssertEqualObjects(expectedOddValues, actualOddValues, @"Values should be equal");
}

@end
