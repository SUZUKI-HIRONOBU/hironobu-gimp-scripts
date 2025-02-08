(define (script-fu-duplicate-layer-and-fill image drawable)
    (let* (
                    (layer (car (gimp-layer-copy drawable TRUE)))
                    (layer-width (car (gimp-image-width image)))
                    (layer-height (car (gimp-image-height image)))
                )
        (gimp-image-add-layer image layer -1)
        (gimp-layer-resize-to-image-size layer)
        (gimp-selection-layer-alpha layer)
        (gimp-selection-grow image 10) ; Adjust the value as needed
        (gimp-edit-fill layer FOREGROUND-FILL)
        (gimp-displays-flush)
    )
)

(script-fu-register
    "script-fu-duplicate-layer-and-fill"
    "チャンネル文字"
    "YouTubeでよく使うチャンネル文字の背景を作るフィルタ"
    "suzuki.hironobu@gmail.com"
    "Copyright 2025 GPLv3 by Hironobu Suzuki (Using Copilot)"
    "2025"
    "*"
    SF-IMAGE "Image" 0
    SF-DRAWABLE "Drawable" 0
)

(script-fu-menu-register "script-fu-duplicate-layer-and-fill" "<Image>/Filters/TextDeco")
