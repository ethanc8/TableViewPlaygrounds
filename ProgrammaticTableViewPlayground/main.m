// SPDX-License-Identifier: GPL-3.0-or-later
#import <AppKit/AppKit.h>
#import "ApplicationController.h"
#import "ExampleTableViewController.h"

int main(int argc, char** argv) {
    @autoreleasepool {
        ApplicationController* con1 = [[ApplicationController alloc] init];
        NSApp.delegate = con1;
        [NSApp run];
        RELEASE(con1);
    }
}