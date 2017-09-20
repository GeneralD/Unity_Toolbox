//
//  ViewController.swift
//  Unity Toolbox
//
//  Created by Yumenosuke Koukata on 2017/09/21.
//  Copyright © 2017 ZYXW. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet weak var installedVersionsTableView: NSTableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		do {
			let pw = getpwuid(getuid())
			let home = pw?.pointee.pw_dir
			let homePath = FileManager.default.string(withFileSystemRepresentation: home!, length: Int(strlen(home)))
			let unityDirectory = "\(homePath)/Developer/Unity_Versions/"
			let contentsAtPath = try FileManager.default.contentsOfDirectory(atPath: unityDirectory)
			contentsAtPath.forEach { path in
				NSLog(path)
			}
		} catch (let e) {
			NSLog(e.localizedDescription)
		}
	}

	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
		}
	}
}
