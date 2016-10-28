require 'xml-dsl'


s = xml do
  html do
    head do
      title 'good title'
    end

    body 'great text!'
  end
end

puts s
