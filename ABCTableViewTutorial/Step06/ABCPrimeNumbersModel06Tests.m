#import <GHUnitIOS/GHUnit.h>
#import "ABCNumbersModel.h"
#import "ABCPrimeNumbersModel06.h"

@interface ABCPrimeNumbersModel06Tests : GHTestCase

@property (nonatomic, strong) id<ABCNumbersModel> testObject;

@end

@implementation ABCPrimeNumbersModel06Tests

- (void)setUp {
    self.testObject = [[ABCPrimeNumbersModel06 alloc] init];
}

- (void)testListNumberOfOddValuesBetween1And10 {
    NSArray *listOfNumbers = [self.testObject integersFrom:1 to:10];
    NSInteger countOfNumbers = [listOfNumbers count];
    GHAssertTrue(countOfNumbers > 0, @"We should have more than zero numbers.");
}

- (void)testCountOfOddValuesBetween1And20 {
    NSArray *listOfNumbers = [self.testObject integersFrom:1 to:20];
    NSInteger expectedCountOfNumbers = [listOfNumbers count];
    GHAssertEquals(expectedCountOfNumbers, 8, @"We should have 8 numbers.");
}

- (void)testActualOddValuesBetween14And22 {
	NSArray *actualOddValues = [self.testObject integersFrom:14 to:20];
	NSInteger expectedCountOfNumbers = [actualOddValues count];
	NSArray *expectedOddValues = @[@17,@19];
	GHAssertEquals(expectedCountOfNumbers, 2, @"We should have 2 prime numbers.");
	GHAssertEqualObjects(expectedOddValues, actualOddValues, @"Values should be equal");
}

@end
