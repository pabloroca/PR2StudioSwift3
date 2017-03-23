//
//  PR2Dates.swift
//  FashionBrowserPablo
//
//  Created by Pablo Roca Rozas on 27/1/16.
//  Copyright © 2016 PR2Studio. All rights reserved.
//

import Foundation

extension String {
   
   public func PR2DateFormatterFromWeb() -> NSDate {
      return NSDateFormatter.PR2DateFormatterFromWeb.dateFromString(self)!
   }
   
   public func PR2DateFormatterFromAPI() -> NSDate {
      return NSDateFormatter.PR2DateFormatterFromAPI.dateFromString(self)!
   }
   
   public func PR2DateFormatterUTCiso8601() -> NSDate {
      return NSDateFormatter.PR2DateFormatterUTCiso8601.dateFromString(self)!
   }
   
}

extension NSDate {
   
   // Date format for API
   public func PR2DateFormatterFromAPI() -> String {
      return NSDateFormatter.PR2DateFormatterFromAPI.stringFromDate(self)
   }
   
   // Date format for Logs
   public func PR2DateFormatterForLog() -> String {
      return NSDateFormatter.PR2DateFormatterForLog.stringFromDate(self)
   }
   
   // Date in UTC
   public func PR2DateFormatterUTC() -> String {
      return NSDateFormatter.PR2DateFormatterUTC.stringFromDate(self)
   }
   
   // Date in UTCiso8601
   public func PR2DateFormatterUTCiso8601() -> String {
      return NSDateFormatter.PR2DateFormatterUTCiso8601.stringFromDate(self)
   }
   
   // Date in HHMMh
   public func PR2DateFormatterHHMM() -> String {
      return NSDateFormatter.PR2DateFormatterHHMM.stringFromDate(self)
   }
   
}

extension NSDateFormatter {
   
   private static let PR2DateFormatterFromWeb: NSDateFormatter = {
      let formatter = NSDateFormatter()
      "Tue, 08 Mar 2016 18:05:40 GMT"
      formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss zzz"
      return formatter
   }()
   
   private static let PR2DateFormatterFromAPI: NSDateFormatter = {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      return formatter
   }()
   
   private static let PR2DateFormatterForLog: NSDateFormatter = {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
      return formatter
   }()
   
   private static let PR2DateFormatterUTC: NSDateFormatter = {
      let formatter = NSDateFormatter()
      let timeZone = NSTimeZone(name:"UTC")
      formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      formatter.timeZone = timeZone
      return formatter
   }()
   
   // from http://stackoverflow.com/questions/28016578/swift-how-to-create-a-date-time-stamp-and-format-as-iso-8601-rfc-3339-utc-tim
   private static let PR2DateFormatterUTCiso8601: NSDateFormatter = {
      let formatter = NSDateFormatter()
      let timeZone = NSTimeZone(name:"UTC")
      formatter.calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierISO8601)
      formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
      formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
      formatter.timeZone = timeZone
      return formatter
   }()
   
   private static let PR2DateFormatterHHMM: NSDateFormatter = {
      let formatter = NSDateFormatter()
      formatter.dateFormat = "HH:mm"
      return formatter
   }()
   
}
