//
//  DateValidator.swift
//  DaysCalculator
//
//  Created by Alam, Sk on 22/02/2021.
//  Copyright © 2021 AlamShaikh. All rights reserved.
//

import Foundation
class DateValidator: NSObject {
    
    
  static func getDays(fromDate: String, toDate: String ) -> (Int, Int, Int) {
        let arrFromDate = fromDate.components(separatedBy: "/")
        let fromDay = Int(arrFromDate[0]) ?? 0
        let fromMonth = Int(arrFromDate[1]) ?? 0
        let fromYear = Int(arrFromDate[2]) ?? 0
        
        let arrToDate = toDate.components(separatedBy: "/")
        let toDay = Int(arrToDate[0]) ?? 0
        let toMonth = Int(arrToDate[1]) ?? 0
        let toYear = Int(arrToDate[2]) ?? 0
        
        var startDay = fromDay//
        var startMonth = fromMonth
        var startYear = fromYear
        
        var endDay = toDay
        var endMonth = toMonth
        var endYear = toYear
        
        var diffDays = 0
        var diffMonths = 0
        var diffYears = 0
        
        
        if(toYear < fromYear) {
            // swap the dates
            startDay = toDay
            startMonth = toMonth
            startYear = toYear
            
            endDay = fromDay
            endMonth = fromMonth
            endYear = fromYear
            
        } else if (toYear == fromYear) {
            if (toMonth < fromMonth){
                // swap the dates
                startDay = toDay
                startMonth = toMonth
                startYear = toYear
                
                endDay = fromDay
                endMonth = fromMonth
                endYear = fromYear

            } else if ( toMonth == fromMonth ){
                if(toDate < fromDate){
                    // swap the number
                    startDay = toDay
                    startMonth = toMonth
                    startYear = toYear
                    
                    endDay = fromDay
                    endMonth = fromMonth
                    endYear = fromYear
                }
            }
        }
        if(endDay < startDay)
        {
            // take days from february if there is leap year
            if (endMonth == 3){
                //  checking leap year
                if ((endYear % 4 == 0 && endYear % 100 != 0) || (endYear % 400 == 0)){
                    endDay += 29;
                } else {
                    endDay += 28;
                }
            }// taking days from April or June or September or November
            else if (endMonth == 5 || endMonth == 7 || endMonth == 10 || endMonth == 12) {
               endDay += 30;
            } else {
               endDay += 31;
            }

            endMonth = endMonth - 1;
        }

        if (endMonth < startMonth)
        {
            endMonth += 12;
            endYear -= 1;
        }

        diffDays = endDay - startDay;
        diffMonths = endMonth - startMonth;
        diffYears = endYear - startYear;
        return (diffYears , diffMonths, diffDays)
    }

}
