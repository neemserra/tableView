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

- (void)testOddIntegersFrom1To10Returns5Numbers {
    NSArray *listOfOddNumbers = [self.testObject oddIntegersFrom:1 to:10];
    
    GHAssertEquals([listOfOddNumbers count], 5, @"We should end up with 5 odd integers.");
}

- (void)testOddIntegersFrom1To20Returns10Numbers {
    NSArray *listOfNumbers = [self.testObject oddIntegersFrom:1 to:20];
    
    GHAssertEquals([listOfNumbers count], 10, @"We should have 10 numbers.");
}

- (void)testOddIntegersFrom14To22Returns4SpecificOddValues {
    NSArray *expectedOddValues = @[@15,@17,@19,@21];
    NSArray *actualOddValues = [self.testObject oddIntegersFrom:14 to:22];
    NSInteger countOfNumbers = [actualOddValues count];
    GHAssertEquals(expectedCountOfNumbers, 4, @"We should have 4 numbers.");
    
    GHAssertEqualObjects([actualOddValues count], expectedOddValues, @"Values should be equal");
}

@end
