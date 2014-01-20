//
//  KFBAppDelegate.h
//  AudioFileViewsTest
//
//  Created by KFB on 09/01/14.
//  Copyright (c) 2014 KFB. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <KFBAudioFileView/KFBAudioFileView.h>

@interface KFBAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet KFBAudioFileWaveformView    *waveformView;
@property (assign) IBOutlet KFBAudioFileSpectrogramView *spectrogramView;

- (IBAction)loadFile:(id)sender;

@end
