//
//  RootViewController.m
//  HPPWeiBoInObjective-C
//
//  Created by 黄晓展 on 16/9/7.
//  Copyright © 2016年 黄晓展. All rights reserved.
//

#import "RootViewController.h"
#import "MainViewController.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor  whiteColor];
    [self addViewControllers];
}
- (void)addViewControllers
{
    //添加home
    HomeViewController *home = [[HomeViewController alloc]init];
    [self addChildViewController:home andTitle:@"首页" andImageName:@"tabbar_home" andSelctedImageName:@"tabbar_home_selected"];
    
    //添加message
    MessageViewController *message = [[MessageViewController alloc]init];
    [self addChildViewController:message andTitle:@"消息" andImageName:@"tabbar_message_center" andSelctedImageName:@"tabbar_message_center_selected"];
    
    //添加discover
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    [self addChildViewController:discover andTitle:@"发现" andImageName:@"tabbar_discover" andSelctedImageName:@"tabbar_discover_selected"];
    
    //添加profile
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [self addChildViewController:profile andTitle:@"我" andImageName:@"tabbar_profile" andSelctedImageName:@"tabbar_profile_selected"];
    
}

- (void)addChildViewController:(UIViewController *)controller andTitle:(NSString *)title andImageName:(NSString *)imageName andSelctedImageName:(NSString *)selctedImageName
{
    MainViewController *mainViewController = [[MainViewController alloc]initWithRootViewController:controller];
    [self addChildViewController:mainViewController];
    controller.title = title;
    //需要原图显示
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [[UIImage imageNamed:selctedImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //文字的颜色(和大小)需要定制
    controller.tabBarItem.title = title;
    [controller.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.67 green:0.67 blue:0.67 alpha:1.00],NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [controller.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:1.00 green:0.51 blue:0.00 alpha:1.00],NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
