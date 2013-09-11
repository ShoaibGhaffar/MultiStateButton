//
//  MultiStateButton.m
//  MultiStateButton
//
//  Created by Shoaib Mac Mini on 10/09/2013.
//  Copyright (c) 2013 Shoaib Mac Mini. All rights reserved.
//

#import "MultiStateButton.h"

@implementation MultiStateButton
@synthesize btnState = btnState_, arrStateImages = arrStateImages_;

#pragma mark - init - auto release 
+ (id)buttonWithImageNames:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION
{
    assert(firstObj); // Atleaset one State Image should be provided
    
    MultiStateButton* multiState = [[[super alloc] initWithFrame:CGRectMake(0, 0, 0, 0)] autorelease];
    //--
    
    //Extracting Image Names
    multiState.arrStateImages = [[[NSMutableArray alloc] init] autorelease];
    id eachObject;
    va_list argumentList;
    
    if (firstObj) // The first argument isn't part of the varargs list,
    {
        // so we'll handle it separately.
        UIImage* imgFirstImg = [UIImage imageNamed:firstObj];
        [multiState.arrStateImages addObject: imgFirstImg];
        va_start(argumentList, firstObj); // Start scanning for arguments after firstObject.
        while ((eachObject = va_arg(argumentList, id))) // As many times as we can get an argument of type "id"
            [multiState.arrStateImages addObject: [UIImage imageNamed:eachObject]];
        va_end(argumentList);
        //--
        //Setting Frame
        [multiState setFrame:CGRectMake(0, 0, imgFirstImg.size.width, imgFirstImg.size.height)];
    }
    multiState.btnState = 0;
    [multiState updateImageWithState:0];
    return multiState;
} //F.E.


#pragma mark - init
- (id)initWithButtonImageNames:(id)firstObj, ... NS_REQUIRES_NIL_TERMINATION
{
    self = [super initWithFrame:CGRectMake(0, 0, 0, 0)];
    if (self) {
        
        assert(firstObj); // Atleaset one State Image should be provided

        
        //Extracting Image Names
        arrStateImages_ = [[NSMutableArray alloc] init];
        id eachObject;
        va_list argumentList;
        

        if (firstObj) // The first argument isn't part of the varargs list,
        {
            // so we'll handle it separately.
            UIImage* imgFirstImg = [UIImage imageNamed:firstObj];
            [arrStateImages_ addObject: imgFirstImg];
            va_start(argumentList, firstObj); // Start scanning for arguments after firstObject.
            while ((eachObject = va_arg(argumentList, id))) // As many times as we can get an argument of type "id"
                [arrStateImages_ addObject: [UIImage imageNamed:eachObject]];
            va_end(argumentList);
            //--
            //Setting Frame
            [self setFrame:CGRectMake(0, 0, imgFirstImg.size.width, imgFirstImg.size.height)];
        }
        //--
        btnState_ = 0;
        [self updateImageWithState:btnState_];
    }
    return self;
} //F.E.

#pragma mark - Update Image
-(void) updateImageWithState:(int)state {
    assert(state<arrStateImages_.count); // Overflow
    //--
    [self setImage:[arrStateImages_ objectAtIndex:btnState_] forState:UIControlStateNormal];
} //F.E.

/*
 * alternative function
-(void) buttonHandler:(id)sender {
    btnState_ = (btnState_ < (arrStateImages.count-1))?btnState_+1:0;
    [self updateImageWithState:btnState_];
} //F.E>
 */

#pragma mark - Function Overriding
-(void) sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    [super sendAction:action to:target forEvent:event];
    //--
    btnState_ = (btnState_ < (arrStateImages_.count-1))?btnState_+1:0;
    [self updateImageWithState:btnState_];
} //F.E.

#pragma mark - Setter for State
-(void) setBtnState:(int)newBtnState {
    if (btnState_ == btnState_)
    {return;}
    //--
    btnState_ = newBtnState;
    [self updateImageWithState:btnState_];
} //F.E.

#pragma mark - dealloc
-(void) dealloc {
    [arrStateImages_ removeAllObjects];
    [arrStateImages_ release];
    arrStateImages_ = nil;
    //-
    [super dealloc];
} //F.E.

@end
