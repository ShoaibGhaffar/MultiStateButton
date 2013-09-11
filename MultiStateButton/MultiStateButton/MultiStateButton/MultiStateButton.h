//
//  MultiStateButton.h
//  MultiStateButton
//
//  Created by Shoaib Mac Mini on 10/09/2013.
//  Copyright (c) 2013 Shoaib Mac Mini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MultiStateButton : UIButton
{
    int btnState_;
    NSMutableArray* arrStateImages_;
}

+ (id)buttonWithImageNames:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithButtonImageNames:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION;



@property (nonatomic, assign) int btnState;
@property (nonatomic, retain) NSMutableArray* arrStateImages;
@end
