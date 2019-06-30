import UIKit
import LoginWithEgov
class ViewController: UIViewController {

    @IBOutlet weak var loginButton: AsanLoginDesign!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(clciked))
        loginButton.addGestureRecognizer(tapGesture)
    }
    
    @objc func clciked(){
        let controller = LoginController()
        controller.endpoint = "az.gov.emdk"
        self.present(controller, animated: true, completion: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "main") as! LogoutViewController
        controller.controller = vc
    }


    @IBAction func girisClicked(_ sender: Any) {
        LoginController.shared.getFinalToken{(token) in
            if(token == "")
            {
                print("Daxil OL")
            }
            else
            {
                self.performSegue(withIdentifier: "segueToMain", sender: self)
            }
        }
    }
    