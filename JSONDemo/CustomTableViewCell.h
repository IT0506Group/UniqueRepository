//
//  CustomTableViewCell.h
//  JSONDemo
//
//  Created by student on 16/3/14.
//  Copyright © 2016年 胡锦涛. All rights reserved.
//

#import <UIKit/UIKit.h>
@class People;
@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *messageImageView;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;


- (void)setPeople:(People *)p;
@end
