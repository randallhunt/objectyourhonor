require 'rspec'
require './lib/my_object'

describe 'VerifiedMyObject' do

  it 'should return nil for non-existing values' do
    obj = MyObject.new

    expect(obj.foo).to be_nil
    expect(obj.bar).to be_nil
  end

  it 'should allow assigning new simple obj values' do
    obj = MyObject.new

    obj.foo = 13
    obj.bar = "foo-bar"

    expect(obj.foo).to eq(13)
    expect(obj.bar).to eq("foo-bar")
  end

  it 'should allow assigning hash values' do
    obj = MyObject.new

    obj.foo = {bar: {'baz' => 'x'}}
    obj.bar = {'foo' => {bar: [12, 13], baz: 14}}

    expect(obj.foo).to be_a(MyObject)
    expect(obj.foo.bar).to be_a(MyObject)
    expect(obj.foo.bar.baz).to eq('x')
    expect(obj.bar.foo.bar).to eq([12, 13])
    expect(obj.bar.foo.baz).to eq(14)
  end

  it 'should allow initialization through constructor' do
    obj = MyObject.new({'foo' => {bar: [12, 13], baz: 14}})

    expect(obj.foo.bar).to eq([12, 13])
    expect(obj.foo.baz).to eq(14)
  end

  it 'should override values' do
    obj = MyObject.new({'foo' => {bar: 'baz'}})

    obj.foo = 10
    obj.foo = {x: {y: 'z'}}

    expect(obj.foo.x.y).to eq('z')
  end

  it 'should raise error when keys have illegal type' do
    obj = MyObject.new

    expect {obj.x = {14 => 15}}.to raise_error(ArgumentError)
  end

  it 'should not accept anything but Hash in the constructor' do
    expect {MyObject.new(11)}.to raise_error(ArgumentError)
    expect {MyObject.new('test')}.to raise_error(ArgumentError)
  end

end