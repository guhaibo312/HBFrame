//
//  MainTabBarController.m
//  HBFrame
//
//  Created by guahibo on 16/5/27.
//  Copyright © 2016年 guahibo. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "HomeController.h"
#import "MainTabBarView.h"

@interface MainTabBarController ()<MainTabBarViewDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HomeController *homeController = [[HomeController alloc] init];
    [self addChildController:homeController title:@"首页" iconNormal:@"icon_tab_a2_normal" iconSelected:@"icon_tab_a2_selected"];
    
    UIViewController *circleVc = [[UIViewController alloc] init];
    [self addChildController:circleVc title:@"圈子" iconNormal:@"icon_tab_a1_normal" iconSelected:@"icon_tab_a1_selected"];
    
    UIViewController *nearbyVc = [[UIViewController alloc] init];
    [self addChildController:nearbyVc title:@"附近" iconNormal:@"icon_tab_a3_normal" iconSelected:@"icon_tab_a3_selected"];
    
    UIViewController *mineVc = [[UIViewController alloc] init];
    [self addChildController:mineVc title:@"我的" iconNormal:@"icon_tab_w4_normal" iconSelected:@"icon_tab_w4_selected"];
    
    int i = 1; //0系统tabbar  1自定义tabbar
    if (i == 1) {
        MainTabBarView *tabBar = [[MainTabBarView alloc] init];
        tabBar.tabbarDelegate = self;
        [self setValue:tabBar forKeyPath:@"tabBar"]; //KVC直接修改系统tabbar
    }
}

- (void) addChildController : (UIViewController *) viewController title : (NSString *) title iconNormal : (NSString *) iconNormal iconSelected : (NSString *) iconSelected
{
    viewController.view.backgroundColor = HBRandomColor;
    viewController.title = title;
    viewController.tabBarItem.image = [UIImage imageNamed:iconNormal];
    UIImage *selectedImage = [UIImage imageNamed:iconSelected];
    // 声明：这张图片按照原始的样子显示出来，不要渲染成其他的颜色（比如说默认的蓝色）
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = selectedImage;
    [self addChildViewController:[[MainNavigationController alloc] initWithRootViewController:viewController]];
}

- (void)mainTabBarViewDidClick:(MainTabBarView *)hBTabBarView
{

}

@end
