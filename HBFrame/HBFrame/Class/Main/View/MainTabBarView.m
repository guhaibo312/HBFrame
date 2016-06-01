//
//  MainTabBarView.m
//  HBFrame
//
//  Created by guahibo on 16/5/27.
//  Copyright © 2016年 guahibo. All rights reserved.
//

#import "MainTabBarView.h"

@interface MainTabBarView()

@property (nonatomic,strong) UIButton *addButton;

@end

@implementation MainTabBarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.addButton = [[UIButton alloc] init];
        [self.addButton setImage:[UIImage imageNamed:@"icon_add_tag"] forState:UIControlStateNormal];
        [self.addButton addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.addButton];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat buttonW = SCREENWIDTH * 0.2;
    for (int i = 0; i < self.subviews.count; i ++) {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            view.width = buttonW;
            view.height = self.height;
            view.y = 0;
            if (i < 4) {
                view.x = (i - 2) * buttonW;
            }else
            {
                view.x = (i - 1) * buttonW;
            }
        }
    }
    
    self.addButton.width = buttonW;
    self.addButton.height = self.height;
    self.addButton.y = 0;
    self.addButton.x = 2 * buttonW;
}

- (void)addClick
{
    if ([self.tabbarDelegate respondsToSelector:@selector(mainTabBarViewDidClick:)]) {
        [self.tabbarDelegate mainTabBarViewDidClick:self];
    }
}

@end
