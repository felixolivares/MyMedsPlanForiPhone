//
//  PlanTableViewCell.swift
//  MyMedsPlanForiPhone
//
//  Created by Felix Olivares on 7/2/15.
//  Copyright © 2015 Felix Olivares. All rights reserved.
//

import UIKit


class PlanTableViewCell: UITableViewCell, ZGCountDownTimerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var counter: UILabel!
    
    var myCountDownTimer : ZGCountDownTimer = ZGCountDownTimer()
    
//    let defaultBtn: SFlatButton = SFlatButton(frame: CGRectMake(227, 76, 80, 35), sfButtonType: SFlatButton.SFlatButtonType.SFBSuccess)

    let btn: SFlatButton = SFlatButton(frame: CGRectMake(1, 1, 80, 35), sfButtonType: SFlatButton.SFlatButtonType.SFBSuccess)
    var myTimer : NSString = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let textColor : UIColor = UIColor(rgb: 0x2a4d69)
        
        
        nameLabel.center = CGPointMake(10, 10)
        nameLabel.textColor = textColor
        self.contentView.addSubview(nameLabel)
        
        
        btn.setTitle("Default", forState: UIControlState.Normal)
        self.contentView.addSubview(btn)
        
        
    }
    
    override func layoutSubviews() {
        self.myCountDownTimer = ZGCountDownTimer(identifier: self.myTimer as String)
        self.myCountDownTimer.delegate = self
        self.myCountDownTimer.setupCountDownForTheFirstTime({ (timer:ZGCountDownTimer!) -> Void in
            timer.totalCountDownTime = 28800
            }, restoreFromBackUp: { (timer:ZGCountDownTimer!) -> Void in
                if !timer.isRunning{
                    print("timer is not running (restore)")
                }else{
                    print("timer is running (restore)")
                }
        })
        
        self.myCountDownTimer.startCountDown()
        
        }
    override func updateConstraints() {
        
        btn.autoPinEdge(.Trailing, toEdge: .Trailing, ofView: self.contentView, withOffset: -10)
        btn.autoPinEdge(.Top , toEdge: .Bottom, ofView: counter, withOffset: 20)
        btn.autoSetDimension(.Height , toSize: 35)
        btn.autoSetDimension(.Width, toSize: 80)
        
        super.updateConstraints()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func secondUpdated(sender: ZGCountDownTimer!, countDownTimePassed timePassed: NSTimeInterval, ofTotalTime totalTime: NSTimeInterval) {
        self.counter.text = ZGCountDownTimer.getDateStringForTimeInterval(totalTime - timePassed)
    }
    
    func countDownCompleted(sender: ZGCountDownTimer!) {
        print("Completed")
    }
}
