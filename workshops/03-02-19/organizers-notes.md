Beginner Workshop for Julia 
March 2nd, 2019 10 am - 5 pm
Co-Up, 3rd  floor, Adalbertstr. 7-8, 810999 Berlin-Kreuzberg


This workshop is for everybody who is interested in learning Julia.
Pre-requirements: You read our Code of Conduct (http://www.opentechschool.org/code-of-conduct/) and appreciate the content.

10 am: We will give a quick introduction to the language
1) How it differs from Python and C
2) Which applications are particularly promising
3) How to get started programming in Julia

10.45 am: We split into balanced groups, depending on your previous experience (with similar languages) and your interests and we will work through the tutorials on juliabox.org
More experienced Julia users will help you whenever you get stuck.

2 pm: We will be a bit more creative and work on several projects, e.g.
- writing our own opentechschool tutorial(s)
- implementing your current project into Julia
- working on more advanced stuff, e.g.  https://etherpad.net/p/Julia_teaching-material

Why Julia? -- Julia is Open Source. Julia is integrative: bloody beginners can use it, but also experts often prefer it over C or Fortran. It is nearly as fast as C, but as easy to program as Python. In recent years, many computer and data scientists have switched to Julia as it seems to be the most future-proof language for large numerical operations. But even today, Julia nicely complements Python and R when not only the comfort of an open source language that is easy to read and write but also speed is required.

What is Julia made for? -- Julia is a general purpose language like Python, but it shines particularly when heavy computation is necessary and the alternatives are either to slow or require a lot of time to be implemented, e.g. data science, engineering, differential equations. Moreover, package development for Julia is rather convenient so that many scientists have switched to implement their packages in Julia.

Will Julia be the future? -- We don't know. Julia reached version 1.0 in summer 2018. Before that, developers had to expect changes in the basic language so that there packages might not work a year later. That time has passed and we expect that more developers will commit to Julia. 




Ablauf:  (Slides: Frank’s task)


0) Welcome, Code of Conduct Hello Everyone
Outlook
https://etherpad.net/p/juliOTS-Workshop190302
Advanced material https://etherpad.net/p/Julia_teaching-material
Code of Conduct

1) How it differs from Python and C/C++ 
Scriptsprachen ( wie Python ) haben eine Benutzerfreundliche Syntax, aber die Laufzeit ist verglichen mit statisch kompilierten Sprachen wie C/C++, suboptimal.
Warum? Übergang von Quellcode zu Assembler mehr oder minder optimiert (Verweis auf Why is Julia fast?) Typisierung!
Julia ermöglicht durch JIT-kompilierung (z.B. numba) vergleichbare Laufzeit mit ähnlich bequemer Syntax
Objektorientiert vs multiple dispatch (overly simplified!),  z.b. https://github.com/crstnbr/julia-workshop/blob/master/1%20Types%20and%20dispatch/1_types_and_dispatch.ipynb cell 40 (simplifiziert)
2) Which applications are particularly promising
Eigentlich alles, aber z.Z. gewisse Packages (kann aber schnell ändern, da 1.0 seit Sommer)
Performance & Entwicklungszeit
Sprachbarieren vermeiden (z.B. tensorflow vs flux) => e.g. data science
Cutting Edge Methods => e.g., Autodiff, DifferentialEquations
Julia als Supersprache zum Aufruf der anderen; relative einfach zu integrieren! Jupyter -> Python, R, Julia, C
Multiple dispatch => Hardware: GPUArrays -> CPU/GPU switching (or even TPUs), parallel computing
3) How to get started programming in Julia
Show how to use JuliaBox
Verweise auf Links im Etherpad

