#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray* items;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] initWithObjects:@"Vancouver", @"Terrace", @"Victoria", nil];
    
    UIScrollView* mainScrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    
    
    mainScrollView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: mainScrollView];
    
    
    for (int i = 0; i < _items.count; i++)
    {
        int y = 96 * i;
        CellView* firstRow = [[CellView alloc] initWithFrame: CGRectMake(0, y, self.view.frame.size.width, 96)];
        [firstRow setupCellWithTitle:[_items objectAtIndex:i] andSubTitle:[_items objectAtIndex:i]];
        [mainScrollView addSubview: firstRow];
    }
    
    
    mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 96 * _items.count);

}
@end
