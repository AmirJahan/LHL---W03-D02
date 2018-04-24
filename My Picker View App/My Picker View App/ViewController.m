

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *citiesPickerView;

@property (nonatomic) NSMutableArray* countriesArr;

@property (nonatomic) NSMutableArray* canCitiesArr;
@property (nonatomic) NSMutableArray* usCitiesArr;

@property (nonatomic) NSMutableArray* shownCitiesArr;

@end



// UIDatePickerView

@implementation ViewController

- (void)viewDidLoad

{
    [super viewDidLoad];

    _countriesArr = [[NSMutableArray alloc] initWithObjects:
                  @"Canada",
                  @"US", nil];
    
    _canCitiesArr = [[NSMutableArray alloc] initWithObjects:
                  @"Vancouver",
                  @"Victioria",
                  @"Surrey", nil];
    
    _usCitiesArr = [[NSMutableArray alloc] initWithObjects:
                    @"Seattle", nil];
    
//    _citiesPickerView.dataSource = self;
//    _citiesPickerView.delegate = self;
    
    _shownCitiesArr = [_canCitiesArr mutableCopy];
}

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if ( component == 0)
        return  _countriesArr.count;
    else
        return _shownCitiesArr.count;
}


-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    if (component == 0)
        return [_countriesArr objectAtIndex:row];
    else
        return [_shownCitiesArr objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if ( component == 0 )
    {
        if ( row == 0)
            _shownCitiesArr = _canCitiesArr;
        else
            _shownCitiesArr = _usCitiesArr;
        // the array of the other
        // component
        // should swicth to the
        // other array
        
        //we then have to refresh data
        
        [pickerView reloadComponent:1];
    }
}





@end
