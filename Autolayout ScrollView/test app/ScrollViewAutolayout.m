//
//  ScrollViewAutolayout.m
//  test app
//
//  Created by Canopus 4 on 01/05/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "ScrollViewAutolayout.h"

@implementation ScrollViewAutolayout
{
    IBOutlet NSLayoutConstraint *constraintContentViewWidth;
    IBOutlet NSLayoutConstraint *constraintContentViewHeight;
}

//-(CGSize)scrollContentSize
//{
//
//}

-(void)setScrollContentSize:(CGSize)scrollContentSize
{
    constraintContentViewWidth.constant = scrollContentSize.width;
    constraintContentViewHeight.constant = scrollContentSize.height;

    [self.contentView setNeedsUpdateConstraints];
    [self.contentView layoutIfNeeded];
}

@end
