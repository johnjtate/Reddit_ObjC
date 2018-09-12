//
//  JJTSubredditClient.h
//  Reddit_ObjC
//
//  Created by John Tate on 9/12/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTSubreddit.h"

@interface JJTSubredditClient : NSObject

+(void)fetchAllSubRedditsForTitle:(NSString *)title withBlock:(void(^)(NSArray<JJTSubreddit *> * _Nullable posts))block;

+(void)fetchImageDataForURL:(NSString *)imageUrlString withBlock:(void(^)(NSData * _Nullable imageData))block;
// static func fetchImageData(for url: String, completion: @escaping (Data?) -> ()


@end
