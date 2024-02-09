// SPDX-License-Identifier: GPL-3.0-or-later
#include "AppKit/NSWindow.h"
#import <AppKit/AppKit.h>
#import "ApplicationController.h"
#import "ExampleTableViewController.h"

@implementation ApplicationController: NSObject
- (instancetype) init {
    [super init];
    self->controller1 = [[ExampleTableViewController alloc] init];
    // self->window1 = [[NSWindow alloc] init];
    return self;
}
- (void) applicationDidFinishLaunching:(NSNotification*)aNotification {
    self->window1 = [[NSWindow alloc] initWithContentRect: (NSRect){
        .origin = (NSPoint){.x = 0, .y = 0}, .size = (NSSize){.width = 800, .height = 500}
                                              } styleMask: NSWindowStyleMaskResizable | NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable
                                                  backing: NSBackingStoreBuffered
                                                    defer: NO];
    self->window1.contentView = controller1.scroll;
    [self->window1 makeKeyAndOrderFront: self];
    // This is different from the way the Swift example worked:
    //   let window1 = NSWindow()
    //   window1.contentView = controller1.scroll
    //   window1.styleMask = NSWindowStyleMask([.resizable, .titled])
    //   window1.setFrame(CGRect(x: 0, y: 0, width: 800, height: 500), display: false)
    //   window1.makeKeyAndOrderFront(self)
    // ObjC equivalent:
    //   window1 = [[NSWindow alloc] init];
    //   window1.contentView = controller1.scroll;
    //   window1.styleMask = NSWindowStyleMaskResizable | NSWindowStyleMaskTitled;
    //   window1.frame = (NSRect){
    //       .origin = (NSPoint){.x = 0, .y = 0}, .size = (NSSize){.width = 800, .height = 500}
    //                           }
    //   [window1 makeKeyAndOrderFront: self];
    // However, -[NSWindow setStyleMask:] and -[NSWindow setFrame:] are unimplemented.
}
@end