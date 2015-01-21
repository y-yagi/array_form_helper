# ArrayFormHelper

[![Build Status](https://travis-ci.org/y-yagi/array_form_helper.svg?branch=master)](https://travis-ci.org/y-yagi/array_form_helper)
[![Coverage Status](https://coveralls.io/repos/y-yagi/array_form_helper/badge.png)](https://coveralls.io/r/y-yagi/array_form_helper)
[![Code Climate](https://codeclimate.com/github/y-yagi/array_form_helper/badges/gpa.svg)](https://codeclimate.com/github/y-yagi/array_form_helper)

ArrayFormHelper provides some form helper methods to use array column in Rails.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'array_form_helper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install array_form_helper

## Usage

ArrayFormHelper provides methods is a format that added a prefix called "array\_" to a method of rails provides helper method. For example, it is like `array_text_field`, `array_email_field`.

You can appoint array size with `array_size` option.  Other option can set contents same as an original method.

### Example

```ruby
# migration file
class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :tags, array: true

      t.timestamps null: false
    end
  end
end
```

```ruby
# controller
def book_params
  # need permit of array
  params.require(:book).permit(:name, tags: [])
end
```

```ruby
# form
<%= form_for(@book) do |f| %>
  <div class="field">
    <%= f.label :name %><br>
    <%= f.text_field :name %>
  </div>
  <div class="field">
    <%= f.label :tags %><br>
    <%= f.array_text_field :tags, array_size: 3 %>
  </div>
  <div class="actions">
    <%= f.submit %>
  </div>
<% end %>
```
The code generates following HTML.

```html
<form class="new_book" id="new_book" action="/books" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#x2713;" /><input type="hidden" name="authenticity_token" value="Nu05ebKkwQEfvACgAu+N1TskwoCeAXyhbVDNROrVR69yWH24IJ7JiXetwrSOnsZX19ZwdSH96FAnuKlxy5prwQ==" />
  <div class="field">
    <label for="book_name">Name</label><br>
    <input type="text" name="book[name]" id="book_name" />
  </div>
  <div class="field">
    <label for="book_tags">Tags</label><br>
    <input name="book[tags][]" id="book_tags_0" type="text" /><input name="book[tags][]" id="book_tags_1" type="text" /><input name="book[tags][]" id="book_tags_2" type="text" />
  </div>
  <div class="actions">
    <input type="submit" name="commit" value="Create Book" />
  </div>
</form>
```

### Methods

The methods supporting are as follows now.

`array_text_field`, `array_text_area`, `array_color_field`, `array_search_field`, `array_telephone_field`
`array_phone_field`, `array_date_field`, `array_time_field`, `array_datetime_field`
`array_datetime_local_field`, `array_month_field`, `array_week_field`, `array_url_field`

## Contributing

1. Fork it ( https://github.com/y-yagi/array_form_helper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
