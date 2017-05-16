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
1. Add a header and toolbar
1. Add a navigation to the toolbar
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

1. Update the Gemfile to include the polymer gem:
  ```
  gem 'polymer-rails'
  ```

1. Run the installation generator for the polymer gem:
  ```
  $ rails g polymer:install
  ```

1. To add componments you just need to add them to the
 `app/assets/components/application.html.erb` file in the following format:
  ```
  //= require polymer/polymer
  //= require component-name/component-name
  ```

1. Update the `app/views/layouts/application.html.erb` file so that it
  matches the following to remove turbolinks and adds the Polymer javascript
  and component dependencies:
  ```
  <%= stylesheet_link_tag    'application', media: 'all' %>
  <%= javascript_include_tag 'application' %>

  <!-- Polymer components -->
  <%= html_import_tag 'application'%>
  ```

1. Remove both `jquery` and `turbolinks` gems from the Gemfile

1. Remove entries from - `app/assets/javascripts/application.js`
  ```
  //= require jquery
  //= require jquery_ujs
  //= require turbolinks
  ```

1. Remove the `app/assets/stylesheets/scaffold.scss`

# Adding Components

In general the method for adding polymer components to your Rails application
follows this general pattern.

1. Identify the component you want to use by browsing the
   [Polymer Catalog](https://elements.polymer-project.org/)

1. Install the component using the `bower install -S <component name>`

1. Updating the `app/assets/components/application.html.erb` file with
   the appropriate `//= require <component name>` engry

1. Adding the Polymer components to your ERB file and adding any
   component properties or calling any of the components methods.
   See the reference in the Polymer catalog for styling updates,
   properties or methods for each component.
   
1. Updating any CSS elements by adding them to the appropriate `.css` or
   `.scss` file in the `app/assets/stylesheets` directory for the
   views in which you are using the Polymer component.

We will add a few Polymer components following the above steps, so you
can get a feel for the general process.

## Add Header Components

Add the header banner and a menu bar across the top of all screens. This
is done by adding the necessary Polymer components.

1. We can add the flexible layout by running:
  ```
  bower init
  bower install -S iron-flex-layout
  bower install -S PolymerElements/app-layout
  ```

1. You then need to add a line to the `app/assets/components/application.html.erb`
file.
  ```
  //= require polymer/polymer
  //= require iron-flex-layout/iron-flex-layout
  //= require app-layout/app-layout
  ```
