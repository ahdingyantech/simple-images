# simple-images

to add some helper methods for create images in web page

for rails 3

## dependencies

* jQuery

## Usage

include in Gemfile:
```ruby
gem 'simple-images'
```

in view:
```ruby
= fit_image 'http://foo.com/bar.png', :alt => 'foobar',
                                      :width => 100,
                                      :height => 100,
                                      :meta => 'some text',
                                      :class => 'avatar'
```
