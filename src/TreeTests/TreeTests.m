//
//  TreeTests.m
//  TreeTests
//
//  Created by mainuser on 12/27/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PDTNode.h"
#import "PDTTree.h"
#import "PDTTreePool.h"

@interface Test: NSObject
@property (nonatomic) NSString *text;
@end

@implementation Test
+ (Test *)testWithText:(NSString *)text {
    Test *t = [[Test alloc] init];
    t.text = text;
    return t;
}
@end

@interface TreeTests : XCTestCase
@property (nonatomic) PDTTreePool *pool;
@property (nonatomic) PDTTree *tree;

@end

@implementation TreeTests

- (void)setUp {
    [super setUp];
    self.pool = [[PDTTreePool alloc] init];
    self.tree = [[PDTTree alloc] initWithPool:self.pool];
}

- (void)testRootNodeCreation {
    PDTNode *node = [self.tree rootNodeWithComponent:[Test testWithText:@"root"]];
    XCTAssertNotNil(self.tree.root);
    XCTAssertEqual(self.tree.root, node);
}

- (void)testNestedAdd {
    PDTNode *root = [self.tree rootNodeWithComponent:[Test testWithText:@"root"]];
    PDTNode *l1_1 = [self.pool nodeWithComponent:[Test testWithText:@"l1_1"]];
    [root addChildNode:l1_1];
    PDTNode *l1_2 = [self.pool nodeWithComponent:[Test testWithText:@"l1_2"]];
    [root addChildNode:l1_2];
    XCTAssertEqual(root.children.count, 2);    
}

- (void)testNestedTravers {
    PDTNode *root = [self.tree rootNodeWithComponent:[Test testWithText:@"root"]];
    PDTNode *l1_1 = [self.pool nodeWithComponent:[Test testWithText:@"l1_1"]];
    [root addChildNode:l1_1];
    PDTNode *l1_2 = [self.pool nodeWithComponent:[Test testWithText:@"l1_2"]];
    [root addChildNode:l1_2];
    PDTNode *l2_1 = [self.pool nodeWithComponent:[Test testWithText:@"l2_1"]];
    [l1_1 addChildNode:l2_1];
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:3];
    [self.tree enumerateNodesUsingBlock:^(PDTNode *node, BOOL *stop) {
        [array addObject:node.component];
    }];
    XCTAssertEqual(array.count, 4);
}


//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
