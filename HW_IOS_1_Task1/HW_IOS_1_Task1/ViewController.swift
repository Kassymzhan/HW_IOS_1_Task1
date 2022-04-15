//
//  ViewController.swift
//  HW_IOS_1_Task1
//
//  Created by Касымжан Гиждуан on 11.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let reminderButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Repeat", for: .normal)
        button.contentHorizontalAlignment = .left
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let reminderNameLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.text = "Get Groceries"
        label.backgroundColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        
        return label
    }()
    
    let daySwitchLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.text = "Remind me on a day"
        label.backgroundColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        return label
    }()
    
    let daySwitch: UISwitch = {
        let dayswitch = UISwitch()
        dayswitch.addTarget(self, action: #selector(daySwitchChanged(sender:)), for: .valueChanged)
        return dayswitch
    }()
    
    @objc func daySwitchChanged(sender: UISwitch) {
        print("Remind me on a day is switched")
    }
    
    let datePickerLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        label.text = formatter.string(from: date)
        label.textColor = .systemBlue
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        label.backgroundColor = .white
        return label
    }()
        
    let datePickerButton: UIButton = {
        let button = UIButton(type: .system)
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        button.setTitle(formatter.string(from: date), for: .normal)
        button.backgroundColor = .white
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    let backgroundView: UIView = {
        let background = UIView()
        background.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 245/255, alpha: 1)
        return background
    }()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        return formatter
    }
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .dateAndTime
        picker.preferredDatePickerStyle = .wheels
        picker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        return picker
    }()
    
    @objc func dateChange(datePicker: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        datePickerButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
        print("Date changed to: \(datePicker.date)")
    }
    
    let repeatLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.backgroundColor = .white
        label.text = "Repeat"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        return label
    }()
    
    let topView: UIView = {
        let someView = UIView()
        someView.backgroundColor = .white
        return someView
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        return button
    }()
    
    let topViewLabel: UILabel = {
        let label = UILabel()
        label.text = "Create Reminder"
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
        return label
    }()
    
    let doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let locationLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.backgroundColor = .white
        label.text = "Remind me at a location"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        return label
    }()
    
    let locationSwitch: UISwitch = {
        let locswitch = UISwitch()
        locswitch.addTarget(self, action: #selector(locationSwitchChanged(sender:)), for: .valueChanged)
        return locswitch
    }()
    
    @objc func locationSwitchChanged(sender: UISwitch) {
        print("Remind me at lication is switched")
    }
    
    let priorityLabel: PaddingLabel = {
        let label = PaddingLabel(padding: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0))
        label.backgroundColor = .white
        label.text = "Priority"
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        return label
    }()
    
    let segmentContol: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "None", at: segment.numberOfSegments, animated: true)
        segment.insertSegment(withTitle: "!", at: segment.numberOfSegments, animated: true)
        segment.insertSegment(withTitle: "!!", at: segment.numberOfSegments, animated: true)
        segment.insertSegment(withTitle: "!!!", at: segment.numberOfSegments, animated: true)
        segment.selectedSegmentTintColor = .systemBlue
        segment.addTarget(self, action: #selector(didChangeSegment(sender:)), for: .valueChanged)
        return segment
    }()
        
    @objc func didChangeSegment(sender: UISegmentedControl) {
        switch segmentContol.selectedSegmentIndex {
        case 0: print("Priority is changed to: None")
        case 1: print("Priority is changed to: !")
        case 2: print("Priority is changed to: !!")
        case 4: print("Priority is changed to: !!!")
        default: break
        }
    }
    
    let notesTextField: UITextView = {
        let notes = UITextView()
        notes.backgroundColor = .white
        notes.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        notes.textContainer.lineFragmentPadding = 20
        notes.text = "Notes"
        return notes
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundViewDisplay()
        topViewDisplay()
        reminderNameLabelDisplay()
        cancelButtonDisplay()
        topViewLabelDisplay()
        doneButtonDisplay()
        daySwitchLabelDisplay()
        daySwitchDisplay()
        datePickerButtonDisplay()
        datePickerDisplay()
        repeatLabelDisplay()
        locationLabelDisplay()
        locationSwitchDisplay()
        priorityLabelDisplay()
        segmentContolDisplay()
        notesTextFieldDisplay()
        reminderButtonDisplay()
    }
    
    private func reminderButtonDisplay() {
        view.addSubview(reminderButton)
        
        reminderButton.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.centerY.equalTo(repeatLabel)
        }
        reminderButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        reminderButton.titleEdgeInsets = UIEdgeInsets(top: 0, left:20, bottom: 0, right: 0)
    }
    
    private func notesTextFieldDisplay() {
        view.addSubview(notesTextField)
        
        notesTextField.snp.makeConstraints() {
            $0.height.equalTo(120)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(priorityLabel.snp.bottom).offset(1)
        }
    }
    
    private func segmentContolDisplay() {
        view.addSubview(segmentContol)
        
        segmentContol.snp.makeConstraints() {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(priorityLabel)
        }
    }
    
    private func priorityLabelDisplay() {
        view.addSubview(priorityLabel)
        
        priorityLabel.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(locationLabel.snp.bottom).offset(20)
        }
    }
    
    private func locationSwitchDisplay() {
        view.addSubview(locationSwitch)
        
        locationSwitch.snp.makeConstraints() {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(locationLabel)
        }
    }
    
    private func locationLabelDisplay() {
        view.addSubview(locationLabel)
        
        locationLabel.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(repeatLabel.snp.bottom).offset(20)
        }
    }
    
    private func repeatLabelDisplay() {
        view.addSubview(repeatLabel)
        
        repeatLabel.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(datePicker.snp.bottom).offset(-20)
        }
    }
    
    private func datePickerButtonDisplay() {
        view.addSubview(datePickerButton)
        
        datePickerButton.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(daySwitchLabel.snp.bottom).offset(1)
        }
        datePickerButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        datePickerButton.titleEdgeInsets = UIEdgeInsets(top: 0, left:20, bottom: 0, right: 0)
    }

    private func backgroundViewDisplay() {
        view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints() {
            $0.edges.equalToSuperview()
        }
    }

    private func reminderNameLabelDisplay() {
        view.addSubview(reminderNameLabel)
        
        reminderNameLabel.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(topView.snp.bottom).offset(20)
        }
        
    }
    
    private func datePickerDisplay() {
        view.addSubview(datePicker)
        
        datePicker.snp.makeConstraints() {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(datePickerButton.snp.bottom)
        }
    }
    
    private func topViewDisplay() {
        view.addSubview(topView)
        
        topView.snp.makeConstraints() {
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(-90)
        }
    }
    
    private func cancelButtonDisplay() {
        view.addSubview(cancelButton)
        
        cancelButton.snp.makeConstraints() {
            $0.bottom.equalTo(topView.snp.bottom).offset(-10)
            $0.leading.equalTo(topView.snp.leading).offset(20)
        }
        cancelButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
    }

    private func topViewLabelDisplay() {
        view.addSubview(topViewLabel)
        
        topViewLabel.snp.makeConstraints() {
            $0.centerX.equalTo(topView)
            $0.bottom.equalTo(topView.snp.bottom).offset(-15)
        }
        
    }
    
    private func doneButtonDisplay() {
        view.addSubview(doneButton)
        
        doneButton.snp.makeConstraints() {
            $0.trailing.equalTo(topView.snp.trailing).offset(-20)
            $0.bottom.equalTo(topView.snp.bottom).offset(-10)
        }
        doneButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
    }
    
    private func daySwitchLabelDisplay() {
        view.addSubview(daySwitchLabel)
        
        daySwitchLabel.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(reminderNameLabel.snp.bottom).offset(20)
            
        }
    }
    
    private func daySwitchDisplay() {
        view.addSubview(daySwitch)
        
        daySwitch.snp.makeConstraints() {
            $0.trailing.equalToSuperview().offset(-20)
            $0.centerY.equalTo(daySwitchLabel)
        }
    }
    
    private func datePickerLabelDisplay() {
        view.addSubview(datePickerLabel)
        
        datePickerLabel.snp.makeConstraints() {
            $0.height.equalTo(40)
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(daySwitchLabel.snp.bottom).offset(1)
        }
    }
}
