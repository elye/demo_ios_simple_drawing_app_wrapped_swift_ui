import UIKit

class CanvasViewController: UIViewController {
    
    let canvas = CanvasView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvas)
        canvas.backgroundColor = .lightGray
        canvas.frame = view.frame
    }
}
