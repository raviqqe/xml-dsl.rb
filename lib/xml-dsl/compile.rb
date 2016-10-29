require 'nokogiri'



module XML
  def self.from_array array, format: true
    xml = compile_elems(array)

    return xml if not format

    Nokogiri::XML(xml, &:noblanks).to_xml(indent: 4, &:no_declaration)
  end

  def self.compile_elems elems
    elems.map do |elem|
      tagged(*analyze_elem(elem))
    end.join
  end

  def self.tagged tag, attrs, body
    tag = tag.to_s
    brackets(tag + ' ' + compile_attrs(attrs)) \
        + (body.is_a?(String) ? body : compile_elems(body)) \
        + brackets('/' + tag)
  end

  def self.compile_attrs attrs
    attrs.map do |name, value|
      "#{name}=#{value.encode(xml: :attr)}"
    end.join ' '
  end

  def self.brackets tag
    '<' + tag + '>'
  end

  def self.analyze_elem elem
    [elem[0], get_elem_part(elem, Hash), get_elem_part(elem, [Array, String])]
  end

  def self.get_elem_part elem, classes
    raise "Error: An array longer than 3 representing an element is detected.: \
           #{elem}" if elem.length > 3

    classes = [classes] if classes.is_a? Class
    in_classes = lambda { |x| classes.map{ |klass| x.is_a? klass }.any? }

    if in_classes.call elem[1]
      elem[1]
    elsif in_classes.call elem[2]
      elem[2]
    else
      classes[0].new
    end
  end
end
