//
//  FSWelcomeViewController.m
//  LaughingMeme
//
//  Created by Michal Smaga on 10/10/13.
//  Copyright (c) 2013 Future Simple. All rights reserved.
//

#import "FSWelcomeViewController.h"
#import "FSChatViewController.h"

@interface FSWelcomeViewController ()

@end

@implementation FSWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)hostAction:(id)sender
{
    FSChatViewController *chatViewController = [[FSChatViewController alloc] init];
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)joinAction:(id)sender {
}
@end
