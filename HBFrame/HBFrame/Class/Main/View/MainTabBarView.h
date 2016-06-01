//
//  MainTabBarView.h
//  HBFrame
//
//  Created by guahibo on 16/5/27.
//  Copyright © 2016年 guahibo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainTabBarView;

@protocol MainTabBarViewDelegate <NSObject>

- (void) mainTabBarViewDidClick : (MainTabBarView *)hBTabBarView;


@end

@interface MainTabBarView : UITabBar

@property(nonatomic,weak) id<MainTabBarViewDelegate> tabbarDelegate;

@end
