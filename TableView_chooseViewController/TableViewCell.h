//
//  TableViewCell.h
//  TableView_chooseViewController
//
//  Created by simon on 16/9/6.
//  Copyright © 2016年 simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;
@property (copy, nonatomic) NSString *type;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftCont;

@end
