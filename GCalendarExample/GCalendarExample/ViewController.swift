//
//  ViewController.swift
//  GCalendarExample
//
//  Created by Kyle Shank on 11/3/15.
//  Copyright © 2015 Blade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var startDate:NSDate?
    var endDate:NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendar = FSCalendar()
        
        calendar.frame = CGRect(x: 2, y: (view.frame.size.height / 2.0) - 150.0, width: 371.0, height: 300)
        calendar.delegate = self
        calendar.dataSource = self
        calendar.scrollDirection = FSCalendarScrollDirection.Vertical
        
        calendar.appearance.headerFont = "Geomanist-Light"
        calendar.appearance.headerTitleColor = UIColor(red: 174.0/255.0, green: 174.0/255.0, blue: 174.0/255.0, alpha: 1.0)
        calendar.appearance.headerUppercase = true
        calendar.appearance.headerTitleTextSize = 20
        calendar.appearance.weekdayFont = "Geomanist-Light"
        calendar.appearance.weekdayTextColor = UIColor(red: 174.0/255.0, green: 174.0/255.0, blue: 174.0/255.0, alpha: 1.0)
        calendar.appearance.weekdayUppercase = true
        calendar.appearance.weekdayTextSize = 13
        calendar.appearance.dayFont = "Geomanist-Light"
        calendar.appearance.cellStyle = .Rectangle
        calendar.appearance.titleTodayColor = UIColor.blackColor()
        calendar.appearance.titleSelectionColor = UIColor(red: 255.0/255.0, green: 87.0/255.0, blue: 87.0/255.0, alpha: 1.0)
        calendar.appearance.titleSelectionFont = "Geomanist-Bold"
        
        calendar.invalidateWeekdaySymbols()
        calendar.reloadData()
        
        view.addSubview(calendar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : FSCalendarDataSource, FSCalendarDelegate {
    func startDateForCalendar(calendar: FSCalendar!) -> NSDate! {
        return self.startDate;
    }
    
    func endDateForCalendar(calendar: FSCalendar!) -> NSDate! {
        return self.endDate;
    }
    
    func minimumDateForCalendar(calendar: FSCalendar!) -> NSDate! {
        return NSDate()
    }
    
    func calendar(calendar: FSCalendar!, didSelectDate date: NSDate!) {
        if self.startDate != nil && self.endDate != nil {
            self.startDate = nil
            self.endDate = nil
        }
        if self.startDate == nil {
            self.startDate = date
            calendar.startDate = date
            calendar.endDate = nil
        }else{
            self.endDate = date
            calendar.endDate = date
        }
    }
}
