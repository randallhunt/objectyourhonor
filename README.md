# Treat hashes as objects with dot notation

## Introduction

```ruby
obj = MyObject.new(foo: {bar: "x", "baz" => "y"}, "some" => "other")

obj.foo.bar
=> "x"
obj.foo.baz
=> "y"
obj.some
=> "other"
obj.foo.class
=> MyObject
obj.unknown
=> nil
```

 The `MyObject` class also allows to override the values and assign new values:

```ruby
obj.foo = 13
=> 13
obj.foo
=> 13
obj.foo = {bar: 18, "baz" => [30, 31]}
=> {:bar=>18, "baz"=>[30, 31]}
obj.foo.bar
=> 18
obj.foo.other = ["42", "44"]
=> ["42", "44"]
obj.foo.other
=> ["42", "44"]
```

## Tests

```sh
(RUBY_ENV=test bundle exec rake ci)
```