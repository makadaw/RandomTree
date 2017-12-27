//
//  PDTNode.h
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PDTNode <T:id> : NSObject
@property (nonatomic, readonly) T component;
@property (nonatomic, readonly) NSArray<PDTNode *> *children;
@property (nonatomic, weak, readonly) PDTNode *parent;

- (instancetype)initWithComponent:(T)component;

//
- (void)addChildNode:(PDTNode *)node;

//
- (void)enumerateNodesUsingBlock:(void(^)(PDTNode *node, BOOL * _Nonnull stop))block;

@end

NS_ASSUME_NONNULL_END
