//
//  ScrollViewAutolayout.h
//  test app
//
//  Created by Canopus 4 on 01/05/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollViewAutolayout : UIScrollView

@property(nonatomic, strong) IBOutlet UIView *contentView;

@property(nonatomic, assign) CGSize scrollContentSize;

@end
