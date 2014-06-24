//
//  AppDelegate.m
//  test app
//
//  Created by Canopus 4 on 11/04/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

+(NSString *) uploadImageWithData:(NSMutableDictionary *)record image:(NSData *)imageData
{
	NSString *urlString = @"http://localhost/WebService/UploadService.php";
	NSURL *url = [NSURL URLWithString:urlString];
	NSString *filename = @"file";
	NSMutableURLRequest *request= [[NSMutableURLRequest alloc] initWithURL:url] ;
    
	[request setURL:[NSURL URLWithString:urlString]];
	[request setHTTPMethod:@"POST"];
	NSString *boundary = @"---------------------------14737809831466499882746641449";
	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];
    
	NSMutableData *postbody = [NSMutableData data];
	if(imageData != nil)
	{
		[postbody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
		[postbody appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filetype=\"image/jpeg\"; filename=\"%@.jpg\"\r\n", filename] dataUsingEncoding:NSUTF8StringEncoding]];
		[postbody appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
		[postbody appendData:[NSData dataWithData:imageData]];
	}
    
	[postbody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:postbody];
    
    NSLog(@"%@",[[NSString alloc] initWithData:postbody encoding:NSASCIIStringEncoding]);
    NSError *error;
    NSURLResponse *response;
    
	NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
	return [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSLog(@"%@",[[self class] uploadImageWithData:nil image:UIImagePNGRepresentation([UIImage imageNamed:@"sample"])]);
    
    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
