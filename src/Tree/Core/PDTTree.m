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

#pragma mark Debug

- (NSString *)description {
    return [NSString stringWithFormat:@"Tree: %@\n%@",
            [super description],
            [self node:self.root debugDescriptionOnLevel:0]];
}

- (NSString *)node:(PDTNode *)node debugDescriptionOnLevel:(NSUInteger)level {
    NSMutableString *string = nil;
    unichar shift[level*2+1];
    shift[0] = '|';
    if (level > 0) {
        for (NSUInteger idx = 1; idx < level*2; idx++) {
            shift[idx] = '-';
        }
        shift[level*2] = ' ';
    }
    string = [NSMutableString stringWithCharacters:shift length:level*2+1];
    [string appendFormat:@"%@\n", node];
    NSUInteger next = level + 1;
    for (PDTNode *child in node.children) {
        [string appendString:[self node:child debugDescriptionOnLevel:next]];
    }
    return [string copy];
}

@end
