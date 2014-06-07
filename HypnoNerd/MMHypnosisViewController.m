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

    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];

    // Setting the border style on the text field will allow us to see it more
    // easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnosis me";
    textField.returnKeyType = UIReturnKeyDone;

    textField.delegate = self;

    [backgroundView addSubview:textField];
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

- (void)viewDidLoad
{
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];

    NSLog(@"MMHypnosisViewController loaded its view");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];

    textField.text = @"";
    [textField resignFirstResponder];

    return YES;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++) {
        UILabel *messageLable = [[UILabel alloc] init];

        messageLable.backgroundColor = [UIColor clearColor];
        messageLable.textColor = [UIColor whiteColor];
        messageLable.text = message;

        [messageLable sizeToFit];

        int width = (int)(self.view.bounds.size.width - messageLable.bounds.size.width);
        int x = arc4random() % width;
        int height = (int)(self.view.bounds.size.height - messageLable.bounds.size.height);
        int y = arc4random() % height;

        CGRect frame = messageLable.frame;
        frame.origin = CGPointMake(x, y);
        messageLable.frame = frame;

        [self.view addSubview:messageLable];
    }
}

@end
