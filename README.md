# simple-page-layout

layouts made easy for rails 3

[![Build Status](https://travis-ci.org/mindpin/simple-page-layout.png?branch=master)](https://travis-ci.org/mindpin/simple-page-layout)
[![Gem Version](https://badge.fury.io/rb/simple-page-layout.png)](http://badge.fury.io/rb/simple-page-layout)
[![Code Climate](https://codeclimate.com/github/mindpin/simple-page-layout.png)](https://codeclimate.com/github/mindpin/simple-page-layout)

## dependencies

* haml

## Usage

include in Gemfile:
```ruby
gem 'simple-navbar'
```

in your layout file:

```haml
-# in file views/layouts/my_layout.html.haml

!!!
- simple_page_layout 'My Site', :html_lang => :zh do
  -# your code here with yaml
  .page-content
    yield
```

and then in a view of this layout:

```haml
- page_title 'page title'

.foo bar
```

you will get:

```html
<!DOCTYPE html>
<html lang='zh'>
  <head>
    <title>My Site | page title</title>
    <meta content="authenticity_token" name="csrf-param" />
    <meta content="Gf5GH0+iJtxdjZyNo+3qMV+1DqO9v8/jAHmV/Bq5Eis=" name="csrf-token" />
    <link href="/assets/application.css?body=1" media="screen" rel="stylesheet" type="text/css" />
  </head>
  <body>
    <!-- your code here -->
    <div class="foo">
      bar
    </div>
    
    <script src="/assets/jquery.js?body=1" type="text/javascript"></script>
    <script src="/assets/jquery_ujs.js?body=1" type="text/javascript"></script>
    <script src="/assets/application.js?body=1" type="text/javascript"></script>
  </body>
</html>
```
