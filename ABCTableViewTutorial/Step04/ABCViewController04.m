#import "ABCViewController04.h"
#import "ABCOddNumbersModel04.h"

@interface ABCViewController04 () <UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ABCOddNumbersModel04 *numbersModel;

@end

@implementation ABCViewController04

static const NSInteger fromInteger = 1;
static const NSInteger toInteger = 100;

#pragma mark - Lifecycle

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect tableViewFrame = self.view.bounds;
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.numbersModel = [[ABCOddNumbersModel04 alloc] init];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[self.numbersModel oddIntegersFrom:fromInteger to:toInteger] count];
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"ABCTableViewCell";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
									  reuseIdentifier:CellIdentifier];
	}
    NSInteger rowIndex = indexPath.row;
    NSNumber *numberValue = [[self.numbersModel oddIntegersFrom:fromInteger to:toInteger] objectAtIndex:rowIndex];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", [numberValue intValue]];
	return cell;
}

@end
