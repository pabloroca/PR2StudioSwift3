//
//  PR2Common.swift
//
//  Created by Pablo Roca Rozas on 24/1/16.
//  Copyright © 2016 PR2Studio. All rights reserved.
//
// Common functions for any project

import Foundation
import UIKit
import CoreTelephony

extension String {
   func PR2trimLeadingZeroes() -> String {
      var result = ""
      for character in self.characters {
         if result.isEmpty && character == "0" { continue }
         result.append(character)
      }
      return result
   }
}

/// Commom functions for any project
public class PR2Common {
   
   public init() { }
   
   /**
    Displays network activity indicator in status bar
    */
   public func showNetworkActivityinStatusBar() {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = true
   }
   /**
    Hides network activity indicator in status bar
    */
   public func hideNetworkActivityinStatusBar() {
      UIApplication.sharedApplication().networkActivityIndicatorVisible = false
   }
   
   var topMostVC: UIViewController? {
      var presentedVC = UIApplication.sharedApplication().keyWindow?.rootViewController
      while let pVC = presentedVC?.presentedViewController {
         presentedVC = pVC
      }
      
      if presentedVC == nil {
         print("Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
      }
      return presentedVC
   }
   
   /**
    Simple alert view
    
    - parameter title: title of the alert.
    - parameter message: message to show in the alert.
    */
   public func simpleAlert(title title: String, message: String) {
      let alertController = UIAlertController(title: title, message:
         message, preferredStyle: UIAlertControllerStyle.Alert)
      alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
      
      if let rootViewController = self.topMostVC {
         rootViewController.presentViewController(alertController, animated: true, completion: nil)
      }
   }
   
   public func canDevicePlaceAPhoneCall() -> Bool {
      if UIApplication.sharedApplication().canOpenURL(NSURL(string: "tel://")!) {
         let netInfo = CTTelephonyNetworkInfo()
         let carrier = netInfo.subscriberCellularProvider
         let mnc = carrier?.mobileNetworkCode
         if (mnc?.characters == nil || mnc! == "65535") {
            // Device cannot place a call at this time.  SIM might be removed.
            return false
         } else {
            // Device can place a phone call
            return true
         }
      } else {
         return false
      }
   }
   
   public func documentsDirectory() -> String {
      let documentsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
      return documentsFolderPath
   }
   
   // File in Documents directory
   public func fileInDocumentsDirectory(filename: String) -> String {
      return documentsDirectory().stringByAppendingPathComponent(filename)
   }
   
   public func saveImage(image: UIImage, path: String) -> Bool {
      let pngImageData = UIImagePNGRepresentation(image)
      let result = pngImageData!.writeToFile(path, atomically: true)
      return result
   }
   
   public func loadImageFromPath(path: String) -> UIImage? {
      let data = NSData(contentsOfFile: path)
      if let data = data {
         let image = UIImage(data: data)
         return image
      } else {
         return nil
      }
   }
   
   // MARK: - Regex
   
   /// checks if text matches regex pattern
   public func regex(text: String?, regex: String?) -> Bool {
      guard let text = text else {
         return false
      }
      guard let regex = regex else {
         return false
      }
      if let _ = text.rangeOfString(regex, options: .RegularExpressionSearch) {
         return true
      } else {
         return false
      }
   }
   
   // extracts regex matches in an array
   // from http://stackoverflow.com/questions/27880650/swift-extract-regex-matches
   //
   public func matchesForRegexInText(text: String?, regex: String?) -> [String] {
      guard let text = text else {
         return []
      }
      guard let regex = regex else {
         return []
      }
      
      do {
         let regex = try NSRegularExpression(pattern: regex, options: [])
         let nsString = text as NSString
         let results = regex.matchesInString(text,
                                             options: [], range: NSMakeRange(0, nsString.length))
         return results.map { nsString.substringWithRange($0.range)}
      } catch _ as NSError {
         //      print("invalid regex: \(error.localizedDescription)")
         return []
      }
   }

   
}
