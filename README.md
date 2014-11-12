# Info
This is a Middleman project http://middlemanapp.com/ which requires Ruby and Rubygems.
Look at http://middlemanapp.com/basics/getting-started/ for an overview of what Middleman can do.


# Quick Start

## Setup

The steps have only been testing on OSX.
If you on other platforms search online for the equivelent steps.

### Install ruby. We use RVM to manage ruby instances

Details can be found at http://rvm.io/

    \curl -sSL https://get.rvm.io | bash -s stable

    rvm install 2.0
    rvm use 2.0


### install Bundler Rubygem and Project dependencies

    gem install bundler

    cd /path/to/project
    
    bundler install
    
    # wait patiently


## run local webserver

    cd /path/to/project
    
    middleman
    
    # for extra logging use
    middleman --verbose
    
    
Connect to local site from a web browser http://localhost:4567
 
To view the site structure go to http://localhost:4567/__middleman/sitemap/

    
## Build
    cd /path/to/project
    
    middleman build
    
    # view built assets
    open /path/to/project/build

    # test built assets
    open /path/to/project/home.html



# Contribute

Push to master is not allowed, therefore you'll need to create a branch for your changes and submit a pull request.

Use Git's documentation for more details.
http://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging


    # clone the repository
    git clone git@git.page-foundry.com:pf/splash-ceoread.git /path/to/destination
    
    # go into project
    cd /path/to/destination
    
    # branch
    git checkout -b name-of-feature
    
    # commit as often as you like to the branch, -a for 'all' local changes   
    git commit -a
    
When you're done with the changes, create a "New Merge Request" using the web interface at http://git.page-foundry.com/



# Project Structure

The source makes heavy use of Middleman's asset pipe line (which is Sprocket's asset pipeline).
Addition documentation located at http://middlemanapp.com/basics/asset-pipeline/


## Home Page

- Main splash page is located at `/project_root/source`
    - the site's index file is `home.html.erb`
    
- All styles are in SASS and located at `/project_root/source/stylesheets/_home.scss`.

