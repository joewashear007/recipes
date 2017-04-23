#!/home2/jjprogra/python/Python-2.7.13/python

import cgitb
cgitb.enable()

print "Content-Type: text/plain\r\n\r\n"
print

import git
from mkdocs import config
from mkdocs.commands import build


g = git.cmd.Git('/home/jjprogra/build/recipes')
g.pull()

build.build(config.load_config(config_file='/home/jjprogra/build/recipes/mkdocs.yml', site_dir='/home/jjprogra/public_html/recipes' ))


print "Done!"
