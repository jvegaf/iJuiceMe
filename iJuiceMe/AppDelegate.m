//
//  AppDelegate.m
//  iJuiceMe
//
//  Created by Jose on 27/10/14.
//  Copyright (c) 2014 Jose Vega. All rights reserved.
//

#import "AppDelegate.h"
#import "Flavour.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

-(void)windowWillClose:(NSNotification *)aNotification {
    [NSApp terminate:self];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [_eliqFinalRatioPGTField setIntValue:[_ratioSlider intValue]];
    [_eliqFinalRatioVGTField setIntValue:(100 - [_ratioSlider intValue])];
    self.nicotineBaseSolutionPG = YES;
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)SliderChange:(id)sender {
    [_eliqFinalRatioPGTField setIntValue:[_ratioSlider intValue]];
    [_eliqFinalRatioVGTField setIntValue:(100 - [_ratioSlider intValue])];
}

- (IBAction)nicotineBaseDisolutionChange:(id)sender {
    if ([self.nicotineBaseDisolutionSelector selectedSegment]==0) {
        self.nicotineBaseSolutionPG = YES;
    }else{
        self.nicotineBaseSolutionPG = NO;
    }
}

- (IBAction)calculate:(id)sender {
    [_resultsTextview setString:@""];
    [_resultsTextview setFont:[NSFont userFontOfSize:14.0]];
    [_resultsTextview insertText:@"Recipe:   "];
    [_resultsTextview insertText:_eliqNameTField.stringValue];
    [_resultsTextview insertText:@"\n\n\n"];
    _totalPG = 0.0;
    _totalPG = [self pgMlfinal:[_amountToMakeTextField intValue] withRatio:[_eliqFinalRatioPGTField intValue]];
    _totalVG = 0.0;
    _totalVG = [_amountToMakeTextField floatValue] - _totalPG;
    float NicotineMl = [self calculateMlNicotinefinal:[_nicotineFinalTextField intValue]
                                             fromBase:[_nicotineBaseTextField intValue]
                                               amount:[_amountToMakeTextField intValue]];
    if (_nicotineBaseSolutionPG) {
        _totalPG = _totalPG - NicotineMl;
    }else{
        _totalVG = _totalVG - NicotineMl;
    }
    for (int i=0; i<4; i++) {
        Flavour *flavour = [[Flavour alloc]init];
        flavour.name = [[[[self window]contentView]viewWithTag:i+100]stringValue];
        flavour.percentage = [[[[self window]contentView]viewWithTag:i+110]intValue];
        flavour.quantity = [flavour quantitybypercentage:flavour.percentage
                                                toAmount:[_amountToMakeTextField intValue]];
        if (flavour.quantity != 0.0000) {
            [_resultsTextview insertText:[NSString stringWithFormat:@"Flavour: %@ ",flavour.name]];
            [_resultsTextview insertText:[NSString stringWithFormat:@"    Quantity: %.02f ml.\n",flavour.quantity]];
        }
        _totalPG = _totalPG - flavour.quantity;
    }
    [_resultsTextview insertText:[NSString stringWithFormat:@"\nNicotine Quantity: %.02f ml.\n",NicotineMl]];
    [_resultsTextview insertText:[NSString stringWithFormat:@"PG Quantity: %.02f ml.\n", _totalPG]];
    [_resultsTextview insertText:[NSString stringWithFormat:@"VG Quantity: %.02f ml.\n", _totalVG]];
}

-(float)calculateMlNicotinefinal:(int)nicotineFinal
                        fromBase:(int)nicotineBase
                          amount:(int)amount
{
    int nicotinetotal = amount * nicotineFinal;
    return (nicotinetotal * 1.0) / (nicotineBase * 1.0);
}

-(float)pgMlfinal:(int) totalAmount withRatio:(int)pgRatio
{
    return ([_amountToMakeTextField floatValue] * pgRatio) / 100;
}

-(float)vgMlfinalofAmountDiscountingPg:(float)finalPg
{
    return ([_amountToMakeTextField floatValue] * 1.0) - finalPg;
}





@end
