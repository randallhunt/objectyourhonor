require 'rspec'
require './lib/my_object'

describe MyObject do

  it 'should store values from hash passed through constructor' do
    obj = MyObject.new({p1: 'test', 'p2' => {'p3' => [10, 12]}, p4: {}})

    expect(obj.p1).to eq('test')
    expect(obj.p2.p3).to eq([10, 12])
    expect(obj.p2).to be_a(MyObject)
  end

  it 'should allow assigning params' do
    obj = MyObject.new

    obj.some = 'test'
    obj.other = 'test2'
    obj.yet_one_more = {}
    obj.yet_one_more.test = 'test'

    expect(obj.some).to eq('test')
    expect(obj.other).to eq('test2')
    expect(obj.yet_one_more.test).to eq('test')
  end

end