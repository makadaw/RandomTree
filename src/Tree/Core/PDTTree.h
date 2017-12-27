//
//  PDTTree.h
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PDTNode;
@protocol PDTTreePool;

NS_ASSUME_NONNULL_BEGIN

@interface PDTTree : NSObject

@property (nonatomic, readonly) PDTNode *root;

- (instancetype)initWithPool:(id<PDTTreePool>)pool;

- (PDTNode *)rootNodeWithComponent:(id)component;

- (void)enumerateNodesUsingBlock:(void(^)(PDTNode *node, BOOL * _Nonnull stop))block;

@end

NS_ASSUME_NONNULL_END
