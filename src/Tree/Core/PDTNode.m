//
//  PDTNode.m
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import "PDTNode.h"

@interface PDTNode()
@property (nonatomic) NSMutableArray *mChildren;
@property (nonatomic, weak, readwrite) PDTNode *parent;

@end

@implementation PDTNode

- (instancetype)initWithComponent:(id)component {
    self = [super init];
    if (self) {
        _component = component;
    }
    return self;
}

#pragma mark children

- (NSArray<PDTNode *> *)children {
    if (_mChildren) {
        return [_mChildren copy];
    }
    return nil;
}

- (void)addChildNode:(PDTNode *)node {
    if (node) {
        [self.mChildren addObject:node];
    }
}

- (NSMutableArray *)mChildren {
    if (!_mChildren) {
        _mChildren = [NSMutableArray array];
    }
    return _mChildren;
}

#pragma mark Enumeration

- (void)enumerateNodesUsingBlock:(void(^)(PDTNode *node, BOOL *stop))block {
    BOOL doStop = NO;
    block(self, &doStop);
    if (doStop) {
        return;
    }
    NSArray *children = self.children;
    for (PDTNode *child in children) {
        [child enumerateNodesUsingBlock:block];
    }
}

#pragma mark Debug

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@)", [super description], self.component];
}

@end
