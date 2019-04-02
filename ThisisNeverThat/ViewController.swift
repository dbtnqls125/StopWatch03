//
//  ViewController.swift
//  ThisisNeverThat
//
//  Created by D7703_04 on 2019. 3. 12..
//  Copyright © 2019년 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbTime: UILabel!
    
    var _hour = 0
    var _min = 0
    var _sec = 0
    var _timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabel()
    }
    
    func setLabel() {
        lbTime.text = String(format: "%02d:%02d:%02d", _hour, _min, _sec)
    }
    
    @IBAction func btnPlay(_ sender: UIBarButtonItem) {
        if (_timer.isValid) { return }
        
        _timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (Timer) in
            
            self._sec += 1
            if (self._sec == 60) {
                self._sec = 0
                self._min += 1
                if (self._min == 60) {
                    self._min = 0
                    self._hour += 1
                }
            }
            
            self.setLabel()
        })
    }
    
    @IBAction func btnPause(_ sender: UIBarButtonItem) {
        _timer.invalidate()
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        _timer.invalidate()
        _hour = 0
        _min = 0
        _sec = 0
        setLabel()
    }
}
