

#import "ViewController.h"



@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIDatePicker* myDatePickerView = [[UIDatePicker alloc] initWithFrame: CGRectMake(0, 0, 0, 0)];
    
    [myDatePickerView setDatePickerMode: UIDatePickerModeCountDownTimer];
    [myDatePickerView setDatePickerMode: UIDatePickerModeDate];
    
    [myDatePickerView addTarget:self
                         action:@selector(getDate:)
               forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview: myDatePickerView];
}


-(void)getDate:(id)sender
{
    NSDate* someDate = [sender date];
    NSString* dateDes = [someDate descriptionWithLocale: [NSLocale currentLocale]];
    
    NSLog(@"%@", dateDes);
    
    
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* compoNents = [calendar components:
                                    NSCalendarUnitYear|
                                    NSCalendarUnitMonth|
                                    NSCalendarUnitDay
                                               fromDate:someDate];
    
    int monthInt = (int) [compoNents month];
    int dayInt = (int) [compoNents day];
    
    NSString* dayID = [NSString stringWithFormat:@"Day %i of the month %i", dayInt, monthInt];
    
    NSLog(@"%@", dayID);
    
    
}
@end
