//
//  PDTTreePool.m
//  PDTTree
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import "PDTTreePool.h"
#import "PDTNode.h"

@interface PDTTreePool()
@property (nonatomic) NSHashTable *table;
@end

@implementation PDTTreePool

- (instancetype)init {
    if ((self = [super init])) {
        _table = [NSHashTable weakObjectsHashTable];
    }
    return self;
}

- (PDTNode *)nodeWithComponent:(id)component {
    if (!component) {
        return nil;
    }
    [_table addObject:component];
    PDTNode *node = [[PDTNode alloc] initWithComponent:component];
    // Some configuration here?
    return node;
}

@end
