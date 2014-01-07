//
//  ViewController.m
//  p244Gesture
//
//  Created by SDT-1 on 2014. 1. 7..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *appleImage;

@end

@implementation ViewController

- (IBAction)handleRoate:(UIRotationGestureRecognizer *)gesture
{
    self.appleImage.transform = CGAffineTransformRotate(self.appleImage.transform, gesture.rotation);
    [gesture setRotation:0.0];
}

- (void) handlePan : (UIPanGestureRecognizer *)gesture
{
    CGPoint point = [gesture locationInView:self.view];
    self.appleImage.center = point;
}

- (void) handlePinch : (UIPinchGestureRecognizer *)gesture
{
    CGFloat scale = gesture.scale;
    self.appleImage.transform = CGAffineTransformScale(self.appleImage.transform, scale, scale);
    
    [gesture setScale:1.0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 코드로 사용할떄
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
    [self.appleImage addGestureRecognizer:pan];
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinch:)];
    [self.appleImage addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRoate:)];
    [self.appleImage addGestureRecognizer:rotate];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
