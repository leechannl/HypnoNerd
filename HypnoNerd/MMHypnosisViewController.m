//
//  MMHypnosisViewController.m
//  HypnoNerd
//
//  Created by mm on 6/5/14.
//  Copyright (c) 2014 mm. All rights reserved.
//

#import "MMHypnosisViewController.h"
#import "MMHypnosisView.h"

@implementation MMHypnosisViewController

- (void)loadView
{
    // Create a view
    MMHypnosisView *backgroundView = [[MMHypnosisView alloc] init];

    // Set it as *the* view of this view controller
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Hypnotize";

        // Create a UIImage from a file
        // This will use Hypno@2x.png on  retina display devices
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];

        // Put that image on the tab bar itme
        self.tabBarItem.image = i;
    }

    return self;
}

@end
