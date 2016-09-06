
//
//  TableViewCell.m
//  TableView_chooseViewController
//
//  Created by simon on 16/9/6.
//  Copyright © 2016年 simon. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    if (selected) {
        self.selectImage.image = [UIImage imageNamed:@"charter_tick"];
    }else{
        self.selectImage.image = [UIImage imageNamed:@"charter_select"];
    }
    // Configure the view for the selected state
}

-(void)layoutSubviews{
    [super layoutSubviews];
    if ([self.type isEqualToString:@"multiple"]||[self.type isEqualToString:@"single"]) {
        self.selectImage.hidden = NO;
        self.leftCont.constant = 50;
    }else{
        self.selectImage.hidden = YES;
        self.leftCont.constant = 10;
    }
}

@end
