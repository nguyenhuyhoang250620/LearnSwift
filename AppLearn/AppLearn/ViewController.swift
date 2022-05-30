//
//  ViewController.swift
//  AppLearn
//
//  Created by Nguyen huy hoang on 30/05/2022.
//


import UIKit


class ViewController: UIViewController,UIImagePickerControllerDelegate,
                      UINavigationControllerDelegate {

    
    
    
    @IBOutlet weak var sign_in: UIButton!
    @IBOutlet weak var password_label: UILabel!
    @IBOutlet weak var usename_label: UILabel!
    @IBOutlet weak var get_info: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var usename: UITextField!
    @IBOutlet weak var Add_avatar: UIButton!
    @IBOutlet weak var imagePicked: UIImageView!
    //    @IBOutlet weak var mylabel: UILabel!
//    @IBOutlet weak var Get_Value: UIButton!
//    @IBOutlet weak var myText: UITextField!
//    @IBOutlet weak var imagePicked: UIImageView!
//    @IBOutlet weak var OpenCamera: UIButton!
//    @IBOutlet weak var alert_buttom: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        usename_label.text=""
        password_label.text=""
    }
    
    @IBAction func get_info_click(_ sender: Any) {
        let user = usename.text ?? ""
        usename_label.text = "\(user)"
        let pass = password.text ?? ""
        password_label.text = "\(pass)"
    }
    
    @IBAction func Signin_click(_ sender: Any) {
        let users = usename.text ?? ""
        let alert = UIAlertController(title: "Đăng nhập thành công", message: "Xin chào \(users)", preferredStyle: .alert)
                
                //Khởi tạo các action (các nút) cho alert
                let alertActionOk = UIAlertAction(title: "OK", style: .default) { (act) in
                    print("action ok") //action khi nhấn nút OK
                }
                let alertActionDestructive = UIAlertAction(title: "Destructive", style: .destructive) { (act) in
                    print("action destructive") //action khi nhấn nút Destructive
                }
                let alertActionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (act) in
                    print("action destructive") //action khi nhấn nút Cancel
                }
                
                //Thêm các action vào alert
                alert.addAction(alertActionOk)
                alert.addAction(alertActionDestructive)
                alert.addAction(alertActionCancel)
                
                //Hiển thị alert
                self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func add_avatar_click(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                imagePicker.allowsEditing = true
                self.present(imagePicker, animated: true, completion: nil)
            }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.dismiss(animated: true, completion: nil)
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            print("hoang")
            imagePicked.image = image
            self.dismiss(animated: true, completion: nil)
        }
    
}
