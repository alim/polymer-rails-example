# README

This is a simple of example for combining a Rails 5 application with
Polymer web components. It relies heavily on the
[`polymer-rails`](https://github.com/alchaplinsky/polymer-rails) and
[`polymer-elements-rails`](https://github.com/alchaplinsky/polymer-elements-rails) gems.
The structure of this example will put each step of the example in
separate branches. The master branch will hold the complete final example.
The example is built in the following sequence:

1. Basic Rails application is built to create a Todo list
1. Add in the necessary gems
1. Update the application to use a flexible layout
1. Add a navigation bar to the application
1. Add a table
1. Add a form

The details and notes for each step are outlined in separate sections below.

# Basic Rails Application

We are just going to build a basic Rails 5 application using the built-in
_scaffold_ generator. I know the hard-core developers out there would rather
build it by hand, but this is just an example. The application is a simple
to-do list. I am sure you've seen it a hundred times by now, so I am going to
assume you know your way around the basic Rails commands.

```
$ rails new polymer-rails-example
$ cd polymer-rails-example
$ rails g scaffold ToDo task:string priority:integer due_date:datetime
$ rake db:create
$ rake db:migrate
```

While your at it, go ahead and update your `config/routes.rb` to include an
entry for your root route:

```
root 'to_dos#index'
```

Running `rails s` should spin up a simple running Rails application with
a to-do list.
