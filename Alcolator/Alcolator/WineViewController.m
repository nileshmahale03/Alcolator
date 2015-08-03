//
//  ViewController.m
//  Alcolator
//
//  Created by Nilesh Mahale on 7/25/15.
//  Copyright (c) 2015 Nilesh Mahale. All rights reserved.
//

#import "WineViewController.h"

@interface WineViewController ()

@end

@implementation WineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"Wine";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0) {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    }
}

- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider Value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    // first calculate how much alcohol is in all those beers..
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; //assume they are 12oz beer bottles
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of wine..
    float ouncesInOneWineGlass = 5; // assume they are 5oz wine glasses
    float alcoholPercentageOfWine = 0.13; // 13% is the average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use beer or beers and glass or glasses
    NSString *beertext;
    if (numberOfBeers == 1) {
        beertext = NSLocalizedString(@"beer", @"Singular beer");
    } else {
        beertext = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *winetext;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        winetext = NSLocalizedString(@"glass", @"singular glass");
    } else {
        winetext = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    NSString *navigationBarText = [NSString stringWithFormat:NSLocalizedString(@"Wine (%.1f %@)", nil), numberOfWineGlassesForEquivalentAlcoholAmount, winetext];
    self.navigationItem.title = navigationBarText;

}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    // first calculate how much alcohol is in all those beers..
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; //assume they are 12oz beer bottles
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of wine..
    float ouncesInOneWineGlass = 5; // assume they are 5oz wine glasses
    float alcoholPercentageOfWine = 0.13; // 13% is the average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use beer or beers and glass or glasses
    NSString *beertext;
    if (numberOfBeers == 1) {
        beertext = NSLocalizedString(@"beer", @"Singular beer");
    } else {
        beertext = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *winetext;
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        winetext = NSLocalizedString(@"glass", @"singular glass");
    } else {
        winetext = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beertext, [self.beerPercentTextField.text floatValue], numberOfWineGlassesForEquivalentAlcoholAmount, winetext];
    self.resultLabel.text = resultText;
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}

@end

























