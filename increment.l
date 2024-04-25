(load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l")

(de work ()
   (app)
   (action (html 0 "Increment" "lib.css" NIL
              (form NIL
                 (gui '(+Var +NumField) '*Num 9)
                 (gui '(+JS +Button) "+" '(inc '*Num)) ) ) ) )

(de go ()
      (server 8080 "!work") )