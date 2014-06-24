//
//  AutolayoutScrollView.h
//  test app
//
//  Created by Canopus 4 on 05/05/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutolayoutScrollView : UIScrollView

@property(nonatomic, strong) IBOutlet UIView *scrollContentView;

-(void)setScrollContentSize:(CGSize)size;

@end
