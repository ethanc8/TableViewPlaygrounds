// SPDX-License-Identifier: GPL-3.0-or-later
#import <AppKit/AppKit.h>
#import "ExampleTableViewController.h"

@implementation ExampleTableViewController: NSObject
- (instancetype) init {
    [super init];
    scroll = [[NSScrollView alloc] init];
    scroll.documentView = table;
    scroll.hasVerticalScroller = true;

    table = [[NSTableView alloc] init];
    NSTableColumn* tc1 = [[NSTableColumn alloc] initWithIdentifier: @"NAME_COLUMN"];
    // tc1.title = @"Name";
    [table addTableColumn: tc1];
    table.delegate = self;
    table.dataSource = self;
    // table.rowSizeStyle = NSTableViewRowSizeStyleSmall;
}
- (NSInteger) numberOfRowsInTableView: (NSTableView*)aTableView {
    return 1000;
}
- (NSView*)       tableView:(NSTableView*)tableView
         viewForTableColumn:(NSTableColumn*)aTableColumn 
                        row:(NSInteger)rowIndex {
    NSString* VIEW_ID1 = @"VIEW_ID1";
    NSView* v1 = [tableView makeViewWithIdentifier: VIEW_ID1 owner: nil];
    if(v1) {
        NSLog(@"Reused %@", v1);
        return v1;
    } else {
        v1 = [[NSTextField alloc] init];
        v1.identifier = VIEW_ID1;
        return v1;
    }
}
- (NSScrollView*) scroll {
    return self->scroll;
}
@end