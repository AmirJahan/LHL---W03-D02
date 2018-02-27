
#import "ViewController.h"
#import "MyCustomCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSMutableArray* items;

@property (nonatomic, weak) IBOutlet UITableView* myTableView;

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _myTableView.dataSource = self;
    _myTableView.delegate = self;

    _items = [[NSMutableArray alloc] initWithObjects:@"Vancouverite", @"Terraceite", @"Victorians", nil];

}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    MyCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    cell.topLabel.text = @"Ding";
    cell.subTitle.text = @"Doong";
    cell.subSubTitle.text = @"Diling";
    
    cell.imgView.backgroundColor = [UIColor blueColor];
    
    return cell;
    
}

- (NSInteger)tableView:(nonnull UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}


@end
