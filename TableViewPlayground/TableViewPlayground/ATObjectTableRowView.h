/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 A simple subclass of NSTableRowView that introduces an objectValue property.
 */

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@interface ATObjectTableRowView : NSTableRowView {
@private
    id _objectValue;
}

@property(strong) id objectValue;

@end
