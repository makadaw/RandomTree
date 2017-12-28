//
//  NodeTests.m
//  TreeTests
//
//  Created by mainuser on 12/28/17.
//  Copyright © 2017 xcode. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PDTNode.h"

@interface NodeTests : XCTestCase

@end

@implementation NodeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testComponent {
    NSArray *component = @[@(123)];
    PDTNode *node = [[PDTNode alloc] initWithComponent:component];
    XCTAssertEqualObjects(node.component, component);
}

@end
