#import "NextViewController.h"

@interface NextViewController ()

@property (weak, nonatomic) IBOutlet UILabel *myLabel;


@end



@implementation NextViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _myLabel.text = _titleStr;
    
    
}

@end
