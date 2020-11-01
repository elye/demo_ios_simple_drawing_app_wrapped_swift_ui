import Foundation
import UIKit

class CanvasView: UIView {
    
    override func draw(_ rect: CGRect){
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        paths.forEach { path in
            switch(path.type) {
            case .move:
                context.move(to: path.point)
                break
            case .line:
                context.addLine(to: path.point)
                break
            }
        }
        
        context.setLineWidth(10)
        context.setLineCap(.round)
        context.strokePath()
    }
    
    var paths = [Path]()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        paths.append(Path(type: .move, point: point))
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        paths.append(Path(type: .line, point: point))
        setNeedsDisplay()
    }
}

struct Path {
    let type: PathType
    let point: CGPoint
    
    init(type: PathType, point: CGPoint) {
        self.type = type
        self.point = point
    }
    
    enum PathType {
        case move
        case line
    }
}
