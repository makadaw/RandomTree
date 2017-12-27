//
//  ATTree.m
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import "PDTTree.h"
#import "PDTTreePool.h"
#import "PDTNode.h"

@interface PDTTree()
@property (nonatomic, strong) id<PDTTreePool> pool;

@end

@implementation PDTTree

- (instancetype)initWithPool:(id<PDTTreePool>)pool {
    if ((self = [super init])) {
        _pool = pool;
    }
    return self;
}

#pragma mark Nodes

- (PDTNode *)rootNodeWithComponent:(id)component {
    _root = [self.pool nodeWithComponent:component];
    return self.root;
}

#pragma mark Enumerate

- (void)enumerateNodesUsingBlock:(void(^)(PDTNode *node, BOOL * _Nonnull stop))block {
    [self.root enumerateNodesUsingBlock:block];
}

@end
