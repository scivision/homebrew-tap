# SciVision homebrew tap

Experimental programs as we learn to use Homebrew's tap system.

## GCC 10

It was discovered that GCC-11 had a possible Fortran regression, but homebrew/core didn't make GCC 10 available for Apple Silicon anymore.
Homebrew maintainer @carlocab
[suggested](https://github.com/Homebrew/discussions/discussions/1443#discussioncomment-719680)
we create this tap until GCC-11 is fixed.

To get GCC-10 on Mac M1 (Apple Silicon), compile GCC 10 from source via "brew install":

```sh
brew tap scivision/homebrew-tap

brew install gcc@10.2.0

ln -s /opt/homebrew/Cellar/gcc@10.2.0/10.2.0_4/lib/gcc/10/ /opt/homebrew/lib/gcc/10
```

create a file ~/gcc10.sh containing
```sh
export PATH=/opt/homebrew/Cellar/gcc@10.2.0/10.2.0_4/bin:$PATH
export CC=gcc-10 FC=gfortran-10 CXX=g++-10
```

To use GCC 10 do:

```sh
source ~/gcc10.sh
```

For now, we take advantage of the ABI compatibility between GCC 10 and Homebrew libraries compiled with GCC 11.
So you should still be able to `brew install lapack` and use it with this GCC 10 for now.

### Notes

I have not examined the contents in any way, I merely copied the output from:

```sh
brew extract --version=10.2.0 gcc scivision/homebrew-tap
```
