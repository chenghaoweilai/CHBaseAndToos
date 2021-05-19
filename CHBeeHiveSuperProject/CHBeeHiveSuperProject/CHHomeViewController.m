//
//  CHHomeViewController.m
//  CHBeeHiveSuperProject
//
//  Created by 程浩MAC on 2021/5/18.
//

#import "CHHomeViewController.h"
#import "CHHomeViewProtocol.h"
@BeeHiveService(CHHomeViewProtocol,CHHomeViewController)
@interface CHHomeViewController ()<CHHomeViewProtocol>

@end

@implementation CHHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor redColor];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
