Formats your recipes into a easy-to-use trees.

Some example recipes are given in lieu of real documentation ;)

Recipes and output are in /recipes/{text, png, svg}

NB: To bracket some ingredients, use {None,"blah","bleh"...}. To not-bracket them, use ..."blah","bleh" etc. This is a matter of personal aesthetics; maybe bracketing ingredients is a directive to combine them together before adding.

Known issues:
Sometimes mathematica fucks up the Row[] layout. Changing ItemSize (column width) seems to help.
Some characters are Bad. Known offenders include ; :

In the future:
Implement this in LaTeX!!! it's a better choice, and FOSS
Update the recipe format? Typing the "" gets tedious real fast
Metadata: Citations (ha) and comments
Use mathematica typesetting forms in recipes! for fractions etc
Compile the mathematica to C, if possible
Refactor to do with functional programming wizardry
Formatting: A better (than left or right) alignment, print comments at the bottom
Output: Display errors/weirdness if possible
Extend the brackets PAST the boundary of text in column. it's UGLY