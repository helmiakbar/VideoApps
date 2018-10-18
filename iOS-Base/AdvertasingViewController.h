//
//  AdvertasingViewController.h
//  iOS-Base
//
//  Created by Helmi Akbar on 18/10/18.
//  Copyright © 2018 Lutfi Azhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AdvertasingViewControllerProtocol
    - (void)dismiss;
@end

@interface AdvertasingViewController : UIViewController
    @property(assign, nonatomic) id<AdvertasingViewControllerProtocol>delegate;
@end
