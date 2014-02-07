//
//  KFBAppDelegate.m
//  AudioFileViewsTest
//
//  Created by KFB on 09/01/14.
//  Copyright (c) 2014 KFB. All rights reserved.
//

#import "KFBAppDelegate.h"

@implementation KFBAppDelegate

- (IBAction)loadFile:(id)sender
{
    NSLog(@"Loading file...");
    
    NSOpenPanel * panel = [NSOpenPanel openPanel];

    NSInteger result = [panel runModal];
    
    if(result == NSOKButton)
    {
        NSURL *url = [panel URLs][0];
        NSLog(@"Loading file %@", url);

        NSError *error;
        
        // Load the audio file into the waveform view
        if (![_waveformView_Abs setAudioFile:url withError:&error])
        {
            NSLog(@"Couldn't set audio file for waveform view: %@", error);
        }
        
        if (![_waveformView_Average setAudioFile:url withError:&error])
        {
            NSLog(@"Couldn't set audio file for waveform view: %@", error);
        }

        // Bin the audio data
        if (![_waveformView_Abs binAudioDataWithStrategy:kKFBBinStrategy_Abs error:&error])
        {
            NSLog(@"Couldn't split the audio into bins: %@", error);
        }
        
        if (![_waveformView_Average binAudioDataWithStrategy:kKFBBinStrategy_Average error:&error])
        {
            NSLog(@"Couldn't split the audio into bins: %@", error);
        }
    }
}

@end
