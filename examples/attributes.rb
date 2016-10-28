require 'xml-dsl'


s = xml do
  html do
    head do
      title 'good title'
    end

    body do
      div(id: '"alessa"', class_: 'gillespie') do
        p_('great text!', id: 'cheryl')
      end
    end
  end
end

puts s
