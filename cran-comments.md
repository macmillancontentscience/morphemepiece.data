## v. 1.2.0 (Resubmission)
* Submitting update 2022-04-15
* Updated to new format to match morphemepiece 1.2.3

## Test environments
* local R installation, R 4.1.3 (Windows)
* Windows Server 2022, R-devel, 64 bit (rhub)
* Ubuntu Linux 20.04.1 LTS, R-release, GCC (rhub)
* Fedora Linux, R-devel, clang, gfortran (rhub)

There is a NOTE when testing for Windows Server, which apparently has been showing up for all packages lately:

```
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
```

## R CMD check results

0 errors | 0 warnings | 0 notes

## revdepcheck results

We checked 1 reverse dependencies, comparing R CMD check results across CRAN and dev versions of this package.

 * We saw 0 new problems
 * We failed to check 0 packages
