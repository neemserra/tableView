#import "ABCViewController06.h"
#import "ABCOddNumbersModel06.h"
#import "ABCPrimeNumbersModel06.h"

@interface ABCViewController06 () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) id<ABCNumbersModel> numbersModel;
@property (nonatomic, strong) UIButton *oddsButton;
@property (nonatomic, strong) UIButton *primesButton;
@property (nonatomic) BOOL inOddState;

@end

@implementation ABCViewController06

static const CGFloat kSectionHeight = 100.0f;
static const CGFloat kButtonHeight = 40.0f;
static const CGFloat kButtonWidth = 100.0f;
static const NSInteger fromInteger = 1;
static const NSInteger toInteger = 100;

#pragma mark - Lifecycle

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.inOddState = NO;
    
    CGRect tableViewFrame = self.view.bounds;
    self.tableView = [[UITableView alloc] initWithFrame:tableViewFrame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    self.numbersModel = [[ABCOddNumbersModel06 alloc] init];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = [[self.numbersModel integersFrom:fromInteger to:toInteger] count];
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
    NSNumber *numberValue = [[self.numbersModel integersFrom:fromInteger to:toInteger] objectAtIndex:rowIndex];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", [numberValue intValue]];
	return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kSectionHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    // Not necessarily the ideal way to build a section view ...
    // but adequate for our tutorial's purposes.
    
    // Actual parent view
    CGRect frame = self.view.bounds;
    frame.size.height = kSectionHeight;
    UIView *sectionView = [[UIView alloc] initWithFrame:frame];
    sectionView.backgroundColor = [UIColor colorWithWhite:0.90f alpha:1.0f];
    [self.view addSubview:sectionView];
    
    // The Odds Button
    UIButton *oddsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [oddsButton addTarget:self action:@selector(didSelectOdds:) forControlEvents:UIControlEventTouchUpInside];
    frame = CGRectMake(0.0f, 0.0f, kButtonWidth, kButtonHeight);
    oddsButton.frame = frame;
    [oddsButton setTitle:@"Odds" forState:UIControlStateNormal];
    [sectionView addSubview:oddsButton];
    oddsButton.enabled = self.inOddState;
    self.oddsButton = oddsButton;
    
    // The Primes Button
    UIButton *primesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [primesButton addTarget:self action:@selector(didSelectPrimes:) forControlEvents:UIControlEventTouchUpInside];
    primesButton.frame = frame;
    [primesButton setTitle:@"Primes" forState:UIControlStateNormal];
    [sectionView addSubview:primesButton];
    primesButton.enabled = !self.inOddState;
    self.primesButton = primesButton;
    
    // Positioning the Odds button
    CGPoint leftCenter = sectionView.center;
    leftCenter.x = leftCenter.x / 2;
    oddsButton.center = leftCenter;
    
    // Positioning the Primes button
    CGPoint rightCenter = sectionView.center;
    rightCenter.x = (rightCenter.x / 2) * 3;
    primesButton.center = rightCenter;
    
    // Done
    return sectionView;
}

#pragma mark - Event Handling

- (void)didSelectPrimes:(id)sender {
    self.inOddState = !self.inOddState;
    self.numbersModel = [[ABCPrimeNumbersModel06 alloc] init];
    self.primesButton.enabled = NO;
    self.oddsButton.enabled = YES;
    [self.tableView reloadData];
}

- (void)didSelectOdds:(id)sender {
    self.inOddState = !self.inOddState;
    self.numbersModel = [[ABCOddNumbersModel06 alloc] init];
    self.oddsButton.enabled = NO;
    self.primesButton.enabled = YES;
    [self.tableView reloadData];
}

@end
