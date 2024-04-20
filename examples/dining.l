# The Dining Philosophers
# pil dining.l -dining~main +


(load "@lib/simul.l")
(symbols 'dining-philosophers 'simul 'pico)

(off *Rt)

(local) (*ForkA *ForkB *ForkC *ForkD *ForkE *ForkF now dining)

(de now (Str)
   (prinl (tim$ (* 60 *Time)) " " (co) " " Str) )


(de dining (LeftFork RightFork)
  (loop
    (now "is thinking... 💭")
    (pause (rand 180 240))

    (now "is hungry... 😋")
    (use (L R)
      (while 
        (or
          (setq L (val LeftFork))
          (setq R (val RightFork)) )
        (now (pack "waiting for " L (and L R " and ") R " 🤬🤬🤬 "))
      (pause LeftFork RightFork) ) )
    (set LeftFork (set RightFork (co)))

    (now "is eating! 🍝")
    (pause 20)

    (now "finished eating.")
    (set LeftFork (set RightFork NIL))
    (event LeftFork)
    (event RightFork) ) )


(local) (main)

(de main()
  (symbols '(dining-philosophers simul pico))
  (co 'Arendt 
    (dining '*ForkA '*ForkB) )
  (co 'v.-Bingen 
    (dining '*ForkB '*ForkC) )
  (co 'Luxemburg 
    (dining '*ForkC '*ForkD) )
  (co 'Kant 
    (dining '*ForkD '*ForkE) )
  (co 'Nietzsche 
    (dining '*ForkE '*ForkF) )
  (co 'Wittgenstein 
    (dining '*ForkE '*ForkA) ) )