(defmodule yaws-websocket-routes
  (export all))

(include-lib "deps/exemplar/include/html-macros.lfe")

(defun routes
  "2-arity routes for our app."
  ;; /
  (((list '"") arg-data)
    (: yaws-websocket-content get-content arg-data))
  ;; /content/:id
  (((list '"content" item-id) arg-data)
    (: yaws-websocket-content get-content item-id arg-data))
  ;; /relation/:userid/:accountid
  (((list '"relation" user-id account-id) arg-data)
    (: yaws-websocket-content get-content user-id account-id arg-data))
  ;; potentially many other routes
  ;;
  ;; When nothing matches, do this
  ((path arg-data)
   (let* ((joined-path (++ '"/" (: string join path '"/")))
          (msg (++ '"Unmatched route!~n~n"
                   '"Path-info: ~p~n"
                   '"joined path: ~p~n"
                   '"arg-data: ~p~n~n"))
          (msg-args (list path joined-path arg-data)))
    (: io format msg msg-args)
    (: yaws-websocket-content four-oh-four
      (++ (strong '"Unmatched Route: ") joined-path)))))
