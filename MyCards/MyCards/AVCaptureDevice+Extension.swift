//
//  AVCaptureDevice+Extension.swift
//  MyCards
//
//  Created by Maciej Piotrowski on 04/12/16.
//

import AVFoundation

extension AVCaptureDevice {
    class var duoBackVideoCamera: AVCaptureDevice? {
        return AVCaptureDevice.default(
            .builtInDuoCamera, for: AVMediaType.video, position: .back)
    }

    class var duoFrontVideoCamera: AVCaptureDevice? {
        return AVCaptureDevice.default(.builtInDuoCamera, for: AVMediaType.video, position: .front)
    }

    class var wideAngleBackVideoCamera: AVCaptureDevice? {
        return AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .back)
    }

    class var wideAngleFrontVideoCamera: AVCaptureDevice? {
        return AVCaptureDevice.default(.builtInWideAngleCamera, for: AVMediaType.video, position: .front)
    }

    class var backVideoCamera: AVCaptureDevice? {
        return duoBackVideoCamera ?? wideAngleBackVideoCamera
    }
}
