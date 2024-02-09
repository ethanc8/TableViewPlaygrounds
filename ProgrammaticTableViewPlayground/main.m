// SPDX-License-Identifier: GPL-3.0-or-later
#import <AppKit/AppKit.h>
#import "ApplicationController.h"
#import "ExampleTableViewController.h"

int main(int argc, const char** argv) {
    @autoreleasepool {
        [NSApplication sharedApplication];
        ApplicationController* con1 = [[ApplicationController alloc] init];
        NSApp.delegate = con1;
        return NSApplicationMain(argc, argv);
        // [NSApp run];
        // RELEASE(con1);
    }
}