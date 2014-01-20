//
//  KFBAppDelegate.m
//  AudioFileViewsTest
//
//  Created by KFB on 09/01/14.
//  Copyright (c) 2014 KFB. All rights reserved.
//

#import "KFBAppDelegate.h"

@implementation KFBAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)loadFile:(id)sender
{
    NSLog(@"Loading file...");
    
    NSOpenPanel * panel = [NSOpenPanel openPanel];

    NSInteger result = [panel runModal];
    
    if(result == NSOKButton)
    {
        NSURL *url = [panel URLs][0];
        NSLog(@"Loading file %@", url);
        
        // Tell the views to do their thing
        NSError *error;
        
        // Load the audio file into the waveform view
        if (![_waveformView setAudioFile:url withError:&error])
        {
            NSLog(@"Couldn't set audio file for waveform view: %@", error);
        }
        
        // Bin the audio data
        // TODO: Bin into number of pixels
        if (![_waveformView splitAudioDataIntoNumberOfBins:64 usingStrategy:kKFBBinStrategy_Abs withError:&error])
        {
            NSLog(@"Couldn't split the audio into bins: %@", error);
        }
        

//        if (![_spectrogramView setAudioFile:url withError:&error])
//        {
//            NSLog(@"Couldn't set audio file for waveform view: %@", error);
//        }
    }
}

@end
