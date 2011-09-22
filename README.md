gem-versions -- view a gem's versions
=====================================


## SYNOPSIS

    gem versions <GEM>


## DESCRIPTION

The `gem versions` command can be used to show all versions of a gem
published on Rubygems.org.  Versions you have installed locally are
asterisked.

Note you must use the exact name of the gem, not just a partial match.

It's like `gem list --both <GEM>` except:

- it shows only the exact gem you specify, rather than all gems whose
  names start with that name;
- it shows the results inline, i.e. with local and remote gems merged.


## QUICK START

    gem install gem-versions
    gem versions rails


## INTELLECTUAL PROPERTY

Copyright 2011 Andy Stewart <boss@airbladesoftware.com>.
