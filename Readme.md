# SciVision homebrew tap

Experimental programs as we learn to use Homebrew's tap system.

## GCC 10

It was discovered that GCC-11 had a possible Fortran regression, but homebrew/core didn't make GCC 10 available for Apple Silicon anymore.
So a homebrew maintainer [suggested](https://github.com/Homebrew/discussions/discussions/1443#discussioncomment-719680) we create this tap until GCC-11 is fixed.
I have not examined the contents in any way, I merely copied the output from:

```sh
brew extract --version=10.2.0 gcc scivision/homebrew-tap
```
