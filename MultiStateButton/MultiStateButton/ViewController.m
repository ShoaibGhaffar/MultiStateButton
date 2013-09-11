//
//  ViewController.m
//  MultiStateButton
//
//  Created by Shoaib Mac Mini on 10/09/2013.
//  Copyright (c) 2013 Shoaib Mac Mini. All rights reserved.
//

#import "ViewController.h"
#import "MultiStateButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView* imgVIew = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.view addSubview:imgVIew];
    
    MultiStateButton* multiStateButton = [MultiStateButton buttonWithImageNames:@"button.png", @"button2.png", @"button3.png", nil];
    [multiStateButton setFrame:CGRectMake(200, 200, 40, 40)];
    [multiStateButton addTarget:self action:@selector(buttonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:multiStateButton];

} // F.E.

-(void)buttonHandler:(id) sender {
//    MultiStateButton* multiStateButton = (MultiStateButton*)sender;
//    NSLog(@"img > %@", multiStateButton.getImage);
    NSLog(@"buttonHandler. . .");
} //F.E.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
