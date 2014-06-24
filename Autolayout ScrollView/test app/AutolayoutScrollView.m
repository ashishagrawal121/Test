//
//  AutolayoutScrollView.m
//  test app
//
//  Created by Canopus 4 on 05/05/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "AutolayoutScrollView.h"

@implementation AutolayoutScrollView
{
    IBOutlet NSLayoutConstraint *heightConstraint;
    IBOutlet NSLayoutConstraint *widthConstraint;
}

-(void)setScrollContentSize:(CGSize)size
{
    heightConstraint.constant = MAX(size.height, self.frame.size.height);
    widthConstraint.constant = MAX(size.width, self.frame.size.width);
    
    [self.scrollContentView setNeedsUpdateConstraints];
    [self.scrollContentView layoutIfNeeded];
}

@end
