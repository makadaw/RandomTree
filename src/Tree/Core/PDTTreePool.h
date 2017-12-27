//
//  PDTTreePool.h
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PDTNode;

NS_ASSUME_NONNULL_BEGIN

@protocol PDTTreePool <NSObject>

- (nullable PDTNode *)nodeWithComponent:(id)component;

@end

@interface PDTTreePool : NSObject <PDTTreePool>

@end

NS_ASSUME_NONNULL_END
