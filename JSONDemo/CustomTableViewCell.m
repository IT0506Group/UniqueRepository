//
//  CustomTableViewCell.m
//  JSONDemo
//
//  Created by student on 16/3/14.
//  Copyright © 2016年 胡锦涛. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "People.h"
#import "UIImageView+WebCache.h"
@implementation CustomTableViewCell
- (void)setPeople:(People *)p{
    [self.messageImageView sd_setImageWithURL:[NSURL URLWithString:p.cover]];
    self.label1.text = p.setname;
    self.label2.text = [NSString stringWithFormat:@"%d",p.imgsum];
    self.label3.text = [NSString stringWithFormat:@"%d人跟帖",p.replynum];
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
