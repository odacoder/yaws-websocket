(defmodule yaws-websocket
  (export all))

(defun my-adder (x y)
  (+ x (+ y 1)))

(defun out (arg-data)
  "This function is executed by YAWS. It is the YAWS entry point for our app."
  (let ((raw-path-info (: yaws-websocket-util parse-path arg-data)))
    (if (== raw-path-info 'undefined)
      (: yaws-websocket-routes routes '("") arg-data)
      (let ((path-info (: string tokens raw-path-info '"/")))
        (: yaws-websocket-routes routes path-info arg-data)))))
