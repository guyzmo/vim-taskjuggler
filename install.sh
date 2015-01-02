#!/bin/sh

# Little script to test whether the syntax file has already been installed
# If it has not check if taskjuggler has been installed
# If it has install the syntax file!

mkdir syntax 2> /dev/null && {
    gem list --local taskjuggler | grep taskjuggler > /dev/null && {
        cp $(ruby -e "puts Gem::Specification.find_by_name('taskjuggler').gem_dir + '/data/tjp.vim'") syntax 
    } || echo "Taskjuggler not installed. Please run 'gem install taskjuggler first'!"
} || echo "Already installed"

