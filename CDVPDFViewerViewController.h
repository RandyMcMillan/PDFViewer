// PDFViewer based on ChildBrowser

//  Created by Jesse MacFadyen on 10-05-29.
//  Copyright 2010 Nitobi. All rights reserved.
//
//  CDVPDFViewer
//  CDVEmailComposer Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan

#import <UIKit/UIKit.h>

@protocol CDVPDFViewerDelegate <NSObject>

- (void)onClose;

@end

@protocol CDVOrientationDelegate <NSObject>

- (NSUInteger)supportedInterfaceOrientations;
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation;
- (BOOL)shouldAutorotate;

@end

@class PDFView;

@interface CDVPDFViewerViewController : UIViewController <UIWebViewDelegate>{}

@property (nonatomic, strong) IBOutlet UIButton *closeBtn;

@property (nonatomic, strong) IBOutlet PDFView		*pdfView;
@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIImageView	*imageView;
@property (nonatomic, strong) IBOutlet UIToolbar	*toolBar;

// unsafe_unretained is equivalent to assign - used to prevent retain cycles in the two properties below
@property (nonatomic, unsafe_unretained) id <CDVPDFViewerDelegate>	delegate;
@property (nonatomic, unsafe_unretained) id									orientationDelegate;

+ (NSString *)resolveImageResource:(NSString *)resource;
- (CDVPDFViewerViewController *)initWithScale:(BOOL)enabled;
- (void)viewDidLoad;

- (IBAction)onDoneButtonPress:(id)sender;
- (void)loadPDF:(NSString *)pdfName;
- (void)closeViewer;
- (BOOL)shouldAutorotate;

@end
