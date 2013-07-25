//PDFViewer based on ChildBrowser

/* MIT licensed */
// (c) 2010 Jesse MacFadyen, Nitobi
//
//  CDVPDFViewer
//  CDVEmailComposer Template Created Jan 7 2013
//  Copyright 2013 @RandyMcMillan

(function() {
 
 var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks
 
 function CDVPDFViewer() {
 // Does nothing
 }
 
  
 // Callback when the user chooses the 'Done' button
 // called from native
 CDVPDFViewer._onClose = function()
 {
 window.plugins.CDVPDFViewer.onClose();
 };
 
 
 
/* The interface that you will use to access functionality */
 
 // Show a webpage, will result in a callback to onLocationChange
 CDVPDFViewer.prototype.showPDF = function(loc)
 {
 cordovaRef.exec("CDVPDFViewer.showPDF", loc);
 };
 
 // close the browser, will NOT result in close callback
 CDVPDFViewer.prototype.close = function()
 {
 cordovaRef.exec("CDVPDFViewer.close");
 };
 
 // Not Implemented
 CDVPDFViewer.prototype.jsExec = function(jsString)
 {
 // Not Implemented!!
 //PhoneGap.exec("PDFViewerCommand.jsExec",jsString);
 };
 
 // Note: this plugin does NOT install itself, call this method some time after deviceready to install it
 // it will be returned, and also available globally from window.plugins.PDFViewer
 CDVPDFViewer.install = function()
 {
 if(!window.plugins) {
 window.plugins = {};
 }
 if ( ! window.plugins.CDVPDFViewer ) {
 window.plugins.CDVPDFViewer = new CDVPDFViewer();
 }
 
 };
 
 
 if (cordovaRef && cordovaRef.addConstructor) {
 cordovaRef.addConstructor(CDVPDFViewer.install);
 } else {
 console.log("CDVPDFViewer Cordova Plugin could not be installed.");
 return null;
 }
 
 
 })();
