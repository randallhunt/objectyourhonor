class MyObject
  def initialize(hash=nil)
    @data = {}
    if hash.nil?
      return
    end
    if hash.is_a?(Hash)
      hash.each_pair do |k, v|
        m = k.to_s.match(/^([A-Za-z_][A-Za-z0-9_]*)$/)
        raise ArgumentError if m.nil?
        @data[k.to_s] = v.is_a?(Hash) ? MyObject.new(v) : v
      end
    else
      raise ArgumentError
    end
  end

  def method_missing(*args)
    m = args[0].to_s.match(/^([A-Za-z_][A-Za-z0-9_]*)(=?)/)
    if m.nil?
      raise ArgumentError
    end

    if m[2] == '='
      # setter
      if args.length != 2
        raise ArgumentError
      end
      val = args[1]
      @data[m[1]] = val.is_a?(Hash) ? MyObject.new(val) : val
      return val
    else
      # getter
      return @data[args[0].to_s]
    end
  end
end
