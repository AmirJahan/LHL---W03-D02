//
//  CustomTableViewCell.h
//  My Table View App
//
//  Created by Amir J on 4/24/18.
//  Copyright © 2018 Cinard Digital Media Institute. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UILabel *topLabel;

@property (weak, nonatomic) IBOutlet UILabel *midLabel;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;


@end
