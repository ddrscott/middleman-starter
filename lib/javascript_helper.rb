# @thanks https://github.com/rails/rails/blob/0d6e8edc2a47a4b4c6824936632bfb83850db343/actionview/lib/action_view/helpers/javascript_helper.rb
module JavascriptHelper
  JS_ESCAPE_MAP = {
      '\\'    => '\\\\',
      '</'    => '<\/',
      "\r\n"  => '\n',
      "\n"    => '\n',
      "\r"    => '\n',
      '"'     => '\\"',
      "'"     => "\\'"
  }

  JS_ESCAPE_MAP["\342\200\250".force_encoding('UTF-8').encode!] = '&#x2028;'

  # Escapes carriage returns and single and double quotes for JavaScript segments.
  #
  # Also available through the alias j(). This is particularly helpful in JavaScript responses, like:
  #
  #   $('some_element').replaceWith('<%=j render 'some/element_template' %>');
  def escape_javascript(javascript)
    if javascript
      result = javascript.gsub(/(\\|<\/|\r\n|\342\200\250|[\n\r"'])/u) {|match| JS_ESCAPE_MAP[match] }
      javascript.html_safe? ? result.html_safe : result
    else
      ''
    end
  end
end