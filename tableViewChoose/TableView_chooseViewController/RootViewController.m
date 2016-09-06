//
//  RootViewController.m
//  TableView_chooseViewController
//
//  Created by simon on 16/9/6.
//  Copyright © 2016年 simon. All rights reserved.
//

#import "RootViewController.h"
#import "TableView_chooseViewController.h"
@interface RootViewController ()
@property (strong, nonatomic) IBOutlet UITableView *rootTableView;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.rootTableView.delegate = self;
//    self.rootTableView.dataSource = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    UITableViewCell *cell = sender;
    TableView_chooseViewController *vc=segue.destinationViewController;
    if ([vc respondsToSelector:@selector(setType:)]) {
        switch (cell.tag) {
            case 1:
                [vc setValue:@"multiple" forKey:@"type"];
                break;
            case 2:
                [vc setValue:@"single" forKey:@"type"];
                break;
            case 3:
                [vc setValue:@"delete" forKey:@"type"];
                break;
            default:
                break;
        }
    }
    
}


@end
