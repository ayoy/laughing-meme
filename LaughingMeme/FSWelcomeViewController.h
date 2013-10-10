//
//  FSWelcomeViewController.h
//  LaughingMeme
//
//  Created by Michal Smaga on 10/10/13.
//  Copyright (c) 2013 Future Simple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FSWelcomeViewController : UIViewController <UITextFieldDelegate>

- (IBAction)hostAction:(id)sender;
- (IBAction)joinAction:(id)sender;
- (IBAction)takeFakePicture:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end
