// SPDX-License-Identifier: GPL-3.0-or-later
#import <AppKit/AppKit.h>

@class ExampleTableViewController;

@interface ApplicationController: NSObject <NSApplicationDelegate> {
    ExampleTableViewController* controller1;
    NSWindow* window1;
}
- (void) applicationDidFinishLaunching:(NSNotification*)aNotification;
@end