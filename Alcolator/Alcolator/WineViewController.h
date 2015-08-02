//
//  ViewController.h
//  Alcolator
//
//  Created by Nilesh Mahale on 7/25/15.
//  Copyright (c) 2015 Nilesh Mahale. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

