//
//  JJTSubredditClient.m
//  Reddit_ObjC
//
//  Created by John Tate on 9/12/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTSubredditClient.h"


@implementation JJTSubredditClient


+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<JJTSubreddit *> * _Nullable posts))block {
    
    // 1) Construct your URL
    NSURL *baseURL = [NSURL URLWithString:@"https://www.reddit.com/r/"];
    NSURL *url = [baseURL URLByAppendingPathComponent:title];
    url = [url URLByAppendingPathExtension:@"json"];
    
    NSLog(@"%@", [url absoluteString]);
    
    // 2) DataTask, serialize JSON, complete, and resume
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching all subreddits for the title %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data) {
            NSLog(@"No data returned %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data  options:NSJSONReadingAllowFragments error:&error];
        // tap into jsonDictionary and pull out the value for the key "data"
        NSDictionary *dataDictionary = jsonDictionary[@"data"];
        NSArray *childrenArray = dataDictionary[@"children"];
        NSMutableArray *subreddits = [[NSMutableArray alloc] init];
        for (NSDictionary *postDictionary in childrenArray) {
            JJTSubreddit *post = [[JJTSubreddit alloc] initWithDictionary:postDictionary];
            [subreddits addObject:post];
        }
        block(subreddits);
    }] resume];
}

+(void)fetchImageDataForURL:(NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block {
    
    // 1) Construct the URL
    NSURL *url = [NSURL URLWithString:imageUrlString];
    NSLog(@"%@", [url absoluteString]);
    
    // 2) DataTask, serialize, complete, and resume
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching image %@ %@", error, error.localizedDescription);
            block(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data) {
            NSLog(@"NO DATA AVAILABLE");
            block(nil);
            return;
        }
        block(data);
        
    }] resume];
}

@end
