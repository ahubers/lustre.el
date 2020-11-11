## Emacs Major for Lustre & Kind2

The file lustre.el is an updated version of lustre.el by Chevallier Olivier, found here https://matthieu-moy.fr/emacs/lustre.el. It has been stripped of any compilation functionality, as well
as some logic around comments.

It has been updated to support syntax highlighting for newer lustre/Kind2 constructs such as:
- Contracts
- Contract modes
- Guarantee/assume keywords
- Multi-line comments


## Further work

It would be nice to distinguish between multi-line comments delimited by `(*` and `*)` and
contract imports.

