(defmodule yaws-websocket-util
  (export all))

(defun get-yaws-websocket-version ()
  (lutil:get-app-src-version "src/yaws-websocket.app.src"))

(defun get-versions ()
  (++ (lutil:get-version)
      `(#(yaws-websocket ,(get-yaws-websocket-version)))))
