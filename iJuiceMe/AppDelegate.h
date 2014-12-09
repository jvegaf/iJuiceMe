//
//  AppDelegate.h
//  iJuiceMe
//
//  Created by Jose on 27/10/14.
//  Copyright (c) 2014 Jose Vega. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>

@property (weak) IBOutlet NSTextField *eliqNameTField;
@property (weak) IBOutlet NSTextField *eliqFinalRatioPGTField;
@property (weak) IBOutlet NSTextField *eliqFinalRatioVGTField;
@property (weak) IBOutlet NSTextField *amountToMakeTextField;
@property (weak) IBOutlet NSSlider *ratioSlider;
@property (weak) IBOutlet NSTextField *nicotineBaseTextField;
@property (weak) IBOutlet NSTextField *nicotineFinalTextField;
@property (weak) IBOutlet NSSegmentedControl *nicotineBaseDisolutionSelector;
@property (weak) IBOutlet NSTextField *percentageFlavour1Textfield;
@property (weak) IBOutlet NSSegmentedControl *flavour1Solution;
@property (unsafe_unretained) IBOutlet NSTextView *resultsTextview;


@property int eliqFinalRatioPG;
@property int eliqFinalRatioVG;
@property int amountTomake;
@property int finalNicotine;
@property BOOL nicotineBaseSolutionPG;
@property float totalVG;
@property float totalPG;
@property float totalFlavour1;
@property BOOL flavourSolutionPG;



- (IBAction)SliderChange:(id)sender;
- (IBAction)nicotineBaseDisolutionChange:(id)sender;
- (IBAction)calculate:(id)sender;


@end

