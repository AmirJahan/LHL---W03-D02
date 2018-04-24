#import "ViewController.h"



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray* cities = [[NSArray alloc] initWithObjects:
                       @"Vancouver",
                       @"Burnaby",
                       @"Surrey",
                       @"Victoria",
                       @"Tornoto",
                       @"Terrace",
                       @"Kelowna", nil];
    
    CGFloat origY = 0;
    CGFloat height = 160;

    for ( NSString * any in cities)
    {
        // prototype cell
        UILabel* myLabel = [[UILabel alloc] init];
        myLabel.frame = CGRectMake(0,
                                   origY,
                                   self.view.frame.size.width,
                                   height);
        
        myLabel.text = any;
        [_myScrollView addSubview: myLabel];
        
        origY += height;
    }
    
    _myScrollView.contentSize = CGSizeMake(_myScrollView.frame.size.width,
                                           height * cities.count);
   
    
}

@end
