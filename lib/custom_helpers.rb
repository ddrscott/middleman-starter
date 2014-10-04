require 'open-uri'

module CustomHelpers


  # based on https://github.com/damrbaby/middleman-angular-templates
  def angular_include_templates(path = File.dirname(current_page.path))
    base_dir = Pathname.new('source')
    tags = []
    Dir[File.join(base_dir, path, '**/*.{html,erb,slim,haml}')].each do |filename|
      template_name = File.basename(filename, '.*')
      next unless template_name.slice!(0) == '_'
      $stderr.puts "[text/ng-template] base_dir => #{base_dir}, path => #{path}, filename => #{filename}"
      template_path = Pathname.new(File.join(File.dirname(filename), template_name)).relative_path_from(base_dir)
      tags << content_tag(:script, partial(template_path), type: 'text/ng-template', id: template_name)
    end
    tags.join("\n")
  end

  def external_html(url)
    open(url).read.force_encoding('utf-8')
  end

  def _proxy_example_
    data.authors.each do |last_name, author|
      proxy "/#{last_name}/index.html", '/ng-view.html', :locals => {:author => author}, :ignore => true
    end
  end
end