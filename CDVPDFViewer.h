// PDFViewer based on ChildBrowser

//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//
//  CDVPDFViewer
//  CDVEmailComposer Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan

#import <Cordova/CDVPlugin.h>
#import "CDVPDFViewerViewController.h"
#import "ReaderViewController.h"

@interface CDVPDFViewer : CDVPlugin <CDVPDFViewerDelegate>{}

@property (nonatomic, strong) ReaderViewController *pdfViewer;


/*
 *
 *   - (void)myMethod:(CDVInvokedUrlCommand*)command;
 *
 */


- (void)showPDF:(CDVInvokedUrlCommand*)command;

@end
