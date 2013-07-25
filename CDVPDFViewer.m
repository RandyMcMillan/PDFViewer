// PDFViewer based on ChildBrowser

//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//
//  CDVPDFViewer
//  CDVEmailComposer Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan
//  //  Copyright 2012, Randy McMillan

#import "CDVPDFViewer.h"
#import <Cordova/CDVViewController.h>

@implementation CDVPDFViewer

@synthesize pdfViewer;


/*
 *
 *   - (void)myPluginMethod:(CDVInvokedUrlCommand*)command
 *   {
 *   // Check command.arguments here.
 *   [self.commandDelegate runInBackground:^{
 *   NSString* payload = nil;
 *   // Some blocking logic...
 *   CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:payload];
 *   // The sendPluginResult method is thread-safe.
 *   [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
 *   }];
 *   }
 *
 */


- (void)showPDF:(CDVInvokedUrlCommand*)command
{
    
#pragma mark Constants
    
#define DEMO_VIEW_CONTROLLER_PUSH FALSE
    
#pragma mark UIViewController methods
    
    
    NSString *phrase = nil; // Document password (for unlocking most encrypted PDF files)
    
	//NSArray *pdfs = [[NSBundle mainBundle] pathsForResourcesOfType:@"pdf" inDirectory:nil];
    NSLog(@"%@",[command.arguments objectAtIndex:0]);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:(@"%@",[command.arguments objectAtIndex:0]) ofType:@"pdf"];
 
    //	NSString *filePath = [pdfs lastObject]; assert(filePath != nil); // Path to last PDF file
    
	ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    
	if (document != nil) // Must have a valid ReaderDocument object in order to proceed with things
	{
		ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        
		readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        self.pdfViewer = readerViewController;
#if (DEMO_VIEW_CONTROLLER_PUSH == TRUE)
        
		//[self.navigationController pushViewController:readerViewController animated:YES];
        
#else // present in a modal view controller
        
		//readerViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
		//readerViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        
		//[self presentModalViewController:readerViewController animated:YES];
        
#endif // DEMO_VIEW_CONTROLLER_PUSH
	}
    
    
    
 
    
    
    
	if (self.pdfViewer == nil) {
#if __has_feature(objc_arc)
        
        
        
        //self.pdfViewer = [[ReaderViewController alloc] init];


#else

        
        //self.pdfViewer = [[[ReaderViewController alloc] init] autorelease];



#endif
		//self.pdfViewer.delegate				= self;
		//self.pdfViewer.orientationDelegate	= self.viewController;
	}

	// TODO: Add better Modal Pres options
	pdfViewer.modalPresentationStyle = UIModalPresentationFullScreen;
	// pdfViewer.modalPresentationStyle = UIModalPresentationPageSheet;
	// pdfViewer.modalPresentationStyle = UIModalPresentationFormSheet;
	//pdfViewer.modalTransitionStyle = UIModalTransitionStylePartialCurl;
	pdfViewer.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
	// pdfViewer.modalTransitionStyle  =  UIModalTransitionStyleFlipHorizontal;

    
    
    
    
    
    
	[self.viewController presentModalViewController:pdfViewer animated:YES];

	//NSString *pdfName = (NSString *)[command.arguments objectAtIndex:0];

	//[self.pdfViewer loadPDF:pdfName];	// @"YingYang.pdf"];
}

- (void)close:(CDVInvokedUrlCommand*)command
{
	//[self.pdfViewer closeViewer];
}

- (void)onClose
{
	[self.webView stringByEvaluatingJavaScriptFromString:@"window.plugins.PDFViewer.onClose();"];
}

#if !__has_feature(objc_arc)
	- (void)dealloc
	{
		self.pdfViewer = nil;

		[super dealloc];
	}

#endif

@end
