//
//  ViewController.swift
//  Practice05-ImagePicker
//
//  Created by Mac on 2015. 10. 24..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	@IBOutlet var imgView: UIImageView!
	@IBOutlet var infoLabel: UILabel!
	@IBOutlet var info2Label: UILabel!


	@IBAction func openCamera(sender: AnyObject) {
		
		let picker = UIImagePickerController()
		
		// 카메라 사용가능 여부
		if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
/*
			// 전면 카메라 사용가능 여부
			if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) {
				
			}
			else {
				
			}
*/
			picker.sourceType = UIImagePickerControllerSourceType.Camera
		}
		else {

			let alert = UIAlertController(title: "", message: "카메라가 없습니다.", preferredStyle: .Alert)
			alert.addAction((UIAlertAction(title: "확인", style: .Cancel, handler: {(_)
			
			})))
			self.presentViewController(alert, animated: false, completion: nil)
			
			picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
		}
		
		picker.allowsEditing = false
		picker.delegate = self
		
		self.presentViewController(picker, animated: true, completion: nil)
	}
	
	func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
		
		// 이미지 불러와서 이미지뷰에 보여주기
		self.imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
		
		self.infoLabel.text = info[UIImagePickerControllerMediaType] as? String
		
		let metadata = info[UIImagePickerControllerMediaMetadata]
		self.info2Label.text = String(metadata?.count)
		
		// 창닫기 - 안닫아주면 리스트화면이 그대로 있음.
		picker.dismissViewControllerAnimated(false, completion: nil)
	}
	
	func imagePickerControllerDidCancel(picker: UIImagePickerController) {
		picker.dismissViewControllerAnimated(false, completion: {
			$0;
			let alert = UIAlertController(title: "", message: "취소되었습니다", preferredStyle: .Alert)
			alert.addAction((UIAlertAction(title: "확인", style: .Cancel, handler: nil)))
			self.presentViewController(alert, animated: false, completion: nil)
		})
	}
	
}

