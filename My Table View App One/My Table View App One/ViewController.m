#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) NSMutableArray* items;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _items = [[NSMutableArray alloc] initWithObjects:@"Vancouverite", @"Terraceite", @"Victorians", nil];


}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [@"Delete " stringByAppendingString: [_items objectAtIndex:indexPath.row]];
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( editingStyle == UITableViewCellEditingStyleDelete)
    {
        [_items removeObjectAtIndex: indexPath.row];

        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject: indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}


// required
- (NSInteger)tableView:(nonnull UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}

// required
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    cell.textLabel.text = [_items objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [_items objectAtIndex: indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"gotoNextSegue" sender:indexPath];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"gotoNextSegue"])
    {
     
        NextViewController* nextVC = [segue destinationViewController];
        NSLog(@"%@",  [_items objectAtIndex: ((NSIndexPath *) sender).row]);
        
        nextVC.titleStr = [_items objectAtIndex: ((NSIndexPath *) sender).row];
    }
}











@end
