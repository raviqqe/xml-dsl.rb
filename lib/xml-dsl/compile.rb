require 'nokogiri'



module XML
  def self.from_array array
    Nokogiri::XML(compile_elems(array), &:noblanks)
        .to_xml(indent: 4, &:no_declaration)
  end

  def self.compile_elems elems
    elems.map do |elem|
      tagged elem[0], elem[1..-2], elem[-1]
    end.join
  end

  def self.tagged tag, attrs, elems
    p "TAGGED"
    p tag, attrs, elems

    tag = tag.to_s
    brackets(tag + ' ' + compile_attrs(attrs)) \
        + (elems.is_a?(String) ? elems : compile_elems(elems)) \
        + brackets('/' + tag)
  end

  def self.compile_attrs attrs
    attrs.map do |name, value|
      "#{name}=#{value.gsub('\\', '\\\\').gsub('"', '\\"')}"
    end.join ' '
  end

  def self.brackets tag
    '<' + tag + '>'
  end
end
