# rrregex
rrregex = **R**ealtime **R**uby **R**egex

## Inspiration

One of the (many) things I love about working with ruby is the natural and elegant way that 
regular expressions are integrated into the language.  I find myself using them much more often
in my ruby code than in other languages.

One of my favorite tools for __efficiently__ working with regexes is [Rubular](http://rubular.com).
It's fast, simple, and allows me to write/test/debug my regexes quickly, so I can get on with other things.

The only problem?  [Rubular.com](http://rubular.com) goes down. A lot.  Since I've come to rely on Rubular for 
my regular 'workflow', I decided to write my own.  Now when Rubular craps out, I've got a backup.  

I've shamelessly stolen Rubular's idea, but made my implementation [FOSS](http://en.wikipedia.org/wiki/Free_and_open_source_software).

## About

rrregex is written in ruby (natch) using a simple [Sinatra](http://www.sinatrarb.com/) app.  There's a bit of
[jQuery](http://jquery.com/) and HTML for the dead-simple UI, along with some CSS that uses the wonderful
[Twitter Bootstrap](http://twitter.github.com/bootstrap/).

## Dependencies 
Just a couple of ruby gems:

* [sinatra](http://www.sinatrarb.com/)
* json

rrregex is written with, and runs on ruby 1.9.3. YMMV with other versions.

## Installing/Running

    # get the code
    $ git clone git://github.com/dcarney/rrregex.git
    $ cd rrregex

	# Install required gems
	$ gem install sinatra json

    # run it
    $ ruby app.rb

Point your browser to [http://localhost:4567](http://localhost:4567)

Everything should be pretty self-explanatory after that.  Type some regexes, try some test strings.  Enjoy.  Get on with your day.
