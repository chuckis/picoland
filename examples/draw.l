 (load "@lib/http.l" "@lib/xhtml.l" "@lib/form.l" "@lib/canvas.l")

   (de drawCanvas (Id Dly)
      (make
         (csStrokeStyle "blue")
         (csStrokeRect 0 0 400 300)
         (csFillStyle "red")
         (csFillRect 100 100 200 100) ) )

   (de canvasTest ()
      (action
         (html 0 "Canvas Test" "@lib.css" '((onload . "drawCanvas('$testID', -1)"))
            (form NIL
               (<canvas> "$testID" 400 300) ) ) ) )

   (de work ()
      (app)
      (redirect (baseHRef) *SesId "!canvasTest") )

   (server 8080 "!work")