//
//  DrawingView.swift
//  GuessTheDoodle
//
//  Created by Bakhtiyorjon Mirzajonov on 10/22/23.
//

import SwiftUI
import PencilKit

struct DrawingView: UIViewRepresentable {
  class Coordinator: NSObject, PKCanvasViewDelegate {
    var matchManager: MatchManager
    
    init(matchManager: MatchManager) {
      self.matchManager = matchManager
    }
    
    func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
      guard canvasView.isUserInteractionEnabled else { return }
      matchManager.sendData(canvasView.drawing.dataRepresentation(), mode: .reliable)
    }
  }
  
  @ObservedObject var matchManager: MatchManager
  @Binding var eraserEnabled: Bool
  
  func makeUIView(context: Context) -> PKCanvasView {
    let canvasView = PKCanvasView()
    canvasView.drawingPolicy = .anyInput
    canvasView.tool = PKInkingTool(.pen, color: .black, width: 5)
    canvasView.delegate = context.coordinator
    canvasView.isUserInteractionEnabled = matchManager.currentlyDrawing
    
    return canvasView
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(matchManager: matchManager)
  }
  
  func updateUIView(_ uiView: PKCanvasView, context: Context) {
    let wasDrawing = uiView.isUserInteractionEnabled
    uiView.isUserInteractionEnabled = matchManager.currentlyDrawing
    if !wasDrawing && matchManager.currentlyDrawing {
      uiView.drawing = PKDrawing()
    }
    
    if !uiView.isUserInteractionEnabled || !matchManager.inGame {
      uiView.drawing = matchManager.lastReceivedDrawing
    }
    
    uiView.tool = eraserEnabled ? PKEraserTool(.vector) : PKInkingTool(.pen, color: .black, width: 5)
  }
}

struct DrawingView_Previews: PreviewProvider {
  @State static var eraser = false
  static var previews: some View {
    DrawingView(matchManager: MatchManager(), eraserEnabled: $eraser)
  }
}
