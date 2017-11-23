<h2>Algebracket</h2>

Algebracket solves simple math equations, with or without variables.

<h4>Installation</h4>

<p>To use algebracket, you will need <a href="http://racket-lang.org/">Racket</a> installed.
Then, run:</p>

>git clone https://github.com/pknight24/algebracket
>cd algebracket
>racket run

<p>and the program will start.</p>

<h4>Usage</h4>

<p>You can pass equations to the algebracket 'repl' like this:</p>

>(1 + x at 4)

<p>this will plug in '4' for 'x', and evaluate to 5.
You can pass more complicated equations by using lots and lots of parentheses. Example: </p>

>((x ^ 2) + (5 * x) + 4 at 3)

<p>which will evaluate to 28.</p>

