# README

This is a simple of example for combining a Rails 5 application with
Polymer web components. It relies heavily on the
[`polymer-rails`](https://github.com/alchaplinsky/polymer-rails) and
[`polymer-elements-rails`](https://github.com/alchaplinsky/polymer-elements-rails) gems.
The structure of this example will put each step of the example in
separate branches. The master branch will hold the complete final example.
The example is built in the following sequence:

1. Basic Rails application is built to create a Todo list
1. Add in the necessary Polymer configuration
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

# Add in Polymer

The next step is to add in the necessary configuration for using Polymer
components. We will go through the manual steps for this exercise to include
Polymer components in the asset pipeline. You will require that
[`bower`](https://bower.io/) package manager is installed on your system.
The configuration steps are as follows:

1. Create a `.bowerrc` file in the Rails root directory with the following entry:
  ```
  {
   "directory": "vendor/assets/components"
  }
  ```

1. Add following method to app/helpers/application_helper.rb
  ```
   def include_polymer
    @polymer = true
    result = <<-EOF
    <script src='/assets/webcomponentsjs/webcomponents-lite.js'></script>
    EOF
    result.html_safe
  end

  def include_component(package: nil, component: nil)
    result = ""
    unless @polymer == true
      result = <<-EOF
      <script src='/assets/webcomponentsjs/webcomponents-lite.js'></script>
      EOF
      @polymer = true
    end

    result += <<-EOF
      <link rel='import' href='/assets/#{package}/#{component}.html'>
    EOF

    result.html_safe
  end
  ```

1. Install polymer with `bower`. We will install the individual
  components in later steps and use the helper methods to reference
  the components in the Rails ERB files. To install Polmer:
  ```
  $ bower install -S polymer
  ```

1. Remove both `jquery` and `turbolinks` gems from the Gemfile

1. Remove entries from - `app/assets/javascripts/application.js`
  ```
  //= require jquery
  //= require jquery_ujs
  //= require turbolinks
  ```

1. Update the `app/views/layouts/application.html.erb` file so that it
  matches the following to remove turbolinks and adds the Polymer javascript
  dependency:
  ```
  <%= stylesheet_link_tag    'application', media: 'all' %>
  <%= javascript_include_tag 'application' %>
  <%= include_polymer %>
  ```
