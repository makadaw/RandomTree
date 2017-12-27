//
//  TreePoolTests.m
//  TreeTests
//
//  Created by mainuser on 12/28/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PDTTreePool.h"
#import "PDTTree.h"
#import "PDTNode.h"

@interface TreePoolTests : XCTestCase
@property (nonatomic) PDTTreePool *pool;
@property (nonatomic) PDTTree *tree;

@end

@implementation TreePoolTests

- (void)setUp {
    [super setUp];
    self.pool = [[PDTTreePool alloc] init];
    self.tree = [[PDTTree alloc] initWithPool:self.pool];
}

- (void)testNodeStoreReferenceOnComponent {
    PDTNode *node = [self.pool nodeWithComponent:@"root"];
    XCTAssertNotNil(node.component);
}

- (void)testPoolKeepWeakReference {
    __weak NSArray *weak = nil;
    @autoreleasepool {
        NSArray *component = @[@(123)];
        weak = component;
        PDTNode *node = [self.pool nodeWithComponent:component];
        component = nil;
        XCTAssertNotNil(weak);
        XCTAssertNotNil(node.component);
        node = nil;
    }
    XCTAssertNil(weak);
}

@end
