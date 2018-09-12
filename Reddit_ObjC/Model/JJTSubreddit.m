//
//  JJTSubreddit.m
//  Reddit_ObjC
//
//  Created by John Tate on 9/12/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import "JJTSubreddit.h"

@implementation JJTSubreddit

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary {
    
    // Step 1) Pull all the values out of the JSON dictionary.
    NSString *title = postDictionary[@"data"][@"title"];
    NSNumber *likeCount = postDictionary[@"data"][@"ups"];
    NSNumber *commentCount = postDictionary[@"data"][@"num_comments"];
    NSString *imageURLString = postDictionary[@"data"][@"thumbnail"];
    
    // Step 1.5) Make sure the values pulled out of the JSON dictionary are of the expected type.
    // We want to make sure that title exists and is of the correct class and that both likesCount and commentsCount are of type number.
    if (![title isKindOfClass:[NSString class]] || !(title) || ![likeCount isKindOfClass:[NSNumber class]] || ![commentCount isKindOfClass:[NSNumber class]]) {
    }
    
    // Step 2) Initialize a Model Object from the value you pulled out of the JSON dictionary.
    // Call the designated initializer from NSObject and set equal to self.
    self = [super init];
    // Check if self is there.  Objects on the left are for the header and objects on the right are things pulled out of the dictionary.
    if (self) {
        _title = title;
        _likeCount = likeCount;
        _commentCount = commentCount;
        _imageUrlString = imageURLString;
    }
    return self;
}





@end
