// SPDX-License-Identifier: AML
/*
     File: SidebarTableCellView.m 
 Abstract: 
    Sample NSTableCellView subclass that adds a button outlet. The implementation does layout in -viewWillDraw.
  
  Version: 1.1 
  
 Disclaimer: IMPORTANT:  This Apple software is supplied to you by Apple 
 Inc. ("Apple") in consideration of your agreement to the following 
 terms, and your use, installation, modification or redistribution of 
 this Apple software constitutes acceptance of these terms.  If you do 
 not agree with these terms, please do not use, install, modify or 
 redistribute this Apple software. 
  
 In consideration of your agreement to abide by the following terms, and 
 subject to these terms, Apple grants you a personal, non-exclusive 
 license, under Apple's copyrights in this original Apple software (the 
 "Apple Software"), to use, reproduce, modify and redistribute the Apple 
 Software, with or without modifications, in source and/or binary forms; 
 provided that if you redistribute the Apple Software in its entirety and 
 without modifications, you must retain this notice and the following 
 text and disclaimers in all such redistributions of the Apple Software. 
 Neither the name, trademarks, service marks or logos of Apple Inc. may 
 be used to endorse or promote products derived from the Apple Software 
 without specific prior written permission from Apple.  Except as 
 expressly stated in this notice, no other rights or licenses, express or 
 implied, are granted by Apple herein, including but not limited to any 
 patent rights that may be infringed by your derivative works or by other 
 works in which the Apple Software may be incorporated. 
  
 The Apple Software is provided by Apple on an "AS IS" basis.  APPLE 
 MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION 
 THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS 
 FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND 
 OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS. 
  
 IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL 
 OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, 
 MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED 
 AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE), 
 STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE 
 POSSIBILITY OF SUCH DAMAGE. 
  
 Copyright (C) 2011 Apple Inc. All Rights Reserved. 
  
*/

#import "SidebarTableCellView.h"


@implementation SidebarTableCellView

// @synthesize button = _button;
// https://stackoverflow.com/a/20207110
- (id)initWithFrame:(NSRect)frameRect {
  self = [super initWithFrame:frameRect];
  [self setAutoresizingMask:NSViewWidthSizable];
  NSImageView* iv = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 6, 16, 16)];
  NSTextField* tf = [[NSTextField alloc] initWithFrame:NSMakeRect(21, 6, 200, 14)];
  NSButton* btn = [[NSButton alloc] initWithFrame:NSMakeRect(0, 3, 16, 16)];
  [iv setImageScaling:NSImageScaleProportionallyUpOrDown];
  [iv setImageAlignment:NSImageAlignCenter];
  [tf setBordered:NO];
  [tf setDrawsBackground:NO];
  [[btn cell] setControlSize:NSSmallControlSize];
  [[btn cell] setBezelStyle:NSInlineBezelStyle];
  [[btn cell] setButtonType:NSMomentaryPushInButton];
  [[btn cell] setFont:[NSFont boldSystemFontOfSize:10]];
  [[btn cell] setAlignment:NSCenterTextAlignment];
  [self setImageView:iv];
  [self setTextField:tf];
  [self addSubview:iv];
  [self addSubview:tf];
  [self addSubview:btn];
  return self;
}

- (NSButton*)button {
  return [[self subviews] objectAtIndex:2];
}

- (void)awakeFromNib {
    // We want it to appear "inline"
    [[self.button cell] setBezelStyle:NSInlineBezelStyle];
}

- (void)dealloc {
    self.button = nil;
    [super dealloc];
}

// The standard rowSizeStyle does some specific layout for us. To customize layout for our button, we first call super and then modify things
- (void)viewWillDraw {
    [super viewWillDraw];
    if (![self.button isHidden]) {
        [self.button sizeToFit];
        
        NSRect textFrame = self.textField.frame;
        NSRect buttonFrame = self.button.frame;
        buttonFrame.origin.x = NSWidth(self.frame) - NSWidth(buttonFrame);
        self.button.frame = buttonFrame;
        textFrame.size.width = NSMinX(buttonFrame) - NSMinX(textFrame);
        self.textField.frame = textFrame;
    }
}

@end
