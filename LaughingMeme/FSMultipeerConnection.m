//
//  FSMultipeerConnection.m
//  LaughingMeme
//
//  Created by Dominik Kapusta on 10.10.2013.
//  Copyright (c) 2013 Future Simple. All rights reserved.
//

#import "FSMultipeerConnection.h"

static NSString * const kServiceType = @"laughing-meme";

@interface FSMultipeerConnection () // <MCNearbyServiceBrowserDelegate>

@end

@implementation FSMultipeerConnection

+ (FSMultipeerConnection *)sharedInstance
{
    static FSMultipeerConnection *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance  = [[FSMultipeerConnection alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (MCNearbyServiceBrowser *)browser
{
    if (!_browser) {
        _browser = [[MCNearbyServiceBrowser alloc] initWithPeer:self.peer serviceType:kServiceType];
    }
    return _browser;
}

- (void)setupSessionForPeerWithName:(NSString *)name
{
    self.peer = [[MCPeerID alloc] initWithDisplayName:name];
    self.session = [[MCSession alloc] initWithPeer:self.peer];
    
    self.advertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:self.peer
                                                        discoveryInfo:@{@"sessionName": @"laughing-meme"}
                                                          serviceType:kServiceType];
    [self.advertiser startAdvertisingPeer];
    [self.browser startBrowsingForPeers];
}

@end
