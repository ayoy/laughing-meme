//
//  FSWelcomeViewController.m
//  LaughingMeme
//
//  Created by Michal Smaga on 10/10/13.
//  Copyright (c) 2013 Future Simple. All rights reserved.
//

#import "FSWelcomeViewController.h"
#import "FSChatViewController.h"
#import "FSMultipeerConnection.h"

@interface FSWelcomeViewController () <MCBrowserViewControllerDelegate>

@property (nonatomic, weak) IBOutlet UITextField *textField;
@end

@implementation FSWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
        self.title = @"Laughing room";
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.edgesForExtendedLayout = UIRectEdgeTop;
}


- (IBAction)hostAction:(id)sender
{
    FSChatViewController *chatViewController = [[FSChatViewController alloc] init];
    [self.navigationController pushViewController:chatViewController animated:YES];
}

- (IBAction)joinAction:(id)sender {
    FSMultipeerConnection *connection = [FSMultipeerConnection sharedInstance];
    [connection setupSessionForPeerWithName:self.textField.text];
    MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithBrowser:connection.browser session:connection.session];
    [self presentViewController:browserViewController animated:YES completion:nil];
}

- (IBAction)takeFakePicture:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
//        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        imagePicker.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeImage,nil];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:^{
            NSString *imageName = [NSString stringWithFormat:@"cat%d.jpg",arc4random()%3+1];
            self.imageView.image = [UIImage imageNamed:imageName];
        }];
    }
}

- (BOOL)browserViewController:(MCBrowserViewController *)browserViewController shouldPresentNearbyPeer:(MCPeerID *)peerID withDiscoveryInfo:(NSDictionary *)info
{
    return YES;
}

- (void)browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
