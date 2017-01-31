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

# Add in Necessary Gems

The next step is to add in the necessary gems to the Gemfile:

* [polymer-rails](https://github.com/alchaplinsky/polymer-rails)
* [polymer-elements-rails](https://github.com/alchaplinsky/polymer-elements-rails)

Then execute:

 ```
 $ bundle install
 $ rails g polymer:install
 ```

Once the installation is complete you can:

1. Remove both `jquery` and `turbolinks` gems from the Gemfile
1. Remove entries from - `app/assets/javascripts/application.js`
  ```
  //= require jquery
  //= require jquery_ujs
  //= require turbolinks
  ```

# Update Application to User Flexible Layout

The flexible layout can be implemented using the Polymer iron-flex-layout
element styles. For more information on this component, see
[here](https://www.webcomponents.org/element/PolymerElements/iron-flex-layout).

1. Update the header section to remove more of the turbolinks dependencies
and the directive to add in the application components as follows:

  ```
  <head>
    <title>PolymerRailsExample</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag 'application', media: 'all' %>
    <%= html_import_tag 'application'%>
  </head>
  ```

1. Next add the component to the `/app/assets/components/applciation.html.erb`

  ```
  //= require iron-flex-layout/iron-flex-layout
  ```

1. Add style to the `<body>` in the `/app/views/layouts/application.html.erb`

  ```
  <body class="fullbleed layout vertical">
  ```
