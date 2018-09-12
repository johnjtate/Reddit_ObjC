//
//  JJTSubreddit.h
//  Reddit_ObjC
//
//  Created by John Tate on 9/12/18.
//  Copyright © 2018 John Tate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JJTSubreddit : NSObject

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly) NSNumber *likeCount;
@property (nonatomic, readonly) NSNumber *commentCount;
@property (nonatomic, readonly, copy) NSString *imageUrlString;

@property (nonatomic, readwrite, nullable) UIImage *photo;

-(instancetype)initWithDictionary:(NSDictionary *)postDictionary; 

@end
