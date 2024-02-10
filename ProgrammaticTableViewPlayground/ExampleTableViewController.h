// SPDX-License-Identifier: GPL-3.0-or-later
#include "AppKit/NSScrollView.h"
#import <AppKit/AppKit.h>

@interface ExampleTableViewController: NSObject <NSTableViewDataSource, NSTableViewDelegate> {
    NSScrollView* scroll;
    NSTableView* table;
}
- (NSInteger) numberOfRowsInTableView: (NSTableView*)aTableView;
- (NSView*)       tableView:(NSTableView*)aTableView
         viewForTableColumn:(NSTableColumn*)aTableColumn 
                        row:(NSInteger)rowIndex;
- (NSScrollView*) scroll;
- (NSTableView*) table;
@end