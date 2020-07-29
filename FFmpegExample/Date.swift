//
//  Date.swift
//  FFmpegExample
//
//  Created by Apple on 7/28/20.
//  Copyright © 2020 Apple. All rights reserved.
//

extension Date
{
    func toString( dateFormat format  : String ) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
