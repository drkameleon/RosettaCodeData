// GUI component interaction. Nigel Galloway: June 13th., 2020
let n=new System.Windows.Forms.Form(Size=new System.Drawing.Size(250,150))
let i=new System.Windows.Forms.TextBox(Location=new System.Drawing.Point(30,30),Text="0")
let g=new System.Windows.Forms.Label(Location=new System.Drawing.Point(135,33),Text="Value")
let e=new System.Windows.Forms.Button(Location=new System.Drawing.Point(30,70),Text="Increment")
let l=new System.Windows.Forms.Button(Location=new System.Drawing.Point(135,70),Text="Random")
n.Controls.AddRange([|i;g;e;l|])
let rand=new System.Random()
i.Leave.AddHandler(new System.EventHandler(fun _ _->i.Text<-try string(int(i.Text)) with |_->"0"))
e.Click.AddHandler(new System.EventHandler(fun _ _->i.Text<-(string(int(i.Text)+1))))
l.Click.AddHandler(new System.EventHandler(fun _ _->i.Text<-(string(rand.Next()))))
System.Windows.Forms.Application.Run(n)