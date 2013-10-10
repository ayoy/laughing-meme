//
//  FSMultipeerConnection.h
//  LaughingMeme
//
//  Created by Dominik Kapusta on 10.10.2013.
//  Copyright (c) 2013 Future Simple. All rights reserved.
//

#import <Foundation/Foundation.h>

@import MultipeerConnectivity;

@interface FSMultipeerConnection : NSObject

+ (FSMultipeerConnection *)sharedInstance;

- (void)setupSessionForPeerWithName:(NSString *)name;

@property (nonatomic, strong) MCPeerID *peer;
@property (nonatomic, strong) MCSession *session;
@property (nonatomic, strong) MCNearbyServiceAdvertiser *advertiser;
@property (nonatomic, strong) MCNearbyServiceBrowser *browser;
@end
