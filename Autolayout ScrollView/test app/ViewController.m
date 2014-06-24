//
//  ViewController.m
//  test app
//
//  Created by Canopus 4 on 11/04/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "ViewController.h"
#import <EventKitUI/EventKitUI.h>
#import "IQKeyboardManager.h"
#import "ScrollViewAutolayout.h"
#import <StoreKit/StoreKit.h>

@interface ViewController ()<SKProductsRequestDelegate>

@property (strong, nonatomic) IBOutlet ScrollViewAutolayout *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObjects:myProduct1,myProduct2,nil]];
    [request setDelegate:self];
    [request start];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
//    [self.myScrollView setScrollContentSize:CGSizeMake(1000, 1000)];
    
//    self.myScrollView.contentView.frame = CGRectMake(0,0,1000, 1000);
    
//    self.myScrollView.contentSize = CGSizeMake(1000, 1000);
    
//    
//    CGFloat contentWidth = 1000;
//    CGFloat contentHeight = 1000;
//    
//    UIView *contentView;
//    
//    contentView = [[UIView alloc] initWithFrame:CGRectMake(50,50,contentWidth,contentHeight)];
//    contentView.backgroundColor = [UIColor blueColor];
//    [self.myScrollView addSubview:contentView];
//    
//    // DON'T change contentView's translatesAutoresizingMaskIntoConstraints,
//    // which defaults to YES;
//    
//    // Set the content size of the scroll view to match the size of the content view:
//    [self.myScrollView setContentSize:CGSizeMake(contentWidth+100,contentHeight+100)];

//    self.myScrollView.contentSize = CGRectInset(self.myScrollView.frame, -self.myScrollView.frame.size.width, -self.myScrollView.frame.size.height).size;
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    NSLog(@"%@",response.invalidProductIdentifiers);
    NSLog(@"%@",response.products);
}

- (void)request:(SKRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)eventsAction:(UIButton *)sender
{
    EKEventStore *store = [[EKEventStore alloc] init];
    
    [store requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
        if (granted)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
                [controller setEventStore:store];
                
//                EKEvent *event = [EKEvent eventWithEventStore:store];
//                [controller setEvent:event];
                [[IQKeyboardManager sharedManager] setEnable:NO];
                [[IQKeyboardManager sharedManager] setEnableAutoToolbar:NO];
                [self presentViewController:controller animated:YES completion:nil];
            });
        }
    }];
}

@end
