
#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "CyanViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;
@end

@implementation ViewController
NSMutableArray* cities;
NSMutableArray* countries;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    cities = [[NSMutableArray alloc] initWithObjects:
              @"Vancouver",
              @"Burnaby",
              @"Surrey",
              @"Victoria",
              @"Tornoto",
              @"Terrace",
              @"Kelowna", nil];
    
    countries = [[NSMutableArray alloc] initWithObjects:
                 @"Canada",
                 @"USA",
                 @"Brazil",
                 @"Argentina",
                 @"Chile", nil];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

// data source -> Number of Rows
// cell for row

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ( section == 0)
        return cities.count;
    else
        return countries.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell;
    
    if ( indexPath.row % 2 == 0)
    {
        cell =  (CustomTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"myTableViewCellId"];
        ((CustomTableViewCell *)cell).topImageView.backgroundColor = [UIColor cyanColor];
        ((CustomTableViewCell *)cell).topLabel.text = [cities objectAtIndex: indexPath.row];
        ((CustomTableViewCell *)cell).midLabel.text = @"Test";
        ((CustomTableViewCell *)cell).bottomLabel.text = @"Bottom";
        ((CustomTableViewCell *)cell).backgroundColor = [UIColor lightGrayColor];
        if ( indexPath.row % 2 == 0)
            cell.backgroundColor = [UIColor darkGrayColor];
    }

    else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"anotherCellId"];
        cell.textLabel.text = [cities objectAtIndex: indexPath.row];
    }
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
        return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if ( section == 0)
        return @"Cities";
    else
        return @"Countries";
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( editingStyle == UITableViewCellEditingStyleDelete)
    {
        if ( indexPath.section == 0)
            [cities removeObjectAtIndex: indexPath.row];
        else
            [countries removeObjectAtIndex: indexPath.row];
        
        
        NSArray* deleteableIndexPaths = [[NSArray alloc] initWithObjects:indexPath, nil];
        
        [tableView deleteRowsAtIndexPaths:deleteableIndexPaths withRowAnimation:UITableViewRowAnimationLeft];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* resText;
    
    if ( indexPath.section == 0)
        resText= [NSString stringWithFormat:@"Delete %@?", [cities objectAtIndex: indexPath.row]];
    else
        resText= [NSString stringWithFormat:@"Delete %@?", [countries objectAtIndex: indexPath.row]];
    
    return resText;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toDetailsSegueId"
                              sender:indexPath];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath* senderIndexPath = (NSIndexPath *)sender;
    
    CyanViewController* cyanVc = [segue destinationViewController];
    
    // then you do the hell you need to
    // vancouver ~ red backgournd
    if (senderIndexPath.row == [cities indexOfObject:@"Vancouver"])
    {
     
        cyanVc.view.backgroundColor = [UIColor redColor];
        
    }
}




@end
