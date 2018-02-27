

#import "CellView.h"

@implementation CellView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if ( self)
    {
        UIPanGestureRecognizer* myPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panned)];
        [self addGestureRecognizer: myPan];
    }
    
    return self;
}

-(void)panned
{
    NSLog(@"Panned");
}


-(void)setupCellWithTitle: (NSString *)inpTitleStr andSubTitle:(NSString *)inpSubTitleStr
{
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [[UIColor cyanColor] CGColor];
        
        UILabel* mainTitle = [[UILabel alloc] initWithFrame: CGRectMake(20, 20, self.frame.size.width-40, 32)];
        mainTitle.textAlignment = NSTextAlignmentCenter;
        mainTitle.font = [UIFont systemFontOfSize:22 weight:bold];
        mainTitle.text = inpTitleStr;
        
        [self addSubview: mainTitle];
        
        
        UILabel* subTitle = [[UILabel alloc] initWithFrame: CGRectMake(20, 62, self.frame.size.width-40, 24)];
        subTitle.textAlignment = NSTextAlignmentCenter;
        subTitle.font = [UIFont systemFontOfSize:18];
        subTitle.text = inpSubTitleStr;
        
        [self addSubview: subTitle];
}
@end
