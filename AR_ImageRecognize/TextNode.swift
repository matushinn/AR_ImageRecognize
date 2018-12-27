//
//  TextNode.swift
//  AR_ImageRecognize
//
//  Created by 大江祥太郎 on 2018/12/27.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import ARKit

class TextNode: SCNNode {
    required init?(coder aDecoder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(str:String){
        super.init()
        //文字のジオメトリを作る
        let text = SCNText(string: str, extrusionDepth: 0.01)
        text.font = UIFont(name: "Futura-Bold", size: 1)
        //塗り
        text.firstMaterial?.diffuse.contents = UIColor.red
        
        //テキストノードを作る
        let textNode = SCNNode(geometry: text)
        //子ノードとして追加する
        self.addChildNode(textNode)
        
        //boundingBoxから幅と高さを求めます
        let (max,min) = textNode.boundingBox
        let w = abs(CGFloat(max.x-min.x))
        let h = abs(CGFloat(max.y-min.y))
        textNode.position = SCNVector3(-w/2, -h*1.2, 0)
        
        //全体縮小する
        self.scale = SCNVector3(0.04, 0.04, 0.04)
        
    }

}
