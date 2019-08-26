class Hash
  def explode(*args, &block)
    # TODO this fails when the value is a string, quotes are ignored and
    # a variable is assumed
    exploded_hash = Hash.new { |hash, key| hash[key] = Hash.new(&hash.default_proc) }

    self.each do |k, v|
      eval("exploded_hash" + k.split('/').map {|i| "['#{i}']"}.join + "=#{v}")
    end

    exploded_hash
  end
end
