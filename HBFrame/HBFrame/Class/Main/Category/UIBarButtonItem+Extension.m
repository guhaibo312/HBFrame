//
//  UIBarButtonItem+Extension.m
//  TattooMan
//
//  Created by 吴迪 on 15/10/19.
//  Copyright © 2015年 HB. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+ (instancetype)setNavigationBarBackGroundImgName:(NSString*)imageName target : (UIViewController *)target selector: (SEL)selector
{
    UIButton * rightButton= [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    rightButton.size = rightButton.imageView.image.size;
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    return rightBarBtnItem;
}

@end
