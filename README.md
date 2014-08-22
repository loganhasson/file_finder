# NOT WORKING YET
# FileFinder

Easily access files within your gems' directory structures. Why is this
cool? It takes some annoying jumping through hoops to access support files from
within a gem. If you try to `File.read('some/file.rb')`, you end up
accessing a file relative to where the gem is *run* from.

FileFinder gives you a simple helper method to get the absolute path to
support files.

## Installation

Add this line to your gemspec:

    spec.add_runtime_dependency "file_finder"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install file_finder

## Usage

Call `apath_to` with a relative path to a file.

    `apath_to('path/to/file.rb')`

For example, let's say I have this directory structure:

```bash
├── README.md
├── Rakefile
├── my_sweet_gem.gemspec
├── lib
│   ├── my_sweet_gem
│   │   ├── some_class.rb
│   │   ├── another_class.rb
│   │   └── yet_another_class.rb
│   └── outer_file.rb
├── templates
│   └── some_template.txt
└── spec
```

If I want to read `templates/some_template.txt` from within
`lib/my_sweet_gem/some_class.rb`, I can do something like this:

```ruby
File.read(apath_to('../../templates/some_template.txt'))
```

## Configuration

There's one downside to the default usage of FileFinder: the `apath_to`
method is defined on Kernel. It could have been defined on Object just
as easily, but that's six of one and half a dozen of the other. If this
would overwrite another method of the same name that you've written, or
you just perfer not polluting the global namespace, you can turn this
feature off with:

```ruby
FileFinder.config do |c|
  c.global_method = false
end
```

If you've done this, you can get absolute paths with `FileFinder::File('path/to/file/here)`.

## Known Issues

1. If you happen to already have a method, `apath_to` defined on Kernel,
   setting the `global_method` configuration option to `true` more than
once will forever overwrite the original method. The current solution to
this problem is the alternate setting the `global_method`
configuration option between `true` and `false` if you intend to change
it on the fly. Really, you should only be setting this option once.

## Contributing

1. Fork it ( https://github.com/loganhasson/file_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
