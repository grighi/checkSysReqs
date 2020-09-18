# checksysreqs

Minimal R package to print system requirements for packages you want to install.

### Motivation

You want to install some packages on a server that you don't have sudo 
permissions on, and you need to tell your colleague which system 
packages you need. You want to avoid bothering him with repeated messages, but
you don't have time to manually check every package's requirement. Now you can use
```
checksysreqs::sys_reqs('package-name')
```
to display a message listing the `SystemRequirements` string for all of the 
packages required by the package you want to install.


### Installation

Install with 

```
devtools::install_github('grighi/checksysreqs')
```


