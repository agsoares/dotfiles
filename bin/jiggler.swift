#!/usr/bin/env swift

import Cocoa

signal(SIGINT) { _ in
    exit(EXIT_FAILURE)
}

while true {

    let mouseCursorPosition = CGPoint(x: Int.random(in: 0...500), y: Int.random(in: 0...500))
    CGWarpMouseCursorPosition(mouseCursorPosition)

    sleep(1)
}